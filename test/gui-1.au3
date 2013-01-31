#include <GUIConstantsEx.au3>

Opt("GUIOnEventMode", 1) ; Change to OnEvent mode

Global $hMainGUI = GUICreate("Hello World", 200, 100)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEButton")
GUICtrlCreateLabel("Hello world! How are you?", 30, 10)
Local $iOKButton = GUICtrlCreateButton("OK", 70, 50, 60)
GUICtrlSetOnEvent($iOKButton, "OKButton")

Global $hDummyGUI = GUICreate("Dummy GUI for testing", 200, 100)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEButton")

GUISetState(@SW_SHOW,$hMainGUI)
GUISetState(@SW_SHOW,$hDummyGUI)

While 1
    Sleep(100) ; Sleep to reduce CPU usage
WEnd

Func OKButton()
    ; Note: At this point @GUI_CtrlId would equal $iOKButton
    MsgBox(0, "GUI Event", "You selected OK!")
EndFunc   ;==>OKButton

Func CLOSEButton()
    ; Note: at this point @GUI_CtrlId would equal $GUI_EVENT_CLOSE,
    ; @GUI_WinHandle will be either $hMainGUI or $hDummyGUI
    If @GUI_WinHandle = $hMainGUI Then
        MsgBox(0, "GUI Event", "You selected CLOSE in the main window! Exiting...")
        Exit
    EndIf
EndFunc   ;==>CLOSEButton
