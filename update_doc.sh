#!/bin/bash
git add .
git commit -a -m "Update index.md"
git push
./deploy.sh
