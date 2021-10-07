#!/bin/bash

export USER_SHELL="zsh"

for i in .aliases .gitconfig .zshrc; do
	ln --verbose --force --symbolic $PWD/$i ~/
done
echo "Creating symlinks done!"

if [[ -z "$CLOUDSMITH_API_KEY" ]]; then
	echo "CLOUDSMITH_API_KEY not set, not configuring credential helper"
else
	echo "Setting up git credential helper for cloudsmith"
	
	git config --global credential.helper store
	echo "https://${CLOUDSMITH_API_USER}:${CLOUDSMITH_API_KEY}@dl.cloudsmith.io" >> ~/.git-credentials
fi
echo "Credential config done!"
