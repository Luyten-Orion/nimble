# Copyright (C) Dominik Picheta. All rights reserved.
# BSD License. Look at license.txt for more info.

## This module is implicitly imported in NimScript .nimble files.

var
  packageName* = ""    ## Set this to the package name. It
                       ## is usually not required to do that, nims' filename is
                       ## the default.
  version*: string     ## The package's version.
  author*: string      ## The package's author.
  description*: string ## The package's description.
  license*: string     ## The package's license.
  srcdir*: string      ## The package's source directory.
  binDir*: string      ## The package's binary directory.
  backend*: string     ## The package's backend.

  skipDirs*, skipFiles*, skipExt*, installDirs*, installFiles*,
    installExt*, bin*: seq[string] = @[] ## Nimble metadata.
  requiresData*: seq[string] = @[] ## The package's dependencies.

proc requires*(deps: varargs[string]) =
  ## Call this to set the list of requirements of your Nimble
  ## package.
  for d in deps: requiresData.add(d)

template builtin = discard

proc getPkgDir*(): string =
  builtin