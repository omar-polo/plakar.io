After checkout:
git rm --cached themes/blowfish
rm -rf themes/blowfish
git submodule add --force -b main https://github.com/nunocoracao/blowfish.git themes/blowfish

Start the server (debug mode):
hugo server --logLevel debug --disableFastRender --ignoreCache --noHTTPCache --templateMetrics

Regenerate CSS:
npx tailwindcss -c ./tailwind.config.js  -i ./themes/blowfish/assets/css/main.css -o ./assets/css/compiled/main.css --watch
