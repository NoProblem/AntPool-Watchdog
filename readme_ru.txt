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
2. (Пропустить шаг если не хотите слать смс) Зарегистрироваться на сайте sms.ru, сайт позволяет бесплатно отправить 5 смс в сутки на свой номер, этого обычно достаточно.
3. (Пропустить шаг если не хотите слать сообщения в Telegram) Через BotFather в Telegram создаете своего бота https://core.telegram.org/bots, получаете его token и, написав ему, получаете chat_id чата.
4. Скачать и распаковать скрипт https://github.com/NoProblem/AntPool-Watchdog/raw/master/AntPool-Watchdog.zip
5. Прописать в файле AntPool_watchdog.ini ваши настройки:

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
MustSendTelegram=0 --------------------------------- Отправлять сообщение в Telegram если произошла ошибка (слать:1 не слать:0)
Telegram_token=XXXXXXXXX:XXXXXXXXXXXXXXXXXXXXXXXXX - токен полученный от BotFather в Telegram. 
Telegram_chat_id=XXXXXXXXX ------------------------- chat_id вашего с ботом чата в телеграм, для этого открываете например веб клиент (https://web.telegram.org/) и пишете любое собщение созданному боту, далее в браузере делаете запрос вида https://api.telegram.org/botXXXXXXXXX:XXXXXXXXXXXXXXXXXXXXXXXXX/getUpdates?offset=0 (где XXXXXXXXX:XXXXXXXXXXXXXXXXXXXXXXXXX - token вашего бота) и узнаете значение поля id это и есть искомый chat_id. 

6. Запустить скрипт (двойной клик на файле AntPool_watchdog.ahk), в трее появится иконка "пауза" кликнуть по ней правой кнопкой и выбрать в списке "Run AntPool Watchdog"
7. Профит!

Скрипт можно редактировать в любом текстовом редакторе, например я пишу в блокноте (только хардкор! :) компиляция и прочее не требуются, достаточно выбрать в трее "Reload This Script" или "Exit" и запустить скрипт заново.
В скрипт можно легко добавить отправку емэйла или сообщения в телеграм/вайбер/скайп/ватсап/твитер/и т.д. на соответствующих сайтах есть описание api обычно аналогичное отправке смс. 
Кому понравилось коньяк можно лить сюда :) Bitcoin: 17cQT8GjQyYg9QKt2b42PFXRTifxENdMHT

Ссылки:
качаем тут: https://github.com/NoProblem/AntPool-Watchdog/raw/master/AntPool-Watchdog.zip
страница проекта: https://github.com/NoProblem/AntPool-watchdog
В скрипте использованы две опенсорс библиотеки:
libcrypt.ahk https://github.com/ahkscript/libcrypt.ahk
AutoHotkey-JSON https://github.com/cocobelgica/AutoHotkey-JSON

Скрипт занимает 2.7МБ оперативки и 0.0% процессорного времени, можно запускать несколько скриптов с разными настройками из разных папок.  