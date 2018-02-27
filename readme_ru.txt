������ ��� ����������� ��������� ������ �� ���� AntPool. ������ ���������� � ������� ����� ����������� �� �������� :)

����� ����: https://www.antpool.com/home.htm
��� ������: BTC, LTC, ETH, ETC, ZEC, DASH, BCC 
BTC, BCC, BCL - �������� SHA256, �����: AntMiner S4+, AntMiner S5, AntMiner S7, AntMiner R4, AntMiner S9, Avalon4, Avalon6, SP35 Yukon � ������.
LTC - �������� script, �����: AntMiner L3, AntMiner L3+, Litecoin Scrypter PRO, ZeusMiner VOLCANO, A4 Dominator � ������.
ETH, ETC - �������� EtHash, � ������� ������ �������� �� �����������. 
ZEC - �������� Equihash, � ������� ������ �������� �� �����������. 
DASH - �������� x11, �����: iBeLink DM384M, Pinidea DR-2 X11, ASIC Baikal A900 X11, AntMiner D3, Innosilicon A5 DashMaster, Pinidea DR-100+, iBeLink DM11G, iBeLink 22 � ������.

�� ����� ������ ������� ������������ ������ � ���� ���������� � ����. ������ ��� � 2 ������ ��������� ������� ������, ���� ���� ��������� ��� ��� ������� ���������� �� ������ ���������� ���.
��� ������ ������� ����������: 
1. ���������� ��������� ���������� https://www.autohotkey.com/
2. (���������� ��� ���� �� ������ ����� ���) ������������������ �� ����� sms.ru, ���� ��������� ��������� ��������� 5 ��� � ����� �� ���� �����, ����� ������ ����������.
3. (���������� ��� ���� �� ������ ����� ��������� � Telegram) ����� BotFather � Telegram �������� ������ ���� https://core.telegram.org/bots, ��������� ��� token �, ������� ���, ��������� chat_id ����.
4. ������� � ����������� ������ https://github.com/NoProblem/AntPool-Watchdog/raw/master/AntPool-Watchdog.zip
5. ��������� � ����� AntPool_watchdog.ini ���� ���������:

[AntPoolSettings]
User=NoProblem ------------------------------------- ��� ��� ������� �� ������� "current sub-account" https://www.antpool.com/home.htm
APIkey=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX --------------- "Key" �� �������� �� ����: https://www.antpool.com/user/apiSettings.htm
SecretKey=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX ------------ "Secret" �� �������� �� ����: https://www.antpool.com/user/apiSettings.htm
CoinType=BTC --------------------------------------- �������� ������
WorkerWarnSpeed=12000000.00 ------------------------ �������� � Mh (��������������) ���� �������� ������� ���� �� �������� �������������� � ���� � ����.
WorkerErrorSpeed=9000000.00 ------------------------ �������� � Mh (������) ���� �������� ������� ���� �� �������� ������ � ���� � ���������� SMS.
WorkerCount=9 -------------------------------------- ����� ���������� ��������, ���� ���������� �������� ������ ��� ������ ���������� ������ � ���� � ������������ SMS.
SkipWorkers=NoProblem.worker7,NoProblem.worker9 ---- ����� ���������� �������� ��������� ��������, �������� �������� �� ���������� ��� � ������ ���������.
SleepTime=120000 ----------------------------------- �������� � ������������� ����� ���������� (120000 = 2 ������)
SleepAfterError=1800000 ---------------------------- �������� � ������������� ����� ��������� ��������� � ������ ���� ��������� ������ (1800000 = 30 �����). ������� ����� � ������ ������ �� ������� SMS. 
MustSendSMS=0 -------------------------------------- ���������� SMS ���� ��������� ������ (�����:1 �� �����:0)
SMS_RU_api_id=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX - ��� api_id � ����� sms.ru https://sms.ru/?panel=api
Phones=79001234567,79001234568 --------------------- ������ ��������� �� ������� ����� ���������� SMS.
MustSendTelegram=0 --------------------------------- ���������� ��������� � Telegram ���� ��������� ������ (�����:1 �� �����:0)
Telegram_token=XXXXXXXXX:XXXXXXXXXXXXXXXXXXXXXXXXX - ����� ���������� �� BotFather � Telegram. 
Telegram_chat_id=XXXXXXXXX ------------------------- chat_id ������ � ����� ���� � ��������, ��� ����� ���������� �������� ��� ������ (https://web.telegram.org/) � ������ ����� �������� ���������� ����, ����� � �������� ������� ������ ���� https://api.telegram.org/botXXXXXXXXX:XXXXXXXXXXXXXXXXXXXXXXXXX/getUpdates?offset=0 (��� XXXXXXXXX:XXXXXXXXXXXXXXXXXXXXXXXXX - token ������ ����) � ������� �������� ���� id ��� � ���� ������� chat_id. 

6. ��������� ������ (������� ���� �� ����� AntPool_watchdog.ahk), � ���� �������� ������ "�����" �������� �� ��� ������ ������� � ������� � ������ "Run AntPool Watchdog"
7. ������!

������ ����� ������������� � ����� ��������� ���������, �������� � ���� � �������� (������ �������! :) ���������� � ������ �� ���������, ���������� ������� � ���� "Reload This Script" ��� "Exit" � ��������� ������ ������.
� ������ ����� ����� �������� �������� ������ ��� ��������� � ��������/������/�����/������/������/� �.�. �� ��������������� ������ ���� �������� api ������ ����������� �������� ���. 
���� ����������� ������ ����� ���� ���� :) Bitcoin: 17cQT8GjQyYg9QKt2b42PFXRTifxENdMHT

������:
������ ���: https://github.com/NoProblem/AntPool-Watchdog/raw/master/AntPool-Watchdog.zip
�������� �������: https://github.com/NoProblem/AntPool-watchdog
� ������� ������������ ��� �������� ����������:
libcrypt.ahk https://github.com/ahkscript/libcrypt.ahk
AutoHotkey-JSON https://github.com/cocobelgica/AutoHotkey-JSON

������ �������� 2.7�� ���������� � 0.0% ������������� �������, ����� ��������� ��������� �������� � ������� ����������� �� ������ �����.  