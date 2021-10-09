#!/usr/bin/env bash

git add .
git commit -m "begin deployment"
git push
hugo
cd public
git add .
git commit -m "deploy"
git push
cd ..