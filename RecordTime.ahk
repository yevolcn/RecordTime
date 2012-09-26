RecordFile = L:\KuaiPan\FastRecordTime.txt ;文件记录地址

!4::
	Run,%RecordFile%
Return

!3::

	Gui, Add, Text, x12 y12 w90 h21 +Center , UserName
	Gui, Add, Edit, x102 y10 w140 h21 +Center vStartTime, Edit
	Gui, Add, Edit, x257 y10 w30 h21 +Center vUseTime, 1
	Gui, Add, Text, x292 y12 w10 h21 +Center, H
	Gui, Add, Edit, x12 y50 w290 h60 vThings,
	Gui, Add, Button, x222 y120 w80 h30 , OK

	GuiControl, , UserName , %A_UserName%
	GuiControl, , StartTime , %A_YYYY%-%A_MM%-%A_WDay% %A_Hour%:%A_Min%:%A_Sec%

	SettingForm_x:=Round((A_ScreenWidth-315)/2)

	Gui, Show, x%SettingForm_x% y320 h158 w315, FastRecordTime

Return

GuiClose:
	Gui, Destroy
Return

ButtonOK:
{
	Gui, Submit, NoHide
	GuiControlGet, UserName
	GuiControlGet, StartTime
	GuiControlGet, UseTime
	GuiControlGet, Things
	StringReplace, Things, Things,`n,<br>
	info = %StartTime%   %UseTime%   %Things%   %UserName%`n`n
	;MsgBox,%info%
	FileAppend,%info%,%RecordFile% ;写入文件
	TrayTip,FastRecordTime,%info%,100 ;显示提示
	Gui, Destroy
	Return
}

#IfWinActive,FastRecordTime
{
	^enter::
	Gosub,ButtonOK
	Return
}






