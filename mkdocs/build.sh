# build api markdown
source /opt/edjanger/scripts/_common.sh
rm -f docs/api/*
buildApiMarkdown "docs"
mkdocs build
cp -r site/* ../
