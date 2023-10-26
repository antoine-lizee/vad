#!/usr/bin/env bash

set +x

(
    cd examples/bundler
    npm remove @antoine-lizee/vad-web
    npm i @antoine-lizee/vad-web@latest
    npm run clean
    npm run build
)

(
    cd examples/node
    npm remove @antoine-lizee/vad-node
    npm i @antoine-lizee/vad-node@latest
)

(
    cd examples/react-bundler
    npm remove @antoine-lizee/vad-react
    npm i @antoine-lizee/vad-react@latest
    npm run clean
    npm run build
)

(
    cd examples/nextjs
    npm remove @antoine-lizee/vad-react
    npm i @antoine-lizee/vad-react@latest
    npm run build
)

(
    cd examples/script-tags
    latest_version=$(wget -O - https://cdn.jsdelivr.net/npm/@antoine-lizee/vad-web/ \
        | grep -oP "@antoine-lizee/vad-web@\d+\.\d+\.\d+" \
        | head -1 \
        | grep -oP "\d+\.\d+\.\d+"
    )
    sed -i "s/@antoine-lizee\/vad-web@[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+/@antoine-lizee\/vad-web@$latest_version/g" \
        index.html
)
