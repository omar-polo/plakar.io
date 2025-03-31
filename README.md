After checkout:
git rm --cached themes/blowfish
rm -rf themes/blowfish
git submodule add --force -b main https://github.com/nunocoracao/blowfish.git themes/blowfish

Start the server (debug mode):
hugo server --logLevel debug --disableFastRender --ignoreCache --noHTTPCache --templateMetrics

Regenerate CSS:

Work only with tailwindcss 3
nvm install 18
nvm use 18
npm install -D tailwindcss@3.4.1
npm install -D postcss-load-config
npm install -D tailwind-scrollbar@3.1.0
npx @tailwindcss/cli  -c ./tailwind.config.js -i ./themes/blowfish/assets/css/main.css -o ./assets/css/compiled/main.css --watch
