GUICreate("test",800,600)
GUISetState(@SW_SHOW)
Do
	HotKeySet ( "{SPACE}" , "stop" )
Until 0
Func stop()
	MsgBox(0,"",@HotKeyPressed)
	Exit
EndFunc