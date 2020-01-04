
;#InstallKeybdHook
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#MaxHotkeysPerInterval 2000 ; To prevent warning from popping up when scrolling with mac touchpad
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

; Mouse over taskbar actions
#If MouseIsOver("ahk_class Shell_TrayWnd")
	; Wheel down/up over taskbar => increase/decrease volume.
	WheelDown::Send {Volume_Down}     
	WheelUp::Send {Volume_Up} ;
	; Wheel click on taskbar => play/pause media
    MButton::Send {Media_Play_Pause}
#If ; Closing the #If statement


; Left side button (ususally on the side of the mouse) => move one desktop to the left
WheelLeft::
	Send ^#{Left}
return

; Right side button (ususally on the side of the mouse) => moves one desktop to the right
WheelRight::
	Send ^#{Right}
return


; Left side button + Left Click => open Task View
XButton1 & LButton::
	Send #{Tab}
return

; Left side button + Right Click => switch to previously opened window
XButton1 & RButton::
	Send !{Tab}
return


; Alt + Backspace => delete text until the start of the line
!Backspace:: 
	Send {Shift down}{Home}{Shift up}{Backspace}
return

; Alt + Delete => delete text until the end of the line
!Delete::
	Send {Shift down}{End}{Shift up}{Delete}
return


; Alt + Wheel down => fast scrolling down
!WheelDown::
	Send {WheelDown}{WheelDown}{WheelDown}{WheelDown}
return

; Alt + Wheel up => fast scrolling up
!WheelUp::
	Send {WheelUp}{WheelUp}{WheelUp}{WheelUp}
return

; Always on top for the current window
^SPACE::  Winset, Alwaysontop, , A