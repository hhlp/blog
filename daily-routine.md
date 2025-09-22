   ┌──────────────────────────────┐
   │       Write a new post       │
   │ make newpreview NAME="Title" │
   │ Default: Markdown (.md)      │
   │ Optional: EXT=rst            │
   └─────────────┬────────────────┘
                 │
                 ▼
   ┌──────────────────────────────┐
   │  Local preview the site      │
   │ make preview                 │
   │ http://localhost:8000        │
   └─────────────┬────────────────┘
                 │
                 ▼
   ┌──────────────────────────────┐
   │ Edit post if needed          │
   │ make editpost NAME="Title"   │
   │ Refresh preview              │
   └─────────────┬────────────────┘
                 │
                 ▼
   ┌──────────────────────────────┐
   │ Commit & push to GitHub      │
   │ git add .                    │
   │ git commit -m "Add post"     │
   │ git push origin main         │
   └─────────────┬────────────────┘
                 │
                 ▼
   ┌──────────────────────────────┐
   │ GitHub Actions deploys       │
   │ make github (automated)      │
   │ Output pushed to gh-pages    │
   │ Live blog updated            │
   │ https://hhlp.github.io/blog/│
   └──────────────────────────────┘

