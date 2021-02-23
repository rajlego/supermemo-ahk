;Provides some simple shortcuts that make script making easier



;alt+shift+w ——> open autohotkey Window Spy (for getting information about windows, eg. wintitle)
;alt+shfit+k ——> get key information (eg. scan code)

;::sautosave:: ——> expands into code which reloads the script every time you press ctrl+s (for notepad)
;[[[ ———> expands into large divider for organising code
;]] ———> expands into small divider for organising code
;// ———> expands into /* for multiline comments
;\\ ———> expands into */ for multiline comments





#ifwinactive ahk_exe notepad.exe


;———————————————————————————————————————————————————————————————Scipt Autosave Expansion———————————————————————————————————————————————————————————————

::sautosave::
(
;STARTOFSCRIPT

SetTimer,UPDATEDSCRIPT,1000
UPDATEDSCRIPT:
FileGetAttrib,attribs,%A_ScriptFullPath%
IfInString,attribs,A
{
FileSetAttrib,-A,%A_ScriptFullPath%
SplashTextOn,,,Updated script,
Sleep,500
SplashTextOff
Reload
}
Return
;ENDOFSCRIPT
)




!+u::run, C:\Program Files\AutoHotkey\WindowSpy.ahk



;———————————————————————————————————————————————————————————————Comment Maker———————————————————————————————————————————————————————————————


::[[[:: ;Quick Comments
send, `;———————————————————————————————————————————————————————————————
KeyWait, ., D
send, {Backspace}
send, ———————————————————————————————————————————————————————————————
return



::]]::
send, `;———————————————————
KeyWait, ., D
send, {Backspace}
send, ———————————————————
return






;———————————————————————————————————————————————————————————————Get Key Name———————————————————————————————————————————————————————————————;———————————————————

!+k::
InputBox, key

name := GetKeyName(key)
vk   := GetKeyVK(key)
sc   := GetKeySC(key)

MsgBox, % Format("Name:`t{}`nVK:`t{:X}`nSC:`t{:X}", name, vk, sc)
return


:*://::/*
:*:\\::*/



