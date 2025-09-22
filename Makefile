# --- Variables ---
PY = python3
PELICAN = pelican
PELICANOPTS =

BASEDIR = $(CURDIR)
INPUTDIR = $(BASEDIR)/content
OUTPUTDIR = $(BASEDIR)/output
CONFFILE = $(BASEDIR)/pelicanconf.py
PUBLISHCONF = $(BASEDIR)/publishconf.py
PAGESDIR = $(INPUTDIR)/pages
DATE := $(shell date +'%Y-%m-%d %H:%M:%S')
DATEYYMMDD := $(shell date +'%Y%m%d')
SLUG := $(shell echo '${NAME}' | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z)
EXT ?= md      # Markdown default, override with EXT=rst
AUTHOR := hhlp
GITHUB_PAGES_BRANCH = gh-pages

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

# --- Help / Usage ---
help:
	@echo 'Pelican Blog Makefile - Full Usage'
	@echo ''
	@echo 'Local site management:'
	@echo '   make html                     Build the site locally (no server)'
	@echo '   make serve                    Serve the site at http://localhost:8000'
	@echo '   make preview                  Build + serve site locally (html + serve)'
	@echo '   make regenerate               Watch content folder; rebuild on changes'
	@echo ''
	@echo 'Cleaning:'
	@echo '   make clean                    Remove specific generated files (tags, posts, feeds, indexes, categories) but keep output/ folder'
	@echo '   make cleanoutput              Remove the entire output/ folder for a full rebuild'
	@echo ''
	@echo 'Production:'
	@echo '   make publish                  Build site using production settings (publishconf.py)'
	@echo '   make github                   Build and push site to gh-pages (used by GitHub Actions)'
	@echo ''
	@echo 'Posts management:'
	@echo '   make newpost NAME="Post Title" [EXT=rst]       Create a new post (Markdown by default, reStructuredText optional)'
	@echo '   make editpost NAME="Post Title"                Edit an existing post'
	@echo '   make newpreview NAME="Post Title" [EXT=rst]   Create new post and preview site locally'
	@echo '   make listdrafts                                List posts with draft status'
	@echo ''
	@echo 'Pages management:'
	@echo '   make newpage NAME="Page Title" [EXT=rst]      Create a new page'
	@echo '   make editpage NAME="Page Title"               Edit an existing page'
	@echo ''
	@echo 'Variables you can override:'
	@echo '   NAME    - Title of post or page (required for newpost, newpage, editpost, editpage)'
	@echo '   EXT     - File extension: md (default) or rst'
	@echo '   DEBUG   - Set to 1 to enable Pelican debug mode (make DEBUG=1 html)'
	@echo ''
	@echo 'Examples:'
	@echo '   make newpreview NAME="My First Post"         # Markdown post and local preview'
	@echo '   make newpreview NAME="My First Post" EXT=rst # reStructuredText post and preview'
	@echo '   make editpost NAME="My First Post"          # Edit post'
	@echo '   make cleanoutput                             # Remove all generated files'
	@echo '   make github                                  # Deploy site to GitHub Pages'

# --- Local build ---
html:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve: html
	python -m http.server --directory $(OUTPUTDIR) 8000

preview: html serve

cleanoutput:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)/{tag,author,20*,category,index*html,posts,feeds,files}

regenerate:
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

# --- Production ---
publish: clean
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

github: publish
	ghp-import -m "Regenerate Pelican site" -b $(GITHUB_PAGES_BRANCH) -c "https://hhlp.github.io/blog/" -n -p -f "$(OUTPUTDIR)"

# --- Posts & Pages ---
newpost:
ifdef NAME
	echo "$(NAME)" > $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo -n "$(NAME)" | sed "s/./#/g" >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo ":date: $(DATE)" >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo ":modified: $(DATE)" >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo ":author: $(AUTHOR)" >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo ":category: " >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo ":tags: " >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo ":slug: $(SLUG)" >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo ":status: draft" >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo ":summary: " >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	echo "" >> $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	git add --intent-to-add $(INPUTDIR)/$(DATEYYMMDD)-$(SLUG).$(EXT)
	${EDITOR} ${INPUTDIR}/$(DATEYYMMDD)-${SLUG}.${EXT}
else
	@echo 'Variable NAME is not defined. Usage: make newpost NAME="Post Title"'
endif

editpost:
ifdef NAME
	${EDITOR} ${INPUTDIR}/$(DATEYYMMDD)-$(SLUG).$(EXT)
else
	@echo 'Variable NAME is not defined. Usage: make editpost NAME="Post Title"'
endif

newpage:
ifdef NAME
	echo "$(NAME)" > $(PAGESDIR)/$(SLUG).$(EXT)
	echo -n "$(NAME)" | sed "s/./#/g" >> $(PAGESDIR)/$(SLUG).$(EXT)
	echo >> $(PAGESDIR)/$(SLUG).$(EXT)
	echo ":date: $(DATE)" >> $(PAGESDIR)/$(SLUG).$(EXT)
	echo ":author: $(AUTHOR)" >> $(PAGESDIR)/$(SLUG).$(EXT)
	echo ":slug: $(SLUG)" >> $(PAGESDIR)/$(SLUG).$(EXT)
	echo "" >> $(PAGESDIR)/$(SLUG).$(EXT)
	git add --intent-to-add $(PAGESDIR)/$(SLUG).$(EXT)
	${EDITOR} ${PAGESDIR}/${SLUG}.$(EXT)
else
	@echo 'Variable NAME is not defined. Usage: make newpage NAME="Page Title"'
endif

editpage:
ifdef NAME
	${EDITOR} ${PAGESDIR}/${SLUG}.$(EXT)
else
	@echo 'Variable NAME is not defined. Usage: make editpage NAME="Page Title"'
endif

listdrafts:
	grep -nrH "^:status:.* draft" $(INPUTDIR)/*rst | cut -d : -f 1 | sed 's|$(BASEDIR)/||'

# --- New streamlined workflow ---
newpreview:
ifdef NAME
	@echo "Creating new post: $(NAME) and previewing locally..."
	$(MAKE) newpost NAME="$(NAME)"
	$(MAKE) preview
else
	@echo 'Variable NAME is not defined. Usage: make newpreview NAME="Post Title"'
endif

.PHONY: html help clean regenerate serve preview devserver publish github newpost newpage editpost editpage listdrafts newpreview
