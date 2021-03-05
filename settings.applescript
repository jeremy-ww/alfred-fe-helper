on run argv
  set bundleID to (system attribute "alfred_workflow_bundleid")
  set token to (item 1 of argv)

  tell application id "com.runningwithcrayons.Alfred"
    set configuration "FE_HELPER_ID" to value token in workflow bundleID
  end tell
end run
