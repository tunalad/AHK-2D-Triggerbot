﻿#NoEnv
;#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

InputBox, UserInput, Phone Number, Lenght between clicks (in miliseconds)., , 640, 480
if ErrorLevel
{
    MsgBox, CANCEL was pressed. Default value is set to 300.
	UserInput = 300
}

Threshold = 20
*~$t::
MouseGetPos, MouseX, MouseY
PixelGetColor, Color1, (MouseX+2), (MouseY+2)
StringSplit, Colorz, Color1
Color1B = 0x%Colorz3%%Colorz4%
Color1G = 0x%Colorz5%%Colorz6%
Color1R = 0x%Colorz7%%Colorz8%
Color1B += 0
Color1G += 0
Color1R += 0

while (GetKeyState("t", "P"))
{
	sleep 1
    MouseGetPos, MouseX, MouseY
	PixelGetColor, Color2, (MouseX+2), (MouseY+2)
	StringSplit, Colorz, Color2
	Color2B = 0x%Colorz3%%Colorz4%
	Color2G = 0x%Colorz5%%Colorz6%
	Color2R = 0x%Colorz7%%Colorz8%
	Color2B += 0
	Color2G += 0
	Color2R += 0
	if (Color1R > (Color2R + Threshold)) or (Color1R < (Color2R - Threshold)) or (Color1G > (Color2G + Threshold)) or (Color1G < (Color2G - Threshold)) or (Color1B > (Color2B + Threshold)) or (Color1B < (Color2B - Threshold))
	{
		BlockInput, MouseMove
		send {LButton}
		sleep UserInput
		BlockInput, MouseMoveOff
	}
}
BlockInput, MouseMoveOff
Return

End::
MsgBox You just game ended this script.
exitapp
return