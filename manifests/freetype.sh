#!/bin/sh
brew rm freetype
brew install https://raw.github.com/mxcl/homebrew/0e450f2c2be7450934a3fdcc6537e3fa90c118aa/Library/Formula/freetype.rb
brew unlink freetype
brew install freetype # So dependency does not fail
brew switch freetype 2.4.11