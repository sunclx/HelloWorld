Opt("WinTitleMatchMode", 2)
WinWaitActive("PowerPoint","")
$oExcel = ObjCreate("Excel.Application")                   ; ����һ��Excel ����
If IsObj($oExcel) Then 
MsgBox(0,"","@error="& @error)
EndIf
$oExcel.Visible = 1                                        ; ��ʾ Excel �Լ�
$oExcel.WorkBooks.Add                                      ; ���һ���µĹ�����
$oExcel.ActiveWorkBook.ActiveSheet.Cells(1,1).Value="test" ; ��дһ�����
sleep(4000)                                                ; �ȴ� 4 ��
$oExcel.ActiveWorkBook.Saved = 1                           ; ģ���û����湤����
$oExcel.Quit                                               ; �˳� Excel  