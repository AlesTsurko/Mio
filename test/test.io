#!/usr/bin/env io
Directory setCurrentWorkingDirectory(System launchPath)

tests := list("")
Directory files foreach(file, 
  if(file name containsSeq("_spec.io"),
    tests append(file name)
  )
)

doFile("../Channel.io")

System args = tests
doFile("jasmineio/jasmine.io")
