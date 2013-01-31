#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Opt("GUIOnEventMode", 1)
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode", 1)
$formOption = GUICreate("自定义时间", 351, 91, -1, -1)
GUISetOnEvent($GUI_EVENT_CLOSE, "formOptionClose")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "formOptionClose")
$lblPrompt = GUICtrlCreateLabel("提示信息", 8, 8, 52, 17)
$iptPrompt = GUICtrlCreateInput("", 8, 25, 273, 21)
$lblTime = GUICtrlCreateLabel("时间", 288, 8, 28, 17)
$iptTime = GUICtrlCreateInput("1", 288, 25, 33, 21, BitOR($ES_AUTOHSCROLL, $ES_NUMBER))
$lblUnit = GUICtrlCreateLabel("分", 328, 27, 16, 17)
$btnOk = GUICtrlCreateButton("确定(&O)", 264, 56, 75, 25, 0)
GUICtrlSetOnEvent(-1, "btnOkClick")
TraySetClick("9")

Dim $m[7][2] = [[Null, 3],[Null, 5],[Null, 10],[Null, 15],[Null, 20],[Null, 30],[Null, 0]]
For $i = 0 To UBound($m) - 1
	If $m[$i][1] > 0 Then
		$m[$i][0] = TrayCreateItem($m[$i][1] & " 分钟提醒")
		TrayItemSetOnEvent(-1, "mClick")
	Else
		$miSprt1 = TrayCreateItem("")
		$m[$i][0] = TrayCreateItem("自定义时间")
		TrayItemSetOnEvent(-1, "mClick")
	EndIf
Next

$miSprt2 = TrayCreateItem("")
$miExit = TrayCreateItem("退出")
TrayItemSetOnEvent(-1, "miExitClick")
GUISetState(@SW_HIDE)
Local $SleepTime
Local $StartTimeStamp
Local $Prompt

While 1
	Sleep(100)
	If $SleepTime > 0 Then
		If TimerDiff($StartTimeStamp) > $SleepTime * 60000 Then
			MsgBox(48, "提示", $Prompt)
			$SleepTime = 0
			$Prompt = ""
		EndIf
	EndIf
WEnd


Func formOptionClose()
	GUISetState(@SW_HIDE, $formOption)
EndFunc   ;==>formOptionClose
Func mClick()
	MsgBox(0,'',TrayGetMsg( ))
	GUISetState(@SW_SHOW, $formOption)
	For $i = 1 To UBound($m) - 1
		If $m[$i][0] = TrayGetMsg( ) Then
			If $m[$i][0] > 0 Then
				SetTimer("您设置的" & $m[$i][1] & "分钟时间到！", $m[$i][1])
			Else
				GUISetState(@SW_SHOW, $formOption)
			EndIf
		EndIf
	Next
EndFunc   ;==>mClick


Func SetTimer($PrptTxt, $Min)
	$StartTimeStamp = TimerInit()
	$SleepTime = $Min
	$Prompt = $PrptTxt
EndFunc   ;==>SetTimer

Func btnOkClick()
	$PromptText = GUICtrlRead($iptPrompt)
	$Time = GUICtrlRead($iptTime)
	GUICtrlSetData($iptPrompt, "")
	GUICtrlSetData($iptTime, "0")
	GUISetState(@SW_HIDE, $formOption)
	SetTimer($PromptText, $Time)
EndFunc   ;==>btnOkClick
Func miExitClick()
	Exit
EndFunc   ;==>miExitClick
