# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Hector Louzao'
SITENAME = u'hhlp/blog'
SITESUBTITLE = u'linux/fedora/musings'
SITETAG = u'linux/fedora/musings'
TWITTER_USERNAME = 'hhlp'
TWITTER_CARD = True

FONT_AWESOME_CDN_LINK = {}
JAVASCRIPT_URLS = ['https://kit.fontawesome.com/9f8622f8d1.js']

STATIC_PATHS = ['images', 'extras/favicon.ico',
                'extras/feeds-allow-indexing',
                'extras/drafts-allow-indexing',
                'extras/redirect-blog']
EXTRA_PATH_METADATA = {
    'extras/favicon.ico': {'path': 'favicon.ico'},
    'extras/feeds-allow-indexing': {'path': 'feeds/.htaccess'},
    'extras/drafts-allow-indexing': {'path': 'drafts/.htaccess'},
    'extras/redirect-blog': {'path': 'blog/index.html'},
}
ARTICLE_PATHS = ['']
ARTICLE_SAVE_AS = '{date:%Y}/{date:%m}/{date:%d}/{slug}.html'
ARTICLE_URL = '{date:%Y}/{date:%m}/{date:%d}/{slug}.html'

ARCHIVES_SAVE_AS = 'pages/archives.html'
YEAR_ARCHIVE_SAVE_AS = 'posts/{date:%Y}/index.html'
MONTH_ARCHIVE_SAVE_AS = 'posts/{date:%Y}/{date:%m}/index.html'

TAG_URL = 'tag/{slug}/'
TAG_SAVE_AS = 'tag/{slug}/index.html'
CATEGORY_URL = 'category/{slug}/'
CATEGORY_SAVE_AS = 'category/{slug}/index.html'

SIDEBAR = 'sidebar.html'
CUSTOM_SIDEBAR_MIDDLES = ("sb_links.html", "sb_tagcloud.html")

TIMEZONE = 'Europe/Madrid'

DEFAULT_LANG = u'en'

THEME = 'voidy-bootstrap'

# Code highlighting
MARKDOWN = {
    'extension_configs': {
        'markdown.extensions.codehilite': {'css_class': 'highlight'},
        'markdown.extensions.extra': {},
        'markdown.extensions.meta': {},
        'markdown.extensions.toc': {},
    },
    'output_format': 'html5',
}

PLUGIN_PATHS = ['pelican-plugins', 'pelican-plugins-other']
# RESPONSIVE_IMAGES = False
PLUGINS = ['pelican.plugins.share_post',
           'post_stats',
           'render_math',
           'sitemap',
           'tag_cloud',
           'series']

TAG_CLOUD_STEPS = 4
TAG_CLOUD_MAX_ITEMS = 30
TAG_CLOUD_SORTING = 'random'

# Blogroll
LINKS = (
    ('Fedora Project', 'http://fedoraproject.org'),
)

# Social widget
SOCIAL = (
    ('Search (DuckDuckGo)',
     'https://duckduckgo.com/?q=site%3Ahhlp&ia=web',
     'fas fa-search fa-fw fa-lg'),
    ('GitHub', 'http://github.com/hhlp',
     'fab fa-github fa-fw fa-lg'),
    ('Gitlab', 'https://gitlab.com/hhlp',
     'fab fa-gitlab fa-fw fa-lg'),
    ('Bitbucket', 'https://bitbucket.org/hhlp/',
     'fab fa-bitbucket fa-fw fa-lg'),
    ('Orcid', ' https://orcid.org/0000-0002-9207-7667',
     'fas fa-flask fa-fw fa-lg'),
    ('Fedora',
     'https://fedoraproject.org/wiki/User:hhlp',
     'fab fa-fedora fa-fw fa-lg'),
    ('Mastodon', 'https://fosstodon.org/@hhlp',
     'fab fa-mastodon fa-fw fa-lg'),
    ('X', 'https://twitter.com/hhlp',
     'fab fa-twitter fa-fw fa-lg'),
    ('Buy me a coffee!', 'https://www.paypal.com/paypalme/louzaoh',
     'fas fa-mug-hot fa-fw fa-lg'),
    ('LinkedIn', 'https://www.linkedin.com/in/louzaoh/',
     'fab fa-linkedin fa-fw fa-lg'),
    ('Facebook', 'http://www.facebook.com/louzaoh',
     'fa fa-facebook-square fa-fw fa-lg'),
    ('Instagram', 'https://instagram.com/louzaoh/',
     'fa fa-instagram fa-fw fa-lg'),
)

DEFAULT_PAGINATION = 10
DELETE_OUTPUT_DIRECTORY = False

SITEMAP = {
    'format': 'xml',
    'priorities': {
        'articles': 0.5,
        'indexes': 0.5,
        'pages': 0.5
    },
    'changefreqs': {
        'articles': 'monthly',
        'indexes': 'daily',
        'pages': 'monthly'
    }
}

CUSTOM_ARTICLE_PRECONTENT = ('article_precontent.html')
CUSTOM_ARTICLE_FOOTERS = ('sharing.html',)
CUSTOM_SCRIPTS_ARTICLE = "sharing_scripts.html"

MATH_JAX = {
    'tex_extensions': ['AMSmath.js', 'AMSsymbols.js', 'color.js', 'mhchem.js'],
    'process_escapes': True
}

STYLESHEET_FILES = ("use-opensans.css", "voidybootstrap.css", "pygment.css")
RELATIVE_URLS = False
CACHE_CONTENT = True

DIRECT_TEMPLATES = ['index', 'archives', 'categories', 'tags', 'publications']
