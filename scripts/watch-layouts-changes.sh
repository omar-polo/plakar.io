#!/bin/bash

echo "🔁 Watching layouts... will trigger Hugo reload on any change"

fswatch -o themes/plakarium/layouts | while read; do
  echo "<!-- dev-reload-$(date +%s) -->" > content/_dev-trigger.md
  echo "✅ Triggered reload via _dev-trigger.md"
done
