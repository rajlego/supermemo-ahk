;script is meant to make it easy to open tasklists and plan no matter which workspace you're on or what application you're using
;to make it work, you need to have a separate exe named sm18j and have a separate collection you use for tasklists that opens it
;to make it work on all workspaces, from task view right click the sm collection and do "Show this window on all desktops"

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;opens plan globally, shortcut is ctrl+shift+p which you can modify
!^p::
DetectHiddenWindows, Off

if !WinExist("ahk_exe sm18j.exe") {
	run "C:\supermemo-collection\Journal.lnk"
}
else if WinActive("ahk_class TPlanDlg") {
	Send {ESC}
}
else if WinActive("ahk_class TTaskManager") {
	Send {ESC}
	WinActivate ahk_exe sm18j.exe
	Send ^p
}
else if !WinActive("ahk_class TPlanDlg") {
	WinActivate ahk_exe sm18j.exe
	Send ^p
}
return

;opens tasklist globally, shortcut is f4 which you can modify
$F4::
DetectHiddenWindows, Off

if !WinExist("ahk_exe sm18j.exe") {
	run "C:\supermemo-collection\Journal.lnk"
}
else if WinActive("ahk_class TTaskManager") {
	Send {ESC}
}
else if WinActive("ahk_class TPlanDlg") {
	Send {ESC}
	WinActivate ahk_exe sm18j.exe
	Send {F4}{F4}
}
else if !WinActive("ahk_class TTaskManager") {
	WinActivate ahk_exe sm18j.exe
	Send {F4}{F4}
}
return

