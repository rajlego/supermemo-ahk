; Easy use of SuperMemo with only one hand (reps / grading / priorities / cloze / extract / back and forward) 

; Backtick Button (beneath Esc) =  Enter
; Tab + q/w/e/r sets priorities
; Tab + a = extract
; Tab + z = cloze
; Tab + d = back 
; Tab + f = forward


;Note: Priority settings are currently based on my personal settings, not Naess's. Feel free to change it / change and reupload. 

;by TheTrueSquidward, based off Naess's Numpad Prioritiy Script and raj's ideas.


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance force




;———————————————————————————————————————————————————————————————Backtick button as enter ———————————————————————————————————————————————————————————————

#ifwinactive ahk_exe sm18.exe


sc029::Enter    ;sc029 = backtick's scan code




;no matter where the cursor is it will go to learnbar then press Enter

sc029::   
ControlGetFocus, foc, ahk_class TElWind
if (foc = "Internet Explorer_Server1") or (foc = "Internet Explorer_Server2")
{
	Send, {esc}
}

send, {enter}

return








;——————————————————————————————————————————————————————————————— Priorities (Tab + q/w/e/r) —————————————————————————————————————————————————————————————————————————————

;Priorities are my own, feel free to change.

;scF = the scan code for Tab key



;Tab + q = high priority
scF & sc10::    
{
send, !p
Random, OutputVar, 33, 37  ;Change if you want!
send, %OutputVar%
send, {enter}
}
return


;Tab + w = medium high priority
scF & sc11::
{
send, !p
Random, OutputVar, 50, 55  ;Change if you want!
send, %OutputVar%
send, {enter}
}
return



;Tab + e = medium low priority
scF & sc12::
{
send, !p
Random, OutputVar, 60, 70  ;Change if you want!
send, %OutputVar%
send, {enter}
}
return




;Tab + r = low priority
scF & sc13::
{
send, !p
Random, OutputVar, 85, 95  ;Change if you want!
send, %OutputVar%
send, {enter}
}
return







;——————————————————————————————————————————————————————————————— Extract / Clozes / Movement———————————————————————————————————————————————————————————————

#ifwinactive ahk_exe sm18.exe


scF & sc1E:: Send, !{x}     ; Tab + a = extract
scF & sc1F:: Send, !{z}     ; Tab + s = cloze
scF & sc20:: Send, !{Left}  ; Tab + d = back 
scF & sc21:: Send, !{Right} ; Tab + f = forward


sc1E::a
sc1F::s
sc20::d
sc21::f





;——————————————————————————————————————————————————————————————— Give keys normal function ———————————————————————————————————————————————————————————————








+sc029::  ;use shift+backtick if you still need to type a backtick while in SuperMemo
send, ``
return




;Alt Tab Window Switcher

!scF::
send, !{Tab}
return


;Win Tab Window Switcher
#scF::
send, #{Tab}
return
