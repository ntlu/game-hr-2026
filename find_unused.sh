#!/bin/bash
find . -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.mp4 -o -iname \*.jpeg -o -iname \*.gif -o -iname \*.svg \) | grep -v 'node_modules' | grep -v '\.git' > media_files.txt

while read -r file; do
    basename=$(basename "$file")
    # Search for the basename in HTML, CSS, JS, Vue files
    count=$(grep -ro --include=\*.{html,css,js,vue} "$basename" . | wc -l)
    if [ "$count" -eq 0 ]; then
        echo "$file"
    fi
done < media_files.txt
rm media_files.txt
