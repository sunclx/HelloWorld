;MyPath = Application.Path & "\TestFile"
;Application.ActivePresentation.SaveAs MyPath
;Opt("WinTitleMatchMode", 2)
;WinWaitActive("PowerPoint","")
;$oExcel = ObjCreate("Powerpoint.Application")                   ; ����һ��Excel ����
Local $obj = ObjGet("","PowerPoint.Application")
If Not IsObj($obj) Then
	;MsgBox(0, "", "@error=" & @error)
EndIf
$obj.Visible = 1 ; ��ʾ Excel �Լ�
WinWaitActive("[CLASS:PPTFrameClass]","")
Sleep(1000)
$MyPath = "D:\nihao"
$obj.ActivePresentation.SaveCopyAs($MyPath)
;$oExcel.WorkBooks.Add                                      ; ���һ���µĹ�����
;$oExcel.ActiveWorkBook.ActiveSheet.Cells(1,1).Value="test" ; ��дһ�����
;sleep(4000)                                                ; �ȴ� 4 ��
;$oExcel.ActiveWorkBook.Saved = 1                           ; ģ���û����湤����
;$oExcel.Quit                                               ; �˳� Excel
; Example getting an Object using it's class name
;
; Excel must be activated for this example to be successfull
#cs
Local $oExcel = ObjGet("", "Excel.Application") ; Get an existing Excel Object

If @error Then
    MsgBox(4096, "ExcelTest", "Error Getting an active Excel Object. Error code: " & Hex(@error, 8))
    Exit
EndIf

$oExcel.Visible = 1 ; Let the guy show himself
$oExcel.workbooks.add ; Add a new workbook
Exit
#ce