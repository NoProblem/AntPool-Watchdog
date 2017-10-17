;=================================== BTC AntPool Watchdog By NoProblem @ moodlander ==================================================
#include lib\libcrypt.ahk
#include lib\JSON.ahk

Menu, Tray, add
Menu, Tray, add, Run AntPool Watchdog, RunWD
Menu, Tray, add, Show Log AntPool Watchdog, ShowLogWD
Menu, Tray, add, Stop/Reload AntPool Watchdog, StopWD
Menu, Tray, add, Settings AntPool Watchdog v0.7.01b, SettingsWD 
Menu, Tray, Tip, AntPool Watchdog Paused
Menu, Tray, Icon, Images\pause_wd.bmp
Menu, Tray, Disable, Stop/Reload AntPool Watchdog

IniRead, User , AntPool_watchdog.ini, AntPoolSettings, User
IniRead, APIkey, AntPool_watchdog.ini, AntPoolSettings, APIkey
IniRead, SecretKey, AntPool_watchdog.ini, AntPoolSettings, SecretKey
IniRead, CoinType, AntPool_watchdog.ini, AntPoolSettings, CoinType
IniRead, WorkerWarnSpeed, AntPool_watchdog.ini, AntPoolSettings, WorkerWarnSpeed
IniRead, WorkerErrorSpeed, AntPool_watchdog.ini, AntPoolSettings, WorkerErrorSpeed
IniRead, WorkerCount, AntPool_watchdog.ini, AntPoolSettings, WorkerCount
IniRead, SkipWorkers, AntPool_watchdog.ini, AntPoolSettings, SkipWorkers
IniRead, SleepTime, AntPool_watchdog.ini, AntPoolSettings, SleepTime
IniRead, SleepAfterError, AntPool_watchdog.ini, AntPoolSettings, SleepAfterError
IniRead, MustSendSMS, AntPool_watchdog.ini, AntPoolSettings, MustSendSMS
IniRead, SMS_RU_api_id, AntPool_watchdog.ini, AntPoolSettings, SMS_RU_api_id
IniRead, Phones, AntPool_watchdog.ini, AntPoolSettings, Phones
IniRead, MustSendTelegram, AntPool_watchdog.ini, AntPoolSettings, MustSendTelegram
IniRead, Telegram_token, AntPool_watchdog.ini, AntPoolSettings, Telegram_token
IniRead, Telegram_chat_id, AntPool_watchdog.ini, AntPoolSettings, Telegram_chat_id

startTime := " " . A_DD . " " . A_MMM . " " . A_Hour . ":" . A_Min . ":" . A_Sec
textLog := "Started:" . startTime . chr(10) . chr(13)
textErrorLog := "Started: " . startTime . chr(10) . chr(13)
checkCounter := 0
totalWarn := 0
totalErr := 0
SetFormat, float, 0.1

Gui, Add, Tab3, vTab, Settings|Log|ReadmeRU|ReadmeEN
Gui, Tab, 1
Gui, Add, Edit, w600 r37 -wrap vEditSettings
Gui, Add, Button, gSaveSettings, Save and Reload
Gui, Tab, 2
Gui, Add, text,, Log:
Gui, Add, Edit, w600 r20 vEditLog
Gui, Add, text,, Error Log:
Gui, Add, Edit, w600 r15 vEditErrorLog
Gui, Tab, 3
Gui, Add, Edit, w600 r39 vEditReadme
Gui, Tab, 4
Gui, Add, Edit, w600 r39 vEditReadmeEN
return

fillGui(textLog, textErrorLog)
{
	GuiControl,, EditLog, %textLog%
	GuiControl,, EditErrorLog, %textErrorLog%
	FileRead, FileContents, AntPool_watchdog.ini
	GuiControl, , EditSettings, %FileContents%
	FileRead, FileContents, readme_ru.txt
	GuiControl, , EditReadme, %FileContents%
	FileRead, FileContents, readme.txt
	GuiControl, , EditReadmeEN, %FileContents%
	return
}

; Settings =============================================================================
SettingsWD:
Menu, Tray, Tip, AntPool Watchdog Paused
Menu, Tray, Icon, Images\pause_wd.bmp
Menu, Tray, Disable, Stop/Reload AntPool Watchdog
Menu, Tray, Enable, Run AntPool Watchdog
fillGui(textLog, textErrorLog)
Gui, -AlwaysOnTop 
GuiControl, Choose, Tab, 1
Gui, Show

