#!/bin/sh

VERSION=main

if [ "$1" != "" ]; then
    VERSION=$1
fi

tempfoo=`basename $0`
TMPDIR=`mktemp -d /tmp/${tempfoo}.XXXXXX` || exit 1

onexit() {
	rm -rf "$TMPDIR"
	exit 0
}

trap 'onexit' EXIT INT TERM

git clone --depth 1 https://github.com/PlakarKorp/plakar.git -b ${VERSION} ${TMPDIR}

echo
    cd ${TMPDIR}
    commit=`git log ${VERSION} | head -4 |  grep ^commit | cut -d' ' -f2`
    date=`git log ${VERSION} | head -4 |  grep ^Date: | cut -d' ' -f2`
    author=`git log ${VERSION} | head -4 |  grep ^Author: | cut -d' ' -f2,3,4,5`
    cd -
echo

rm  -rf ./content/docs/${VERSION}/commands/*

echo "generating documentation for ${VERSION}"
mkdir -p ./content/docs/${VERSION}/commands/
TITLE=${VERSION}
if test ${VERSION} = "main" ; then
    TITLE="developers branch"
fi
cat <<EOF > ./content/docs/${VERSION}/commands/_index.md
+++
title = "Commands"
date = "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
weight = 3
chapter = false
pre = "<b>3. </b>"
sort = "title"
+++

{{%children description="false"%}}
EOF

SUBCMDDIR=subcommands
if ! test -d "${TMPDIR}/${SUBCMDDIR}"; then
    SUBCMDDIR=cmd/plakar/subcommands
fi

mkdir "$TMPDIR/manpages"
find "$TMPDIR/$SUBCMDDIR" -iname \*.[1-9] -ls -exec ln {} "$TMPDIR/manpages/" \;
[ -f "$TMPDIR/plakar.1" ] && ln "$TMPDIR/plakar.1" "$TMPDIR/manpages/"

for man in "$TMPDIR/manpages/"*; do
	name="${man%%.[1-9]}"
	name="${name##*/}"

	summary="$(grep -m1 ^\.Nd "$man" | sed 's/^.Nd //')"

	echo "generating documentation for ${name}"
	mkdir -p ./content/docs/${VERSION}/commands/${name}

	dest="./content/docs/${VERSION}/commands/${name}/index.md"

	cat <<EOF > $dest
---
date: "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
title: ${name##plakar-}
summary: "${summary}"
---
EOF

	mandoc -I os=Plakar -Thtml -Ofragment,man=../%N/ "$man" >> $dest
done
