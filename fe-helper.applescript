to getRecordValue(theKey, theList)
   run script "on run{theKey,theList}
   return (" & theKey & " of theList )
end" with parameters {theKey, theList}
end getRecordValue

on run argv
  set FE_HELPER_ID to (system attribute "FE_HELPER_ID")
  set apps to {json:"json-format", encode:"en-decode", regexp:"regexp", format:"code-beautify", qrcode:"qr-code", codecompress:"code-compress", timestamp:"timestamp", imagebase64:"image-base64", password:"password", qrdecode:"qr-decode", postman:"postman"}
  set app_name to (item 1 of argv)
  set tools to (getRecordValue(app_name, apps))
  tell application "chrome"
    open location "chrome-extension://" & FE_HELPER_ID & "/dynamic/index.html?tool=" & tools
    repeat until (loading of front window's active tab is false)
    end repeat
    delay 0.5
    tell application "System Events" to key code 9 using {command down}
  end tell
end run
