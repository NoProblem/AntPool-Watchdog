Скрипт для мониторинга состояния асиков на пуле AntPool. Скрипт бесплатный с откртым кодом пользуйтесь на здоровье :)

Адрес пула: https://www.antpool.com/home.htm
Пул майнит: BTC, LTC, ETH, ETC, ZEC, DASH, BCC 
BTC, BCC, BCL - алгоритм SHA256, асики: AntMiner S4+, AntMiner S5, AntMiner S7, AntMiner R4, AntMiner S9, Avalon4, Avalon6, SP35 Yukon и другие.
LTC - алгоритм script, асики: AntMiner L3, AntMiner L3+, Litecoin Scrypter PRO, ZeusMiner VOLCANO, A4 Dominator и другие.
ETH, ETC - алгоритм EtHash, в текущий момент майнится на видеокартах. 
ZEC - алгоритм Equihash, в текущий момент майнится на видеокартах. 
DASH - алгоритм x11, асики: iBeLink DM384M, Pinidea DR-2 X11, ASIC Baikal A900 X11, AntMiner D3, Innosilicon A5 DashMaster, Pinidea DR-100+, iBeLink DM11G, iBeLink 22 и другие.

Во время работы скрипта отображается иконка и мини статистика в трее. Скрипт раз в 2 минуты проверяет хэшрэйт асиков, если асик отвалился или его хэшрэйт уменьшился то скрипт отправляет смс.
Для работы скрипта необходимо: 
1. Установить программу автохоткей https://www.autohotkey.com/
2. (Пропустить шаг если пока не хотите слать смс) Зарегистрироваться на сайте sms.ru желательно по моей рефке https://noproblem.sms.ru/ вам скидка 10% - мне бонус 1% xD. Сайт позволяет бесплатно отправить 5 смс в сутки на свой номер, этого обычно достаточно.
3. Скачать и распаковать скрипт https://github.com/NoProblem/AntPool-watchdog/archive/master.zip
4. Прописать в файле AntPool_watchdog.ini ваши настройки:

[AntPoolSettings]
User=NoProblem ------------------------------------- Ваш суб аккаунт на антпуле "current sub-account" https://www.antpool.com/home.htm
APIkey=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX --------------- "Key" из настроек на пуле: https://www.antpool.com/user/apiSettings.htm
SecretKey=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX ------------ "Secret" из настроек на пуле: https://www.antpool.com/user/apiSettings.htm
CoinType=BTC --------------------------------------- Название валюты
WorkerWarnSpeed=12000000.00 ------------------------ Скорость в Mh (предупреждение) если скорость воркера ниже то появится предупреждение в трее и логе.
WorkerErrorSpeed=9000000.00 ------------------------ Скорость в Mh (ошибка) если скорость воркера ниже то появится ошибка в трее и отправится SMS.
WorkerCount=9 -------------------------------------- Общее количество воркеров, если работающих воркеров меньше или больше появляется ошибка в трее и отправляется SMS.
SkipWorkers=NoProblem.worker7,NoProblem.worker9 ---- Можно пропустить проверку некоторых воркеров, например временно не работающих или с другим хэшрэйтом.
SleepTime=120000 ----------------------------------- Задержка в миллисекундах между проверками (120000 = 2 минуты)
SleepAfterError=1800000 ---------------------------- Задержка в миллисекундах перед следующей проверкой в случае если произошла ошибка (1800000 = 30 минут). Сделано чтобы в случае ошибки не спамить SMS. 
MustSendSMS=0 -------------------------------------- Отправлять SMS если произошла ошибка (слать:1 не слать:0)
SMS_RU_api_id=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX - Ваш api_id с сайта sms.ru https://sms.ru/?panel=api
Phones=79001234567,79001234568 --------------------- Номера телефонов на которые будет отправлено SMS.

5. Запустить скрипт (двойной клик на файле AntPool_watchdog.ahk), в трее появится иконка "пауза" кликнуть по ней правой кнопкой и выбрать в списке "Run AntPool Watchdog"
6. Профит!

Скрипт можно редактировать в любом текстовом редакторе, например я пишу в блокноте (только хардкор! :) компиляция и прочее не требуются, достаточно выбрать в трее "Reload This Script" или "Exit" и запустить скрипт заново.
В скрипт можно легко добавить отправку емэйла или сообщения в телеграм/вайбер/скайп/ватсап/твитер/и т.д. на соответствующих сайтах есть описание api обычно аналогичное отправке смс. 
Кому понравилось коньяк можно лить сюда :) Bitcoin: 17cQT8GjQyYg9QKt2b42PFXRTifxENdMHT

Ссылки:
качаем тут: https://github.com/NoProblem/AntPool-watchdog/archive/master.zip
страница проекта: https://github.com/NoProblem/AntPool-watchdog
страница на битмедиа: https://forum.bits.media/index.php?/topic/53372-watchdog-%D0%B4%D0%BB%D1%8F-%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%D0%B0-%D0%B0%D1%81%D0%B8%D0%BA%D0%BE%D0%B2%D1%84%D0%B5%D1%80%D0%BC-%D0%BD%D0%B0-antpool%D0%B5/
В скрипте использованы две опенсорс библиотеки:
libcrypt.ahk https://github.com/ahkscript/libcrypt.ahk
AutoHotkey-JSON https://github.com/cocobelgica/AutoHotkey-JSON

Скрипт занимает 2.7МБ оперативки и 0.0% процессорного времени, можно запускать несколько скриптов с разными настройками из разных папок.  