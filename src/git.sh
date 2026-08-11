#!/bin/bash

# Contain all function related to git

get_git_branch() {
	echo $(git rev-parse --abbrev-ref HEAD 2>/dev/null)
} 