MsgBox, Script Paused
return

SaveSettings:
Gui, Submit
FileDelete, AntPool_watchdog.ini
FileAppend, %EditSettings%, AntPool_watchdog.ini
reload
return

;SHOW LOG ===============================================================================
ShowLogWD:
fillGui(textLog, textErrorLog)
Gui, +AlwaysOnTop 
GuiControl, Choose, Tab, 2
Gui, Show
Goto, RunWD
return

;RUN function ===========================================================================
RunWD:

Menu, Tray, Disable, Run AntPool Watchdog
Menu, Tray, Enable, Stop/Reload AntPool Watchdog
Menu, Tray, Tip, AntPool Watchdog Starting...
Menu, Tray, Icon, Images\play_wd_start.bmp

;main loop ==============================================================================
Loop 
{
checkCounter++

Nonce := "" . A_YYYY . A_YDay . A_Hour . A_Min . A_Sec . A_MSec
message := User . APIkey . Nonce  
Signature := LC_HMAC(SecretKey, message, "sha256")
StringUpper, Signature, Signature

POSTData := "?key=" .       APIkey
          . "&nonce=" .     Nonce 
	  . "&signature=" . Signature 
	  . "&coin=" .      CoinType
	  . "&pageEnable=1"
	  . "&page=1"
	  . "&pageSize=50"

URL      := "https://antpool.com/api/workers.htm" . POSTData

try 
{
	WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	WebRequest.Open("POST", URL, false)
	WebRequest.SetRequestHeader("Content-Type", "application/json")
	WebRequest.Send("")
}
catch e 
{
	tipStr := "AntPool Watchdog Connection Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(13) . URL
	Menu, Tray, Tip, %tipStr%
	Menu, Tray, Icon, Images\play_wd_err.bmp	

	textLog .= "AntPool Connection Error! " .  A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . URL . chr(10) . chr(13)
	textErrorLog .= "AntPool Connection Error! " .  A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . URL . chr(10) . chr(13)
 	totalWarn++
	Sleep, %SleepTime% 
	continue
}

if (WebRequest.StatusText = "OK")
{
	html := WebRequest.responseText
	parsed := JSON.Load(html)

	textLog .= "" . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13)	
	warningText := ""
	errorText := ""

	Warn := 0
	Err := 0

	total_last10m := 0.0
	total_last1d := 0.0
	total_last1h := 0.0
	total_last30m := 0.0
	totalRecord := parsed.data.totalRecord
	
	if (totalRecord != WorkerCount)
	{
		errorText .= "Worker count Error: " . totalRecord . "(" . WorkerCount . ") "
		err++
	}	

;worker main loop =========================================================================
	i := 1
	While (i <= totalRecord)
	{
		worker := parsed.data.rows[i].worker
		
		StringGetPos, pos, SkipWorkers, %worker%
		if (pos >= 0)
		{
			comma := SubStr(SkipWorkers, pos + StrLen(worker) + 1, 1)	
			if (comma = "," or comma = "" or comma = " ")
			{
				i++
				continue		
			}
		}

		accepted := parsed.data.rows[i].accepted + 0
		dupelicate := parsed.data.rows[i].dupelicate + 0
		last10m := parsed.data.rows[i].last10m + 0
		last1d := parsed.data.rows[i].last1d + 0
		last1h := parsed.data.rows[i].last1h + 0
		last30m := parsed.data.rows[i].last30m + 0
		other := parsed.data.rows[i].other
		prev10m := parsed.data.rows[i].prev10m + 0
		prev1d := parsed.data.rows[i].prev1d + 0
		prev1h := parsed.data.rows[i].prev1h + 0
		prev30m := parsed.data.rows[i].prev30m + 0
		stale := parsed.data.rows[i].stale + 0
			
		rateStr := worker . " 10m:" . last10m/1000000 . " 30m:" . last30m/1000000 . " 1h:" . last1h/1000000
		textLog .= rateStr . chr(10) . chr(13)	 

		total_last10m += last10m/1000000
		total_last1d += last1d/1000000
		total_last1h += last1h/1000000
		total_last30m += last30m/1000000

		if (last10m < WorkerWarnSpeed) and (last30m < WorkerWarnSpeed) and (last1h < WorkerWarnSpeed)
		{
			warningText .= rateStr . "; "
			Warn++
		}

		if (last10m < WorkerErrorSpeed) and (last30m < WorkerErrorSpeed) and (last1h < WorkerErrorSpeed)
		{
			errorText .= rateStr . "; "
			err++
		}

		if (totalRecord != WorkerCount)
			errorText .= worker . " "	
		
		i++
	} ;end worker loop ========================================

	if (warn > 0)
	{
		textLog .= "Warning! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . warningText . chr(10) . chr(13)
		textErrorLog .= "Warning! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . warningText . chr(10) . chr(13)
	}
	if (err > 0)
	{
		textLog .= "Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . errorText . chr(10) . chr(13)
		textErrorLog .= "Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . errorText . chr(10) . chr(13)

		; ================= SMS ===========================================================
		try 
		{
			URL := "SMS disabled"
			if (MustSendSMS != 0)
			{
				URL := "https://sms.ru/sms/send?api_id=" . SMS_RU_api_id
					. "&to=" . Phones . "&msg=" . errorText . "&json=1"  
	
				WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				WebRequest.Open("POST", URL, false)
				WebRequest.SetRequestHeader("Content-Type", "application/json")
				WebRequest.Send("")
			}

			textErrorLog .= "SMS send " . A_Hour . ":" . A_Min . ":" . A_Sec . " " . URL . chr(10) . chr(13)
		}
		catch e 
		{
			textLog .= "SMS send Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . URL . chr(10) . chr(13)
			textErrorLog .= "SMS send Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . URL . chr(10) . chr(13)
			totalWarn++
		}	

		; ================= Telegram BOT ===========================================================
		try 
		{
			URL := "Telegram disabled"
			if (MustSendTelegram != 0)
			{
				URL := "https://api.telegram.org/bot" . Telegram_token 	
					. "/sendMessage?chat_id=" . Telegram_chat_id . "&text=" . errorText 
	
				WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				WebRequest.Open("POST", URL, false)
				WebRequest.SetRequestHeader("Content-Type", "application/json")
				WebRequest.Send("")
			}

			textErrorLog .= "Telegram send " . A_Hour . ":" . A_Min . ":" . A_Sec . " " . URL . chr(10) . chr(13)
		}
		catch e 
		{
			textLog .= "Telegram send Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . URL . chr(10) . chr(13)
			textErrorLog .= "Telegram send Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . URL . chr(10) . chr(13)
			totalWarn++
		}	
	}

	totalWarn += Warn
	totalErr += Err
	totalRateStr := "10m: " . total_last10m . " 30m: " . total_last30m . " 1h: " . total_last1h . "  24h: " . total_last1d 

	tipStr := chr(34) . User . chr(34) . " AntPool WD Running" . startTime . chr(13) 
		. "Err: " . totalErr . " " . errorText . " Warn: " . totalWarn . " " . warningText . chr(13)
		. A_Hour . ":" . A_Min . ":" . A_Sec . " (" . checkCounter . ")" .  chr(13) 
		. totalRateStr 

	textLog .= totalRateStr . chr(10) . chr(13)	 
	Menu, Tray, Tip, %tipStr%

	if (err > 0) and (warn > 0)
		Menu, Tray, Icon, Images\play_wd_err_warn.bmp	
	else if (err > 0)
		Menu, Tray, Icon, Images\play_wd_err.bmp	
	else if (warn > 0)
		Menu, Tray, Icon, Images\play_wd_warn.bmp	
	else
		Menu, Tray, Icon, Images\play_wd.bmp	
}
else 
{
	tipStr := "AntPool Watchdog Request Status Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(13) . WebRequest.StatusText
	Menu, Tray, Tip, %tipStr%
	Menu, Tray, Icon, Images\play_wd_err.bmp	

	textLog .= "AntPool Watchdog AntPool Request Status Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . WebRequest.StatusText . chr(10) . chr(13) 
	textErrorLog .= "AntPool Watchdog AntPool Request Status Error! " . A_Hour . ":" . A_Min . ":" . A_Sec . chr(10) . chr(13) . WebRequest.StatusText . chr(10) . chr(13) 
}
;end web request ==========================================================

	if (err > 0)
		Sleep, %SleepAfterError%

	Sleep, %SleepTime%

	; AntPool Request limits: Do not make more than 600 request per 10 minutes or we will ban your IP address. 
	if (SleepTime < 1000)
		Sleep, 1000 
}
; end main loop =======================================================
return

Done:
gui,submit,nohide
gui,destroy
return

StopWD:
Reload
