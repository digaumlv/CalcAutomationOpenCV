; In order for the x86 DLLs to work
#AutoIt3Wrapper_UseX64=n

;Include OpenCV library
#include "OpenCV-Match_UDF.au3"
#include "Array.au3"
#include "ArrayMultiColSort.au3"
#include "File.au3"

HotKeySet("{ESC}","Sair")
Func Sair()
	Exit
EndFunc

;Debug MarkMatch
$bDebug = False

Global $aSortData[][] = [[0, 0]]

;loads opencv DLLs
_OpenCV_Startup()

;Logs matches, errors in a log file and autoit console output.
_OpenCV_EnableLogging(false,false,false)

;Set Wintitle
$WinTitle = "[CLASS:ApplicationFrameWindow]"

;Example, matching on a specific area of the screen
ShellExecute("calc.exe");open nodepad
WinWait($WinTitle,"",5)
WinMove($WinTitle,"",0,0,500,500)

;~ Calculates the center of a rect using an array with coordinates and then clicks the left/right mouse button.
;~ Parameters: FilePath image to Match
;~ 			   % Threshold
;~ 			   Coordenates matching on a specific area of the screen
;~ 			   Wait 5 seconds: 10 (tries) and 500 per tries

; Click 1
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (1).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 2
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (2).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 3
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (3).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 4
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (4).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 5
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (5).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 6
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (6).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 7
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (7).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 8
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (8).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 9
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (9).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click *
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (10).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click 9
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (9).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

; Click =
$Match = _MatchPicture(@ScriptDir&"\Match\calc\img (11).png", 0.9,false,10,500)
If Not @error Then
	if($bDebug=True) then
		_MarkMatch($Match)
		Sleep(1000)
	EndIf
	_ClickMouse($Match, "left", 1)
EndIf

;Set Wintitle
$WinTitle = "[CLASS:ApplicationFrameWindow]"

;Example, matching on a specific area of the screen
WinActivate($WinTitle,"")
WinWait($WinTitle,"",5)
WinMove($WinTitle,"",0,0,500,500)

$aFiles = _FileListToArray(@ScriptDir&"\Match\Calc\Results\","*",$FLTA_FILES)
Local $aResult[1][2] = [["",""]]
Local $aResult
Local $sCoords[4] = [9, 68, 489,157]
if($bDebug=True) then
	_MarkMatch($sCoords)
	Sleep(1000)
EndIf

for $i=1 To $aFiles[0] Step 1

	Local $sCoords[4] = [18, 90, 487,158]
	local $contReadNumber = 0
	Local $bExit = False
	ConsoleWrite($aFiles[$i] & @CRLF)
	Do

		if ($sCoords[0]>470) then
			ExitLoop
		else
			$Match = _MatchPicture(@ScriptDir&"\Match\Calc\Results\" & $aFiles[$i], 0.75,$sCoords,2,100)
		endif

		If Not @error Then

			if($bDebug=True) then

				_MarkMatch($Match)
;~ 				Sleep(1000)
;~ 				MouseClickDrag("",$sCoords[0],$sCoords[1],$sCoords[2],$sCoords[3])

			EndIf

			if (_ArraySearch($aResult,$Match[0]) = -1) then

				_ArrayAdd($aResult ,Number(StringStripWS($Match[0],$STR_STRIPALL)) & "|" & StringStripWS(StringReplace(StringReplace(StringReplace($aFiles[$i],"result ",""),"(",""),").png",""), $STR_STRIPALL))
				$sCoords[0] = $Match[2]

				if($bDebug=True) then
					_MarkMatch($sCoords & @CRLF)
				endif

			ElseIf not(_ArraySearch($aResult,$Match[0]) = -1) then

				$bExit = True
				ExitLoop

			EndIf
			$contReadNumber = $contReadNumber + 1

		else
;~ 			ConsoleWrite("Não Encontrou Imagem!")
			$bExit = True
			ExitLoop
		EndIf

	Until $bExit = True

Next

for $i=1 To UBound($aResult)-1 Step 1
	$aResult[$i][0] = Number($aResult[$i][0])
Next

;Closes DLLs
_OpenCV_Shutdown()

_ArrayMultiColSort($aResult, $aSortData)

$sAppend = ""
for $i=0 To UBound($aResult)-1 Step 1
	$sAppend = $sAppend & $aResult[$i][1]
Next

MsgBox("","Resultado",$sAppend)
