#!/bin/bash
# Deploy affiliate site to GitHub Pages
# Usage: ./deploy.sh

set -e

echo "==> Building affiliate site..."
SITE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Check if git repo exists
if [ ! -d "$SITE_DIR/.git" ]; then
    echo "==> Initializing git repo..."
    cd "$SITE_DIR"
    git init
    git checkout -b main
fi

cd "$SITE_DIR"
git add -A
git commit -m "Update affiliate site $(date +%Y-%m-%d)" || echo "No changes to commit"

echo ""
echo "==> Done! Next steps:"
echo "1. Create a GitHub repo: gh repo create devtoolsguide --public --push --source=."
echo "2. Enable GitHub Pages in repo Settings > Pages > Source: main branch"
echo "3. Add your domain in Settings > Pages > Custom domain"
echo "4. Replace affiliate URLs in HTML files with your real tracking links"
echo ""
echo "Or deploy manually by uploading files to any static host (Netlify, Vercel, Cloudflare Pages)."
