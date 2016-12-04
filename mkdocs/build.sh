# build api markdown
source /opt/edjanger/scripts/_common.sh
rm -f docs/api/*
buildApiMarkdown "docs/api"
mkdocs build
cp -r site/* ../
