Opt("WinTitleMatchMode", 2)
WinWaitActive("PowerPoint","")
$oExcel = ObjCreate("Excel.Application")                   ; 创建一个Excel 对象
If IsObj($oExcel) Then 
MsgBox(0,"","@error="& @error)
EndIf
$oExcel.Visible = 1                                        ; 显示 Excel 自己
$oExcel.WorkBooks.Add                                      ; 添加一个新的工作表
$oExcel.ActiveWorkBook.ActiveSheet.Cells(1,1).Value="test" ; 填写一个表格
sleep(4000)                                                ; 等待 4 秒
$oExcel.ActiveWorkBook.Saved = 1                           ; 模拟用户保存工作表
$oExcel.Quit                                               ; 退出 Excel  