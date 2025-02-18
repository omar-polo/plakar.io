#!/bin/sh

VERSION=main

if test x$1 != x"" ; then
    VERSION=$1
fi

tempfoo=`basename $0`
TMPDIR=`mktemp /tmp/${tempfoo}.XXXXXX` || exit 1
rm ${TMPDIR}
mkdir -p ${TMPDIR}

git clone https://github.com/PlakarKorp/plakar.git -b ${VERSION} ${TMPDIR}

echo rm  -rf ./content/Documentation/${VERSION}/*

echo "generating documentation for ${VERSION}"
mkdir -p ./content/Documentation/${VERSION}/
cat <<EOF > ./content/Documentation/${VERSION}/_index.md
---
date: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
title: ${VERSION}
cascade:
    - showDate: false
    - showReadingTime: false
    - showWordCount: false
---
EOF

DOCUMENTS=
for DOCUMENT in `ls ${TMPDIR}/cmd/plakar/subcommands/help/docs |sort -r`; do
    DOCUMENTS="${DOCUMENTS} ${DOCUMENT}"
done

I=10
for DOCUMENT in ${DOCUMENTS}; do
    DOC_NAME=`echo ${DOCUMENT} | cut -d'.' -f1 |cut -d'-' -f2`
    SUMMARY=`grep '# NAME' -A 2 ${TMPDIR}/cmd/plakar/subcommands/help/docs/${DOCUMENT} | tail -1 | cut -d'-' -f2 | sed 's/^ *//g'`
    echo $SUMMARY

    echo "generating documentation for ${DOC_NAME}"
    mkdir -p ./content/Documentation/${VERSION}/${DOC_NAME}

    cat <<EOF > ./content/Documentation/${VERSION}/${DOC_NAME}/index.md
---
date: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
title: ${DOC_NAME}
weight: ${I}
summary: "${SUMMARY}"
---
EOF
    cat ${TMPDIR}/cmd/plakar/subcommands/help/docs/${DOCUMENT} >> ./content/Documentation/${VERSION}/${DOC_NAME}/index.md
    I=`expr $I + 1`
done

rm -rf ${TMPDIR}