#!/bin/bash

git_prompt() {
	echo $(git rev-parse --abbrev-ref HEAD 2>/dev/null)
} 
