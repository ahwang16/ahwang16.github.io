#!/usr/bin/env bash

git add .
git commit -m "begin deployment"
git push -u origin master
hugo
cd public
git add .
git commit -m "deploy"
git pull
git pull
git push
cd ..