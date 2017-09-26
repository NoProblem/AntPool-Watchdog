Opensource and free script for ASIC monitoring on AntPool pool. Created by NoProblem :)

AntPool: https://www.antpool.com/home.htm
Pool coin mining: BTC, LTC, ETH, ETC, ZEC, DASH, BCC 
BTC, BCC, BCL - SHA256, ASICs: AntMiner S4+, AntMiner S5, AntMiner S7, AntMiner R4, AntMiner S9, Avalon4, Avalon6, SP35 Yukon and others.
LTC - script, ASICs: AntMiner L3, AntMiner L3+, Litecoin Scrypter PRO, ZeusMiner VOLCANO, A4 Dominator and others.
ETH, ETC - EtHash, video cards.
ZEC - Equihash, video cards.
DASH -  x11, ASICs: iBeLink DM384M, Pinidea DR-2 X11, ASIC Baikal A900 X11, AntMiner D3, Innosilicon A5 DashMaster, Pinidea DR-100+, iBeLink DM11G, iBeLink 22 и другие.

English is not my native language, sorry for mistakes.

This script running in tray and checking ASIC state every 2 min. If a single ASIC hashrate less than value "WorkerErrorSpeed" script will send SMS.
Usage:
1. Download and install Autohotkey https://www.autohotkey.com/
2. (skip if not need SMS) Register on site sms.ru (may be other site) using my ref link https://noproblem.sms.ru/ discount 10%. 
3. Dowload script: https://github.com/NoProblem/AntPool-Watchdog/raw/master/AntPool-Watchdog.zip
4. Change values in file AntPool_watchdog.ini

[AntPoolSettings]
User=NoProblem ------------------------------------- Your sub account.
APIkey=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX --------------- "Key" from https://www.antpool.com/user/apiSettings.htm
SecretKey=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX ------------ "Secret" from https://www.antpool.com/user/apiSettings.htm
CoinType=BTC --------------------------------------- Coin 
WorkerWarnSpeed=12000000.00 ------------------------ Speed in Mh (warning) If worker speed less than this value than warning message will apears in tray and log.
WorkerErrorSpeed=9000000.00 ------------------------ Speed in Mh (error) If worker speed less than this value than error message will apears in tray and log and SMS will be send. 
WorkerCount=8 -------------------------------------- Your total worker quantity.
SkipWorkers=NoProblem.worker7,NoProblem.worker8 ---- Skip workers which you dont need to check.
SleepTime=120000 ----------------------------------- Time between checks in milliseconds (120000 = 2 min)
SleepAfterError=1800000 ---------------------------- Time after error (1800000 = 30 min). Timout for prevent SMS spamming.
MustSendSMS=0 -------------------------------------- Send SMS if error appears or not (yes:1 no:0)
SMS_RU_api_id=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX - Your api_id from sms.ru https://sms.ru/?panel=api
Phones=79001234567,79001234568 --------------------- Phone numbers for SMS.

5. Run script (dbl click AntPool_watchdog.ahk), in tray will appes "pause" icon, right click on it and choose "Run AntPool Watchdog"
6. Have fun!

You can edit this script with any text editor like notepad, script not need to compile, after update it you must choose "Reload This Script" or "Exit" and run script again.
If you like it you can buy some c2h5oh for me :) Bitcoin: 17cQT8GjQyYg9QKt2b42PFXRTifxENdMHT

links:
Download last version: https://github.com/NoProblem/AntPool-Watchdog/raw/master/AntPool-Watchdog.zip
GitHub: https://github.com/NoProblem/AntPool-Watchdog
Used libraries:
libcrypt.ahk https://github.com/ahkscript/libcrypt.ahk
AutoHotkey-JSON https://github.com/cocobelgica/AutoHotkey-JSON

You can run script multiple times with different settings from different directories.
Script mem usage ~2.8MB, CPU usage ~0.0%