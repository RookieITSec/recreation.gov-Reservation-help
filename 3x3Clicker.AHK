CoordMode,Mouse,Screen
SetBatchLines, -1
SetMouseDelay, 0


#Persistent 
SetTimer, Chronos, 5
Return

Chronos:
FormatTime, TimeToMeet,,HHmm
If TimeToMeet = 0900
  {
    Click 734 409
    Click 1581 410
    Click 2428 406

    Click 733 869
    Click 1585 870
    Click 2430 865

    Click 731 1329
    Click 1571 1330
    Click 2418 1329

    Click -375 -750
    Click 283 -749
    Click 721 -750

    Click -382 -420
    Click 283 -420
    Click 720 -420

    Click -382 -90
    Click 283 -90
    Click 720 -90

    ExitApp
   }
Return
