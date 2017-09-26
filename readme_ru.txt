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
2. (���������� ��� ���� ���� �� ������ ����� ���) ������������������ �� ����� sms.ru ���������� �� ���� ����� https://noproblem.sms.ru/ ��� ������ 10% - ��� ����� 1% xD. ���� ��������� ��������� ��������� 5 ��� � ����� �� ���� �����, ����� ������ ����������.
3. ������� � ����������� ������ https://github.com/NoProblem/AntPool-watchdog/archive/master.zip
4. ��������� � ����� AntPool_watchdog.ini ���� ���������:

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

5. ��������� ������ (������� ���� �� ����� AntPool_watchdog.ahk), � ���� �������� ������ "�����" �������� �� ��� ������ ������� � ������� � ������ "Run AntPool Watchdog"
6. ������!

������ ����� ������������� � ����� ��������� ���������, �������� � ���� � �������� (������ �������! :) ���������� � ������ �� ���������, ���������� ������� � ���� "Reload This Script" ��� "Exit" � ��������� ������ ������.
� ������ ����� ����� �������� �������� ������ ��� ��������� � ��������/������/�����/������/������/� �.�. �� ��������������� ������ ���� �������� api ������ ����������� �������� ���. 
���� ����������� ������ ����� ���� ���� :) Bitcoin: 17cQT8GjQyYg9QKt2b42PFXRTifxENdMHT

������:
������ ���: https://github.com/NoProblem/AntPool-watchdog/archive/master.zip
�������� �������: https://github.com/NoProblem/AntPool-watchdog
�������� �� ��������: https://forum.bits.media/index.php?/topic/53372-watchdog-%D0%B4%D0%BB%D1%8F-%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0-%D0%B0%D1%81%D0%B8%D0%BA%D0%BE%D0%B2%D1%84%D0%B5%D1%80%D0%BC-%D0%BD%D0%B0-antpool%D0%B5/
� ������� ������������ ��� �������� ����������:
libcrypt.ahk https://github.com/ahkscript/libcrypt.ahk
AutoHotkey-JSON https://github.com/cocobelgica/AutoHotkey-JSON

������ �������� 2.7�� ���������� � 0.0% ������������� �������, ����� ��������� ��������� �������� � ������� ����������� �� ������ �����.  