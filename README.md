# source for plakar.io website

## HOWTO MAKE CHANGES TO FRONT PAGE

- install hugo: `brew install hugo`
- clone this repo:  `git clone ssh://git@github.com/PlakarLabs/plakar.io`
- `hugo server -D` at the root of the project to launch a dev server at `http://localhost:1313`
- change content in `content/_index.html`

Changes are reflected automatically on the dev server which reloads the page.

commits to main branch trigger an action that rebuilds the website to gh-pages branch and deploys to prod one minute later.

