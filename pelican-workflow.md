───────────── Daily Workflow ─────────────
Create & preview post:
    make newpreview NAME="Post Title"
        • Default: Markdown (.md)
        • Optional: EXT=rst

Preview site locally:
    make preview
        • Serves at http://localhost:8000

Edit existing post:
    make editpost NAME="Post Title"
        • Refresh preview if needed

Commit & push to GitHub:
    git add .
    git commit -m "Add Post Title"
    git push origin main
        • Triggers GitHub Actions
        • Automatic deployment

Live blog updated:
    https://hhlp.github.io/blog/
──────────────────────────────────────────

───────────── Cleaning & Building ─────────
Clean specific generated files:
    make clean
        • Removes tags, feeds, posts, indexes, categories
        • Keeps output/ folder intact

Clean entire output folder:
    make cleanoutput
        • Deletes the whole output/ folder
        • Use for a fully fresh rebuild

Build locally:
    make html
        • Builds the site without serving

Build & serve locally:
    make preview
        • Equivalent to make html + serve
        • Live preview in browser

Regenerate automatically:
    make regenerate
        • Watch mode (-r)
        • Updates files when source changes

Production build:
    make publish
        • Uses publishconf.py
        • For deployment

Deploy to GitHub Pages:
    make github
        • Builds and pushes output/ to gh-pages
        • GitHub Actions runs automatically on push to main
──────────────────────────────────────────

───────────── Posts & Pages ─────────────
Create new post:
    make newpost NAME="Post Title" [EXT=rst]
Edit post:
    make editpost NAME="Post Title"

Create new page:
    make newpage NAME="Page Title" [EXT=rst]
Edit page:
    make editpage NAME="Page Title"

List drafts:
    make listdrafts
──────────────────────────────────────────

