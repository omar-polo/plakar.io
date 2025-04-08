#!/bin/bash

echo "🔁 Watching layouts... will trigger Hugo reload at most every 8s"

last_trigger_time=0

fswatch -o themes/plakarium/layouts | while read; do
  now=$(date +%s)
  diff=$((now - last_trigger_time))

  if [ $diff -ge 8 ]; then
    echo "<!-- dev-reload-${now} -->" > content/_dev-trigger.md
    echo "✅ Triggered reload via _dev-trigger.md at $(date +%T)"
    last_trigger_time=$now
  else
    echo "⏱ Skipped reload (last was $diff seconds ago)"
  fi
done
