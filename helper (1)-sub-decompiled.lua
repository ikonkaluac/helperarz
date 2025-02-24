if (function ()
    return true
end) then
script_name("helper")
script_author("McLore")
script_properties("work-in-pause")
script_version(7.6)

	local slot0_a8134, slot1_a29133 = pcall(require, "imgui")
	local slot2_a3948, slot3_a9760 = pcall(require, "fAwesome5")
	local slot4_a3952, slot5_a1606 = pcall(require, "imgui_addons")
	local slot6_a27283, slot7_a25136 = pcall(require, "rkeys")
	local slot8_a8136, slot9_a25135 = pcall(require, "lib.imcustom.hotkey")
	local slot10_a1620, slot11_a1621 = pcall(require, "vkeys")
	local slot12_a3949, slot13_a25131 = pcall(import, "imgui_notf.lua")
	local slot14_a5877, slot15_a5899 = pcall(require, "lib.samp.events")
	local slot16_a1634 = require("encoding")
	local slot17_a28610 = require("inicfg")
	local slot18_a28309 = require("memory")
	local slot19_a25374 = require("moonloader").download_status
	local slot20_a5656 = require("ffi")
	local slot21_a1650 = require("lib.windows.message")

	require("lib.sampfuncs")

	local slot22_a5875 = require("lanes").configure()
	local slot23_a1660 = require("game.keys")
	local slot24_a28082 = require("game.weapons")
	slot16_a1634.default = "CP1251"
	u8 = slot16_a1634.UTF8
	CP1251 = slot16_a1634.CP1251

	slot20_a5656.cdef([[
	short GetKeyState(int nVirtKey);
	bool GetKeyboardLayoutNameA(char* pwszKLID);
	int GetLocaleInfoA(int Locale, int LCType, char* lpLCData, int cchData);
]])

	local slot25_a5659 = 32
	local slot26_a5657 = slot20_a5656.new("char[?]", slot25_a5659)
	local slot27_a5658 = slot20_a5656.new("char[?]", slot25_a5659)
	ffile = getWorkingDirectory() .. "\\config\\Universal Helper\\UNHKey.bind"
	binderlist = {}

	if doesFileExist(ffile) then
		local slot28_a1692 = io.open(ffile, "r")

		if io.open(ffile, "r") then
			binderlist = decodeJson(slot28_a1692:read("a*"))

			slot28_a1692:close()
		end

		if #binderlist == 0 or not binderlist or not binderlist[1] then
			local slot29_a1704 = {}
			local slot30_a1705 = {
				text = "Меню взаимодействий",
				v = {}
			}
			slot29_a1704[1] = slot30_a1705
			local slot30_a1707 = {
				text = "Фаст инвайт",
				v = {}
			}
			slot29_a1704[2] = slot30_a1707
			local slot30_a1709 = {
				text = "Сбив анимации",
				v = {}
			}
			slot29_a1704[3] = slot30_a1709
			local slot30_a1711 = {
				text = "Активация скрипта",
				v = {}
			}
			slot29_a1704[4] = slot30_a1711
			local slot30_a1713 = {
				text = "WallHack",
				v = {}
			}
			slot29_a1704[5] = slot30_a1713
			local slot30_a1715 = {
				text = "Активация piar",
				v = {}
			}
			slot29_a1704[6] = slot30_a1715
			local slot30_a1717 = {
				text = "Репорт по Anti-DM",
				v = {}
			}
			slot29_a1704[7] = slot30_a1717
			local slot30_a1719 = {
				text = "Anti-AFK",
				v = {}
			}
			slot29_a1704[8] = slot30_a1719
			local slot30_a1721 = {
				text = "Оверлей",
				v = {}
			}
			slot29_a1704[9] = slot30_a1721
			local slot30_a1723 = {
				text = "Тренировка капчи",
				v = {}
			}
			slot29_a1704[10] = slot30_a1723
			binderlist = slot29_a1704
		end
	else
		local slot28_a1725 = {}
		local slot29_a1726 = {
			text = "Меню взаимодействий",
			v = {}
		}
		slot28_a1725[1] = slot29_a1726
		local slot29_a1728 = {
			text = "Фаст инвайт",
			v = {}
		}
		slot28_a1725[2] = slot29_a1728
		local slot29_a1730 = {
			text = "Сбив анимации",
			v = {}
		}
		slot28_a1725[3] = slot29_a1730
		local slot29_a1732 = {
			text = "Активация скрипта",
			v = {}
		}
		slot28_a1725[4] = slot29_a1732
		local slot29_a1734 = {
			text = "WallHack",
			v = {}
		}
		slot28_a1725[5] = slot29_a1734
		local slot29_a1736 = {
			text = "Активация piar",
			v = {}
		}
		slot28_a1725[6] = slot29_a1736
		local slot29_a1738 = {
			text = "Репорт по Anti-DM",
			v = {}
		}
		slot28_a1725[7] = slot29_a1738
		local slot29_a1740 = {
			text = "Anti-AFK",
			v = {}
		}
		slot28_a1725[8] = slot29_a1740
		local slot29_a1742 = {
			text = "Оверлей",
			v = {}
		}
		slot28_a1725[9] = slot29_a1742
		local slot29_a1744 = {
			text = "Тренировка капчи",
			v = {}
		}
		slot28_a1725[10] = slot29_a1744
		binderlist = slot28_a1725
	end

	local slot28_a1746 = {
		u8("Нет"),
		u8("IPHONE X"),
		u8("Samsung Galaxy S10"),
		u8("Xiaomi Mi 8"),
		u8("Huawei P20 PRO"),
		u8("Google Pixel 3")
	}
	pphone = slot28_a1746
	local slot28_a28606 = getWorkingDirectory() .. "\\config\\Universal Helper\\Universal_Bind.bind"
	local slot29_a28607 = {}

	if doesFileExist(slot28_a28606) then
		local slot30_a1779 = io.open(slot28_a28606, "r")

		if io.open(slot28_a28606, "r") then
			slot29_a28607 = decodeJson(slot30_a1779:read("a*"))

			slot30_a1779:close()
		end
	else
		local slot30_a1787 = {}
		local slot31_a1788 = {
			text = "",
			cmd = "-",
			delay = 3,
			v = {}
		}
		slot30_a1787[1] = slot31_a1788
		local slot31_a1790 = {
			text = "",
			cmd = "-",
			delay = 3,
			v = {}
		}
		slot30_a1787[2] = slot31_a1790
		local slot31_a1792 = {
			text = "",
			cmd = "-",
			delay = 3,
			v = {}
		}
		slot30_a1787[3] = slot31_a1792
		local slot31_a1794 = {
			text = "",
			cmd = "-",
			delay = 3,
			v = {}
		}
		slot30_a1787[4] = slot31_a1794
		local slot31_a1796 = {
			text = "",
			cmd = "-",
			delay = 3,
			v = {}
		}
		slot30_a1787[5] = slot31_a1796
		slot29_a28607 = slot30_a1787
	end

	logmessage = {}
	local slot30_a28608 = getWorkingDirectory() .. "\\config\\Universal Helper\\UNHTrash.json"
	local slot31_a28609 = {}

	if doesFileExist(slot30_a28608) then
		local slot32_a1815 = io.open(slot30_a28608, "r")

		if io.open(slot30_a28608, "r") then
			slot31_a28609 = decodeJson(slot32_a1815:read("a*"))

			slot32_a1815:close()
		end
	else
		local slot32_a1823 = {
			{
				text = "В транспорте присутствует радио{DFCFCF} [/radio]",
				status = true
			},
			{
				text = "~~~~~~~~~~~~~~~~~~~~~~~~~~",
				status = true
			},
			{
				text = "- Основные команды",
				status = true
			},
			{
				text = "- Пригласи друга",
				status = true
			},
			{
				text = "- Донат и получение",
				status = true
			},
			{
				text = "Чтобы завести двигатель введите",
				status = true
			},
			{
				text = "Для управления поворотниками используйте клавиши",
				status = true
			},
			{
				text = "В транспорте присутствует радио",
				status = true
			},
			{
				text = "Чтобы закрыть автомобиль используйте",
				status = true
			},
			{
				text = "Чтобы отказаться от аренды",
				status = true
			},
			{
				text = "выехал",
				status = true
			},
			{
				text = "между использованием",
				status = true
			}
		}
		slot32_a1823[12] = {
			text = "обновлениях сервера",
			status = true
		}
		slot32_a1823[13] = {
			text = "Пополнение игрового счета",
			status = true
		}
		slot32_a1823[14] = {
			text = "В нашем магазине ты можешь приобрести нужное количество игровых денег и потратить",
			status = true
		}
		slot32_a1823[15] = {
			text = "или на покупку каких-нибудь безделушек",
			status = true
		}
		slot32_a1823[16] = {
			text = "предметы, которые выделят тебя из толпы! Наш сайт: arizona-rp.com",
			status = true
		}
		slot32_a1823[17] = {
			text = "В магазине так-же можно приобрести редкие",
			status = true
		}
		slot32_a1823[18] = {
			text = "- Игроки со статусом {FFFFFF}VIP{6495ED} имеют большие возможности, подробнее .*",
			status = true
		}
		slot32_a1823[19] = {
			text = "Состояние вашего авто крайне плохое! Машина может сломаться!",
			status = true
		}
		slot32_a1823[20] = {
			text = "Необходимо заехать на станцию тех. обслуживания!",
			status = true
		}
		slot32_a1823[21] = {
			text = "Наш сайт",
			status = true
		}
		slot32_a1823[22] = {
			text = "начал работу новый инкассатор",
			status = true
		}
		slot32_a1823[23] = {
			text = "Убив его, вы сможете получить деньги",
			status = true
		}
		slot32_a1823[24] = {
			text = "News",
			status = true
		}
		slot31_a28609 = slot32_a1823
	end

	for slot35_a1860, slot36_a1865 in pairs(slot31_a28609) do
		_G["CBC" .. slot35_a1860] = slot1_a29133.ImBool(slot36_a1865.status)
	end

	inputHelpText = renderCreateFont("Arial", 9, FCR_BORDER + FCR_BOLD)
	local slot32_a1875 = "nothing"
	local slot33_a1876 = -1
	findedgun = false
	ammoclip = slot33_a1876
	gname = slot32_a1875
	bike = {
		[481.0] = true,
		[509.0] = true,
		[510.0] = true
	}
	moto = {
		[448.0] = true,
		[463.0] = true,
		[462.0] = true,
		[523.0] = true,
		[581.0] = true,
		[586.0] = true,
		[468.0] = true,
		[471.0] = true,
		[522.0] = true,
		[521.0] = true,
		[461.0] = true
	}
	local slot32_a1880 = {
		u8("Тёмная тема"),
		u8("Синия тема"),
		u8("Красная тема"),
		u8("Темно-зеленая тема"),
		u8("Зелёная тема"),
		u8("Оранжевая тема"),
		u8("Фиолетовая тема"),
		u8("Тёмно-светлая тема"),
		u8("Темно-красная тема")
	}
	items = slot32_a1880
	local slot32_a1907 = {
		u8("Чипсы"),
		u8("Рыба"),
		u8("Олень"),
		u8("Пиво"),
		u8("Спранк"),
		u8("Сигареты"),
		u8("Мешок с едой"),
		u8("Еда из дома")
	}
	seda = slot32_a1907
	drugskolvo = {
		"0",
		"1",
		"2",
		"3"
	}
	barmoney = {
		"100.000 $",
		"250.000 $",
		"500.000 $",
		"1.000.000 $"
	}
	local slot32_a1933 = {
		u8("Анимация"),
		u8("Софт")
	}
	typesbiv = slot32_a1933
	local slot32_a1939 = {
		u8("1 ранг"),
		u8("2 ранг"),
		u8("3 ранг"),
		u8("4 ранг"),
		u8("5 ранг"),
		u8("6 ранг"),
		u8("7 ранг"),
		u8("8 ранг"),
		u8("9 ранг")
	}
	rangfastinvite = slot32_a1939
	FAMA = {
		"Family",
		"Dynasty",
		"Corporation",
		"Squad",
		"Crew",
		"Empire",
		"Brotherhood"
	}
	stable = {
		"Phoenix",
		"Tucson",
		"Scottdale",
		"Chandler",
		"Brainburg",
		"Saint Rose",
		"Mesa",
		"Red-Rock",
		"Yuma",
		"Surprise",
		"Prescott",
		"Glendale",
		"Kingman",
		"Winslow",
		"Payson",
		"Gilbert"
	}
	iparz = {
		Payson = "185.169.134.174:7777",
		Brainburg = "185.169.134.45:7777",
		Mesa = "185.169.134.59:7777",
		Queen-Creek = "80.66.82.200:7777",
		Gilbert = "80.66.82.191:7777",
		Page = "80.66.82.168:7777",
		Show Low = "80.66.82.190:7777",
		Yava = "80.66.82.113:7777",
		Sedona = "80.66.82.144:7777",
		Surprise = "185.169.134.109:7777",
		Glendale = "185.169.134.171:7777",
		Faraway = "80.66.82.82:7777",
		Prescott = "185.169.134.166:7777",
		Kingman = "185.169.134.172:7777",
		Winslow = "185.169.134.173:7777",
		Chandler = "185.169.134.44:7777",
		Sun-City = "80.66.82.159:7777",
		Christmas = "80.66.82.54:7777",
		Mirage = "80.66.82.39:7777",
		Holiday = "80.66.82.132:7777",
		Wednesday = "80.66.82.128:7777",
		Saint-Rose = "185.169.134.5:7777",
		Scottdale = "185.169.134.43:7777",
		Bumble Bee = "80.66.82.87:7777",
		Casa-Grande = "80.66.82.188:7777",
		Phoenix = "185.169.134.3:7777",
		Yuma = "185.169.134.107:7777",
		Red-Rock = "185.169.134.61:7777",
		Tucson = "185.169.134.4:7777",
		Love = "80.66.82.33:7777",
		Drake = "80.66.82.22:7777",
		HMS = "cheating.hackmysoftware.ru:7777"
		}
	tableguns = {
		m4 = 356,
		de = 348,
		sh = 349,
		rf = 357
	}
	kills = {}
	killsid = {}
	deathkill = {}
	deathkillid = {}
	killweapon = {}
	users = {}
	skinpng = {}
	reshkatrue = {}
	oreltrue = {}
	vipp = {}
	tLastKeys = {}
	LastKeys = {}
	orgcolor = {
		2147502591.0,
		2164227710.0,
		2160918272.0,
		2157536819.0,
		2164221491.0,
		2164228096.0,
		2150206647.0,
		2566951719.0,
		2580667164.0,
		2580283596.0,
		2566979554.0,
		2573625087.0,
		2158524536.0,
		2157314562.0,
		2150852249.0,
		2157523814.0,
		23486046
	}
	local slot32_a1983 = {
		u8("Полиция"),
		u8("Больница"),
		u8("Мэрия"),
		u8("Армия/ТСР"),
		u8("Автошкола"),
		u8("СМИ"),
		u8("Банк ЛС"),
		u8("Грув"),
		u8("Вагос"),
		u8("Баллас"),
		u8("Ацтек"),
		u8("Рифа"),
		u8("Ночные волки"),
		u8("Якудза"),
		u8("Рус. Мафия"),
		u8("ЛКН"),
		u8("В маске")
	}
	organname = slot32_a1983
	tegifill = {
		"{mynick}",
		"{myid}",
		"{myguns}",
		"{phone}",
		"{job}",
		"{org}",
		"{myrang}",
		"{time}",
		"{day}",
		"{myname}",
		"{mysurname}",
		"{score}",
		"{paydaymoney}",
		"{city}",
		"{zone}",
		"{nearest}",
		"{nearestid}",
		"{killernick}",
		"{killerid}",
		"{killerweapon}",
		"{screen}"
	}
	local slot32_a2663 = [[
Command Universal Helper (Scrollbar)

/kb - Флуд о начале КБ
/online - Показывает статистику за неделю по онлайну
/sobeska - Флудить о собески в фраку
/piar - Флудер пиара в разные чата
/drop - Флуд о начале дропа
/fh - /findihouse 
/fbiz - /findibiz
/chet  - Калькулятор через чат
/gg - Уволить человека с ЧС фракции
/piss - Пописать
/hrec - Реконект (15 сек)
/rep [суть репорта] - Быстрый репорт
/color - Id цветов 
/killinfo - Информация о стрельбе
/skinc - Скин ченжер
/arz - Реконеект между серверами ARZ
/skinid - Выбор скина по ID
/deagle - Крафтит дигл
/mka - Крафтит мку
/shot - Крафтит шот
/rif - Крафтит рифлу
/iall - Пригласить людей в фаму в радиусе
/ivip - Пригласить людей в фаму с вип в радиусе 
/call [id] - звонок по id человека

]]
	local slot33_a2652 = [[
ChangeLog Universal Helper (Scrollbar)
- 7.6 V UPD
* Оптимизация кода / исправления багов
* Добавлен сервер - Payson[15]
* Добавлен сервер - Gilbert[16]
* Удаленные команды [/rc | /fl | /dm]
* Добавлен чекер игроков 
* Добавлен фикс AltEnter
* Фикс TwinTurboControl
* Удалена функция /bchat
* Добавлена настройка функции ChatCleaner
* Фикс AutoKey
* Фикс AutoFill
* Фикс RenderCar 
* Небольшое изменения в CustomTab
* Фикс афк онлайна
* Фикс /ad в piar
* Фикс FastPhone
* Вернул подкачку файлов
- 7.5 V UPD
* Добавлен эмулятор лаунчера 
* Добавлен CustomTab
* Теперь телефон через сочетания клавиш открыватся сразу 
* Переделана система подкачки библиотек
* Добавлен ZekRender
* Добавлена команда /call id 
* Фикс автореконекта
* Добавлена возможность изменять номер анимации для сбива
* Добавлены новые теги
* Добавлена настройка функции Anti-DM
* Фикс фаст гана
* Фикс отыгровок оружия 
- 7.4 V UPD 
* Добавлен Discord сервер (информация)
* Добавлен биндер в меню взаимодействия / изменения
* Добавлена команда /iall [Radius 1-25] инвайтит людей в радиусе
* Добавлена команда /ivip [Radius 1-25] инвайтит людей c Titan / Premium вип в радиусе
* Полностью удален старый дизайн скрипта
* Добавлены новые пункты в бинды скрипта
 - Тренер капчи (by cosmo)
 - Оверлей
* Добавлен новый раздел - "Рендер"
 - Новая функция RenderPed 
 - Новая функция RenderCar
 - Новая функция RenderTime
* Добавлен новый раздел - "FPS UP|FIX"
 - Новая функция FastLoad
 - Новая функция BufferCleaner
 - Новая функция TabFix
 - Новая функция DellCar
 - Новая функция Dell3D
 - Новая функция FPS UP CAR
 - Новая функция EffectOff
* Добавлен новый раздел - "Сочетания клавиш"
 - Функция из старого дизайна
* Теперь при 2 клике в табе ник человека скопируется
* Фиксы / улучшения кода
- 7.3 V UPD
* Добавлен CustomReport
* Фиксы
* Добавлен новый сервер ARZ
- 7.2 V UPD
* Исправлен краш в биндере
* Исправлена задержка в отыгровках 
* Добавлена команда /online - показывает статистику за неделю по онлайну
- 7.1 V UPD 
* Изминения в тегах
* Разные фиксы
* Добавлена функция на проверку вип статуса в меню взаимодействий
* Удалены команды /hp /eda
* Изменения в CustomWeather
* Новые пункты в оверлеи
* Фикс умного бара
* Добавлены команды для крафта оружия 
- 6.8 - 7.0 V UPD 
* Тех.часть
- 6.7 V UPD
* Фикс тегов, фикс бинда
- 6.6 V UPD
* Фикс краша
- 6.5 V UPD
* Добавлена задержка в секундах в /piar
* Добавлен InputHelper
* Добавлен RpGuns
* Деньги в оверлеи теперь разделяются 
* Добавлен новый биндер
* Удалены настройки отыгровки (замена биндер)
- 6.4 V UPD
* Фиксы 
- 6.3 V UPD
* Фиксы 
* Добавлен умный бар
* Добавлен новый стиль скрипта (настройки)
* Новые пункты в оверлеи
* Добавлена функция Anti-DM для быстрого репорта
* Добавлена CustomArenda изменяет меню аренды
* Бинды локальных функций скрипта перемещены в "Биндер"
- 6.2 V UPD
* Добавлена бесплатная аренда
* Автореконект в /arz
* Добавлена настройка сбива 
* Добавлена отыгровка маски
* Добавлен новый стиль
* Добавлена цветовая палитра для статистики
* В АвтоЕду добавлена еда из дома
* Добавлена возможность удаления HotKey
* Фикс отображения skinс с разными темами
- 6.1 V UPD 
* Теперь AntiBike не работает в воде
* Фикс задержки в пиар
* Добавлена отыгровка на броню / нарко / аптечку
* /hp и /eda работает только в инте
- 6.0 V UPD 
* В настройках можно изменить клавишу фаст инвайнта и ранг
* В настройках появилась доп.инфа как узнать ID тексдрава для /hp, /eda
* Добавлен скин ченжер /skinc [imgui] | /skinid [id]
* Добавлвен реконект между серверами /arz
* Теперь в биндере можно биндить команды скриптов
- 5.9 V UPD
* Фикс
- 5.8 V UPD 
* Фиксы
* Теперь скрипт работает только на Arizona RolePlay
* Добавлена возможность изменять кнопку меню взаимодействия (настройки)
* Добавлен БлекЛиск для чата (/bchat)
* Новые пункты в статистике
- 5.7 V UPD 
* Теперь биндер не работает когда открыт чат
* Добавлена команда - /killinfo
* Создана беседа ВК, туда можете писать свои баги | предложения - ссылка в информации
- 5.6 V UPD
* Изменил меню взаимодействий
* Добавлена функция CustomColor
* Добавлена функция WeatherChanger
* Добавлена функция AutoFill
* Добавилена функция RepitVR
* Изменил настройку статистики
* Добавил таймер аренды
* Добавил счетчик киллов
* Автоключи работаю теперь только в вашем ТС
* Фикс нескольких багов
- 5.5 V UPD 
* Переписал часть кода
* Добавлена автоподкачка модуля hotkey.lua
* В удаления хуйни добавил новые строки для игнора
* Изменил принцип очистки чата
* Добавлена команда /color - id цветов
- 5.4 V UPD 
* Добавлен HP HUD
* Убраны старые бинды и добавлен HotKey
* Добавлена автоподкачка модуля imgui_notf.lua
* Исправлено что нельзя показывать распальцовку с акцентом
* В настройки добавлена кнопка чтобы отключить скрипт
* Добавлен быстрый репорт /rep [суть репорта]
- 5.3 V UPD
* Добавил TwinTurboControl
* Добавил AntiBike
* Добавил реконект /hrec (15 сек по стандарту)
* Задержка в биндере теперь в минутах, так - же она сохроняется
* Сбив в SafeMod`e можно отключать
* Убрал команду /online
* Изменил алгоритм подсчета онлайна
* Таймер маски обнуляется при смерти
* АвтоСобеска убрана 
* Фейк ломка убрана
- 5.2 V UPD 
* Улучшил биндер
* В статистику добавил FPS
* В настройки добавил возможно изменять ИД ТекстДрава для /hp /eda
* Немного изменил интерфейс
* Добавил возможность скрыть пин-код и пароль
* Добавил AutoKey для машины
- 5.1 V UPD 
* Фикс
- 5.0 V UPD 
* Добавил окно статистики
* Добавил мешок с едой в AutoEda
* Добавил /key для биндера
* Пофиксил АвтоСбив нарко
- 4.9 V UPD 
* Улучшил пару функций
- 4.8 V UPD 
* Фикс SafeModa
* Фикс Бич еды
- 4.7 V UPD 
* Фикс /hp /eda 
* Фикс Fbiz
- 4.6 V UPD
* Добавил /fh /fbiz /dm
* Добавил отключения фамы
* Добавил бинд на телефон / аренду 
* Уведомления о дропе теперь функция
* Фикс чипсов 
* Добавил команду /chet
* Улучшил AutoEda 
- 4.5 V UPD 
* Мелкий баг
- 4.4 V UPD 
* Добавил скип репорта
* Добавил акцент
* Убрал текст в чат при использовании бинда
* Фикс биндера
- 4.3 V UPD 
* Фикс AutoEda
* Фиксы в меню взаимодействий
* Изменил команду /sobes на /sobeska
* Добавил перевод секунд в минуты в деморгане 
* Добавил АнтиБлок при спавне 
* Добавил РыбийГлаз
* Добавил InfiniteRun
* Дополнил "Удаления хуйни из чата"
* Теперь DeadText работает с SafeMod
* Добавил изминения текста для сбива SafeMod`a
* Добавил выбор чем хилится в SafeMod`e 
- 4.2 V UPD 
* Фикс формата
- 4.1 V UPD
* Фикс краша
- 4.0 V UPD
* Улучшил работу некоторых функций
* Разбаротка скрипта заморожена 
- 3.8 - 3.9 V UPD
* Фикс краша из за вх
* Прочие баги
- 3.7.V UPD
* Добавлен отключение / включение ВХ в функциях
* Добавил бинд на чипсы
* Фиксы багов
- 3.5.V UPD
* Добавлен ВХ , активация на колесико мышки (не скрол) , отключается при скрине
* Пару фиксов
- 3.4.V UPD
* Добавлен кастомный флудер
- 3.3.V UPD
* Новый дизайн скрипта
* Фикс багов
- 3.2.V UPD
* Добавил бинд на сбив 
* Добавил радар офф в инте
- 3.1.V UPD
* Добавил скрип ЗЗ 
* Добавил бинд на тайм , filcar , repcar
- 3.0.V UPD
* Фикс
- 2.9.V UPD
* Добавил PayDayMaster - считает сколько вы заработали за день денег (депозит + зп)
* Добавил /piss для ящеров
* Улучшил код
- 2.8.V UPD
* Добавил возможность изменять бинды
* Изменил интерфейс
* Добавил автоеду оленины
- 2.7.V  UPD
* Фикс кодировки
* Добавил проверку в меню взаимодействий
* Добавил новые пункты
- 2.6.V UPD
* Добавлено меню взаимодействий с игроком (ПКМ + J)
- 2.5.V UPD
* Добавлен адекватный флудер для всех чатов
* Пофиксил баги
* Добавил настройку темы скрипта
* Добавил настройку активации скрита
* Баг фиксы
- 2.4.V UPD
* Анонс на BlastHack]]
	sw, sh = getScreenResolution()
	local slot34_a2041 = slot17_a28610.load
	local slot35_a2042 = {
		onlinfo = {},
		onlinfoafk = {},
		reportname = {},
		reportotvet = {},
		vzbindname = {},
		vzbind = {},
		playerlist = {}
	}
	local slot36_a2050 = {
		typesmi = -1,
		sobes = "Пусто ..",
		textreport = "СРОЧНО зайдите в рекон, меня дмят с оружия >> {killerweapon} человек с ником {killernick}[{killerid}]",
		flood_ad = "Пусто ..",
		narko = 0,
		sbittext = "Ой",
		accenttext = "Английский акцент",
		animsnumber = "78",
		flood_kb = "Пусто ..",
		typesbiv = 0,
		casitext = "Посмотрел на часы",
		typephone = 0,
		firstload = false,
		antidmsound = false,
		piar_ad = false,
		piar_fam = false,
		flood_vr = "Пусто ..",
		flood_fam = "Пусто ..",
		kypiltext = "++ бабки на яхту Масону",
		smartbarauto = false,
		sseda = 2,
		inviterank = 0,
		playerspos = 1,
		piar_vr = false,
		antidmtype = 0,
		textdead = "i fucked up",
		timerecon = 1,
		zektable = 0,
		moneybar = 0,
		flood_drop = "Пусто ..",
		waitupdatezek = tonumber(0)
	}
	slot35_a2042.config = slot36_a2050
	slot35_a2042.functionsfps = {
		tabfix = false,
		altenter = false,
		buffercleaner = false,
		loadoff = false,
		effectoff = false,
		patchfix = false
	}
	slot35_a2042.rendersettings = {
		font1size = 9,
		font2 = "Arial",
		font5 = "Arial",
		font3 = "Arial",
		font2size = 9,
		font5size = 9,
		font1 = "Arial",
		font3size = 9,
		font4 = "Arial",
		font4size = 9
	}
	slot35_a2042.functions = {
		inputhelper = false,
		accenton = false,
		hpcent = true,
		safemodsbiv = true,
		reportcustom = false,
		weatherсhanger = false,
		hphudon = false,
		zz = false,
		renderped = false,
		safemod = false,
		radar = false,
		deadt = false,
		FishEyeEffect = false,
		famvisible = false,
		dell = false,
		turbocontrol = false,
		antibikeon = false,
		dropinfo = false,
		payd = false,
		autonarko = false,
		rpguns = false,
		autofill = false,
		autorecon = false,
		smartbar = false,
		vorr = false,
		autoeda = false,
		antidm = false,
		launcher = false,
		customarenda = false,
		usenarko = true,
		casi = false,
		chekerplayers = false,
		skiprep = false,
		rendercar = false,
		repitvr = false,
		zekrender = false,
		timeinscreen = false,
		rpguns_pol = false,
		autokey = false,
		kypill = false,
		tabcustom = false,
		useapteka = false
	}
	slot35_a2042.infostat = {
		armon = false,
		serveron = true,
		onlineson = false,
		dataon = false,
		fpson = false,
		nickon = true,
		kbon = false,
		hpon = false,
		statson = false,
		afkon = false,
		modelcaron = false,
		maskon = false,
		onlinafkday = false,
		hpcaron = false,
		onlinafk = false,
		payon = false,
		arendaon = false,
		statsoff = false,
		idcaron = false,
		onlineon = false,
		pingon = false
	}
	slot35_a2042.authorization = {
		autologin = false,
		autop = false,
		loginakk = "",
		autopin = ""
	}
	slot35_a2042.settingshelper = {
		command = "helper"
	}
	local slot36_a2060 = {
		day = os.date("%d-%m-%y"),
		shet = tonumber(0),
		online = tonumber(0),
		onlineafk = tonumber(0)
	}
	slot35_a2042.obnylenie = slot36_a2060
	slot35_a2042.bindertestchect = {
		command1 = "ARM",
		command17 = "KE",
		command15 = "P",
		command6 = "L",
		command11 = "FC",
		command3 = "MED",
		command16 = "JL",
		command8 = "AFK",
		command12 = "EZ",
		command10 = "REP",
		command2 = "DRU",
		command7 = "MASK",
		command4 = "SP"
	}
	local slot36_a2075 = {
		a_kills = tonumber(0),
		a_damage = tonumber(0),
		a_death = tonumber(0),
		deagle_time = tostring(0),
		shot_time = tostring(0),
		m4_time = tostring(0),
		killstrik = tonumber(0)
	}
	slot35_a2042.killinfo = slot36_a2075
	local slot36_a2101 = {
		xCoord = 1261,
		xCoordchat = 45,
		yCoordzek = 409,
		xCoordzek = 45,
		xCoordtime = 724,
		yCoordchat = 409,
		yCoordtime = 724,
		yCoord = 724,
		posXcheker = sh / 1.5,
		posYcheker = sw / 2
	}
	slot35_a2042.cord = slot36_a2101
	local slot36_a2109 = {
		color_gh = 1,
		color_rh = 1,
		color_a = 0.84,
		color_bh = 1,
		color_gt = 255,
		color_rt = 255,
		color_b = 0.06,
		color_r = 0.06,
		color_g = 0.06,
		color_bt = 255,
		customcolor = false,
		color_ah = 1,
		taksic = tonumber(15909660),
		dalna = tonumber(15909660),
		news = tonumber(6152980),
		prem = tonumber(11490028),
		vip = tonumber(6779888),
		famchat = tonumber(16272203),
		rchat = tonumber(6730050),
		fchat = tonumber(6730050),
		dchat = tonumber(329637)
	}
	slot35_a2042.color = slot36_a2109
	local slot36_a2147 = {
		slider_ad = tonumber(1),
		slider_ad_sec = tonumber(0),
		slider_fam = tonumber(3),
		slider_fam_sec = tonumber(0),
		slider_vr = tonumber(5),
		slider_vr_sec = tonumber(0),
		slider_time = tonumber(21),
		slider_day = tonumber(21)
	}
	slot35_a2042.slider = slot36_a2147
	local slot34_a28422 = slot34_a2041(slot35_a2042, "helper")
	local slot35_a2183 = 0
	local slot36_a27481 = 1111
	local slot37_a8111 = 0
	local slot38_a8110 = 0
	local slot39_a27480 = 0
	local slot40_a26631 = 0
	local slot41_a5660 = false
	local slot42_a10106 = 0
	userkolvo = "0|1"
	local slot43_a2192 = {}
	infnpc = {}
	npc = slot43_a2192
	gameServer = "nil"
	ServerNumber = 0
	checkstatus = "nil"
	killernick = "No_Name"
	killerid = "-1"
	killerweapon = "Deagle"
	check_time = os.time() + 5
	check_timev = os.time()
	checkvip = true
	logstatus = false
	prints = 0
	copynumber = false
	sex = false
	menu = 0
	mmenu = 0
	afktimer = 0
	fastphone = false
	addcontact = false
	checkinfo = false
	antidmreport = false
	showbinder = false
	timemesto = false
	zekmesto = false
	freearenda = false
	statusсaptcha = false
	settingss = true
	loadwindow = 0
	pricecar = 0
	modelcar = 0
	MODEL = 0
	firstconnect = false
	dyrka = false
	checkskin = false
	maskobeta = false
	mask = 0
	fraimrei = 0
	notkey = false
	checkphone = false
	report = 0
	secarenda = 0
	messvr = ""
	s_damage = 0
	s_kills = 0
	s_death = 0
	killstrik = 0
	killinfomenu = true
	local slot43_a2247 = {
		["IPHONE X"] = {
			["Позвонить"] = 2101,
			["Меню"] = 2112,
			["2"] = 2106,
			["3"] = 2107,
			["Контакты"] = 2103,
			["6"] = 2110,
			["9"] = 2113,
			["Сообщения"] = 2105,
			["1"] = 2108,
			["8"] = 2112,
			["0"] = 2115,
			["Стереть"] = 2128,
			["7"] = 2114,
			["Вызов"] = 2100,
			["Назад"] = 2101,
			["5"] = 2109,
			["4"] = 2111
		},
		["Samsung Galaxy S10"] = {
			["Позвонить"] = 2101,
			["Меню"] = 2112,
			["2"] = 2105,
			["3"] = 2106,
			["Контакты"] = 2100,
			["6"] = 2109,
			["9"] = 2112,
			["Сообщения"] = 2111,
			["1"] = 2107,
			["8"] = 2111,
			["0"] = 2114,
			["Стереть"] = 2127,
			["7"] = 2113,
			["Вызов"] = 2099,
			["Назад"] = 2100,
			["5"] = 2108,
			["4"] = 2110
		},
		["Xiaomi Mi 8"] = {
			["Позвонить"] = 2098,
			["Меню"] = 2096,
			["2"] = 2104,
			["3"] = 2102,
			["Контакты"] = 2100,
			["6"] = 2105,
			["9"] = 2108,
			["Сообщения"] = 2102,
			["1"] = 2103,
			["8"] = 2110,
			["0"] = 2111,
			["Стереть"] = 2124,
			["7"] = 2109,
			["Вызов"] = 2096,
			["Назад"] = 2097,
			["5"] = 2107,
			["4"] = 2106
		},
		["Huawei P20 PRO"] = {
			["Позвонить"] = 2099,
			["Меню"] = 2097,
			["2"] = 2103,
			["3"] = 2104,
			["Контакты"] = 2101,
			["6"] = 2107,
			["9"] = 2110,
			["Сообщения"] = 2103,
			["1"] = 2105,
			["8"] = 2109,
			["0"] = 2112,
			["Стереть"] = 2026,
			["7"] = 2111,
			["Вызов"] = 2097,
			["Назад"] = 2098,
			["5"] = 2106,
			["4"] = 2108
		},
		["Google Pixel 3"] = {
			["Позвонить"] = 2098,
			["Меню"] = 2096,
			["2"] = 2101,
			["3"] = 2102,
			["Контакты"] = 2100,
			["6"] = 2105,
			["9"] = 2108,
			["Сообщения"] = 2102,
			["1"] = 2103,
			["8"] = 2107,
			["0"] = 2110,
			["Стереть"] = 2024,
			["7"] = 2109,
			["Вызов"] = 2094,
			["Назад"] = 2095,
			["5"] = 2104,
			["4"] = 2106
		}
	}
	namephone = slot43_a2247

	if slot0_a8134 then
		orgnumber = slot1_a29133.ImInt(0)
		antidmtype = slot1_a29133.ImInt(slot34_a28422.config.antidmtype)
		zektable = slot1_a29133.ImInt(slot34_a28422.config.zektable)
		typephone = slot1_a29133.ImInt(slot34_a28422.config.typephone)
		typesmi = slot1_a29133.ImInt(slot34_a28422.config.typesmi)
		tabSearch = slot1_a29133.ImBuffer("", 200)
		customtab = slot1_a29133.ImBool(false)
		onlinefull = slot1_a29133.ImBool(false)
		vzaimod = slot1_a29133.ImBool(false)
		colorcar = slot1_a29133.ImBool(false)
		settingsweather = slot1_a29133.ImBool(false)
		killinfo = slot1_a29133.ImBool(false)
		skinc = slot1_a29133.ImBool(false)
		cararenda = slot1_a29133.ImBool(false)
		customreport = slot1_a29133.ImBool(false)
		connectarz = slot1_a29133.ImBool(false)
		newmenu = slot1_a29133.ImBool(false)
		del_ped = slot1_a29133.ImBool(false)
		del_3d = slot1_a29133.ImBool(false)
		del_car = slot1_a29133.ImBool(false)
		check_k = slot1_a29133.ImInt(0)
		addname = slot1_a29133.ImBuffer(150)
		addbklist = slot1_a29133.ImBuffer(150)
		addplayer = slot1_a29133.ImBuffer(150)
		addotvet = slot1_a29133.ImBuffer(150)
		Stylereport = slot1_a29133.ImBuffer(150)
		inputreport = slot1_a29133.ImBuffer(150)
		binddelay = slot1_a29133.ImInt(3)
		cmd_name = slot1_a29133.ImBuffer(256)
		cmd_text = slot1_a29133.ImBuffer(65536)
		tdead = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.textdead)), 256)
		connectname = slot1_a29133.ImBuffer(256)
		kypil = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.kypiltext)), 256)
		text_buffer = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.authorization.loginakk)), 256)
		text_pass = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.authorization.autopin)), 256)
		text_kb = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.flood_kb)), 256)
		text_drop = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.flood_drop)), 256)
		text_sobes = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.sobes)), 256)
		text_vr = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.flood_vr)), 256)
		text_ad = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.flood_ad)), 256)
		text_fam = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.flood_fam)), 256)
		sbivt = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.sbittext)), 256)
		textreport = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.textreport)), 256)
		accenttext = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.accenttext)), 256)
		comman1 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command1), 256)
		comman2 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command2), 256)
		comman3 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command3), 256)
		comman4 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command4), 256)
		comman6 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command6), 256)
		comman7 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command7), 256)
		comman8 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command8), 256)
		comman10 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command10), 256)
		comman11 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command11), 256)
		comman12 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command12), 256)
		comman15 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command15), 256)
		comman16 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command16), 256)
		comman17 = slot1_a29133.ImBuffer(tostring(slot34_a28422.bindertestchect.command17), 256)
		yval = slot1_a29133.ImBuffer(256)
		rank = slot1_a29133.ImBuffer(256)
		give = slot1_a29133.ImBuffer(256)
		giveorel = slot1_a29133.ImBuffer(256)
		givedice = slot1_a29133.ImBuffer(256)
		slider = slot1_a29133.ImInt(2500)
		changelog = slot1_a29133.ImBuffer(u8:encode(slot33_a2652), 65536)
		commandlist = slot1_a29133.ImBuffer(u8:encode(slot32_a2663), 65536)
		colortaksi = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.taksic):GetFloat4())
		colornews = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.news):GetFloat4())
		colordalna = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.dalna):GetFloat4())
		colorvip = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.vip):GetFloat4())
		colorprem = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.prem):GetFloat4())
		colorfamchat = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.famchat):GetFloat4())
		colorrchat = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.rchat):GetFloat4())
		colordchat = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.dchat):GetFloat4())
		colorfchat = slot1_a29133.ImFloat4(slot1_a29133.ImColor(slot34_a28422.color.fchat):GetFloat4())
		colors_stat = slot1_a29133.ImFloat4(slot34_a28422.color.color_r, slot34_a28422.color.color_g, slot34_a28422.color.color_b, slot34_a28422.color.color_a)
		colors_chat_s = slot1_a29133.ImFloat4(slot34_a28422.color.color_rh, slot34_a28422.color.color_gh, slot34_a28422.color.color_bh, slot34_a28422.color.color_ah)
		colortime = slot1_a29133.ImFloat3(slot34_a28422.color.color_rt / 255, slot34_a28422.color.color_gt / 255, slot34_a28422.color.color_bt / 255)
		fontpedrender = slot1_a29133.ImBuffer(tostring(slot34_a28422.rendersettings.font1), 256)
		fontcarrender = slot1_a29133.ImBuffer(tostring(slot34_a28422.rendersettings.font2), 256)
		fonttimerender = slot1_a29133.ImBuffer(tostring(slot34_a28422.rendersettings.font3), 256)
		fontzekrender = slot1_a29133.ImBuffer(tostring(slot34_a28422.rendersettings.font4), 256)
		fontcheker = slot1_a29133.ImBuffer(tostring(slot34_a28422.rendersettings.font5), 256)
		font1 = renderCreateFont(slot34_a28422.rendersettings.font1, slot34_a28422.rendersettings.font1size, 5)
		font2 = renderCreateFont(slot34_a28422.rendersettings.font2, slot34_a28422.rendersettings.font2size, 5)
		font3 = renderCreateFont(slot34_a28422.rendersettings.font3, slot34_a28422.rendersettings.font3size, 5)
		font4 = renderCreateFont(slot34_a28422.rendersettings.font4, slot34_a28422.rendersettings.font4size, 5)
		font5 = renderCreateFont(slot34_a28422.rendersettings.font5, slot34_a28422.rendersettings.font5size, 5)
		font1size = slot1_a29133.ImInt(slot34_a28422.rendersettings.font1size)
		font2size = slot1_a29133.ImInt(slot34_a28422.rendersettings.font2size)
		font3size = slot1_a29133.ImInt(slot34_a28422.rendersettings.font3size)
		font4size = slot1_a29133.ImInt(slot34_a28422.rendersettings.font4size)
		font5size = slot1_a29133.ImInt(slot34_a28422.rendersettings.font5size)
		slider_vr = slot1_a29133.ImInt(slot34_a28422.slider.slider_vr)
		firstloadwindow = slot1_a29133.ImBool(slot34_a28422.config.firstload)
		slider_vr_sec = slot1_a29133.ImInt(slot34_a28422.slider.slider_vr_sec)
		timerecon = slot1_a29133.ImInt(slot34_a28422.config.timerecon)
		slider_fam = slot1_a29133.ImInt(slot34_a28422.slider.slider_fam)
		slider_fam_sec = slot1_a29133.ImInt(slot34_a28422.slider.slider_fam_sec)
		slider_ad = slot1_a29133.ImInt(slot34_a28422.slider.slider_ad)
		slider_ad_sec = slot1_a29133.ImInt(slot34_a28422.slider.slider_ad_sec)
		slider_day = slot1_a29133.ImInt(slot34_a28422.slider.slider_day)
		casi = slot1_a29133.ImBool(slot34_a28422.functions.casi)
		slider_time = slot1_a29133.ImInt(slot34_a28422.slider.slider_time)
		stats = slot1_a29133.ImBool(slot34_a28422.infostat.statson)
		FishEyeEffect = slot1_a29133.ImBool(slot34_a28422.functions.FishEyeEffect)
		autopp = slot1_a29133.ImBool(slot34_a28422.authorization.autologin)
		antidmsound = slot1_a29133.ImBool(slot34_a28422.config.antidmsound)
		autopi = slot1_a29133.ImBool(slot34_a28422.authorization.autop)
		inputhelper = slot1_a29133.ImBool(slot34_a28422.functions.inputhelper)
		dellxuy = slot1_a29133.ImBool(slot34_a28422.functions.dell)
		customarenda = slot1_a29133.ImBool(slot34_a28422.functions.customarenda)
		antidm = slot1_a29133.ImBool(slot34_a28422.functions.antidm)
		rendercar = slot1_a29133.ImBool(slot34_a28422.functions.rendercar)
		renderped = slot1_a29133.ImBool(slot34_a28422.functions.renderped)
		patchfix = slot1_a29133.ImBool(slot34_a28422.functionsfps.patchfix)
		buffercleaner = slot1_a29133.ImBool(slot34_a28422.functionsfps.buffercleaner)
		tabfix = slot1_a29133.ImBool(slot34_a28422.functionsfps.tabfix)
		tabcustom = slot1_a29133.ImBool(slot34_a28422.functions.tabcustom)
		chekerplayers = slot1_a29133.ImBool(slot34_a28422.functions.chekerplayers)
		loadoff = slot1_a29133.ImBool(slot34_a28422.functionsfps.loadoff)
		effectoff = slot1_a29133.ImBool(slot34_a28422.functionsfps.effectoff)
		altenter = slot1_a29133.ImBool(slot34_a28422.functionsfps.altenter)
		usenarko = slot1_a29133.ImBool(slot34_a28422.functions.usenarko)
		useapteka = slot1_a29133.ImBool(slot34_a28422.functions.useapteka)
		autonarko = slot1_a29133.ImBool(slot34_a28422.functions.autonarko)
		deed = slot1_a29133.ImBool(slot34_a28422.functions.deadt)
		safe = slot1_a29133.ImBool(slot34_a28422.functions.safemod)
		rpguns = slot1_a29133.ImBool(slot34_a28422.functions.rpguns)
		rpguns_pol = slot1_a29133.ImBool(slot34_a28422.functions.rpguns_pol)
		drpstiler = slot1_a29133.ImBool(slot34_a28422.functions.vorr)
		edaauto = slot1_a29133.ImBool(slot34_a28422.functions.autoeda)
		vr = slot1_a29133.ImBool(slot34_a28422.config.piar_vr)
		reportcustom = slot1_a29133.ImBool(slot34_a28422.functions.reportcustom)
		safemodsbiv = slot1_a29133.ImBool(slot34_a28422.functions.safemodsbiv)
		ad = slot1_a29133.ImBool(slot34_a28422.config.piar_ad)
		fam = slot1_a29133.ImBool(slot34_a28422.config.piar_fam)
		sseda = slot1_a29133.ImInt(slot34_a28422.config.sseda)
		finvite = slot1_a29133.ImInt(slot34_a28422.config.inviterank)
		ddrugs = slot1_a29133.ImInt(slot34_a28422.config.narko)
		moneybar = slot1_a29133.ImInt(slot34_a28422.config.moneybar)
		tsbiv = slot1_a29133.ImInt(slot34_a28422.config.typesbiv)
		serverarz = slot1_a29133.ImInt(0)
		command = slot1_a29133.ImBuffer(slot34_a28422.settingshelper.command, 32)
		animsnumber = slot1_a29133.ImBuffer(tostring(slot34_a28422.config.animsnumber), 4)
		pay = slot1_a29133.ImBool(slot34_a28422.functions.payd)
		zz = slot1_a29133.ImBool(slot34_a28422.functions.zz)
		autofill = slot1_a29133.ImBool(slot34_a28422.functions.autofill)
		radar = slot1_a29133.ImBool(slot34_a28422.functions.radar)
		kypill = slot1_a29133.ImBool(slot34_a28422.functions.kypill)
		skiprep = slot1_a29133.ImBool(slot34_a28422.functions.skiprep)
		customcolor = slot1_a29133.ImBool(slot34_a28422.color.customcolor)
		accenton = slot1_a29133.ImBool(slot34_a28422.functions.accenton)
		timeinscreen = slot1_a29133.ImBool(slot34_a28422.functions.timeinscreen)
		zekrender = slot1_a29133.ImBool(slot34_a28422.functions.zekrender)
		smartbar = slot1_a29133.ImBool(slot34_a28422.functions.smartbar)
		famvisible = slot1_a29133.ImBool(slot34_a28422.functions.famvisible)
		dropinfo = slot1_a29133.ImBool(slot34_a28422.functions.dropinfo)
		statson = slot1_a29133.ImBool(slot34_a28422.infostat.statson)
		autokey = slot1_a29133.ImBool(slot34_a28422.functions.autokey)
		smartbarauto = slot1_a29133.ImBool(slot34_a28422.config.smartbarauto)
		turbocontrol = slot1_a29133.ImBool(slot34_a28422.functions.turbocontrol)
		antibike = slot1_a29133.ImBool(slot34_a28422.functions.antibikeon)
		hphudon = slot1_a29133.ImBool(slot34_a28422.functions.hphudon)
		hpcent = slot1_a29133.ImBool(slot34_a28422.functions.hpcent)
		repitvr = slot1_a29133.ImBool(slot34_a28422.functions.repitvr)
		autorecon = slot1_a29133.ImBool(slot34_a28422.functions.autorecon)
		launcher = slot1_a29133.ImBool(slot34_a28422.functions.launcher)
		weatherсhanger = slot1_a29133.ImBool(slot34_a28422.functions.weatherсhanger)
		idtextdraw = slot1_a29133.ImBool(false)
		casit = slot1_a29133.ImBuffer(tostring(u8(slot34_a28422.config.casitext)), 256)
		waitupdatezek = slot1_a29133.ImBuffer(tostring(slot34_a28422.config.waitupdatezek), 256)
		onlinafkday = slot1_a29133.ImBool(slot34_a28422.infostat.onlinafkday)
		statson = slot1_a29133.ImBool(slot34_a28422.infostat.statson)
		nickon = slot1_a29133.ImBool(slot34_a28422.infostat.nickon)
		serveron = slot1_a29133.ImBool(slot34_a28422.infostat.serveron)
		pingon = slot1_a29133.ImBool(slot34_a28422.infostat.pingon)
		kbon = slot1_a29133.ImBool(slot34_a28422.infostat.kbon)
		armon = slot1_a29133.ImBool(slot34_a28422.infostat.armon)
		maskon = slot1_a29133.ImBool(slot34_a28422.infostat.maskon)
		payon = slot1_a29133.ImBool(slot34_a28422.infostat.payon)
		hpon = slot1_a29133.ImBool(slot34_a28422.infostat.hpon)
		onlineson = slot1_a29133.ImBool(slot34_a28422.infostat.onlineson)
		onlinafk = slot1_a29133.ImBool(slot34_a28422.infostat.onlinafk)
		onlineon = slot1_a29133.ImBool(slot34_a28422.infostat.onlineon)
		fpson = slot1_a29133.ImBool(slot34_a28422.infostat.fpson)
		arendaon = slot1_a29133.ImBool(slot34_a28422.infostat.arendaon)
		dataon = slot1_a29133.ImBool(slot34_a28422.infostat.dataon)
		statsoff = slot1_a29133.ImBool(slot34_a28422.infostat.statsoff)
		hpcaron = slot1_a29133.ImBool(slot34_a28422.infostat.hpcaron)
		idcaron = slot1_a29133.ImBool(slot34_a28422.infostat.idcaron)
		afkon = slot1_a29133.ImBool(slot34_a28422.infostat.afkon)
		modelcaron = slot1_a29133.ImBool(slot34_a28422.infostat.modelcaron)
	end

	local slot43_a3494 = {}
	local slot44_a3495 = {
		u8("Использовать армор"),
		comman1
	}
	slot43_a3494[1] = slot44_a3495
	local slot44_a3500 = {
		u8("Использовать наркотики"),
		comman2
	}
	slot43_a3494[2] = slot44_a3500
	local slot44_a3505 = {
		u8("Использовать аптечку"),
		comman3
	}
	slot43_a3494[3] = slot44_a3505
	local slot44_a3510 = {
		u8("Спавн личного ТС"),
		comman4
	}
	slot43_a3494[4] = slot44_a3510
	local slot44_a3515 = {
		u8("Открыть / Закрыть ТС"),
		comman6
	}
	slot43_a3494[5] = slot44_a3515
	local slot44_a3520 = {
		u8("Использовать маску"),
		comman7
	}
	slot43_a3494[6] = slot44_a3520
	local slot44_a3525 = {
		u8("АнтиАфк"),
		comman8
	}
	slot43_a3494[7] = slot44_a3525
	local slot44_a3530 = {
		u8("Починить машину"),
		comman10
	}
	slot43_a3494[8] = slot44_a3530
	local slot44_a3535 = {
		u8("Заправить машину"),
		comman11
	}
	slot43_a3494[9] = slot44_a3535
	local slot44_a3540 = {
		u8("Посмотреть время"),
		comman12
	}
	slot43_a3494[10] = slot44_a3540
	local slot44_a3545 = {
		u8("Телефон"),
		comman15
	}
	slot43_a3494[11] = slot44_a3545
	local slot44_a3550 = {
		u8("Открыть / Закрыть аренду"),
		comman16
	}
	slot43_a3494[12] = slot44_a3550
	local slot44_a3555 = {
		u8("Ключи для авто"),
		comman17
	}
	slot43_a3494[13] = slot44_a3555
	klavabind = slot43_a3494

	writeMemory(5593172, 4, -1869574000, true)
	writeMemory(5593176, 1, 144, true)

	local slot43_a3570 = nil
	local slot44_a9761 = nil
	local slot45_a3574 = slot1_a29133.ImGlyphRanges
	local slot46_a3575 = {
		slot3_a9760.min_range,
		slot3_a9760.max_range
	}
	local slot45_a3581 = slot45_a3574(slot46_a3575)

	function slot1_a29133.BeforeDrawFrame()
		if slot43_a3570 == nil then
			local slot0_a3588 = slot1_a29133.ImFontConfig()
			slot0_a3588.MergeMode = true
			slot43_a3570 = slot1_a29133.GetIO().Fonts:AddFontFromFileTTF("moonloader/lib/fa-solid-900.ttf", 15, slot0_a3588, slot45_a3581)
		end

		if slot44_a9761 == nil then
			slot44_a9761 = slot1_a29133.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(20) .. "\\trebucbd.ttf", 16, nil, slot1_a29133.GetIO().Fonts:GetGlyphRangesCyrillic())
		end
	end

	function patch()
		if slot18_a28309.getuint8(7638059) == 232 then
			slot18_a28309.fill(7638059, 144, 5, true)
		elseif slot18_a28309.getuint8(7638139) == 232 then
			slot18_a28309.fill(7638139, 144, 5, true)
		end

		if slot18_a28309.getuint8(5835178) == 190 then
			slot18_a28309.write(5835179, 1, 1, true)
		end

		if slot18_a28309.getuint8(5835293) == 190 then
			slot18_a28309.write(5835293, 233, 1, true)
			slot18_a28309.write(5835294, 141, 4, true)
		end

		if slot18_a28309.getuint8(7638123) == 198 then
			slot18_a28309.fill(7638123, 144, 7, true)
		elseif slot18_a28309.getuint8(7638203) == 198 then
			slot18_a28309.fill(7638203, 144, 7, true)
		end

			slot18_a28309.getuint8(5835504) == 161 then
			slot18_a28309.write(5835504, 233, 1, true)
			slot18_a28309.write(5835505, 320, 4, true)
		end
	end

	function join_rgb(arg0, arg1, arg2)
		return bit.bor(bit.bor(arg2, bit.lshift(arg1, 8)), bit.lshift(arg0, 16))
	end

	local function slot46_a25139(arg0, arg1)
		if arg1 then
			local slot2_a3731 = raknetNewBitStream()

			raknetBitStreamWriteInt16(slot2_a3731, arg0)
			raknetBitStreamWriteInt8(slot2_a3731, arg1[1])
			raknetBitStreamWriteInt32(slot2_a3731, arg1[2])
			raknetBitStreamWriteFloat(slot2_a3731, arg1[3].x)
			raknetBitStreamWriteFloat(slot2_a3731, arg1[3].y)
			raknetBitStreamWriteFloat(slot2_a3731, arg1[3].z)
			raknetBitStreamWriteFloat(slot2_a3731, arg1[4])
			raknetBitStreamWriteInt32(slot2_a3731, arg1[5])
			raknetBitStreamWriteInt8(slot2_a3731, arg1[6])
			raknetEmulRpcReceiveBitStream(32, slot2_a3731)
		end
	end

	function deletePlayer(arg0)
		local slot1_a3770 = raknetNewBitStream()

		raknetBitStreamWriteInt16(slot1_a3770, arg0)
		raknetEmulRpcReceiveBitStream(163, slot1_a3770)
		raknetDeleteBitStream(slot1_a3770)
	end

	function libs()
		if not slot0_a8134 then
			slot0_a3930[#slot0_a3930 + 1] = "lib/imgui.lua"
			slot0_a3930[#slot0_a3930 + 1] = "lib/MoonImGui.dll"
		end

		if not doesFileExist("moonloader\\lib\\fa-solid-900.ttf") then
			slot0_a3930[#slot0_a3930 + 1] = "lib/fa-solid-900.ttf"
		end

		if not slot2_a3948 then
			slot0_a3930[#slot0_a3930 + 1] = "lib/fAwesome5.lua"
		end

		if not slot12_a3949 then
			slot0_a3930[#slot0_a3930 + 1] = "imgui_notf.lua"
		end

		if not slot6_a27283 then
			slot0_a3930[#slot0_a3930 + 1] = "lib/rkeys.lua"
		end

		if not slot8_a8136 then
			slot0_a3930[#slot0_a3930 + 1] = "lib/imcustom/hotkey.lua"
		end

		if not slot4_a3952 then
			slot0_a3930[#slot0_a3930 + 1] = "lib/imgui_addons.lua"
		end

		if #slot0_a3930 > 0 or #slot1_a3842 > 0 then
			lua_thread.create((function ()
				while not isSampAvailable() do
					wait(0)
				end

				sendchat("Внимание! Начата загрузка недостающих библиотек для работы скрипта")
			end))

			for slot5_a3847, slot6_a3857 in pairs(slot1_a3842) do
				if not doesDirectoryExist("moonloader/lib/" .. slot6_a3857) then
					createDirectory("moonloader/lib/" .. slot6_a3857)
				end
			end

			for slot5_a3932, slot6_a3927 in pairs(slot0_a3930) do
				local slot7_a3883 = slot6_a3927

				if slot6_a3927:match("lib/.+") then
					slot7_a3883 = slot6_a3927:match("lib/(.+)")
				end

				local slot8_a3907 = "proccess"

				downloadUrlToFile("https://raw.githubusercontent.com/UNHARZ/UNH/main/lib/" .. slot7_a3883, "moonloader/" .. slot6_a3927, (function (arg0, arg1, arg2, arg3)
					if arg1 == slot19_a25374.STATUS_DOWNLOADINGDATA then
						slot8_a3907 = "proccess"
					elseif arg1 == slot19_a25374.STATUS_ENDDOWNLOADDATA then
						slot8_a3907 = "succ"
					elseif arg1 == 64 then
						slot8_a3907 = "failed"
					end
				end))

				while slot8_a3907 == "proccess" do
					wait(0)
				end

				if slot8_a3907 == "failed" then
					lua_thread.create((function ()
						while not isSampAvailable() do
							wait(0)
						end

						sendconsol("Не удалось загрузить библиотеку " .. slot6_a3927)
						thisScript():unload()
					end))
				else
					sendchat("Библиотека " .. slot6_a3927 .. " была загружена. Осталось: " .. #slot0_a3930 - slot5_a3932)
				end

				wait(500)
			end

			sendchat("Необходимые файлы для работы скрипта успешно установлены!")
			sendchat("Начинаю перезагрузку...")
			thisScript():reload()
		else
			sendconsol("Необходимость установки файлов - отсутствует")
		end
	end

	function main()
		if not isSampfuncsLoaded() or not isSampLoaded() then
			return
		end
end
		while not isSampAvailable() do
			wait(100)
		end

		sendconsol("Успешный запуск!")

		if not doesFileExist("moonloader/config/helper.ini") then
			sendconsol("Создание файла конфигурации..")
			slot17_a28610.save(slot34_a28422, "helper.ini")
		else
			sendconsol("Настройки скрипта загружены.")
		end

		if slot12_a3949 then
			slot13_a25131.addNotification(string.format([[
Universal Helper

Приветствую! 
Хелпер успешно запущен!
Текущая версия %s]], thisScript().version, os.date()), 5)
		end

		if not doesDirectoryExist("moonloader\\lib\\imcustom") then
			createDirectory("moonloader\\lib\\imcustom")
		end

		if not doesDirectoryExist("moonloader\\config\\Universal Helper\\peds") then
			createDirectory("moonloader\\config\\Universal Helper\\peds")
		end

		if not doesDirectoryExist("moonloader\\config\\Universal Helper") then
			createDirectory("moonloader\\config\\Universal Helper")
		end

		if slot0_a8134 then
			if doesFileExist("moonloader\\config\\Universal Helper\\logotip.png") then
				logotip_png = slot1_a29133.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\config\\Universal Helper\\logotip.png")
			else
				downloadUrlToFile("https://cdn.discordapp.com/attachments/496264372063305731/730537996348293142/logotip.png", "moonloader\\config\\Universal Helper\\logotip.png", (function (arg0, arg1, arg2, arg3)
					if arg1 == slot19_a25374.STATUS_ENDDOWNLOADDATA then
						logotip_png = slot1_a29133.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\config\\Universal Helper\\logotip.png")
					end
				end))
			end

			if doesFileExist("moonloader\\config\\Universal Helper\\color.png") then
				color_png = slot1_a29133.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\config\\Universal Helper\\color.png")
			else
				downloadUrlToFile("https://cdn.discordapp.com/attachments/496264372063305731/708038524728770670/color.png", "moonloader\\config\\Universal Helper\\color.png", (function (arg0, arg1, arg2, arg3)
					if arg1 == slot19_a25374.STATUS_ENDDOWNLOADDATA then
						color_png = slot1_a29133.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\config\\Universal Helper\\color.png")
					end
				end))
			end

			for slot3_a4083 = 0, 311 do
				if not doesFileExist("moonloader\\config\\Universal Helper\\peds\\skin_" .. slot3_a4083 .. ".png") then
					downloadUrlToFile(" https://raw.githubusercontent.com/UNHARZ/UNH/main/ped/skin_" .. slot3_a4083 .. ".png", "moonloader\\config\\Universal Helper\\peds\\skin_" .. slot3_a4083 .. ".png", (function (arg0, arg1, arg2, arg3)
						if arg1 == slot19_a25374.STATUSEX_ENDDOWNLOAD then
							print("[Universal Image] {FFFFFF}Загружен файл Skin_" .. slot3_a4083 .. ".png")

							function getstatus()
								slot1_a29133.Text(u8(tostring("Установлено: " .. slot3_a4083 .. " из 311")))
							end
						end
					end))
				end

				function getstatus()
					checkskin = slot0_a4117
				end

				skinpng[slot3_a4083] = slot1_a29133.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\config\\Universal Helper\\peds\\skin_" .. slot3_a4083 .. ".png")
			end
		end

		if slot6_a27283 then
			if slot29_a28607 ~= nil then
				for slot3_a4139, slot4_a4144 in ipairs(slot29_a28607) do
					if slot4_a4144.cmd ~= "-" then
						rcmd(slot4_a4144.cmd, slot4_a4144.text, slot4_a4144.delay)
					end
				end
			else
				local slot0_a4148 = {}
				local slot1_a4149 = {
					text = "",
					cmd = "-",
					delay = 3,
					v = {}
				}
				slot0_a4148[1] = slot1_a4149
				local slot1_a4151 = {
					text = "",
					cmd = "-",
					delay = 3,
					v = {}
				}
				slot0_a4148[2] = slot1_a4151
				local slot1_a4153 = {
					text = "",
					cmd = "-",
					delay = 3,
					v = {}
				}
				slot0_a4148[3] = slot1_a4153
				local slot1_a4155 = {
					text = "",
					cmd = "-",
					delay = 3,
					v = {}
				}
				slot0_a4148[4] = slot1_a4155
				local slot1_a4157 = {
					text = "",
					cmd = "-",
					delay = 3,
					v = {}
				}
				slot0_a4148[5] = slot1_a4157
				slot29_a28607 = slot0_a4148
			end

			for slot3_a4164, slot4_a4169 in pairs(slot29_a28607) do
				slot7_a25136.registerHotKey(slot4_a4169.v, true, onHotKey)
			end

			if binderlist ~= nil then
				for slot3_a4179, slot4_a4183 in pairs(binderlist) do
					slot7_a25136.registerHotKey(slot4_a4183.v, true, onHotKey)
				end
			else
				local slot0_a4187 = {}
				local slot1_a4188 = {
					text = "Меню взаимодействий",
					v = {}
				}
				slot0_a4187[1] = slot1_a4188
				local slot1_a4190 = {
					text = "Фаст инвайт",
					v = {}
				}
				slot0_a4187[2] = slot1_a4190
				local slot1_a4192 = {
					text = "Сбив анимации",
					v = {}
				}
				slot0_a4187[3] = slot1_a4192
				local slot1_a4194 = {
					text = "Активация скрипта",
					v = {}
				}
				slot0_a4187[4] = slot1_a4194
				local slot1_a4196 = {
					text = "WallHack",
					v = {}
				}
				slot0_a4187[5] = slot1_a4196
				local slot1_a4198 = {
					text = "Активация piar",
					v = {}
				}
				slot0_a4187[6] = slot1_a4198
				local slot1_a4200 = {
					text = "Репорт по Anti-DM",
					v = {}
				}
				slot0_a4187[7] = slot1_a4200
				local slot1_a4202 = {
					text = "Anti-AFK",
					v = {}
				}
				slot0_a4187[8] = slot1_a4202
				local slot1_a4204 = {
					text = "Оверлей",
					v = {}
				}
				slot0_a4187[9] = slot1_a4204
				local slot1_a4206 = {
					text = "Тренировка капчи",
					v = {}
				}
				slot0_a4187[10] = slot1_a4206
				binderlist = slot0_a4187
			end
		end

		sampRegisterChatCommand("deagle", (function (arg0)
			getguninvent("de", arg0)
		end))
		sampRegisterChatCommand("mka", (function (arg0)
			getguninvent("m4", arg0)
		end))
		sampRegisterChatCommand("shot", (function (arg0)
			getguninvent("sh", arg0)
		end))
		sampRegisterChatCommand("rif", (function (arg0)
			getguninvent("rf", arg0)
		end))
		sampRegisterChatCommand("ivip", faminvitevip)
		sampRegisterChatCommand("iall", faminviteall)
		sampRegisterChatCommand("call", (function (arg0)
			if slot34_a28422.config.typephone ~= 0 then
				if tonumber(arg0) ~= nil and tonumber(arg0) < 1000 then
					if check_timep < os.time() then
						sampSendChat("/number " .. math.floor(math.abs(arg0)))

						slot42_a10106 = 1

						callphone()

						check_timep = os.time() + 30
					else
						sendchat("Увы, но звонок доступен раз в 30 секунд. Повтори попытку через " .. check_timep - os.time() .. " с.")
					end

					customtab.v = false
				end
			else
				sendchat("Ошибка! Выберите телефон в настройках скрипта!")
			end
		end))
		sampRegisterChatCommand("sobeska", cmd_sobes)
		sampRegisterChatCommand("addplayer", (function (arg0)
			if arg0 ~= nil then
				table.insert(slot34_a28422.playerlist, arg0)

				if slot17_a28610.save(slot34_a28422, "helper.ini") then
					sampAddChatMessage("[Check Player] Ник: " .. arg0 .. " Добавлен в чекер.", 3329330)
				end

				updateusercheck()
			end
		end))
		sampRegisterChatCommand("online", (function ()
			onlinefull.v = not onlinefull.v
		end))
		sampRegisterChatCommand("gg", (function (arg0)
			if #arg0 == 0 then
				sampAddChatMessage("[Universal Helper] {FFFFFF}Введи ID человека!", 6591981)
			else
				sampSendChat("/uninvite " .. arg0 .. " выселен + чс")
				sampSendChat("/blacklist " .. arg0 .. " выселен + чс")
			end
		end))
		sampRegisterChatCommand("kb", cmd_kb)
		sampRegisterChatCommand("drop", cmd_drop)
		sampRegisterChatCommand("hrec", reconnect)
		sampRegisterChatCommand("color", (function ()
			colorcar.v = not colorcar.v
		end))
		sampRegisterChatCommand("fh", (function (arg0)
			sampSendChat("/findihouse " .. arg0)
		end))
		sampRegisterChatCommand("fbiz", (function (arg0)
			sampSendChat("/findibiz " .. arg0)
		end))
		sampRegisterChatCommand(slot34_a28422.settingshelper.command, (function ()
			newmenu.v = not newmenu.v
		end))
		sampRegisterChatCommand("cchat", (function ()
			ClearChat()
		end))
		sampRegisterChatCommand("killinfo", (function ()
			killinfo.v = not killinfo.v
		end))
		sampRegisterChatCommand("piar", cmd_piar)
		sampRegisterChatCommand("rep", report)
		sampRegisterChatCommand("piss", (function ()
			sampSetSpecialAction(68)
		end))
		sampRegisterChatCommand("skinc", (function ()
			skinc.v = not skinc.v
		end))
		sampRegisterChatCommand("arz", (function ()
			connectarz.v = not connectarz.v
		end))
		sampRegisterChatCommand("skinid", (function (arg0)
			if #arg0 > 0 then
				MODEL = tonumber(arg0)

				if MODEL then
					_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)

					set_player_skin(id, MODEL)
					sampAddChatMessage(string.format("[Universal Helper] {FFFFFF} Вы выбрали скин под ID [%d]", MODEL), 6591981)
				end
			else
				sampAddChatMessage("[Universal Helper] {FFFFFF} Введите номер скина [0 - 311]", 6591981)
			end
		end))
		sampRegisterChatCommand("chet", (function (arg0)
			if #arg0 > 0 then
				local slot1_a4466 = calc(arg0)

				if calc(arg0) then
					sampAddChatMessage("[Universal Helper] {FFFFFF}Решенный пример: " .. arg0 .. " = " .. slot1_a4466, 6591981)
				end
			else
				sampAddChatMessage("[Universal Helper] {FFFFFF}Введи пример который нужно решить", 6591981)
			end
		end))

		if slot34_a28422.obnylenie.day ~= os.date("%d-%m-%y") then
			slot34_a28422.obnylenie.day = os.date("%d-%m-%y")
			slot34_a28422.obnylenie.online = tonumber(0)
			slot34_a28422.obnylenie.onlineafk = tonumber(0)
			slot34_a28422.obnylenie.shet = tonumber(0)

			slot17_a28610.save(slot34_a28422, "helper.ini")
		end

		getfps()
		lua_thread.create((function ()
			while true do
				wait(5000)

				if buffercleaner.v and slot18_a28309.read(9325748, 4, true) > 419430400 then
					cleanStreamMemoryBuffer()
				end
			end
		end))
		lua_thread.create((function ()
			while true do
				wait(0)

				if freearenda == true then
					if isCharInAnyCar(PLAYER_PED) then
						mycar = storeCarCharIsInNoSave(PLAYER_PED)

						switchCarEngine(mycar, true)
					else
						freearenda = false
					end
				end

				for slot3_a4550 = 0, sampGetMaxPlayerId(false) do
					if sampIsPlayerConnected(slot3_a4550) then
						local slot4_a4552, slot5_a4579 = sampGetCharHandleBySampPlayerId(slot3_a4550)

						if slot4_a4552 and doesCharExist(slot5_a4579) then
							local slot6_a4561, slot7_a4562, slot8_a4563 = getCharCoordinates(slot5_a4579)
							local slot9_a4566, slot10_a4567, slot11_a4568 = getCharCoordinates(playerPed)

							if getDistanceBetweenCoords3d(slot6_a4561, slot7_a4562, slot8_a4563, slot9_a4566, slot10_a4567, slot11_a4568) < 0.4 then
								setCharCollision(slot5_a4579, false)
							end
						end
					end
				end

				if deed.v and getCharHealth(PLAYER_PED) <= 0 then
					sampSendChat(slot34_a28422.config.textdead)
					wait(4000)
				end
			end
		end))
		lua_thread.create((function ()
			while true do
				wait(1000)

				if sampIsPlayerConnected(playerID) then
					weapon = getCurrentCharWeapon(PLAYER_PED)

					if weapon == 24 then
						slot34_a28422.killinfo.deagle_time = slot34_a28422.killinfo.deagle_time + 1
					elseif weapon == 31 then
						slot34_a28422.killinfo.m4_time = slot34_a28422.killinfo.m4_time + 1
					elseif weapon == 25 then
						slot34_a28422.killinfo.shot_time = slot34_a28422.killinfo.shot_time + 1
					end

					if getCharHealth(PLAYER_PED) <= 0 then
						s_death = s_death + 1
						killstrik = 0

						add_infokill()

						slot34_a28422.killinfo.a_death = slot34_a28422.killinfo.a_death + 1

						slot17_a28610.save(slot34_a28422, "helper.ini")
						wait(4000)
					end
				end
			end
		end))
		lua_thread.create((function ()
			while true do
				wait(0)

				if sampGetGamestate() == 3 and sampIsLocalPlayerSpawned() and not firstconnect then
					updateusercheck()
					sampSendChat("/vipplayers")
					wait(2000)
					sampSendChat("/stats")
					wait(3000)

					local slot0_a4670, slot1_a4671 = sampGetPlayerIdByCharHandle(PLAYER_PED)
					local slot2_a4674 = sampGetPlayerNickname(slot1_a4671)
					firstconnect = true
				end
			end
		end))
		--checkip()
		autoupdate("https://raw.githubusercontent.com/UNHARZ/UNH/main/update", "[Universal Helper] {FFFFFF}")
		libs()

		timer = lua_thread.create(timer)
		rp_weapons = lua_thread.create(rp_weapons)
		fastrun = lua_thread.create(fastrun)
		render = lua_thread.create(render)
		ssmod = lua_thread.create(ssmod)
		hphud = lua_thread.create(hphud)

		if patchfix.v then
			patch()
		end

		_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
		connectname.v = u8(tostring(sampGetPlayerNickname(id)))

		while true do
			wait(0)

			if vzaimod.v or onlinefull.v or connectarz.v or firstloadwindow.v or customtab.v or cararenda.v or customreport.v or newmenu.v or killinfo.v or skinc.v or settingsweather.v or colorcar.v then
				slot1_a29133.ShowCursor = true
				slot1_a29133.Process = true
			elseif stats.v then
				slot1_a29133.ShowCursor = false
				slot1_a29133.Process = true
			else
				slot1_a29133.Process = false
			end

			if tabcustom.v then
				sampToggleScoreboard(false)

				if isKeyJustPressed(9) then
					customtab.v = not customtab.v
				end
			end

			if loadoff.v then
				writeMemory(5425646, 1, 1, true)
			else
				writeMemory(5425646, 1, 0, true)
			end

			if effectoff.v then
				slot18_a28309.setuint8(4887200, 233, true)
				slot18_a28309.setuint32(4887201, 146, true)
				slot18_a28309.setuint16(4887205, 37008, true)
			else
				slot18_a28309.setuint8(4887200, 81, true)
				slot18_a28309.setuint32(4887201, 2250507737.0, true)
				slot18_a28309.setuint16(4887205, 86, true)
			end

			if weatherсhanger.v then
				SetTime(slider_time.v)
				SetWeather(slider_day.v)

				if timew then
					setTimeOfDay(timew, 0)
				end
			end

			if inputhelper.v and sampIsChatInputActive() == true then
				fib = slot34_a28422.cord.yCoordchat
				fib2 = slot34_a28422.cord.xCoordchat
				local slot1_a4836, slot2_a4837 = sampGetPlayerIdByCharHandle(playerPed)
				local slot3_a4840 = sampGetPlayerNickname(slot2_a4837)
				local slot4_a4843 = sampGetPlayerScore(slot2_a4837)
				local slot5_a4846 = sampGetPlayerColor(slot2_a4837)
				local slot6_a4852 = slot20_a5656.C.GetKeyState(20)
				local slot7_a4858 = slot20_a5656.C.GetKeyboardLayoutNameA(slot26_a5657)
				local slot8_a4874 = slot20_a5656.C.GetLocaleInfoA(tonumber(slot20_a5656.string(slot26_a5657), 16), 2, slot27_a5658, slot25_a5659)
				local slot9_a4878 = slot20_a5656.string(slot27_a5658)
				local slot10_a4900 = string.format("%s || {%0.6x}%s[%d] {ffffff}|| Капс: %s {FFFFFF}|| Язык: {ffeeaa}%s{ffffff}", os.date("%H:%M:%S"), bit.band(slot5_a4846, 16777215), slot3_a4840, slot2_a4837, getStrByState(slot6_a4852), string.match(slot9_a4878, "([^%(]*)"))

				renderFontDrawText(inputHelpText, slot10_a4900, fib2, fib, 3623878655.0)
			end

			local slot0_a4909, slot1_a4914, slot2_a4911, slot3_a4915 = sampHasDialogRespond(22222)

			if slot0_a4909 and statusсaptcha then
				if slot1_a4914 == 1 then
					local slot3_a4974 = slot3_a4915:gsub("%s", "")
					local slot4_a4979 = ("%.2f sec"):format(os.clock() - startTime)

					if tostring(slot3_a4974) == tostring(captcha) then
						addOneOffSound(0, 0, 0, 1054)
						print("{6495ED}[Universal Helper]{FFFFFF} Введена верно: {50FF50}( " .. slot3_a4974 .. "{FFFFFF} / {50FF50}" .. captcha .. " ) {FFFFFF}за{50FF50} " .. slot4_a4979 .. ".{FFFFFF} Первая цифра введена за: {50FF50}" .. firstKeyTime .. " sec")
						printStyledString("~w~" .. slot4_a4979, 3000, 4)
					else
						addOneOffSound(0, 0, 0, 1057)
						printStyledString("~r~Miss!", 3000, 4)

						if slot3_a4974 == "" then
							slot3_a4974 = "ничего"
						end

						print("{6495ED}[Universal Helper]{FFFFFF} Введена не верно: {FF5050}( " .. slot3_a4974 .. "{FFFFFF} / {FF5050}" .. captcha .. " ) {FFFFFF}за{FF5050} " .. slot4_a4979)
					end
				else
					print("{6495ED}[Universal Helper]{FFFFFF} Отказались от ввода капчи: {AFAFAF}" .. captcha)
				end

				statusсaptcha = false
			end

			if sampGetCurrentDialogId() == 22222 and sampIsDialogActive() and statusсaptcha then
				local slot4_a5021, slot5_a5024 = getScreenResolution()

				renderDrawBoxWithBorder((slot4_a5021 - 380) / 2, (slot5_a5024 - 150) / 3, 380, 100, 4285965483.0, 7, 4279375396.0)

				tCaptcha = {}
				local slot6_a5008 = tostring(captcha)

				for slot9_a5019 in slot6_a5008:gmatch("%d") do
					table.insert(tCaptcha, slot9_a5019)
				end

				local slot6_a5039 = (slot4_a5021 - 340) / 2
				local slot7_a5041 = (slot5_a5024 - 110) / 3

				for slot11_a5044, slot12_a5036 in pairs(tCaptcha) do
					drawCaptchaNum(tonumber(slot12_a5036), slot6_a5039, slot7_a5041, rth[slot11_a5044], 4279375396.0)

					slot6_a5039 = slot6_a5039 + 70
				end
			end

			if isKeyDown(VK_T) and wasKeyPressed(VK_T) and not sampIsChatInputActive() and not sampIsDialogActive() then
				sampSetChatInputEnabled(true)
			end

			if FishEyeEffect.v then
				if isCurrentCharWeapon(PLAYER_PED, 34) and isKeyDown(2) then
					if not slot41_a5660 then
						cameraSetLerpFov(70, 70, 1000, 1)

						slot41_a5660 = true
					end
				else
					cameraSetLerpFov(101, 101, 1000, 1)

					slot41_a5660 = false
				end
			end

			local slot4_a5083, slot5_a5084, slot6_a5085 = getCharCoordinates(playerPed)
			ZoneInGame = getGxtText(getNameOfZone(slot4_a5083, slot5_a5084, slot6_a5085))
			local slot7_a5097 = {
				"Los-Santos",
				"San-Fierro",
				"Las-Venturas"
			}
			local slot8_a5098 = getCityPlayerIsIn(PLAYER_HANDLE)

			if slot8_a5098 > 0 then
				playerCity = slot7_a5097[slot8_a5098]
			else
				playerCity = "Нет сигнала"
			end

			if slot34_a28422.infostat.maskon and getCharHealth(PLAYER_PED) <= 0 then
				mask = 1
				maskobeta = false
			end

			if posstats then
				if statson.v then
					showCursor(true)

					cX, cY = getCursorPos()
					local slot12_a5125 = 5
					slot34_a28422.cord.xCoord = cX * 1
					local slot12_a5131 = 5
					slot34_a28422.cord.yCoord = cY * 1

					if isKeyJustPressed(13) then
						if slot17_a28610.save(slot34_a28422, "helper.ini") then
							addOneOffSound(0, 0, 0, 1139)
							sampAddChatMessage("[Universal Helper] {FFFFFF}Расположение статистики сохранено!", 6591981)
						else
							sampAddChatMessage("[Universal Helper] {FFFFFF}ОШИБКА СОХРАНЕНИЯ СВЯЖИТЕСЬ С АВТОРОМ СКРИПТА!", 6591981)
						end

						showCursor(false)

						posstats = false
					end
				else
					sampAddChatMessage("[Universal Helper] {FFFFFF}Ошибка включите отображение статистики!", 6591981)

					posstats = false
				end
			end

			if timemesto and timeinscreen.v then
				showCursor(true)

				cX, cY = getCursorPos()
				local slot12_a5171 = 5
				slot34_a28422.cord.xCoordtime = cX * 1
				local slot12_a5177 = 5
				slot34_a28422.cord.yCoordtime = cY * 1

				if isKeyJustPressed(13) then
					if slot17_a28610.save(slot34_a28422, "helper.ini") then
						addOneOffSound(0, 0, 0, 1139)
						sampAddChatMessage("[Universal Helper] {FFFFFF}Расположение сохранено!", 6591981)
					else
						sampAddChatMessage("[Universal Helper] {FFFFFF}ОШИБКА СОХРАНЕНИЯ СВЯЖИТЕСЬ С АВТОРОМ СКРИПТА!", 6591981)
					end

					showCursor(false)

					timemesto = false
				end
			end

			if zekmesto and zekrender.v then
				showCursor(true)

				cX, cY = getCursorPos()
				local slot12_a5213 = 5
				slot34_a28422.cord.xCoordzek = cX * 1
				local slot12_a5219 = 5
				slot34_a28422.cord.yCoordzek = cY * 1

				if isKeyJustPressed(13) then
					if slot17_a28610.save(slot34_a28422, "helper.ini") then
						addOneOffSound(0, 0, 0, 1139)
						sampAddChatMessage("[Universal Helper] {FFFFFF}Расположение сохранено!", 6591981)
					else
						sampAddChatMessage("[Universal Helper] {FFFFFF}ОШИБКА СОХРАНЕНИЯ СВЯЖИТЕСЬ С АВТОРОМ СКРИПТА!", 6591981)
					end

					showCursor(false)

					zekmesto = false
				end
			end

			if posstatschat then
				if inputhelper.v then
					showCursor(true)

					cX, cY = getCursorPos()
					local slot11_a5254 = 5
					slot34_a28422.cord.xCoordchat = cX * 1
					local slot11_a5259 = 5
					slot34_a28422.cord.yCoordchat = cY * 1

					if isKeyJustPressed(13) then
						if slot17_a28610.save(slot34_a28422, "helper.ini") then
							addOneOffSound(0, 0, 0, 1139)
							sampAddChatMessage("[Universal Helper] {FFFFFF}Расположение InputHelper сохранено!", 6591981)
						else
							sampAddChatMessage("[Universal Helper] {FFFFFF}ОШИБКА СОХРАНЕНИЯ СВЯЖИТЕСЬ С АВТОРОМ СКРИПТА!", 6591981)
						end

						showCursor(false)

						posstatschat = false
					end
				else
					sampAddChatMessage("[Universal Helper] {FFFFFF}Ошибка включите InputHelper!", 6591981)

					posstatschat = false
				end
			end

			if autokey.v and isKeyJustPressed(78) and isCharInAnyCar(PLAYER_PED) then
				notkey = true
			end

			if famvisible.v then
				for slot12_a5336 = 1, 2048 do
					if sampIs3dTextDefined(slot12_a5336) then
						local slot13_a5322, slot14_a5309, slot15_a5310, slot16_a5311, slot17_a5312, slot18_a5313, slot19_a5314, slot20_a5315, slot21_a5316 = sampGet3dTextInfoById(slot12_a5336)

						for slot25_a5330 = 1, #FAMA do
							if slot13_a5322:match(string.format(".+%s", FAMA[tonumber(slot25_a5330)])) then
								sampDestroy3dText(slot12_a5336)
							end
						end
					end
				end
			end

			if testCheat(slot34_a28422.bindertestchect.command2) and not sampIsCursorActive() then
				sampSendChat("/usedrugs 3")
			end

			if testCheat(slot34_a28422.bindertestchect.command3) and not sampIsCursorActive() then
				sampSendChat("/usemed")
			end

			if testCheat(slot34_a28422.bindertestchect.command15) and not sampIsCursorActive() then
				sampSendChat("/phone")
				sampSendDialogResponse(1000, 1, _, -1)

				checkphone = true
			end

			if testCheat(slot34_a28422.bindertestchect.command16) and not sampIsCursorActive() then
				sampSendChat("/jlock")
			end

			if testCheat(slot34_a28422.bindertestchect.command7) and not sampIsCursorActive() then
				sampSendChat("/mask")
			end

			if testCheat(slot34_a28422.bindertestchect.command1) and not sampIsCursorActive() then
				sampSendChat("/armour")
			end

			if testCheat(slot34_a28422.bindertestchect.command6) and not sampIsChatInputActive() then
				sampSendChat("/lock")
			end

			if testCheat(slot34_a28422.bindertestchect.command4) and isCharInAnyCar(PLAYER_PED) then
				spawncara()
			end

			if testCheat(slot34_a28422.bindertestchect.command11) and not sampIsCursorActive() and not isCharInAnyCar(PLAYER_PED) then
				sampSendChat("/fillcar")
			end

			if testCheat(slot34_a28422.bindertestchect.command10) and not sampIsCursorActive() and not isCharInAnyCar(PLAYER_PED) then
				sampSendChat("/repcar")
			end

			if testCheat(slot34_a28422.bindertestchect.command12) then
				sampSendChat("/time")
			end

			if testCheat(slot34_a28422.bindertestchect.command17) and not sampIsCursorActive() and isCharInAnyCar(PLAYER_PED) then
				sampSendChat("/key")
			end

			if testCheat(slot34_a28422.bindertestchect.command8) then
				SV()
			end

			if dropinfo.v then
				if os.date("%H") == "14" and os.date("%M") == "00" and os.date("%S") == "00" then
					slot13_a25131.addNotification(string.format("Universal Helper\n\nНапоминаю, через 10 минут пройдет дроп!", 228, os.date()), 10)
					slot13_a25131.addNotification(string.format("Universal Helper\n\nНапоминаю, через 10 минут пройдет дроп!", 228, os.date()), 10)
					wait(500)
				end

				if os.date("%H") == "16" and os.date("%M") == "00" and os.date("%S") == "00" then
					slot13_a25131.addNotification(string.format("Universal Helper\n\nНапоминаю, через 10 минут пройдет дроп!", 228, os.date()), 10)
					slot13_a25131.addNotification(string.format("Universal Helper\n\nНапоминаю, через 10 минут пройдет дроп!", 228, os.date()), 10)
					wait(500)
				end

				if os.date("%H") == "18" and os.date("%M") == "00" and os.date("%S") == "00" then
					slot13_a25131.addNotification(string.format("Universal Helper\n\nНапоминаю, через 10 минут пройдет дроп!", 228, os.date()), 10)
					slot13_a25131.addNotification(string.format("Universal Helper\n\nНапоминаю, через 10 минут пройдет дроп!", 228, os.date()), 10)
					wait(500)
				end

				if os.date("%H") == "20" and os.date("%M") == "00" and os.date("%S") == "00" then
					slot13_a25131.addNotification(string.format("Universal Helper\n\nНапоминаю, через 10 минут пройдет дроп!", 228, os.date()), 10)
					slot13_a25131.addNotification(string.format("Universal Helper\n\nНапоминаю, через 10 минут пройдет дроп!", 228, os.date()), 10)
					wait(500)
				end
			end

			if isKeyDown(119) and wh then
				nameTagOff()
				wait(1000)
				nameTagOn()
			end

			if statsoff.v and stats.v and isKeyDown(119) then
				stats.v = false

				wait(1000)

				stats.v = true
			end
		end
	end

	function sampGetPlayerIdByNickname(arg0)
		local slot1_a5665, slot2_a5673 = sampGetPlayerIdByCharHandle(playerPed)

		if tostring(arg0) == sampGetPlayerNickname(slot2_a5673) then
			return slot2_a5673
		end

		for slot6_a5690 = 0, 1000 do
			if sampIsPlayerConnected(slot6_a5690) and sampGetPlayerNickname(slot6_a5690) == tostring(arg0) then
				return slot6_a5690
			end
		end
	end

	function isKeyCheckAvailable()
		if not isSampLoaded() then
			return true
		end

		if not isSampfuncsLoaded() then
			return not sampIsChatInputActive() and not sampIsDialogActive()
		end

		return not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive()
	end

	function onReceivePacket(arg0, arg1)
		if arg0 == PACKET_DISCONNECTION_NOTIFICATION or arg0 == PACKET_INVALID_PASSWORD then
			recon()
		end
	end

	function onReceiveRpc(arg0, arg1)
		if arg0 == RPC_CONNECTIONREJECTED then
			recon()
		end
	end

	function recon()
		if autorecon.v then
			ip, port = sampGetCurrentServerAddress()

			lua_thread.create((function ()
				wait(slot34_a28422.config.timerecon * 60000)
				sampConnectToServer(ip, port)
			end))
		end
	end

	function isPlayerOnline(arg0)
		for slot4_a5757 = slot1_a5749, slot2_a5750, slot3_a5751 do
			if sampIsPlayerConnected(slot4_a5757) and sampGetPlayerNickname(slot4_a5757) == arg0 then
				return true
			end
		end

		return false
	end

	function updateusercheck()
		users = slot0_a5764

		for slot3_a5772, slot4_a5781 in pairs(slot34_a28422.playerlist) do
			if isPlayerOnline(slot4_a5781) then
				table.insert(users, slot4_a5781 .. "[" .. sampGetPlayerIdByNickname(slot4_a5781) .. "]")
			end
		end
	end

	function checkIntable(arg0, arg1)
		for slot5_a5797, slot6_a5799 in pairs(arg0) do
			if slot6_a5799 == arg1 then
				return true
			end
		end
	end

	function async_http_request(arg0, arg1, arg2, arg3, arg4)
		local slot5_a5810 = slot22_a5875.gen
		local slot6_a5811 = "*"
		local slot7_a5812 = {}
		local slot8_a5813 = {
			path = package.path,
			cpath = package.cpath
		}
		slot7_a5812.package = slot8_a5813
		local slot5_a5871 = slot5_a5810(slot6_a5811, slot7_a5812, (function ()
			local slot1_a5829, slot2_a5833 = pcall(require("requests").request, arg0, arg1, arg2)

			if slot1_a5829 then
				local slot3_a5831 = nil
				slot2_a5833.xml = nil
				slot2_a5833.json = slot3_a5831

				return true, slot2_a5833
			else
				return false, slot2_a5833
			end
		end))
		arg4 = arg4 or function ()
		end

		lua_thread.create((function ()
			local slot0_a5862 = slot5_a5871()

			while true do
				local slot1_a5867 = slot0_a5862.status

				if slot1_a5867 == "done" then
					local slot2_a5850 = slot0_a5862[1]
					local slot3_a5858 = slot0_a5862[2]

					if slot2_a5850 then
						arg3(slot3_a5858)
					else
						arg4(slot3_a5858)
					end

					return
				elseif slot1_a5867 == "error" then
					return arg4(slot0_a5862[1])
				elseif slot1_a5867 == "killed" or slot1_a5867 == "cancelled" then
					return arg4(slot1_a5867)
				end

				wait(0)
			end
		end))
	end

	if slot14_a5877 and slot0_a8134 then
		function slot15_a5899.onSendClickPlayer(arg0)
			setClipboardText(sampGetPlayerNickname(arg0))
			printStyledString("NICK " .. sampGetPlayerNickname(arg0) .. " COPY", 1500, 5)
			addOneOffSound(0, 0, 0, 1054)
		end

		function slot15_a5899.onRemove3DTextLabel(arg0)
			table.remove(_3dtexts, arg0)
		end

		function slot15_a5899.onSendCommand(arg0)
			if arg0.find(slot2_a5911, "{screen}") then
				local slot1_a5918 = arg0:gsub("{screen}", "")

				sampSendChat(slot1_a5918)
				lua_thread.create((function ()
					wait(500)
					setVirtualKeyDown(VK_F8, true)
					wait(0)
					setVirtualKeyDown(VK_F8, false)
				end))

				return false
			end

			if arg0:find("{vzID}") and slot39_a27480 ~= nil then
				local slot1_a5947 = arg0:gsub("{vzID}", slot39_a27480)

				sampSendChat(slot1_a5947)

				return false
			end

			if repitvr.v and arg0:find("^/vr") then
				messvr = arg0
			end

			if arg0:find("^/time") and casi.v then
				lua_thread.create((function ()
					send_rpc_command("/me " .. slot34_a28422.config.casitext)
					wait(2000)
					send_rpc_command("/do На часах  " .. os.date("%H:%M:%S"))
				end))
			end

			if arg0:find("{vzName}") and slot39_a27480 ~= nil then
				local slot1_a5998 = arg0:gsub("{vzName}", sampGetPlayerNickname(slot39_a27480))

				sampSendChat(slot1_a5998)

				return false
			end
		end

		function slot15_a5899.onSendChat(arg0)
			if arg0.find(slot2_a6009, "{screen}") then
				local slot1_a6020 = arg0:gsub("{screen}", "")

				if #slot1_a6020 > 0 then
					sampSendChat(slot1_a6020)
				end

				lua_thread.create((function ()
					wait(500)
					setVirtualKeyDown(VK_F8, true)
					wait(0)
					setVirtualKeyDown(VK_F8, false)
				end))

				return false
			end

			if arg0:find("{vzID}") and slot39_a27480 ~= nil then
				local slot1_a6048 = arg0:gsub("{vzID}", slot39_a27480)

				sampSendChat(slot1_a6048)

				return false
			end

			if arg0:find("{vzName}") and slot39_a27480 ~= nil then
				local slot1_a6064 = arg0:gsub("{vzName}", sampGetPlayerNickname(slot39_a27480))

				sampSendChat(slot1_a6064)

				return false
			end

			if accenton.v then
				if arg0 == ")" or arg0 == "(" or arg0 == "))" or arg0 == "((" or arg0 == "xD" or arg0 == ":D" or arg0 == ":d" or arg0 == "q" or arg0 == "XD" then
					local slot1_a6079 = {
						arg0
					}

					return slot1_a6079
				end

				local slot1_a6081 = {
					"[" .. u8:decode(accenttext.v) .. "]: " .. arg0
				}

				return slot1_a6081
			end
		end

		function slot15_a5899.onShowTextDraw(arg0, arg1)
			if autofill.v then
				if arg1.text:find("%$%d+") then
					fillmoney = arg0
				end

				if arg1.text:find("LD%_BEAT%:chit") and arg1.lineWidth == 19 then
					fillchange = arg0
				end

				if arg1.text:find("FILL") then
					fillid = arg0

					sampSendClickTextdraw(fillmoney)
					lua_thread.create((function ()
						wait(100)
						sampSendClickTextdraw(fillchange)
						wait(130)
						sampSendClickTextdraw(fillid)
					end))
				end
			end

			if gname ~= "nothing" then
				if not findedgun then
					if arg1.modelId == tableguns[gname] then
						findedgun = true

						sampSendClickTextdraw(arg0)
					end
				elseif arg0 == 2302 then
					sampSendClickTextdraw(arg0)
				end
			end
		end

		function slot15_a5899.onSendGiveDamage(arg0, arg1, arg2, arg3)
			if sampIsPlayerConnected(arg0) then
				nickkill = sampGetPlayerNickname(arg0)
				result, handle2 = sampGetCharHandleBySampPlayerId(arg0)

				if result then
					health = sampGetPlayerHealth(arg0)

					if health < arg1 or health == 0 then
						slot34_a28422.killinfo.a_kills = slot34_a28422.killinfo.a_kills + 1
						s_kills = s_kills + 1

						table.insert(kills, nickkill)
						table.insert(killsid, arg0)

						if tonumber(slot34_a28422.killinfo.killstrik) < s_kills then
							slot34_a28422.killinfo.killstrik = s_kills
						end

						killstrik = killstrik + 1
					end
				end

				s_damage = s_damage + arg1
				slot34_a28422.killinfo.a_damage = slot34_a28422.killinfo.a_damage + arg1

				slot17_a28610.save(slot34_a28422, "helper.ini")
			end
		end

		function slot15_a5899.onDisplayGameText(arg0, arg1, arg2)
			if slot34_a28422.infostat.arendaon and arg0 == 4 and arg1 == 1000 and arg2:find("Return (%d+)%/%d+") and arenda then
				secarenda = math.modf(tonumber(arg2:match("Return (%d+)%/%d+")))

				return false
			end

			if arg0 == 3 and arg1 == 1000 and arg2:find("~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Jailed %d+ Sec%.") then
				local slot3_a6261, slot4_a6262 = math.modf(tonumber(arg2:match("Jailed (%d+)")) / 60)
				local slot5_a6263 = {
					arg0,
					arg1,
					string.format("~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Jailed %s Sec = %s Min.", arg2:match("Jailed (%d+)"), slot3_a6261)
				}

				return slot5_a6263
			end

			if arg2:find("%-400%$") then
				return false
			end

			if turbocontrol.v and arg2:find("~n~~n~~n~~n~~n~~n~~n~~n~~w~Style: ~g~Comfort!") then
				sampSendChat("/style")
			end

			if edaauto.v and (arg2:find("You are hungry!") or arg2:find("You are very hungry!")) then
				if slot34_a28422.config.sseda == 0 then
					sampSendChat("/cheeps")
				elseif slot34_a28422.config.sseda == 1 then
					sampSendChat("/jfish")
				elseif slot34_a28422.config.sseda == 2 then
					sampSendChat("/jmeat")
				elseif slot34_a28422.config.sseda == 3 then
					sampSendChat("/beer")
				elseif slot34_a28422.config.sseda == 4 then
					sampSendChat("/sprunk")
				elseif slot34_a28422.config.sseda == 5 then
					sampSendChat("/smoke")
				elseif slot34_a28422.config.sseda == 6 then
					sampSendChat("/meatbag")
				elseif slot34_a28422.config.sseda == 7 then
					lua_thread.create((function ()
						sampSendChat("/home")
						wait(900)
						sampSendDialogResponse(174, 1, 1, false)
						wait(900)
						sampSendDialogResponse(2431, 1, 0, false)
						wait(900)
						sampSendDialogResponse(185, 1, 6, false)
					end))
				end
			end
		end

		function slot15_a5899.onSetPlayerPos(arg0, arg1, arg2)
			if MODEL > 0 then
				_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)

				set_player_skin(id, MODEL)
			end
		end

		function slot15_a5899.onShowDialog(arg0, arg1, arg2, arg3, arg4, arg5)
			if act and ad.v then
				if arg0 == 15345 then
					sampSendDialogResponse(15345, 1, slot34_a28422.config.typesmi + 1, _)
					sampCloseCurrentDialogWithButton(1)

					return false
				end

				if arg0 == 15346 then
					sampSendDialogResponse(15346, 1, 1, _)
					sampCloseCurrentDialogWithButton(1)

					return false
				end

				if arg0 == 15347 then
					sampSendDialogResponse(15347, 1, _, _)
					sampCloseCurrentDialogWithButton(1)

					return false
				end
			end

			if arg0 == 1000 and checkphone then
				checkphone = false

				return false
			end

			if arg0 == 952 and addcontact then
				sampSendDialogResponse(952, 1, _, -1)

				return false
			end

			if arg0 == 953 and addcontact then
				if number ~= "" and number ~= nil then
					sampSendDialogResponse(953, 1, _, number)

					addcontact = false
					number = ""

					return false
				else
					sampSendDialogResponse(953, 0, 0)
					sampCloseCurrentDialogWithButton(0)
					sendchat("Ошибка! человека невозможно добавить в список контактов!")

					addcontact = false
					number = ""

					return false
				end
			end

			if sampGetCurrentServerAddress() == "185.169.134.45" and arg0 == 1 and arg2:find("4/4") then
				sampSendDialogResponse(1, 1, 1, "Lil_McLore")

				return false
			end

			if phoneact then
				sampSendDialogResponse(1000, 1, 1, _)

				phoneact = false

				return false
			end

			if arg0 == 32 and reportcustom.v then
				customreport.v = true

				return false
			end

			if findedgun and gname ~= "nothing" and arg0 == 3011 then
				sampSendDialogResponse(3011, 1, 0, ammoclip)
				sampSendClickTextdraw(2110)

				gname = "nothing"

				return false
			end

			if arg0 == 235 and not firstconnect then
				for slot9_a6542 in arg5:gmatch("[^\r\n]+") do
					if slot9_a6542:find("Организация: {B83434}%[(.*)%]") then
						org = slot9_a6542:match("Организация: {B83434}%[(.*)%]")
					end

					if slot9_a6542:find("Работа: {B83434}%[(.+)]") then
						job = slot9_a6542:match("Работа: {B83434}%[(.+)]")
					end

					if slot9_a6542:find("Должность:% {.*}(.*)%(%d+%)") then
						myrang = slot9_a6542:match("Должность:% {.*}(.*)%(%d+%)")
					else
						myrang = "Нету"
					end

					if slot9_a6542:find("Номер телефона: {B83434}%[(%d+)%]") then
						phone = slot9_a6542:match("Номер телефона: {B83434}%[(%d+)%]")
					end
				end

				sampSendDialogResponse(arg0, 0, nil, nil)
				sampCloseCurrentDialogWithButton(0)

				return false
			end

			if arg0 == 230 and customarenda.v then
				if arg5:find("Модель: (%w+)") then
					modelcar = arg5:match("Модель: (%w+)")
				end

				if arg5:find("Стоимость: (%d+)") then
					pricecar = arg5:match("Стоимость: (%d+)")
				end

				cararenda.v = true

				return false
			end

			if report == 1 and arg0 == 32 then
				report = 0

				return false
			end

			if skiprep.v then
				if arg0 == 1333 then
					return false
				end

				if arg0 == 1332 then
					return false
				end
			end

			if autopi.v and arg0 == 991 then
				sampSendDialogResponse(arg0, 1, _, slot34_a28422.authorization.autopin)
			end

			if autopp.v then
				if arg0 == 2 and not arg5:find("Неверный пароль!") then
					sampSendDialogResponse(2, 1, -1, slot34_a28422.authorization.loginakk)

					return false
				elseif arg5:find("Неверный пароль!") then
					sampAddChatMessage("[Universal Helper]{FFFFFF} В настройках указан не верный пароль.Вводите его в ручную.", 6591981)
				end
			end

			if drpstiler.v and arg0 == 4777 then
				sampAddChatMessage("[Universal Helper] {FFFFFF}Открыто меню дропа, ворую рванку / обвесы.", 6591981)
				sampSendDialogResponse(4777, 1, 3)
			end

			if zz.v and arg5:find("В этом месте запрещено") then
				return false
			end
		end

		function slot15_a5899.onCreate3DText(arg0, arg1, arg2)
			table.insert(_3dtexts, arg0)

			if del_3d.v then
				return false
			end
		end

		function slot15_a5899.onVehicleStreamIn(arg0, arg1)
			if del_car.v then
				return false
			end
		end

		function slot15_a5899.onPlayerStreamIn(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
			local slot7_a6673 = infnpc
			local slot8_a6674 = {
				arg1,
				arg2,
				arg3,
				arg4,
				arg5,
				arg6
			}
			slot7_a6673[arg0] = slot8_a6674

			if del_ped.v then
				for slot10_a6682, slot11_a6689 in ipairs(getAllChars()) do
					if doesCharExist(slot11_a6689) then
						local slot12_a6691, slot13_a6695 = sampGetPlayerIdByCharHandle(slot11_a6689)

						if slot13_a6695 ~= myid then
							deletePlayer(slot13_a6695)
						end
					end
				end

				npc[#npc + 1] = arg0
			end
		end

		function slot15_a5899.onVehicleStreamOut(arg0, arg1)
			if del_car.v then
				return false
			end
		end

		function slot15_a5899.onPlayerQuit(arg0)
			if tabfix.v and sampIsScoreboardOpen() then
				return false
			end

			if chekerplayers.v then
				for slot4_a6743, slot5_a6727 in pairs(users) do
					if tostring(slot5_a6727) == tostring(sampGetPlayerNickname(arg0) .. "[" .. arg0 .. "]") then
						table.remove(users, slot4_a6743)
					end
				end
			end
		end

		function slot15_a5899.onPlayerJoin(arg0, arg1, arg2, arg3)
			if tabfix.v and sampIsScoreboardOpen() then
				return false
			end

			if checkIntable(slot34_a28422.playerlist, arg3) and chekerplayers.v then
				table.insert(users, arg3 .. "[" .. arg0 .. "]")
			end
		end

		function slot15_a5899.onSendClientJoin(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
			if launcher.v then
				local slot5_a6786 = "Arizona PC"
				local slot7_a6787 = {
					arg0,
					arg1,
					arg2,
					arg3,
					arg4,
					slot5_a6786,
					arg6
				}

				return slot7_a6787
			end
		end

		function slot15_a5899.onSendTakeDamage(arg0, arg1, arg2, arg3)
			if antidm.v and arg1 >= 20 and arg0 < 1001 and check_time < os.time() then
				if antidmsound.v then
					addOneOffSound(0, 0, 0, 1138)
				end

				if antidmtype.v == 0 then
					sampAddChatMessage("[Universal Helper] {FFFFFF}Сработал Anti-DM! Чтобы написать репорт нажмите " .. table.concat(slot7_a25136.getKeysName(binderlist[7].v), " + ") .. " !", 6591981)
				else
					slot13_a25131.addNotification(string.format("Сработал Anti-DM!\nЧтобы написать репорт нажмите " .. table.concat(slot7_a25136.getKeysName(binderlist[7].v), " + ") .. " !", 228, os.date()), 5)
				end

				check_time = os.time() + 30
				antidmreport = true
			end

			if sampIsPlayerConnected(arg0) then
				killernick = sampGetPlayerNickname(arg0)
				killerid = arg0
				killerweapon = slot24_a28082.get_name(arg2)
			end
		end

		function slot15_a5899.onSetInterior(arg0)
			if radar.v then
				lua_thread.create((function ()
					if arg0 == 0 then
						displayRadar(1)
					else
						displayRadar()
					end

					return true
				end))
			end
		end

		function slot15_a5899.onServerMessage(arg0, arg1)
			if arg1.find(slot3_a6901, "Данный тип топлива не подходит для вашего транспорта") and autofill.v then
				lua_thread.create((function ()
					wait(100)
					sampSendClickTextdraw(fillchange)
					wait(130)
					sampSendClickTextdraw(fillid)
				end))

				return false
			end

			for slot5_a6923, slot6_a6930 in ipairs(slot31_a28609) do
				if slot6_a6930.status == true and arg1:find(slot6_a6930.text) and not arg1:find("говорит") then
					local slot7_a6939 = table.insert
					local slot8_a6940 = logmessage
					local slot9_a6941 = {
						os.date("%H:%M", os.time()),
						arg1
					}

					slot7_a6939(slot8_a6940, slot9_a6941)

					return false
				end
			end

			if sampGetCurrentServerAddress() == "185.169.134.45" and arg1:find("Поздравляем! Вы достигли 6-го уровня!") then
				sampSendChat("/menu")
				sampSendDialogResponse(722, 1, 11, _)
				sampSendDialogResponse(9469, 1, 1, "#mclore")
				sampSendDialogResponse(9476, 1, 1, _)
				sampSendDialogResponse(722, 1, _, _)

				local slot2_a6979 = {
					arg0,
					arg1
				}

				return slot2_a6979
			end

			if zekrender.v then
				if arg1:find("(%w+.%w+)%(%d+%) | Время: (%d+) мин | Залог: %$(%d+) | КПЗ: (.*) %| Без адвоката") then
					nickzak, idzak, timezak, moneyzak, kpzzak = arg1:match("(%w+.%w+)%((%d+)%) | Время: (%d+) мин | Залог: %$(%d+) | КПЗ: (.*) %| Без адвоката")
					zanks = {}
					local slot2_a7000 = table.insert
					local slot3_a7001 = zanks
					local slot4_a7002 = {
						nickzak,
						idzak,
						timezak,
						moneyzak,
						kpzzak
					}

					slot2_a7000(slot3_a7001, slot4_a7002)

					return false
				end

				if arg1:find("(%w+.%w+)%(%d+%) | Время: (%d+) мин | Залог: %$(%d+) | КПЗ: (.*) %| С адвокатом") then
					zanks = {}

					return false
				end

				if arg1:find("Вы не адвокат.") then
					zekrender.v = false
				end
			end

			if checkvip then
				local slot2_a7032 = arg1:match("^%[VIP%]: (.+)%[%d+%].+уровень")

				if arg1:match("^%[VIP%]: (.+)%[%d+%].+уровень") then
					table.insert(vipp, slot2_a7032)

					return false
				end

				if arg1:find("Всего: (%d+) человек") then
					vipplayer = arg1:match("Всего: (%d+) человек")

					if #vipp == tonumber(vipplayer) then
						sendconsol("Информация о VIP игроках обновлена.")
					else
						sendconsol("Ошибка обновления информации о VIP игроках!" .. #vipp .. " ~= " .. vipplayer)
					end

					checkvip = false

					return false
				end
			end

			if safe.v then
				if arg1:find("У вас нет столько наркотиков!") or arg1:find("У вас нет бронежилета") or arg1:find("У тебя нет аптечек") and not arg1:find("- |") then
					safe.v = false

					sampAddChatMessage("[Universal Helper] {FFFFFF}SafeMod выключен! Нету наркотиков/ аптечки / армора , закупитесь и включите его заново!", 6591981)
				end

				if arg1:find("в стадии при смерти") then
					dyrka = true
				else
					dyrka = false
				end

				if arg1:find("Можно использовать раз в минуту") and not arg1:find("говорит") and not arg1:find("- |") then
					armor = getCharArmour(PLAYER_PED)

					lua_thread.create((function ()
						wait(60000)

						if armor == 0 then
							sampSendChat("/armour")
						elseif armor >= 1 then
							return false
						end
					end))
				end
			end

			if slot34_a28422.infostat.arendaon then
				if arg1:find("Вы отказались от аренды транспорта") then
					secarenda = 0
				end

				if arg1:find("Вы успешно арендовали это ТС") then
					arenda = true
				elseif arg1:find("Вы отказались от аренды транспорта") or arg1:find("Ваш арендованный транспорт был отбуксирован на стоянку") then
					arenda = false
					secarenda = 0
				end
			end

			if slot34_a28422.infostat.maskon then
				if arg1:find("Вы успешно надели маску.") and not arg1:find("говорит") and not arg1:find("- |") then
					mask = 1200
					maskobeta = true

					lua_thread.create((function ()
						if maskobeta then
							wait(1000)

							mask = mask - 1

							if mask == 0 then
								maskobeta = false
							end

							return true
						end
					end))
				end

				if arg1:find("Вы успешно выкинули маску.") and not arg1:find("говорит") and not arg1:find("- |") then
					mask = 1
					maskobeta = false
				end
			end

			if kypill.v and (arg1:find("приобрел PREMIUM VIP.") or arg1:find("приобрел Titan VIP.") and not arg1:find("говорит") and not arg1:find("- |")) then
				sampSendChat("/vr " .. slot34_a28422.config.kypiltext)

				local slot2_a7228 = {
					arg0,
					arg1
				}

				return slot2_a7228
			end

			if arg1:find("50000 с ящика контрабанды") then
				drpstiler.v = false
			end

			if autonarko.v and arg1:find("Вашему персонажу нужно принять") and not arg1:find("говорит") and not arg1:find("- |") then
				sampSendChat("/usedrugs " .. slot34_a28422.config.narko)
			end

			if autokey.v then
				_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
				nick = sampGetPlayerNickname(id)

				if arg1:find("Этот транспорт зарегистрирован на жителя {9ACD32}" .. nick) then
					inmycar = true
				elseif not isCharInAnyCar(PLAYER_PED) then
					inmycar = false
				end

				if isCharInAnyCar(PLAYER_PED) and inmycar then
					if arg1:find("Ключи не вставлены") and not arg1:find("говорит") and not arg1:find("- |") and notkey == true then
						lua_thread.create((function ()
							sampSendChat("/key")
							wait(500)
							sampSendChat("/engine")

							notkey = false
						end))
					end

					if arg1:find(nick) and arg1:find("заглушил") and arg1:find("двигатель") and not arg1:find("говорит") and not arg1:find("- |") then
						sampSendChat("/key")
					end
				end
			end

			if pay.v then
				if arg1:find("Депозит в банке: %$(%d+).*") and not arg1:find("говорит") and not arg1:find("- |") then
					slot38_a8110 = arg1:match("Депозит в банке: %$(%d+).*")
				elseif arg1:find("Сумма к выплате: %$(%d+)") and not arg1:find("говорит") and not arg1:find("- |") then
					slot37_a8111 = arg1:match("Сумма к выплате: %$(%d+)")
				elseif arg1:find("Текущая сумма в банке: %$%d+") and not arg1:find("говорит") and not arg1:find("- |") then
					slot34_a28422.obnylenie.shet = slot37_a8111 + slot38_a8110 + slot34_a28422.obnylenie.shet

					if slot17_a28610.save(slot34_a28422, "helper.ini") then
						sampAddChatMessage("Заработано с PayDay`ев $" .. slot34_a28422.obnylenie.shet, -1)
					end
				end
			end

			if smartbar.v then
				if arg1:find("%Победил (%w+.%w+) %- решка.") then
					lua_thread.create((function ()
						reshkaname, reska = arg1:match("Победил (%w+.%w+) %- (решка.)")
						local slot0_a7437 = table.insert
						local slot1_a7438 = reshkatrue
						local slot2_a7439 = {
							reshkaname,
							reska,
							os.time()
						}

						slot0_a7437(slot1_a7438, slot2_a7439)

						for slot3_a7562, slot4_a7454 in pairs(reshkatrue) do
							if os.time() - slot4_a7454[3] < 180 then
								itestr = 0

								for slot8_a7464, slot9_a7469 in pairs(reshkatrue) do
									if slot9_a7469[1] == slot9_a7469[1] and slot9_a7469[2] == slot9_a7469[2] then
										itestr = itestr + 1
									end
								end

								if itestr > 3 then
									sampAddChatMessage("[Universal Helper]{FFFFFF} Игроку " .. slot4_a7454[1] .. " [" .. sampGetPlayerIdByNickname(slot4_a7454[1]) .. "] Выпала : {FF0000}" .. slot4_a7454[2] .. " {FFFFFF} Больше 3х раз за последнии  " .. os.time() - slot4_a7454[3] .. " секунд!", 6591981)

									if smartbar.v then
										for slot8_a7513, slot9_a7507 in pairs(reshkatrue) do
											if slot9_a7507[1] == slot9_a7507[1] and slot9_a7507[2] == slot9_a7507[2] then
												table.remove(reshkatrue, slot8_a7513)
											end
										end

										if smartbarauto.v then
											if slot34_a28422.config.moneybar == 0 then
												sampSendChat("/reshka " .. slot4_a7454[1] .. " 100000")
											elseif slot34_a28422.config.moneybar == 1 then
												sampSendChat("/reshka " .. slot4_a7454[1] .. " 250000")
											elseif slot34_a28422.config.moneybar == 2 then
												sampSendChat("/reshka " .. slot4_a7454[1] .. " 500000")
											elseif slot34_a28422.config.moneybar == 3 then
												sampSendChat("/reshka " .. slot4_a7454[1] .. " 1000000")
											end
										end
									end

									table.remove(reshkatrue, slot3_a7562)
								end
							else
								table.remove(reshkatrue, slot3_a7562)
							end
						end
					end))
				end

				if arg1:find("%Победил (%w+.%w+) %- (орёл.)") then
					lua_thread.create((function ()
						orelname, orel = arg1:match("Победил (%w+.%w+) %- (орёл.)")
						local slot0_a7581 = table.insert
						local slot1_a7582 = oreltrue
						local slot2_a7583 = {
							orelname,
							orel,
							os.time()
						}

						slot0_a7581(slot1_a7582, slot2_a7583)

						for slot3_a7706, slot4_a7598 in pairs(oreltrue) do
							if os.time() - slot4_a7598[3] < 180 then
								itestrr = 0

								for slot8_a7608, slot9_a7613 in pairs(oreltrue) do
									if slot9_a7613[1] == slot9_a7613[1] and slot9_a7613[2] == slot9_a7613[2] then
										itestrr = itestrr + 1
									end
								end

								if itestrr > 3 then
									sampAddChatMessage("[Universal Helper] {FFFFFF} Игроку " .. slot4_a7598[1] .. " [" .. sampGetPlayerIdByNickname(slot4_a7598[1]) .. "] Выпал : {FF0000}" .. slot4_a7598[2] .. "{FFFFFF}  Больше 3х раз за последнии  " .. os.time() - slot4_a7598[3] .. " секунд!", 6591981)

									if smartbar.v then
										for slot8_a7657, slot9_a7651 in pairs(oreltrue) do
											if slot9_a7651[1] == slot9_a7651[1] and slot9_a7651[2] == slot9_a7651[2] then
												table.remove(oreltrue, slot8_a7657)
											end
										end

										if smartbarauto.v then
											if slot34_a28422.config.moneybar == 0 then
												sampSendChat("/orel " .. slot4_a7598[1] .. " 100000")
											elseif slot34_a28422.config.moneybar == 1 then
												sampSendChat("/orel " .. slot4_a7598[1] .. " 250000")
											elseif slot34_a28422.config.moneybar == 2 then
												sampSendChat("/orel " .. slot4_a7598[1] .. " 500000")
											elseif slot34_a28422.config.moneybar == 3 then
												sampSendChat("/orel " .. slot4_a7598[1] .. " 1000000")
											end
										end
									end

									table.remove(oreltrue, slot3_a7706)
								end
							else
								table.remove(oreltrue, slot3_a7706)
							end
						end
					end))
				end
			end

			if customcolor.v then
				if arg1:find("%[R].*%w+.%w+%[%d+%]:.*") and arg0 == 766526463 then
					r, g, b, a = slot1_a29133.ImColor(slot34_a28422.color.rchat):GetRGBA()

					sampAddChatMessage(arg1, join_rgb(r, g, b))

					return false
				end

				if arg1:find("%[F].*%w+.%w+%[%d+%]:.*") and arg0 == 766526463 then
					r, g, b, a = slot1_a29133.ImColor(slot34_a28422.color.fchat):GetRGBA()

					sampAddChatMessage(arg1, join_rgb(r, g, b))

					return false
				end

				if arg1:find("%[D].*%w+.%w+%[%d+%]:.*") and arg0 == 766526463 then
					r, g, b, a = slot1_a29133.ImColor(slot34_a28422.color.dchat):GetRGBA()

					sampAddChatMessage(arg1, join_rgb(r, g, b))

					return false
				end

				if arg1:find("%[Таксист]%w+.%w+%[(%d+)%]:.*") and arg0 == -2686721 then
					r, g, b, a = slot1_a29133.ImColor(slot34_a28422.color.taksic):GetRGBA()

					sampAddChatMessage(arg1, join_rgb(r, g, b))

					return false
				end

				if arg1:find("%[Дальнобойщик]%w+.%w+%[(%d+)%]:.*") and arg0 == -2686721 then
					r, g, b, a = slot1_a29133.ImColor(tonumber(slot34_a28422.color.dalna)):GetRGBA()

					sampAddChatMessage(arg1, join_rgb(r, g, b))

					return false
				end

				if arg1:find("%Объявление: .*") or arg1:find("Отредактировал сотрудник СМИ ") then
					r, g, b, a = slot1_a29133.ImColor(tonumber(slot34_a28422.color.news)):GetRGBA()

					sampAddChatMessage(arg1, join_rgb(r, g, b))

					return false
				end

				if arg1:find("{(.*)}%[(VIP)] {FFFFFF}(%w+.%w+)%[(%d+)%]: (.*)") then
					_, tegvip, nickvip, idvip, message = arg1:match("{(.*)}%[(VIP)] {FFFFFF}(%w+.%w+)%[(%d+)%]: (.*)")
					r, g, b, a = slot1_a29133.ImColor(tonumber(slot34_a28422.color.vip)):GetRGBA()

					sampAddChatMessage("[" .. tegvip .. "] {FFFFFF}" .. nickvip .. "[" .. idvip .. "]: " .. message, join_rgb(r, g, b))

					return false
				end

				if arg1:find("{(.*)}%[(PREMIUM)] {FFFFFF}(%w+.%w+)%[(%d+)%]: (.*)") then
					_, tegprem, nickprem, idprem, messageprem = arg1:match("{(.*)}%[(PREMIUM)] {FFFFFF}(%w+.%w+)%[(%d+)%]: (.*)")
					r, g, b, a = slot1_a29133.ImColor(tonumber(slot34_a28422.color.prem)):GetRGBA()

					sampAddChatMessage("[" .. tegprem .. "] {FFFFFF}" .. nickprem .. "[" .. idprem .. "]: " .. messageprem, join_rgb(r, g, b))

					return false
				end

				if arg1:find("%[(Семья)]% (.*)% (%w+.%w+)%[(%d+)%]:(.*)") then
					famm, rankfam, nickfam, idfam, textfam = arg1:match("%[(Семья)]% (.*)% (%w+.%w+)%[(%d+)%]:(.*)")
					r, g, b, a = slot1_a29133.ImColor(tonumber(slot34_a28422.color.famchat)):GetRGBA()

					sampAddChatMessage("[" .. famm .. "] " .. rankfam .. " " .. nickfam .. "[" .. idfam .. "] {FFFFFF}" .. textfam, join_rgb(r, g, b))

					return false
				end
			end

			if repitvr.v then
				lua_thread.create((function ()
					if arg1:find("После последнего сообщения в этом чате нужно подождать 3 секунды") and arg0 == -10270721 then
						wait(1000)
						sendconsol("Дублирую ваше сообщение >> " .. messvr)
						sampSendChat(messvr)
					end
				end))
			end

			if slot42_a10106 == 1 and arg1:find("(%w+.%w+)%[(%d+)%]:    {33CCFF}(%d+)") then
				number = string.match(arg1, "{FFFFFF}%a+_%a+%[%d+%]:    {33CCFF}(%d+)")

				if copynumber and number then
					sendchat("Телефонный номер " .. number .. " скопирован в буфер обмена.")
					setClipboardText(number)

					copynumber = false
				end

				if fastphone then
					sampAddChatMessage("++", -1)

					if number ~= "" and number ~= nil then
						sampSendDialogResponse(1000, 1, _, -1)
						sampSendClickTextdraw(namephone[pphone[slot34_a28422.config.typephone + 1]]["Позвонить"])

						for slot5_a8087 in string.gmatch(number, "%d") do
							sampSendClickTextdraw(namephone[pphone[slot34_a28422.config.typephone + 1]][slot5_a8087])
						end

						sampSendClickTextdraw(namephone[pphone[slot34_a28422.config.typephone + 1]]["Вызов"])

						fastphone = false
						number = ""
					else
						sendchat("Ошибка, звонок данному человеку невозможен!")
						sampSendDialogResponse(1000, 0, 0)
						sampCloseCurrentDialogWithButton(0)
					end
				end

				slot42_a10106 = 0
			end
		end
	end

	function send_rpc_command(arg0)
		local slot1_a8117 = raknetNewBitStream()
		local slot2_a8120 = require("samp.raknet")

		raknetBitStreamWriteInt32(slot1_a8117, #arg0)
		raknetBitStreamWriteString(slot1_a8117, arg0)
		raknetSendRpc(slot2_a8120.RPC.SERVERCOMMAND, slot1_a8117)
		raknetDeleteBitStream(slot1_a8117)
	end

	if slot0_a8134 then
		if slot6_a27283 and slot8_a8136 then
			slot9_a25135._SETTINGS.noKeysMessage = u8("Нет")
			slot1_a29133.ToggleButton = require("imgui_addons").ToggleButton
			slot1_a29133.HotKey = require("imgui_addons").HotKey
			slot1_a29133.Spinner = require("imgui_addons").Spinner
		end

		function slot1_a29133.TextColoredRGB(arg0)
			local slot2_a8169 = slot1_a29133.GetStyle().Colors
			local slot3_a8171 = slot1_a29133.ImVec4

			local function slot4_a8209(arg0)
				return bit.band(bit.rshift(arg0, 24), 255), bit.band(bit.rshift(arg0, 16), 255), bit.band(bit.rshift(arg0, 8), 255), bit.band(arg0, 255)
			end

			local function slot5_a8285(arg0)
				if arg0.sub(slot2_a8214, 1, 6):upper() == "SSSSSS" then
					return slot3_a8171(slot2_a8169[1].x, slot2_a8169[1].y, slot2_a8169[1].z, (tonumber(arg0:sub(7, 8), 16) or slot2_a8169[1].w * 255) / 255)
				end

				local slot1_a8269 = type(arg0) == "string" and tonumber(arg0, 16) or arg0

				if type(slot1_a8269) ~= "number" then
					return
				end

				local slot2_a8271, slot3_a8272, slot4_a8273, slot5_a8274 = slot4_a8209(slot1_a8269)

				return slot1_a29133.ImColor(slot2_a8271, slot3_a8272, slot4_a8273, slot5_a8274):GetVec4()
			end

			(function (arg0)
				for slot4_a8297 in arg0.gmatch(slot2_a8289, "[^\r\n]+") do
					local slot5_a8376 = {}
					local slot6_a8369 = {}
					local slot7_a8329 = 1
					slot4_a8297 = slot4_a8297:gsub("{(......)}", "{%1FF}")

					while slot4_a8297:find("{........}") do
						local slot8_a8349, slot9_a8354 = slot4_a8297:find("{........}")
						local slot10_a8343 = slot5_a8285(slot4_a8297:sub(slot8_a8349 + 1, slot9_a8354 - 1))

						if slot10_a8343 then
							local slot11_a8323 = #slot5_a8376
							local slot12_a8325 = #slot5_a8376 + 1
							local slot13_a8333 = slot4_a8297:sub(slot7_a8329, slot8_a8349 - 1)
							slot5_a8376[slot12_a8325] = slot4_a8297:sub(slot9_a8354 + 1, #slot4_a8297)
							slot5_a8376[slot11_a8323] = slot13_a8333
							slot6_a8369[#slot6_a8369 + 1] = slot10_a8343
							slot7_a8329 = slot8_a8349
						end

						slot4_a8297 = slot4_a8297:sub(1, slot8_a8349 - 1) .. slot4_a8297:sub(slot9_a8354 + 1, #slot4_a8297)
					end

					if slot5_a8376[0] then
						for slot11_a8377 = 0, #slot5_a8376 do
							slot1_a29133.TextColored(slot6_a8369[slot11_a8377] or slot2_a8169[1], u8(slot5_a8376[slot11_a8377]))
							slot1_a29133.SameLine(nil, 0)
						end

						slot1_a29133.NewLine()
					else
						slot1_a29133.Text(u8(slot4_a8297))
					end
				end
			end)(arg0)
		end

		function slot1_a29133.CenterText(arg0)
			slot1_a29133.SetCursorPosX(slot1_a29133.GetWindowWidth() / 2 - slot1_a29133.CalcTextSize(arg0).x / 2)
			slot1_a29133.Text(arg0)
		end

		function slot1_a29133.CenterColumnText(arg0)
			slot1_a29133.SetCursorPosX(slot1_a29133.GetColumnOffset() + slot1_a29133.GetColumnWidth() / 2 - slot1_a29133.CalcTextSize(arg0).x / 2)
			slot1_a29133.Text(arg0)
		end

		function slot1_a29133.Link(arg0, arg1, arg2)
			arg2 = type(arg1) == "boolean" and arg1 or arg2 or false
			arg1 = type(arg1) == "string" and arg1 or type(arg1) == "boolean" and arg0 or arg0
			local slot3_a8524 = slot1_a29133.CalcTextSize(arg1)
			local slot4_a8521 = slot1_a29133.GetCursorScreenPos()
			local slot5_a8497 = slot1_a29133.GetCursorPos()
			local slot6_a8559 = slot1_a29133.InvisibleButton("##" .. arg0 .. arg1, slot3_a8524)

			if slot6_a8559 and not arg2 then
				os.execute("explorer " .. arg0)
			end

			slot1_a29133.SetCursorPos(slot5_a8497)

			if slot1_a29133.IsItemHovered() then
				slot1_a29133.TextColored(slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ButtonHovered], arg1)
				slot1_a29133.GetWindowDrawList():AddLine(slot1_a29133.ImVec2(slot4_a8521.x, slot4_a8521.y + slot3_a8524.y), slot1_a29133.ImVec2(slot4_a8521.x + slot3_a8524.x, slot4_a8521.y + slot3_a8524.y), slot1_a29133.GetColorU32(slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ButtonHovered]))
			else
				slot1_a29133.TextColored(slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Button], arg1)
			end

			return slot6_a8559
		end

		function slot1_a29133.VerticalSeparator()
			local slot0_a8565 = slot1_a29133.GetCursorScreenPos()

			slot1_a29133.GetWindowDrawList():AddLine(slot1_a29133.ImVec2(slot0_a8565.x, slot0_a8565.y), slot1_a29133.ImVec2(slot0_a8565.x, slot0_a8565.y + slot1_a29133.GetContentRegionMax().y), slot1_a29133.GetColorU32(slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Separator]))
		end

		function tagsall()
			if slot1_a29133.BeginPopupModal(u8("Теги"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoScrollbar + slot1_a29133.WindowFlags.AlwaysAutoResize) then
				slot1_a29133.BeginChild("##sdaadasdgasfadasdasdd", slot1_a29133.ImVec2(420, 530), true)
				slot1_a29133.CenterText(u8("При нажатии на тег он скопирует в буфер обмена [ctrl + v]"))
				slot1_a29133.NewLine()
				slot1_a29133.Columns(3, "tegi", true)
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Теги:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Описание:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Итог:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{mynick}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[1])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваш игровой ник:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(mynick))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{myid}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[2])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваш игровой ID:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(myID))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{myguns}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[3])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваше оружие в руках:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(slot24_a28082.get_name(weapon)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{phone}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[4])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваш телефон:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(u8(phone)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{job}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[5])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваша работа:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(u8(job)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{org}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[6])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваша организация"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(u8(org)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{myrang}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[7])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваша должность:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(u8(myrang)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{time}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[8])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Время с вашего ПК:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(string.format(os.date("%H:%M:%S")))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{day}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[9])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Cегодняшняя дата:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(string.format(os.date("%d.%m.%y")))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{myname}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[10])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваше имя:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(mynick:gsub("_.*", "")))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{mysurname}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[11])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваше фамилия:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(mynick:gsub(".*_", "")))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{score}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[12])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваш уровень:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(score))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{paydaymoney}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[13])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Кол-во полученных денег:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(money))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{city}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[14])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваш город:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(u8(playerCity)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{zone}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[15])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ваш район:"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(ZoneInGame))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{nearest}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[16])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ближайший игрок [nick]"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(nearestname))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{nearestid}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[17])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ближайший игрок [id]"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(nearestplayerID))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{killernick}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[18])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Ник кто нанес вам урон"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(u8(killernick)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{killerid}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[19])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("ID кто нанес вам урон"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(u8(killerid)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{killerweapon}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[20])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Оружие киллера"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(tostring(u8(killerweapon)))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.Selectable(u8("{screen}"))

				if slot1_a29133.IsItemClicked(0) then
					res = setClipboardText(tegifill[21])

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8("Сделать скриншот"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 155)
				slot1_a29133.CenterColumnText(u8(tostring("Недоступно")))
				slot1_a29133.NextColumn()
				slot1_a29133.EndChild()
				slot1_a29133.Columns(1)

				if slot1_a29133.Button(u8("Пример 1"), slot1_a29133.ImVec2(205, 0)) then
					slot1_a29133.CloseCurrentPopup()

					cmd_text.v = tostring(u8([[
/me {myname} посмотрел на часы с гравировкой 'Rolex'
/do На часах 'Rolex' {time}
/do {myname} вспомнил, что сегодня заработал {paydaymoney}
/do Тем временем уже {day}]]))
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Пример 2"), slot1_a29133.ImVec2(205, 0)) then
					slot1_a29133.CloseCurrentPopup()

					cmd_text.v = tostring(u8("/me {mynick} достал телефон и набрал номер {phone}\n/do На телефоне появилась информация: звонок самому себе невозможен!"))
				end

				if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(418, 0)) then
					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.EndPopup()
			end
		end

		function im_colored_text_with_shadow(arg0, arg1)
			local slot2_a9640 = slot1_a29133.GetCursorPos()

			slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(slot2_a9640.x + 1, slot2_a9640.y + 1))
			slot1_a29133.TextColored(slot1_a29133.ImVec4(0, 0, 0, 1), arg1)
			slot1_a29133.SetCursorPos(slot2_a9640)
			slot1_a29133.TextColored(arg0, arg1)
		end

		function slot1_a29133.Hint(arg0, arg1)
			slot1_a29133.TextDisabled(slot3_a9760.ICON_FA_INFO_CIRCLE)

			if slot1_a29133.IsItemHovered() then
				if go_hint == nil then
					go_hint = os.clock() + (arg1 and arg1 or 0)
				end

				local slot2_a9709 = (os.clock() - go_hint) * 5

				if go_hint <= os.clock() then
					slot1_a29133.PushStyleVar(slot1_a29133.StyleVar.Alpha, slot2_a9709 <= 1 and slot2_a9709 or 1)
					slot1_a29133.PushStyleColor(slot1_a29133.Col.PopupBg, slot1_a29133.ImVec4(0.07, 0.07, 0.09, 1))
					slot1_a29133.BeginTooltip()
					slot1_a29133.PushFont(slot44_a9761)
					slot1_a29133.TextColoredRGB("{15FF00FF}Подсказка")
					slot1_a29133.PushTextWrapPos(450)
					slot1_a29133.TextUnformatted(arg0)
					slot1_a29133.PopFont()

					if not slot1_a29133.IsItemVisible() and slot1_a29133.GetStyle().Alpha == 1 then
						go_hint = nil
					end

					slot1_a29133.PopTextWrapPos()
					slot1_a29133.EndTooltip()
					slot1_a29133.PopStyleColor()
					slot1_a29133.PopStyleVar()
				end
			end
		end

		function slot1_a29133.RenderScoreboardPlayers(arg0)
			local slot1_a10095 = sampGetPlayerNickname(arg0)
			local slot2_a10070 = sampGetPlayerScore(arg0)
			local slot3_a10078 = sampGetPlayerPing(arg0)
			_, myID = sampGetPlayerIdByCharHandle(PLAYER_PED)

			if slot1_a29133.BeginPopup("##playerinfo" .. arg0, false) then
				slot1_a29133.CenterText(u8("Игрок: ") .. slot1_a10095 .. "[" .. arg0 .. "]")
				slot1_a29133.NewLine()

				if slot1_a29133.Button(u8("Скопировать ник##") .. arg0, slot1_a29133.ImVec2(150, 20)) then
					setClipboardText(slot1_a10095)
					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Скопировать ID##") .. arg0, slot1_a29133.ImVec2(150, 20)) then
					setClipboardText(arg0)
					slot1_a29133.CloseCurrentPopup()
				end

				if slot1_a29133.Button(u8("Добавить в контакты##") .. arg0, slot1_a29133.ImVec2(150, 20)) then
					if slot34_a28422.config.typephone ~= 0 then
						if check_timep < os.time() then
							lua_thread.create((function ()
								sampSendChat("/number " .. math.floor(math.abs(arg0)))

								slot42_a10106 = 1

								wait(550)
								sampSendChat("/phone")

								addcontact = true

								wait(500)
								sampSendClickTextdraw(namephone[pphone[slot34_a28422.config.typephone + 1]]["Контакты"])

								check_timep = os.time() + 30
							end))
						else
							sendchat("Увы, но добавление доступно раз в 30 секунд. Повтори попытку через " .. check_timep - os.time() .. " с.")
						end
					else
						sendchat("Ошибка! Выберите телефон в настройках скрипта!")
					end

					customtab.v = false

					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Позвонить##") .. arg0, slot1_a29133.ImVec2(150, 20)) then
					if slot34_a28422.config.typephone ~= 0 then
						if check_timep < os.time() then
							sampSendChat("/number " .. math.floor(math.abs(arg0)))

							slot42_a10106 = 1

							callphone()

							check_timep = os.time() + 30
						else
							sendchat("Увы, но звонок доступен раз в 30 секунд. Повтори попытку через " .. check_timep - os.time() .. " с.")
						end

						customtab.v = false
					else
						sendchat("Ошибка! Выберите телефон в настройках скрипта!")
					end

					slot1_a29133.CloseCurrentPopup()
				end

				if slot1_a29133.Button(u8("Репорт##") .. arg0, slot1_a29133.ImVec2(308, 20)) then
					sampSendChat("/report")

					customtab.v = false

					slot1_a29133.CloseCurrentPopup()
				end

				if chekerplayers.v and slot1_a29133.Button(u8("Добавить в чекер##") .. arg0, slot1_a29133.ImVec2(308, 20)) then
					table.insert(slot34_a28422.playerlist, tostring(slot1_a10095))
					updateusercheck()
					slot1_a29133.CloseCurrentPopup()
				end

				slot1_a29133.EndPopup()
			end

			slot1_a29133.Separator()

			if slot1_a29133.Selectable("" .. arg0, false, slot1_a29133.SelectableFlags.SpanAllColumns) and arg0 ~= myID then
				slot1_a29133.OpenPopup("##playerinfo" .. arg0)
			end

			slot1_a29133.NextColumn()

			local slot4_a10035 = sampGetPlayerColor(arg0)

			slot1_a29133.TextColoredRGB("{" .. string.format("%06X", bit.band(slot4_a10035, 16777215)) .. "}" .. slot1_a10095)

			if arg0 ~= myID and slot1_a29133.IsItemHovered() then
				slot1_a29133.BeginTooltip()
				slot1_a29133.TextUnformatted(u8("Нажмите чтобы открыть меню"))
				slot1_a29133.EndTooltip()
			end

			slot1_a29133.NextColumn()
			slot1_a29133.Text("" .. slot2_a10070)
			slot1_a29133.NextColumn()
			slot1_a29133.Text("" .. slot3_a10078)
			slot1_a29133.NextColumn()

			local slot5_a10083 = nil
			strVips = table.concat(vipp, ", ")

			slot1_a29133.TextColoredRGB(tostring(strVips:find(slot1_a10095) and "{00FF00}Имеется" or "{FF0000}Не имеется"))
			slot1_a29133.NextColumn()
		end

		function slot1_a29133.OnDrawFrame()
			ScreenX, ScreenY = getScreenResolution()

			theme2()

			if customtab.v then
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.TitleBg] = slot1_a29133.ImVec4(0.09, 0.12, 0.14, 0.65)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.TitleBgCollapsed] = slot1_a29133.ImVec4(0, 0, 0, 0.51)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.TitleBgActive] = slot1_a29133.ImVec4(0.08, 0.1, 0.12, 1)
				slot1_a29133.GetStyle().WindowTitleAlign = slot1_a29133.ImVec2(0.5, 0.5)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Text] = slot1_a29133.ImVec4(1, 1, 1, 1)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)

				slot1_a29133.SetNextWindowSize(slot1_a29133.ImVec2(480, 450))
				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), 0, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.Begin(u8("" .. sampGetCurrentServerName()), nil, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize)
				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(150, ScreenY - 100), 0, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.Text(u8("Online: " .. sampGetPlayerCount(false)))
				slot1_a29133.SameLine(140)
				slot1_a29133.PushItemWidth(120)
				slot1_a29133.PushAllowKeyboardFocus(false)

				if slot1_a29133.Button(slot3_a9760.ICON_FA_SYNC_ALT) then
					if check_timev < os.time() then
						vipp = {}

						sampSendChat("/vipplayers")

						checkvip = true

						slot13_a25131.addNotification(string.format("Список ВИП игроков обновлен!", 228, os.date()), 5)

						check_timev = os.time() + 5
					else
						sendchat("Не так быстро, спортсмен! Повтори попытку через " .. check_timev - os.time() .. " с.")
					end
				end

				slot1_a29133.SameLine()

				local slot0_a10301 = slot1_a29133.Combo
				local slot1_a10302 = "##124547473"
				local slot2_a10303 = orgnumber
				local slot3_a10304 = {
					u8("Все"),
					u8("Полиция"),
					u8("Больница"),
					u8("Мэрия"),
					u8("Армия/ТСР"),
					u8("Автошкола"),
					u8("СМИ"),
					u8("Банк ЛС"),
					u8("Грув"),
					u8("Вагос"),
					u8("Баллас"),
					u8("Ацтек"),
					u8("Рифа"),
					u8("Ночные волки"),
					u8("Якудза"),
					u8("Рус. Мафия"),
					u8("ЛКН"),
					u8("В маске")
				}

				slot0_a10301(slot1_a10302, slot2_a10303, slot3_a10304, -1)
				slot1_a29133.SameLine()
				slot1_a29133.NewInputText("##SearchBar", tabSearch, 173, u8("Поиск по списку"), 2)
				slot1_a29133.PopAllowKeyboardFocus()
				slot1_a29133.PopItemWidth()
				slot1_a29133.Columns(5, "All tab", true)
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 35)
				slot1_a29133.Text("ID")
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 250)
				slot1_a29133.Text("Nick")
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 45)
				slot1_a29133.Text("Score")
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 45)
				slot1_a29133.Text("Ping")
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 75)
				slot1_a29133.SameLine(35)
				slot1_a29133.Text("VIP")
				slot1_a29133.NextColumn()

				local slot0_a10499 = {}
				res, id = sampGetPlayerIdByCharHandle(PLAYER_PED)

				if #tabSearch.v <= 0 and orgnumber.v == 0 then
					slot1_a29133.RenderScoreboardPlayers(id)
				end

				for slot4_a10456 = 0, sampGetMaxPlayerId(false) do
					if id ~= slot4_a10456 and sampIsPlayerConnected(slot4_a10456) then
						local slot5_a10458 = sampGetCharHandleBySampPlayerId(slot4_a10456)

						if #tabSearch.v > 0 then
							if tonumber(tabSearch.v) ~= nil then
								if not tostring(slot4_a10456):find(tabSearch.v) then
									if string.find(sampGetPlayerNickname(slot4_a10456):lower(), tabSearch.v:lower(), 1, true) then
										local slot6_a10496 = sampGetPlayerNickname(slot4_a10456)

										table.insert(slot0_a10499, slot4_a10456)
									end
								end
							end
						elseif orgnumber.v ~= 0 then
							if sampGetPlayerColor(slot4_a10456) == orgcolor[orgnumber.v] then
								local slot6_a10515 = sampGetPlayerNickname(slot4_a10456)

								table.insert(slot0_a10499, slot4_a10456)
							end
						else
							local slot6_a10524 = sampGetPlayerNickname(slot4_a10456)

							table.insert(slot0_a10499, slot4_a10456)
						end
					end
				end

				if #slot0_a10499 > 0 then
					local slot1_a10538 = slot1_a29133.ImGuiListClipper(#slot0_a10499)

					while slot1_a10538:Step() do
						for slot5_a10551 = slot1_a10538.DisplayStart + 1, slot1_a10538.DisplayEnd do
							slot1_a29133.RenderScoreboardPlayers(slot0_a10499[slot5_a10551])
						end
					end
				end

				slot1_a29133.Columns(1)
				slot1_a29133.Separator()
				slot1_a29133.End()
			end

			if onlinefull.v then
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Text] = slot1_a29133.ImVec4(1, 1, 1, 1)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)

				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.SetNextWindowSize(slot1_a29133.ImVec2(350, 335), slot1_a29133.Cond.FirstUseEver)
				slot1_a29133.Begin(u8("##[Universal Helper] Онлайн"), firstloadwindow, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoBringToFrontOnFocus + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoTitleBar)
				slot1_a29133.CenterText(u8("[Universal Helper] Онлайн"))
				slot1_a29133.Separator()
				slot1_a29133.NewLine()
				slot1_a29133.CenterText(u8("Онлайн за сегодня " .. get_timer(slot34_a28422.obnylenie.online)))
				slot1_a29133.CenterText(u8("Афк за сегодня " .. get_timer(slot34_a28422.obnylenie.onlineafk + afktimer)))
				slot1_a29133.NewLine()
				slot1_a29133.Separator()
				slot1_a29133.CenterText(u8("Статистика за неделю"))
				slot1_a29133.Columns(3)
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 100)
				slot1_a29133.CenterColumnText(u8("Дата"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 150)
				slot1_a29133.CenterColumnText(u8("Онлайн"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 150)
				slot1_a29133.CenterColumnText(u8("АФК"))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()

				timedays = os.time()

				for slot3_a10723 = 1, 6 do
					timedays = timedays - 86400
					dates = os.date("%d-%m-%y", timedays)

					if slot34_a28422.onlinfo[dates] and tonumber(slot34_a28422.onlinfo[dates]) and tonumber(slot34_a28422.onlinfo[dates]) > 0 then
						if not slot34_a28422.onlinfoafk[dates] or tonumber(slot34_a28422.onlinfoafk[dates]) <= 0 then
							slot34_a28422.onlinfoafk[dates] = 0
						end

						slot1_a29133.SetColumnWidth(-1, 100)
						slot1_a29133.CenterColumnText(tostring(dates))
						slot1_a29133.NextColumn()
						slot1_a29133.SetColumnWidth(-1, 150)
						slot1_a29133.CenterColumnText(tostring(get_timer(slot34_a28422.onlinfo[dates])))
						slot1_a29133.NextColumn()
						slot1_a29133.SetColumnWidth(-1, 150)
						slot1_a29133.CenterColumnText(tostring(get_timer(slot34_a28422.onlinfoafk[dates])))
						slot1_a29133.NextColumn()
						slot1_a29133.Separator()
					else
						slot1_a29133.SetColumnWidth(-1, 100)
						slot1_a29133.CenterColumnText(tostring(dates))
						slot1_a29133.NextColumn()
						slot1_a29133.SetColumnWidth(-1, 150)
						slot1_a29133.CenterColumnText(tostring("00:00:00"))
						slot1_a29133.NextColumn()
						slot1_a29133.SetColumnWidth(-1, 150)
						slot1_a29133.CenterColumnText(tostring("00:00:00"))
						slot1_a29133.NextColumn()
						slot1_a29133.Separator()
					end
				end

				slot1_a29133.Columns(1)

				if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(335, 45)) then
					onlinefull.v = not onlinefull.v
				end

				slot1_a29133.End()
			end

			if firstloadwindow.v then
				if loadwindow == 0 then
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Text] = slot1_a29133.ImVec4(1, 1, 1, 1)
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.26, 0.4, 0.98, 0.75)
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Button] = slot1_a29133.ImVec4(0.26, 0.47, 0.98, 1)
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)

					slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
					slot1_a29133.SetNextWindowSize(slot1_a29133.ImVec2(400, 390), slot1_a29133.Cond.FirstUseEver)
					slot1_a29133.Begin(u8("##[Universal Helper] Первый запуск"), firstloadwindow, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoBringToFrontOnFocus + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoTitleBar)
					slot1_a29133.BeginChild("##1gdsgsds2aaaaas3", slot1_a29133.ImVec2(380, 25), true, slot1_a29133.WindowFlags.NoScrollbar)
					slot1_a29133.CenterText(u8("[Universal Helper] Первый запуск"))
					slot1_a29133.EndChild()

					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)

					slot1_a29133.BeginChild("##1gdsgsds2agaaaas3", slot1_a29133.ImVec2(380, 345), true, slot1_a29133.WindowFlags.NoScrollbar)
					slot1_a29133.SameLine(90)
					slot1_a29133.Image(logotip_png, slot1_a29133.ImVec2(210, 190))
					slot1_a29133.CenterText(u8("Привет! Ты впервые запустил Universal Helper"))
					slot1_a29133.CenterText(u8("Скрипт успешно установлен и запушен"))
					slot1_a29133.CenterText(u8("Активация скрипта -  /helper"))
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(90)

					if checkstatus == "true" then
						slot1_a29133.TextColoredRGB("Статус авторизации: {ADFF2F}авторизирован")
					elseif checkstatus == "new" then
						slot1_a29133.TextColoredRGB("Статус авторизации: {ADFF2F}зарегистрирован")
					else
						slot1_a29133.TextColoredRGB("Статус авторизации: {FF0000}не определен")
					end

					slot1_a29133.NewLine()
					slot1_a29133.Separator()

					if slot1_a29133.Button(u8("Далее"), slot1_a29133.ImVec2(380, 45)) then
						loadwindow = 1
					end

					slot1_a29133.EndChild()
				elseif loadwindow == 1 then
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Text] = slot1_a29133.ImVec4(1, 1, 1, 1)
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.26, 0.4, 0.98, 0.75)
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Button] = slot1_a29133.ImVec4(0.26, 0.47, 0.98, 1)
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)

					slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
					slot1_a29133.Begin(u8("##[Universal Helper] Первый запуск2"), firstloadwindow, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoBringToFrontOnFocus + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoTitleBar)
					slot1_a29133.BeginChild("##1gdsgsd1s2aaaaas3", slot1_a29133.ImVec2(385, 25), true, slot1_a29133.WindowFlags.NoScrollbar)
					slot1_a29133.CenterText(u8("[Universal Helper] Первый запуск"))
					slot1_a29133.EndChild()

					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)

					slot1_a29133.BeginChild("##1gdsgsds2agaaaags3", slot1_a29133.ImVec2(385, 205), true, slot1_a29133.WindowFlags.NoScrollbar)
					slot1_a29133.CenterText(u8("У скрипта есть беседы пользователей в VK/Discord"))
					slot1_a29133.Text(u8("В которые вы можете писать свои предложения по улучшению"))
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(150)
					slot1_a29133.Text(u8("скрипта/баги"))
					slot1_a29133.NewLine()
					slot1_a29133.Separator()

					if slot1_a29133.Button(u8("Скопировать ссылку VK"), slot1_a29133.ImVec2(185, 30)) and setClipboardText("https://vk.me/join/AJQ1dxcP2Bfs00C6jRDiP5J4") then
						sampAddChatMessage("[Universal Helper] {FFFFFF}Ссылка на беседу ВК скопирован в буфер обмена.", 6591981)
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(u8("Скопировать ссылку Discord"), slot1_a29133.ImVec2(185, 30)) and setClipboardText("https://discord.gg/BpkEFQVZxa") then
						sampAddChatMessage("[Universal Helper] {FFFFFF}Ссылка на группу Discord скопирован в буфер обмена.", 6591981)
					end

					if slot1_a29133.Button(u8("Открыть в браузере VK"), slot1_a29133.ImVec2(185, 30)) then
						os.execute("start https://vk.me/join/AJQ1dxcP2Bfs00C6jRDiP5J4")
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(u8("Открыть в браузере Discord"), slot1_a29133.ImVec2(185, 30)) then
						os.execute("start https://discord.gg/BpkEFQVZxa")
					end

					if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(390, 45)) then
						firstloadwindow.v = false
						slot34_a28422.config.firstload = false

						if slot17_a28610.save(slot34_a28422, "helper.ini") then
							firstloadwindow.v = false
						end
					end

					slot1_a29133.EndChild()
				end

				slot1_a29133.End()
			end

			if newmenu.v then
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Text] = slot1_a29133.ImVec4(1, 1, 1, 1)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.26, 0.4, 0.98, 0.75)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Button] = slot1_a29133.ImVec4(0.181, 0.36, 0.864, 0.8)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Header] = slot1_a29133.ImVec4(0.26, 0.47, 0.98, 1)

				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.SetNextWindowSize(slot1_a29133.ImVec2(850, 495), slot1_a29133.Cond.FirstUseEver)
				slot1_a29133.Begin(u8("[Universal Helper] Меню"), newmenu, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoTitleBar)
				slot1_a29133.Columns(2, "213gds", true)
				slot1_a29133.SetColumnWidth(-1, 232)
				slot1_a29133.BeginChild("##1gdsgs23", slot1_a29133.ImVec2(225, 478), true, slot1_a29133.WindowFlags.NoScrollbar)
				slot1_a29133.Image(logotip_png, slot1_a29133.ImVec2(210, 190))

				if slot1_a29133.Button(slot3_a9760.ICON_FA_FILE_CODE .. u8(" Функции"), slot1_a29133.ImVec2(210, 42)) then
					menu = 1
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_CLIPBOARD_LIST .. u8(" Биндер"), slot1_a29133.ImVec2(210, 42)) then
					menu = 2
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_CHART_BAR .. u8(" Оверлей"), slot1_a29133.ImVec2(210, 42)) then
					menu = 3
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_ELLIPSIS_V .. u8(" Прочие"), slot1_a29133.ImVec2(210, 42)) then
					menu = 6
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_INFO .. u8(" Информация"), slot1_a29133.ImVec2(210, 42)) then
					menu = 4
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_COGS .. u8(" Настройки"), slot1_a29133.ImVec2(210, 42)) then
					menu = 5
				end

				slot1_a29133.EndChild()
				slot1_a29133.SetColumnWidth(-1, 232)
				slot1_a29133.NextColumn()
				slot1_a29133.BeginChild("##1gdsggs21233", slot1_a29133.ImVec2(600, 35), true, slot1_a29133.WindowFlags.NoScrollbar)

				if menu == 0 then
					slot1_a29133.PushFont(slot44_a9761)
					slot1_a29133.CenterText(u8("Главное меню"))
					slot1_a29133.PopFont()
				elseif menu == 1 then
					slot1_a29133.PushFont(slot44_a9761)
					slot1_a29133.CenterText(u8("Функции скрипта"))
					slot1_a29133.PopFont()
				elseif menu == 2 then
					slot1_a29133.PushFont(slot44_a9761)
					slot1_a29133.CenterText(u8("Биндер"))
					slot1_a29133.PopFont()
				elseif menu == 3 then
					slot1_a29133.PushFont(slot44_a9761)
					slot1_a29133.CenterText(u8("Настройка оверлея"))
					slot1_a29133.PopFont()
				elseif menu == 4 then
					slot1_a29133.PushFont(slot44_a9761)
					slot1_a29133.CenterText(u8("Информация"))
					slot1_a29133.PopFont()
				elseif menu == 5 then
					slot1_a29133.PushFont(slot44_a9761)
					slot1_a29133.CenterText(u8("Настройки скрипта"))
					slot1_a29133.PopFont()
				elseif menu == 6 then
					slot1_a29133.PushFont(slot44_a9761)
					slot1_a29133.CenterText(u8("Прочие"))
					slot1_a29133.PopFont()
				end

				slot1_a29133.EndChild()

				if menu == 0 then
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 1)

					slot1_a29133.BeginChild("##123ggbbvcdg", slot1_a29133.ImVec2(600, 437), true)
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.TextColoredRGB([[
{466ee3}                    Universal Helper {FFFFFF}— это скрипт, работающий на базе библиотеки 'MoonLoader'.
           Написанный на платформе Lua, который существенно облегчает игру на {FF0000}Arizona RP{FFFFFF}.
     Скрипт универсальный и может подойти как обычному игроку так и игроку из организации.
Скрипт выполнен в простом и минималистичном стиле для удобной и простой игры со скриптом.
]])
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(180)
					slot1_a29133.Text(slot3_a9760.ICON_FA_CODE .. u8(" Актуальная версия скрипта:"))
					slot1_a29133.SameLine()
					slot1_a29133.Text(tostring(updateversion) .. " V")
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(210)
					slot1_a29133.Text(slot3_a9760.ICON_FA_USER .. u8(" Всего пользователей:"))
					slot1_a29133.SameLine()
					slot1_a29133.Text(tostring(userkolvo:gsub("|.*", "")))
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(165)
					slot1_a29133.Text(slot3_a9760.ICON_FA_USER .. u8(" Пользователей на Arizona ") .. gameServer .. ":")
					slot1_a29133.SameLine()
					slot1_a29133.Text(tostring(userkolvo:gsub(".*|", "")))
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(450)

					if checkstatus == "true" then
						slot1_a29133.TextColoredRGB("Статус: {ADFF2F}авторизирован")
					elseif checkstatus == "new" then
						slot1_a29133.TextColoredRGB("Статус: {ADFF2F}зарегистрирован")
					else
						slot1_a29133.TextColoredRGB("Статус: {FF0000}не определен")
					end

					slot1_a29133.EndChild()
				elseif menu == 1 then
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 1)

					slot1_a29133.BeginChild("##123ggbg", slot1_a29133.ImVec2(600, 402), true)
					slot1_a29133.Hint(u8("Автоматически авторизируется в аккаунт при входе на сервер"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("AutoPass"), autopp) then
						if autopp.v then
							slot34_a28422.authorization.autologin = true

							slot17_a28610.save(slot34_a28422, "helper.ini")
						else
							slot34_a28422.authorization.autologin = false

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end
					end

					slot1_a29133.PushItemWidth(100)

					if autopp.v then
						slot1_a29133.SameLine()

						if checkpass then
							if slot1_a29133.InputText(u8("##Текущий пароль"), text_buffer) then
								slot34_a28422.authorization.loginakk = text_buffer.v

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						elseif slot1_a29133.InputText(u8("##Текущий пароль"), text_buffer, slot1_a29133.InputTextFlags.Password) then
							slot34_a28422.authorization.loginakk = text_buffer.v

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.SameLine()

						if checkpass then
							if slot1_a29133.Button(slot3_a9760.ICON_FA_EYE .. u8("##Показать пароль  ")) then
								checkpass = not checkpass
							end
						elseif slot1_a29133.Button(slot3_a9760.ICON_FA_EYE_SLASH .. u8("##Показать пароль  ")) then
							checkpass = not checkpass
						end
					end

					slot1_a29133.Hint(u8("Автоматически авторизируется в меню банка"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("AutoPin  "), autopi) then
						slot34_a28422.authorization.autop = autopi.v
					end

					if autopi.v then
						slot1_a29133.SameLine()

						if checkpin then
							if slot1_a29133.InputText(u8("##Текущий Пин-Код"), text_pass) then
								slot34_a28422.authorization.autopin = text_pass.v

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						elseif slot1_a29133.InputText(u8("##Текущий Пин-Код"), text_pass, slot1_a29133.InputTextFlags.Password) then
							slot34_a28422.authorization.autopin = text_pass.v

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.SameLine()

						if checkpin then
							if slot1_a29133.Button(slot3_a9760.ICON_FA_EYE .. u8("##Показать пин-код  ")) then
								checkpin = not checkpin
							end
						elseif slot1_a29133.Button(slot3_a9760.ICON_FA_EYE_SLASH .. u8("##Показать пин-код  ")) then
							checkpin = not checkpin
						end
					end

					slot1_a29133.PopItemWidth()
					slot1_a29133.Hint(u8([[
Функция позволяет убирать ненужные строчки из чата
 * Реклама от сервера
 * Эфиры СМИ
 * Информация о состоянии авто
 * Информация о выезде матовозов
 Изменить фильтр можно нажав на шестеренку]]))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("ChatCleaner"), dellxuy) then
						slot34_a28422.functions.dell = dellxuy.v

						if dellxuy.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nChatCleaner включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nChatCleaner выключен!", 228, os.date()), 5)
						end
					end

					if dellxuy.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Button(slot3_a9760.ICON_FA_COGS .. u8("##НастройкиМусора")) then
							slot1_a29133.OpenPopup(u8("##Настройкачекера"))
						end

						if slot1_a29133.BeginPopupModal(u8("##Настройкачекера"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoTitleBar) then
							slot1_a29133.BeginChild("##sdaadasdgfasf123123asfadgasgassasdasdd11111", slot1_a29133.ImVec2(720, 457), true)

							if not logstatus then
								slot1_a29133.Columns(3, "settingschat", true)
								slot1_a29133.SetColumnWidth(-1, 595)
								slot1_a29133.CenterColumnText(u8("Текст"))
								slot1_a29133.NextColumn()
								slot1_a29133.SetColumnWidth(-1, 47)
								slot1_a29133.CenterColumnText(u8("On/Off"))
								slot1_a29133.NextColumn()
								slot1_a29133.SetColumnWidth(-1, 63)
								slot1_a29133.CenterColumnText(u8("Удалить"))
								slot1_a29133.NextColumn()
								slot1_a29133.Separator()

								for slot3_a12227, slot4_a12200 in pairs(slot31_a28609) do
									slot1_a29133.SetColumnWidth(-1, 595)
									slot1_a29133.Text(u8(slot4_a12200.text))
									slot1_a29133.NextColumn()
									slot1_a29133.SetColumnWidth(-1, 47)

									if slot1_a29133.ToggleButton("###123" .. slot3_a12227, _G["CBC" .. slot3_a12227]) then
										slot4_a12200.status = not slot4_a12200.status
									end

									slot1_a29133.NextColumn()
									slot1_a29133.SetColumnWidth(-1, 63)

									if slot1_a29133.Button(slot3_a9760.ICON_FA_TRASH .. "##" .. slot3_a12227, slot1_a29133.ImVec2(40, 20)) then
										table.remove(slot31_a28609, slot3_a12227)
									end

									slot1_a29133.NextColumn()
									slot1_a29133.Separator()
								end

								slot1_a29133.Columns(1)
							else
								slot1_a29133.Columns(2, "settingschat2", true)
								slot1_a29133.SetColumnWidth(-1, 47)
								slot1_a29133.CenterColumnText(u8("Время"))
								slot1_a29133.NextColumn()
								slot1_a29133.SetColumnWidth(-1, 595)
								slot1_a29133.CenterColumnText(u8("Сообщение"))
								slot1_a29133.NextColumn()
								slot1_a29133.Separator()

								for slot3_a12268, slot4_a12277 in pairs(logmessage) do
									slot1_a29133.SetColumnWidth(-1, 47)
									slot1_a29133.Text(u8(slot4_a12277[1]))
									slot1_a29133.NextColumn()
									slot1_a29133.SetColumnWidth(-1, 595)
									slot1_a29133.Text(u8(slot4_a12277[2]))
									slot1_a29133.NextColumn()
									slot1_a29133.Separator()
								end

								slot1_a29133.Columns(1)
							end

							slot1_a29133.EndChild()
							slot1_a29133.NewInputText("##newmessage", addbklist, 363, u8("Введите текст который вы хотите удалять из чата"), 2)
							slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(377, 470))

							if slot1_a29133.Button(slot3_a9760.ICON_FA_PLUS .. "##213312пыфвп", slot1_a29133.ImVec2(30, 20)) and addbklist.v ~= "" and addbklist.v ~= " " and addbklist.v ~= nil then
								local slot0_a12332 = slot31_a28609
								local slot1_a12335 = #slot31_a28609 + 1
								local slot2_a12336 = {
									status = false,
									text = u8:decode(addbklist.v)
								}
								slot0_a12332[slot1_a12335] = slot2_a12336

								if doesFileExist(slot30_a28608) then
									os.remove(slot30_a28608)
								end

								for slot3_a12362, slot4_a12369 in pairs(slot31_a28609) do
									_G["CBC" .. slot3_a12362] = slot1_a29133.ImBool(slot4_a12369.status)
								end

								local slot0_a12378 = io.open(slot30_a28608, "w")

								if slot0_a12378 then
									slot0_a12378:write(encodeJson(slot31_a28609))
									slot0_a12378:close()
								end

								addbklist.v = ""
							end

							if slot1_a29133.Button(u8(" Лог удаленных сообщений"), slot1_a29133.ImVec2(400, 22)) then
								logstatus = not logstatus
							end

							if slot1_a29133.Button(u8(" Закрыть"), slot1_a29133.ImVec2(400, 22)) then
								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(410, 470))
							slot1_a29133.Text(u8("Вы можете использовать регулярные выражения"))
							slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(410, 490))
							slot1_a29133.Text(u8("Если в тексте есть цвет"))
							slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(410, 510))
							slot1_a29133.Text(u8("Рекомендуется скопировать строчку из чатлога"))
							slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(410, 530))
							slot1_a29133.TextDisabled(u8("Для более точного определения строчки"))
							slot1_a29133.EndPopup()
						end
					end

					slot1_a29133.Hint(u8("Когда у вашего персонажа начинается ломка - скрипт автоматически используется указанное количество наркотинов"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("АнтиЛомка"), autonarko) then
						slot34_a28422.functions.autonarko = autonarko.v

						if autonarko.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nАвтоСбив нарко - включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nАвтоСбив нарко - выключен", 228, os.date()), 5)
						end
					end

					slot1_a29133.SameLine()
					slot1_a29133.PushItemWidth(50)

					if slot1_a29133.Combo(u8("##Drugs"), ddrugs, drugskolvo, -1) then
						slot34_a28422.config.narko = ddrugs.v

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.Hint(u8("Когда ваш персонаж умрет - скрипт автоматически напишет ваше сообщение в чат"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("DeadText"), deed) then
						slot34_a28422.functions.deadt = deed.v

						if deed.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nТекст при смерти - включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nТекст при смерти - выключен", 228, os.date()), 5)
						end
					end

					slot1_a29133.SameLine()
					slot1_a29133.PushItemWidth(470)

					if slot1_a29133.InputText(u8("##DT"), tdead) then
						local slot0_a12600 = slot34_a28422.config
						local slot1_a12601 = "textdead"
						slot0_a12600[slot1_a12601] = u8:decode(tdead.v)

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.Hint(u8("Отыгровка часов"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("Отыгровка часов"), casi) then
						slot34_a28422.functions.casi = casi.v

						if casi.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nОтыгровка часов включена!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nОтыгровка часов выключена!", 228, os.date()), 5)
						end
					end

					slot1_a29133.SameLine()

					if slot1_a29133.InputText(u8("##Часы"), casit) then
						local slot0_a12674 = slot34_a28422.config
						local slot1_a12675 = "casitext"
						slot0_a12674[slot1_a12675] = u8:decode(casit.v)

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.Hint(u8("При покупки Titan или Premium VIP скрипт будет писать сообщение в ViP чат"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("Текст при покупки Titan | Premium"), kypill) then
						slot34_a28422.functions.kypill = kypill.v

						if kypill.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nТекст в ВР включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nТекст в ВР выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.SameLine()

					if slot1_a29133.InputText(u8("##Купил"), kypil) then
						local slot0_a12748 = slot34_a28422.config
						local slot1_a12749 = "kypiltext"
						slot0_a12748[slot1_a12749] = u8:decode(kypil.v)

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.PopItemWidth()
					slot1_a29133.Hint(u8("Данная функция позволяет добавить вам акцент в ваши сообщения в чат"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("Акцент "), accenton) then
						slot34_a28422.functions.accenton = accenton.v

						if accenton.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nАкцент включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nАкцент выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.SameLine()
					slot1_a29133.PushItemWidth(200)

					if slot1_a29133.InputText(u8("##Акцент"), accenttext) then
						local slot0_a12827 = slot34_a28422.config
						local slot1_a12828 = "accenttext"
						slot0_a12827[slot1_a12828] = u8:decode(accenttext.v)

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.Hint(u8("Автоматически использует армор, аптечку, нарко когда вы на грани смерти "))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("SafeMod"), safe) then
						slot34_a28422.functions.safemod = safe.v

						if safe.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nSafeMod включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nSafeMod выключен!", 228, os.date()), 5)
						end
					end

					if safemodsbiv.v and safe.v then
						slot1_a29133.SameLine()

						if slot1_a29133.InputText(u8("##текст при сбиве"), sbivt) then
							local slot0_a12905 = slot34_a28422.config
							local slot1_a12906 = "sbittext"
							slot0_a12905[slot1_a12906] = u8:decode(sbivt.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end
					end

					slot1_a29133.PopItemWidth()

					if safe.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("Нарко"), usenarko) then
							if usenarko.v then
								slot34_a28422.functions.usenarko = true
								slot34_a28422.functions.useapteka = false
								useapteka.v = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.functions.usenarko = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("Аптечка"), useapteka) then
							if useapteka.v then
								slot34_a28422.functions.useapteka = true
								slot34_a28422.functions.usenarko = false
								usenarko.v = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.functions.useapteka = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("Сбив"), safemodsbiv) then
							if safemodsbiv.v then
								slot34_a28422.functions.safemodsbiv = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.functions.safemodsbiv = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end
					end

					slot1_a29133.Hint(u8("Когда ваш персонаж начнет голодать, скрипт автоматически покушает, что вы ему укажите"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("АutoEda"), edaauto) then
						slot34_a28422.functions.autoeda = edaauto.v

						if edaauto.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nAutoEda включена!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nAutoEda выключена!", 228, os.date()), 5)
						end
					end

					slot1_a29133.SameLine()
					slot1_a29133.PushItemWidth(200)

					if slot1_a29133.Combo(u8("##Eda"), sseda, seda, -1) then
						slot34_a28422.config.sseda = sseda.v

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.Hint(u8([[
Данная функция позволяет забирать самые ценные вещи из дропа
 * Обвесы
 * Рваные части одежды
Доступно только для преступного синдиката]]))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("DropStiler"), drpstiler) then
						slot34_a28422.functions.vorr = drpstiler.v

						if drpstiler.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nDropStiler включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nDropStiler выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Каждый PayDay скрипт будет производить расчет полученных денег за текущий день и выводить это в итоговый чек\n * Учитывается ваша зарплата и депозит"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("PayDayMaster"), pay) then
						slot34_a28422.functions.payd = pay.v

						if pay.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nPayDayMaster включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nPayDayMaster выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Функция позволяет убрать занудливую табличку о наличии зеленой зоны"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("SkipZZ"), zz) then
						slot34_a28422.functions.zz = zz.v

						if zz.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nSkipZZ включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nSkioZZ выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Функция отключает радар в любом из интерьеров сервера"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("RadarOff"), radar) then
						slot34_a28422.functions.radar = radar.v

						if radar.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nRadarOff включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nRadarOff выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Функция позволяет увеличить угол обзора вашей камеры "))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("FishEye"), FishEyeEffect) then
						slot34_a28422.functions.FishEyeEffect = FishEyeEffect.v

						if FishEyeEffect.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nFishEyeEffect включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nFishEyeEffect выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("При ответе Администратора на ваш репорт - окно оценки ответа будет отключено"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("SkipReport"), skiprep) then
						slot34_a28422.functions.skiprep = skiprep.v

						if skiprep.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nSkipReport включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nSkipReport выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Напоминает о начале дропа\nДоступно только для преступного синдиката"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("DropInfo"), dropinfo) then
						slot34_a28422.functions.dropinfo = dropinfo.v

						if dropinfo.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nDropInfo включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nDropInfo выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Автоматически достает ключи когда вы выходите из авто и их вставляет когда вы садитесь а авто\nРаботает только на личный транспорт"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("AutoKey"), autokey) then
						slot34_a28422.functions.autokey = autokey.v

						if autokey.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n AutoKey включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n AutoKey выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Функция всегда будет держать статус вашего ТТ авто в режиме Sport"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("TwinTurboControl"), turbocontrol) then
						slot34_a28422.functions.turbocontrol = turbocontrol.v

						if turbocontrol.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n TwinTurboControl включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n TwinTurboControl включен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Функция не дает вашему персонажу упасть с велосипеда или мотоцикла\nФункция выключается в воде"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("AntiBike"), antibike) then
						slot34_a28422.functions.antibikeon = antibike.v

						if antibike.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n AntiBike включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n AntiBike выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Функция добавляет цифровой индикатор хп и армора на ваш худ"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("HP HUD"), hphudon) then
						slot34_a28422.functions.hphudon = hphudon.v

						if hphudon.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n HP HUD включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n HP HUD выключен!", 228, os.date()), 5)
						end
					end

					if hphudon.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("Цифры по центру"), hpcent) then
							slot34_a28422.functions.hpcent = hpcent.v

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end
					end

					slot1_a29133.Hint(u8("Функция позволяет изменять время и погоду"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("WeatherChanger"), weatherсhanger) then
						slot34_a28422.functions.weatherсhanger = weatherсhanger.v

						if weatherсhanger.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n WeatherChanger включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n WeatherChanger выключен!", 228, os.date()), 5)
						end
					end

					if weatherсhanger.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Button(slot3_a9760.ICON_FA_COGS .. u8("##Настройки")) then
							settingsweather.v = not settingsweather.v
							newmenu.v = false
						end
					end

					slot1_a29133.Hint(u8([[
Функция позволяет изменять цвет сообщений в чате
 * Цвет чата таксистов
 * Цвет чата дальнобойщиков
 * Цвет обьявлений
 * Цвет чата семьи 
 * Цвет тега 'VIP' в вип чате 
 * Цвет тега 'PREMIUM' в вип чате 
 * Цвет чата фракции [ГОС] 
 * Цвет чата фракции [нелегалов] 
 * Цвет чата депортамента]]))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("CustomColor      "), customcolor) then
						slot34_a28422.color.customcolor = customcolor.v

						if customcolor.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n CustomColor включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n CustomColor выключен!", 228, os.date()), 5)
						end
					end

					if customcolor.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Button(slot3_a9760.ICON_FA_COGS .. u8("##НастройкиЦвет")) then
							slot1_a29133.OpenPopup(u8("##Настройкацветачата"))
						end
					end

					if slot1_a29133.BeginPopupModal(u8("##Настройкацветачата"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar) then
						slot1_a29133.BeginChild("##sdaadasdgfasf123123asfadasdasdd11111", slot1_a29133.ImVec2(215, 257), true)
						slot1_a29133.Text(u8("Цвет чата такси"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##ТаксиЧат", colortaksi, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrtaksi = slot1_a29133.ImColor.FromFloat4(colortaksi.v[1], colortaksi.v[2], colortaksi.v[3], colortaksi.v[4]):GetU32()
							slot34_a28422.color.taksic = clrtaksi

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()
						slot1_a29133.Text(u8("Цвет чата дальнобойщиков"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##Дальнобой", colordalna, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrdalna = slot1_a29133.ImColor.FromFloat4(colordalna.v[1], colordalna.v[2], colordalna.v[3], colordalna.v[4]):GetU32()
							slot34_a28422.color.dalna = clrdalna

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()
						slot1_a29133.Text(u8("Цвет обьявлений"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##Обьявы", colornews, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrnews = slot1_a29133.ImColor.FromFloat4(colornews.v[1], colornews.v[2], colornews.v[3], colornews.v[4]):GetU32()
							slot34_a28422.color.news = clrnews

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()
						slot1_a29133.Text(u8("Цвет фам чата"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##чатфам", colorfamchat, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrfamchat = slot1_a29133.ImColor.FromFloat4(colorfamchat.v[1], colorfamchat.v[2], colorfamchat.v[3], colorfamchat.v[4]):GetU32()
							slot34_a28422.color.famchat = clrfamchat

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()
						slot1_a29133.Text(u8("Цвет тэга [VIP]"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##випчат", colorvip, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrvip = slot1_a29133.ImColor.FromFloat4(colorvip.v[1], colorvip.v[2], colorvip.v[3], colorvip.v[4]):GetU32()
							slot34_a28422.color.vip = clrvip

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()
						slot1_a29133.Text(u8("Цвет тэга [PREMIUM]"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##премчат", colorprem, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrprem = slot1_a29133.ImColor.FromFloat4(colorprem.v[1], colorprem.v[2], colorprem.v[3], colorprem.v[4]):GetU32()
							slot34_a28422.color.prem = clrprem

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()
						slot1_a29133.Text(u8("Цвет [R] чата"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##рация чат", colorrchat, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrrchat = slot1_a29133.ImColor.FromFloat4(colorrchat.v[1], colorrchat.v[2], colorrchat.v[3], colorrchat.v[4]):GetU32()
							slot34_a28422.color.rchat = clrrchat

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()
						slot1_a29133.Text(u8("Цвет [F] чата"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##f чат", colorfchat, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrfchat = slot1_a29133.ImColor.FromFloat4(colorfchat.v[1], colorfchat.v[2], colorfchat.v[3], colorfchat.v[4]):GetU32()
							slot34_a28422.color.fchat = clrfchat

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()
						slot1_a29133.Text(u8("Цвет [D] чата"))
						slot1_a29133.SameLine(180)

						if slot1_a29133.ColorEdit4("##деп чат", colordchat, slot1_a29133.ColorEditFlags.NoInputs + slot1_a29133.ColorEditFlags.NoLabel + slot1_a29133.ColorEditFlags.NoAlpha) then
							clrdchat = slot1_a29133.ImColor.FromFloat4(colordchat.v[1], colordchat.v[2], colordchat.v[3], colordchat.v[4]):GetU32()
							slot34_a28422.color.dchat = clrdchat

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.EndChild()

						if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(210, 25)) then
							slot1_a29133.CloseCurrentPopup()
						end

						slot1_a29133.EndPopup()
					end

					slot1_a29133.Hint(u8("Функция позволяет автоматически заправлять ваш транспорт на АЗС"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("AutoFill"), autofill) then
						slot34_a28422.functions.autofill = autofill.v

						if autofill.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n AutoFill включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n AutoFill выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Автоматическая отправка сообщения в /vr если антиспам система не дала его отправить"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("RepitVR"), repitvr) then
						slot34_a28422.functions.repitvr = repitvr.v

						if repitvr.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RepitVR включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RepitVR выключен!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8("Умный бар - ведет подсчет выпавших орлов и решек в баре за последние 3 мин чтобы повысить процент вашей победы"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("Умный бар"), smartbar) then
						slot34_a28422.functions.smartbar = smartbar.v

						if smartbar.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n Умный бар включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n Умный бар выключен!", 228, os.date()), 5)
						end
					end

					if smartbar.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("Подкидывать ставку"), smartbarauto) then
							slot34_a28422.config.smartbarauto = smartbarauto.v

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						if smartbarauto.v then
							slot1_a29133.SameLine()
							slot1_a29133.PushItemWidth(100)

							if slot1_a29133.Combo(u8("##MoneyBar"), moneybar, barmoney, -1) then
								slot34_a28422.config.moneybar = moneybar.v

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end
					end

					slot1_a29133.Hint(u8("Anti-DM если вас начинают дмить вы сможете по нажатию 1 кнопки написать репорт на человека со всей инфой"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("Anti DM"), antidm) then
						slot34_a28422.functions.antidm = antidm.v

						if antidm.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n Anti-DM включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n Anti-DM выключен!", 228, os.date()), 5)
						end
					end

					if antidm.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Button(slot3_a9760.ICON_FA_COGS .. u8("##gdsoghisodhgoi1")) then
							slot1_a29133.OpenPopup(u8("##РепортНастройка"))
						end
					end

					if slot1_a29133.BeginPopupModal(u8("##РепортНастройка"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar) then
						slot1_a29133.BeginChild("##sdaadasdgfasf123123asfadasdasdd", slot1_a29133.ImVec2(630, 220), true)
						slot1_a29133.CenterText(u8("Доступные теги"))
						slot1_a29133.CenterText(u8("* {killernick} - ник человека который нанес вам урон\n* {killerid} - ид человека который нанес вам урон\n* {killerweapon} - оружие с которого нанесли урон"))
						slot1_a29133.CenterText(u8("Тип уведомления"))
						slot1_a29133.SetCursorPosX(240)
						slot1_a29133.PushItemWidth(100)

						local slot0_a14766 = slot1_a29133.Combo
						local slot1_a14767 = "##12454ппп7g473"
						local slot2_a14768 = antidmtype
						local slot3_a14769 = {
							u8("Чат"),
							u8("Notification")
						}

						if slot0_a14766(slot1_a14767, slot2_a14768, slot3_a14769, -1) then
							slot34_a28422.config.antidmtype = antidmtype.v
						end

						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("Звук"), antidmsound) then
							slot34_a28422.config.antidmsound = antidmsound.v
						end

						slot1_a29133.CenterText(u8("Текст репорта"))
						slot1_a29133.PushItemWidth(610)

						if slot1_a29133.InputText(u8("##dsgdsgdsg"), textreport) then
							local slot0_a14811 = slot34_a28422.config
							local slot1_a14812 = "textreport"
							slot0_a14811[slot1_a14812] = u8:decode(textreport.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.CenterText(u8("Итог"))
						slot1_a29133.CenterText(u8(tags(u8:decode(textreport.v))))
						slot1_a29133.SetCursorPosX(285)

						if slot1_a29133.Button(u8("Закрыть")) then
							slot1_a29133.CloseCurrentPopup()
						end

						slot1_a29133.EndChild()
						slot1_a29133.EndPopup()
					end

					slot1_a29133.Hint(u8("CustomArenda позволяет арендовать машину без денег"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("CustomArenda"), customarenda) then
						slot34_a28422.functions.customarenda = customarenda.v

						if customarenda.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n CustomArenda включена!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n CustomArenda выключена!", 228, os.date()), 5)
						end
					end

					slot1_a29133.Hint(u8([[
Показывать информацию при активации чата
 * Время
 * Ник
 * Статус CapsLock
 * Язык]]))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("InputHelper"), inputhelper) then
						slot34_a28422.functions.inputhelper = inputhelper.v

						if inputhelper.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n InputHelper включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n InputHelper выключен!", 228, os.date()), 5)
						end
					end

					if inputhelper.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Button(slot3_a9760.ICON_FA_CROP_ALT .. u8("##dgjoidj21")) then
							sampAddChatMessage("[Universal Helper] {FFFFFF}Чтобы сохранить позицию нажмите Enter", 6591981)
							sampSetChatInputEnabled(true)

							newmenu.v = false
							posstatschat = true
						end
					end

					slot1_a29133.Hint(u8("Отыгровка оружия"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("RpGuns"), rpguns) then
						slot34_a28422.functions.rpguns = rpguns.v

						if rpguns.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RpGuns включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RpGuns выключен!", 228, os.date()), 5)
						end
					end

					if rpguns.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("Женская отыгровка"), rpguns_pol) then
							rp_weapons:terminate()

							if rpguns_pol.v then
								sex = false
							else
								sex = true
							end

							slot34_a28422.functions.rpguns_pol = rpguns_pol.v

							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								rp_weapons:run()
							end
						end
					end

					slot1_a29133.Hint(u8("Кастомный репорт с возможностью создания кнопок репорта для упрощения написания репорта"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("CustomReport"), reportcustom) then
						slot34_a28422.functions.reportcustom = reportcustom.v

						if reportcustom.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n CustomReport включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n CustomReport выключен!", 228, os.date()), 5)
						end
					end

					if reportcustom.v then
						slot1_a29133.SameLine()

						if slot1_a29133.Button(u8("Настройка"), slot1_a29133.ImVec2(100, 20)) then
							slot1_a29133.OpenPopup(u8("Добавление кнопки"))
						end
					end

					if slot1_a29133.BeginPopupModal(u8("Добавление кнопки"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.AlwaysAutoResize) then
						slot1_a29133.PushItemWidth(265)
						slot1_a29133.Text(u8("Название кнопки: "))
						slot1_a29133.SameLine(142)
						slot1_a29133.InputText("##штшги", addname)
						slot1_a29133.Text(u8("Содержание кнопки: "))
						slot1_a29133.SameLine()
						slot1_a29133.InputText("##штшг123и", addotvet)

						if firstconnect then
							slot1_a29133.Text(u8("Так-же есть возможность использования тегов."))
							slot1_a29133.SameLine(305)

							if slot1_a29133.Button(u8("Cписок тегов"), slot1_a29133.ImVec2(100, 20)) then
								slot1_a29133.OpenPopup(u8("Теги"))
							end
						else
							slot1_a29133.Text(u8("Загрузка тегов.."))
						end

						if slot1_a29133.BeginPopupModal(u8("Теги"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoScrollbar + slot1_a29133.WindowFlags.AlwaysAutoResize) then
							slot1_a29133.BeginChild("##sdaadasdgasfadasdasdd", slot1_a29133.ImVec2(420, 440), true)
							slot1_a29133.CenterText(u8("При нажатии на тег он скопирует в буфер обмена [ctrl + v]"))
							slot1_a29133.NewLine()
							slot1_a29133.Columns(3, "tegi", true)
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Теги:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Описание:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Итог:"))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{mynick}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[1])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваш игровой ник:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(mynick))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{myid}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[2])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваш игровой ID:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(myID))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{myguns}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[3])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваше оружие в руках:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(slot24_a28082.get_name(weapon)))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{phone}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[4])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваш телефон:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(u8(phone)))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{job}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[5])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваша работа:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(u8(job)))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{org}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[6])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваша организация"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(u8(org)))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{myrang}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[7])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваша должность:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(u8(myrang)))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{time}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[8])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Время с вашего ПК:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(string.format(os.date("%H:%M:%S")))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{day}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[9])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Cегодняшняя дата:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(string.format(os.date("%d.%m.%y")))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{myname}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[10])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваше имя:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(mynick:gsub("_.*", "")))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{mysurname}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[11])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваше фамилия:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(mynick:gsub(".*_", "")))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{score}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[12])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваш уровень:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(score))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{paydaymoney}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[13])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Кол-во полученных денег:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(money))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{city}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[14])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваш город:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(u8(playerCity)))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{zone}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[15])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ваш район:"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(ZoneInGame))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{nearest}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[16])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ближайший игрок [nick]"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(nearestname))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{nearestid}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[17])

								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Ближайший игрок [id]"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring(nearestplayerID))
							slot1_a29133.NextColumn()
							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.Selectable(u8("{screen}"))

							if slot1_a29133.IsItemClicked(0) then
								res = setClipboardText(tegifill[18])
							end

							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(u8("Сделать скриншот"))
							slot1_a29133.NextColumn()
							slot1_a29133.SetColumnWidth(-1, 155)
							slot1_a29133.CenterColumnText(tostring("Недоступно"))
							slot1_a29133.NextColumn()
							slot1_a29133.EndChild()
							slot1_a29133.Columns(1)

							if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(418, 0)) then
								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.EndPopup()
						end

						if slot1_a29133.Button(u8("Добавить"), slot1_a29133.ImVec2(400, 20)) then
							if addname.v == "" or addname.v == nil or addotvet.v == nil or addotvet.v == "" then
								slot1_a29133.PushStyleColor(slot1_a29133.Col.Text, slot1_a29133.ImColor(253, 65, 63, 255):GetVec4())
								sampAddChatMessage("[Universal Helper] {FF0000}[Ошибка] {FFFFFF}Заполните все пункты!", 6591981)
								slot1_a29133.PopStyleColor()
							else
								table.insert(slot34_a28422.reportname, u8:decode(addname.v))
								table.insert(slot34_a28422.reportotvet, u8:decode(addotvet.v))
								slot1_a29133.CloseCurrentPopup()
								sendchat("Вы успешно добавили кнопку \"" .. u8:decode(addname.v) .. "\"")

								addname.v = ""
								addotvet.v = ""
							end
						end

						slot1_a29133.Columns(3)
						slot1_a29133.Separator()
						slot1_a29133.SetColumnWidth(-1, 100)
						slot1_a29133.CenterColumnText(u8("Кнопка"))
						slot1_a29133.NextColumn()
						slot1_a29133.SetColumnWidth(-1, 220)
						slot1_a29133.CenterColumnText(u8("Вопрос"))
						slot1_a29133.NextColumn()
						slot1_a29133.SetColumnWidth(-1, 150)
						slot1_a29133.CenterColumnText(u8("Удаления"))
						slot1_a29133.NextColumn()

						for slot3_a16313, slot4_a16257 in pairs(slot34_a28422.reportname) do
							slot1_a29133.SetColumnWidth(-1, 100)
							slot1_a29133.CenterColumnText(tostring(u8(slot34_a28422.reportname[slot3_a16313])))
							slot1_a29133.NextColumn()

							if slot34_a28422.reportotvet[slot3_a16313] then
								slot1_a29133.SetColumnWidth(-1, 220)
								slot1_a29133.CenterColumnText(u8(tags(slot34_a28422.reportotvet[slot3_a16313])))
								slot1_a29133.NextColumn()
							end

							slot1_a29133.Separator()
							slot1_a29133.SetColumnWidth(-1, 150)

							if slot1_a29133.Selectable(u8(slot3_a16313 .. " Удалить")) then
								table.remove(slot34_a28422.reportname, slot3_a16313)
								table.remove(slot34_a28422.reportotvet, slot3_a16313)
							end

							slot1_a29133.NextColumn()
						end

						slot1_a29133.Separator()
						slot1_a29133.Columns(1)

						if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(400, 20)) then
							slot1_a29133.CloseCurrentPopup()
						end

						slot1_a29133.EndPopup()
					end

					slot1_a29133.Hint(u8([[
Функция для получения бонусов с лаунчера
Бонусы в PayDay
 * 10.000$
 * Гражданский талон
 * Возможность открывать кейс с рулетками
 * Увеличенный процент депозита]]))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("ARZ Launcher"), launcher) then
						slot34_a28422.functions.launcher = launcher.v

						if launcher.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n ARZ Launcher включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n ARZ Launcher выключен!", 228, os.date()), 5)
						end

						slot1_a29133.OpenPopup("Лаунчер")
					end

					slot1_a29133.Hint(u8("Обновленый ScoreBoard с удобным функционалом"))
					slot1_a29133.SameLine()

					if slot1_a29133.Checkbox(u8("Custom TAB"), tabcustom) then
						slot34_a28422.functions.tabcustom = tabcustom.v

						if tabcustom.v then
							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n Custom TAB включен!", 228, os.date()), 5)
							end
						elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
							slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n Custom TAB выключен!", 228, os.date()), 5)
						end
					end

					if slot1_a29133.BeginPopupModal("Лаунчер", _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoScrollbar + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar) then
						slot1_a29133.SameLine(175)
						slot1_a29133.TextColoredRGB("{FF0000} Внимание{FFFFFF}!")
						slot1_a29133.NewLine()
						slot1_a29133.SameLine(30)
						slot1_a29133.Text(u8("Для приминения изминения необходимо перезапустить игру!"))
						slot1_a29133.Separator()

						if slot1_a29133.Button(u8("Перезапустить сейчас"), slot1_a29133.ImVec2(200, 35)) then
							slot1_a29133.CloseCurrentPopup()
							callFunction(sampGetBase() + 413040, 0, 0)
						end

						slot1_a29133.SameLine()

						if slot1_a29133.Button(u8("Позже"), slot1_a29133.ImVec2(200, 35)) then
							slot1_a29133.CloseCurrentPopup()
						end

						slot1_a29133.EndPopup()
					end

					slot1_a29133.EndChild()

					if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(600, 35)) then
						newmenu.v = false
					end
				elseif menu == 2 then
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 1)

					slot1_a29133.BeginChild("##123ggbbvcdg", slot1_a29133.ImVec2(600, 373), true)

					if slot1_a29133.CollapsingHeader(u8("Настройка флуда КБ | Дроп")) then
						slot1_a29133.PushItemWidth(360)
						slot1_a29133.Hint(u8("Флуд в FB.Активация /drop"))
						slot1_a29133.SameLine()

						if slot1_a29133.InputText(u8("Введите текст для дропа"), text_drop) then
							local slot0_a16591 = slot34_a28422.config
							local slot1_a16592 = "flood_drop"
							slot0_a16591[slot1_a16592] = u8:decode(text_drop.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Hint(u8("Флуд в FB.Активация /kb"))
						slot1_a29133.SameLine()

						if slot1_a29133.InputText(u8("Введите текст для КБ"), text_kb) then
							local slot0_a16618 = slot34_a28422.config
							local slot1_a16619 = "flood_kb"
							slot0_a16618[slot1_a16619] = u8:decode(text_kb.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Hint(u8("Флуд в VR и AD 1. Активация /sobeska"))
						slot1_a29133.SameLine()

						if slot1_a29133.InputText(u8("Введите текст для собески"), text_sobes) then
							local slot0_a16645 = slot34_a28422.config
							local slot1_a16646 = "sobes"
							slot0_a16645[slot1_a16646] = u8:decode(text_sobes.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end
					end

					if slot1_a29133.CollapsingHeader(u8("Настройка /piar")) then
						if slot1_a29133.Checkbox(u8("Пиар в вип-чат"), vr) then
							if vr.v then
								slot34_a28422.config.piar_vr = true
							else
								slot34_a28422.config.piar_vr = false
							end
						end

						slot1_a29133.PushItemWidth(410)

						if slot1_a29133.InputText(u8("Текст для вип-чата"), text_vr) then
							local slot0_a16692 = slot34_a28422.config
							local slot1_a16693 = "flood_vr"
							slot0_a16692[slot1_a16693] = u8:decode(text_vr.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.PushItemWidth(140)

						if slot1_a29133.SliderInt(u8("Задержка в минутах"), slider_vr, 0, 30) then
							slot34_a28422.slider.slider_vr = tonumber(slider_vr.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.SameLine()

						if slot1_a29133.SliderInt(u8("Задержка в секундах"), slider_vr_sec, 0, 60) then
							slot34_a28422.slider.slider_vr_sec = tonumber(slider_vr_sec.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()

						if slot1_a29133.Checkbox(u8("Пиар в семейный чат"), fam) then
							if fam.v then
								slot34_a28422.config.piar_fam = true
							else
								slot34_a28422.config.piar_fam = false
							end
						end

						slot1_a29133.PushItemWidth(410)

						if slot1_a29133.InputText(u8("Текст для семейного чата"), text_fam) then
							local slot0_a16784 = slot34_a28422.config
							local slot1_a16785 = "flood_fam"
							slot0_a16784[slot1_a16785] = u8:decode(text_fam.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.PushItemWidth(140)

						if slot1_a29133.SliderInt(u8("Задержкa в минутах"), slider_fam, 0, 30) then
							slot34_a28422.slider.slider_fam = tonumber(slider_fam.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.SameLine()

						if slot1_a29133.SliderInt(u8("Задержкa в секундах"), slider_fam_sec, 0, 60) then
							slot34_a28422.slider.slider_fam_sec = tonumber(slider_fam_sec.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.Separator()

						if slot1_a29133.Checkbox(u8("Пиар в обьявления"), ad) then
							if ad.v then
								slot34_a28422.config.piar_ad = true
							else
								slot34_a28422.config.piar_ad = false
							end
						end

						if string.len(u8:decode(text_ad.v)) < 20 then
							slot1_a29133.SameLine()
							slot1_a29133.TextColoredRGB("{FF0000}Внимание! Введите не менее 20 символов для корректной работы")
						end

						slot1_a29133.PushItemWidth(410)

						if slot1_a29133.InputText(u8("Текст для обьявлений"), text_ad) then
							local slot0_a16892 = slot34_a28422.config
							local slot1_a16893 = "flood_ad"
							slot0_a16892[slot1_a16893] = u8:decode(text_ad.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.PushItemWidth(140)

						if slot1_a29133.SliderInt(u8("Зaдержка в минутах"), slider_ad, 0, 30) then
							slot34_a28422.slider.slider_ad = tonumber(slider_ad.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						slot1_a29133.SameLine()

						if slot1_a29133.SliderInt(u8("Зaдержка в секундах"), slider_ad_sec, 0, 60) then
							slot34_a28422.slider.slider_ad_sec = tonumber(slider_ad_sec.v)

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end
					end

					if slot1_a29133.CollapsingHeader(u8("Бинды скрипта")) then
						for slot3_a16972, slot4_a17001 in ipairs(binderlist) do
							if slot9_a25135.HotKey("##HK1223456" .. slot3_a16972, slot4_a17001, tLastKeys, 100) then
								if not slot7_a25136.isHotKeyDefined(slot4_a17001.v) then
									if slot7_a25136.isHotKeyDefined(tLastKeys.v) then
										slot7_a25136.unRegisterHotKey(tLastKeys.v)
									end

									slot7_a25136.registerHotKey(slot4_a17001.v, true, onHotKey)

									if doesFileExist(ffile) then
										os.remove(ffile)
									end

									local slot5_a17018 = io.open(ffile, "w")

									if slot5_a17018 then
										slot5_a17018:write(encodeJson(binderlist))
										slot5_a17018:close()
									end
								elseif #slot4_a17001.v ~= 0 then
									slot4_a17001.v = tLastKeys.v

									sampAddChatMessage("[Universal Helper] {FF0000}[Ошибка] {FFFFFF}Клавиша занята.", 6591981)
								end
							end

							slot1_a29133.SameLine()
							slot1_a29133.Text(u8(slot4_a17001.text))
						end
					end

					slot1_a29133.Separator()
					slot1_a29133.CenterText(u8("Настройка биндера"))
					slot1_a29133.Separator()
					slot1_a29133.BeginChild("##bindlist1", slot1_a29133.ImVec2(590, 250))

					for slot3_a17445, slot4_a17381 in ipairs(slot29_a28607) do
						slot1_a29133.NextColumn()

						if slot9_a25135.HotKey("##ID" .. slot3_a17445, slot4_a17381, tLastKeys, 100) then
							if not slot7_a25136.isHotKeyDefined(slot4_a17381.v) and slot7_a25136.isHotKeyDefined(tLastKeys.v) then
								slot7_a25136.unRegisterHotKey(tLastKeys.v)
							end

							slot7_a25136.registerHotKey(slot4_a17381.v, true, onHotKey)

							if doesFileExist(slot28_a28606) then
								os.remove(slot28_a28606)
							end

							local slot5_a17119 = io.open(slot28_a28606, "w")

							if slot5_a17119 then
								slot5_a17119:write(encodeJson(slot29_a28607))
								slot5_a17119:close()
							end
						end

						slot1_a29133.SameLine()

						if slot4_a17381.cmd ~= "-" then
							slot1_a29133.Text(u8("Команда: /" .. slot4_a17381.cmd))
						else
							slot1_a29133.Text(u8("Команда не назначена"))
						end

						slot1_a29133.SameLine(380)

						if slot1_a29133.Button(slot3_a9760.ICON_FA_EDIT .. u8(" Редактировать ##") .. slot3_a17445) then
							slot1_a29133.OpenPopup(u8("Установка клавиши ##modal") .. slot3_a17445)
						end

						if slot3_a17445 ~= 0 then
							slot1_a29133.SameLine()

							if slot1_a29133.Button(slot3_a9760.ICON_FA_TRASH .. u8(" Удалить ##") .. slot3_a17445) then
								if slot4_a17381.cmd ~= "-" then
									sampUnregisterChatCommand(slot4_a17381.cmd)
								end

								if slot7_a25136.isHotKeyDefined(tLastKeys.v) then
									slot7_a25136.unRegisterHotKey(tLastKeys.v)
								end

								table.remove(slot29_a28607, slot3_a17445)

								if doesFileExist(slot28_a28606) then
									os.remove(slot28_a28606)
								end

								local slot5_a17221 = io.open(slot28_a28606, "w")

								if slot5_a17221 then
									slot5_a17221:write(encodeJson(slot29_a28607))
									slot5_a17221:close()
								end
							end
						end

						if slot1_a29133.BeginPopupModal(u8("Установка клавиши ##modal") .. slot3_a17445, _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove) then
							if slot1_a29133.Button(u8(" Сменить/Назначить команду"), slot1_a29133.ImVec2(200, 0)) then
								slot1_a29133.OpenPopup(u8("Команда - /") .. slot4_a17381.cmd)
							end

							if slot1_a29133.Button(u8(" Редактировать содержимое"), slot1_a29133.ImVec2(200, 0)) then
								local slot5_a17283 = cmd_text
								slot5_a17283.v = u8(slot4_a17381.text):gsub("~", "\n")
								binddelay.v = slot4_a17381.delay

								slot1_a29133.OpenPopup(u8("Редактор текста ##second") .. slot3_a17445)
							end

							if slot1_a29133.BeginPopupModal(u8("Команда - /") .. slot4_a17381.cmd, _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoScrollbar + slot1_a29133.WindowFlags.AlwaysAutoResize) then
								slot1_a29133.Text(u8("Введите название команды, которую хотите применить к бинду, указывайте без '/':"))
								slot1_a29133.CenterText(u8("Чтобы удалить команду, введите прочерк и сохраните."))
								slot1_a29133.PushItemWidth(400)
								slot1_a29133.NewLine()
								slot1_a29133.SameLine(65)
								slot1_a29133.InputText("##FUCKITTIKCUF_1", cmd_name)

								if slot1_a29133.Button(u8("Сохранить"), slot1_a29133.ImVec2(250, 0)) then
									local slot5_a17363 = "cmd"
									slot4_a17381[slot5_a17363] = u8:decode(cmd_name.v)

									if u8:decode(cmd_name.v) ~= "-" then
										rcmd(slot4_a17381.cmd, slot4_a17381.text, slot4_a17381.delay)
										sendconsol("Зарегистрирована команда /" .. slot4_a17381.cmd)

										cmd_name.v = ""
									end

									if doesFileExist(slot28_a28606) then
										os.remove(slot28_a28606)
									end

									local slot5_a17407 = io.open(slot28_a28606, "w")

									if slot5_a17407 then
										slot5_a17407:write(encodeJson(slot29_a28607))
										slot5_a17407:close()
									end

									slot1_a29133.CloseCurrentPopup()
								end

								slot1_a29133.SameLine()

								if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(250, 0)) then
									cmd_name.v = ""

									slot1_a29133.CloseCurrentPopup()
								end

								slot1_a29133.EndPopup()
							end

							if slot1_a29133.BeginPopupModal(u8("Редактор текста ##second") .. slot3_a17445, _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoScrollbar + slot1_a29133.WindowFlags.AlwaysAutoResize) then
								slot1_a29133.BeginChild("##sdaadasdd", slot1_a29133.ImVec2(510, 540), true)
								slot1_a29133.PushItemWidth(263)
								slot1_a29133.InputInt(u8("Задержка строк(сек.)"), binddelay)
								slot1_a29133.SameLine()

								if firstconnect then
									if slot1_a29133.Button(u8("Cписок тегов"), slot1_a29133.ImVec2(100, 20)) then
										slot1_a29133.OpenPopup(u8("Теги"))
									end
								else
									slot1_a29133.Text(u8("Загрузка тегов.."))
								end

								tagsall()

								if binddelay.v <= 0 then
									binddelay.v = 1
								elseif binddelay.v >= 1801 then
									binddelay.v = 1800
								end

								slot1_a29133.InputTextMultiline("##FUCKITTIKCUF_2", cmd_text, slot1_a29133.ImVec2(498, 300))
								slot1_a29133.CenterText(u8("Результат:"))
								slot1_a29133.BeginChild("##sdaadasdd", slot1_a29133.ImVec2(495, 145), true)

								local slot5_a17542 = tags(u8:decode(cmd_text.v))

								slot1_a29133.Text(u8(slot5_a17542))
								slot1_a29133.EndChild()

								if slot1_a29133.Button(u8("Сохранить"), slot1_a29133.ImVec2(250, 25)) then
									local slot6_a17559 = "text"
									slot4_a17381[slot6_a17559] = u8:decode(cmd_text.v):gsub("\n", "~")
									slot4_a17381.delay = binddelay.v

									if slot4_a17381.cmd ~= nil then
										rcmd(slot4_a17381.cmd, slot4_a17381.text, slot4_a17381.delay)
									else
										rcmd(nil, slot4_a17381.text, slot4_a17381.delay)
									end

									if doesFileExist(slot28_a28606) then
										os.remove(slot28_a28606)
									end

									local slot6_a17606 = io.open(slot28_a28606, "w")

									if slot6_a17606 then
										slot6_a17606:write(encodeJson(slot29_a28607))
										slot6_a17606:close()
									end

									slot1_a29133.CloseCurrentPopup()
								end

								slot1_a29133.SameLine()

								if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(250, 25)) then
									slot1_a29133.CloseCurrentPopup()
								end

								slot1_a29133.EndChild()
								slot1_a29133.EndPopup()
							end

							if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(200, 0)) then
								slot1_a29133.CloseCurrentPopup()
							end

							slot1_a29133.EndPopup()
						end
					end

					slot1_a29133.EndChild()
					slot1_a29133.EndChild()

					if slot1_a29133.Button(slot3_a9760.ICON_FA_KEYBOARD .. u8(" Добавить бинд"), slot1_a29133.ImVec2(600, 25)) then
						local slot0_a17672 = slot29_a28607
						local slot1_a17675 = #slot29_a28607 + 1
						local slot2_a17676 = {
							text = "",
							cmd = "-",
							delay = 3,
							v = {}
						}
						slot0_a17672[slot1_a17675] = slot2_a17676

						if doesFileExist(slot28_a28606) then
							os.remove(slot28_a28606)
						end

						local slot0_a17691 = io.open(slot28_a28606, "w")

						if slot0_a17691 then
							slot0_a17691:write(encodeJson(slot29_a28607))
							slot0_a17691:close()
						end
					end

					if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(600, 35)) then
						newmenu.v = false
					end
				elseif menu == 3 then
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 1)

					slot1_a29133.BeginChild("##123ggbg", slot1_a29133.ImVec2(600, 373), true)

					if slot1_a29133.ToggleButton("##окно статистики", statson) then
						if statson.v then
							slot34_a28422.infostat.statson = true
							stats.v = true

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end

						if not statson.v then
							stats.v = false
							slot34_a28422.infostat.statson = false

							slot17_a28610.save(slot34_a28422, "helper.ini")
						end
					end

					slot1_a29133.SameLine()
					slot1_a29133.Text(u8("Включить оверлей"))

					if statson.v then
						slot1_a29133.SameLine(390)
						slot1_a29133.Text(u8("Настройка цвета фона"))
						slot1_a29133.SameLine(550)

						if slot1_a29133.ColorEdit4("##2", colors_stat, slot1_a29133.ColorEditFlags.AlphaBar + slot1_a29133.ColorEditFlags.NoInputs) then
							slot34_a28422.color.color_r = colors_stat.v[1]
							slot34_a28422.color.color_g = colors_stat.v[2]
							slot34_a28422.color.color_b = colors_stat.v[3]
							slot34_a28422.color.color_a = colors_stat.v[4]
						end

						if slot1_a29133.ToggleButton("##офф", statsoff) then
							if statsoff.v then
								slot34_a28422.infostat.statsoff = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end

							if not statsoff.v then
								slot34_a28422.infostat.statsoff = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Выключать оверлей при скрине"))
						slot1_a29133.SameLine(390)
						slot1_a29133.Text(u8("Настройка цвета шрифта"))
						slot1_a29133.SameLine(550)

						if slot1_a29133.ColorEdit4("##23", colors_chat_s, slot1_a29133.ColorEditFlags.AlphaBar + slot1_a29133.ColorEditFlags.NoInputs) then
							slot34_a28422.color.color_rh = colors_chat_s.v[1]
							slot34_a28422.color.color_gh = colors_chat_s.v[2]
							slot34_a28422.color.color_bh = colors_chat_s.v[3]
							slot34_a28422.color.color_ah = colors_chat_s.v[4]
						end

						slot1_a29133.Separator()

						if slot1_a29133.ToggleButton("Ваш ник", nickon) then
							if slot34_a28422.infostat.nickon == false then
								slot34_a28422.infostat.nickon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.nickon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Ник"))

						if slot1_a29133.ToggleButton("##Сервак", serveron) then
							if slot34_a28422.infostat.serveron == false then
								slot34_a28422.infostat.serveron = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.serveron = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Сервер"))

						if slot1_a29133.ToggleButton("##дата", dataon) then
							if slot34_a28422.infostat.dataon == false then
								slot34_a28422.infostat.dataon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.dataon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Дата | Время"))

						if slot1_a29133.ToggleButton("##пинг", pingon) then
							if slot34_a28422.infostat.pingon == false then
								slot34_a28422.infostat.pingon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.pingon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Пинг"))

						if slot1_a29133.ToggleButton("##кв", kbon) then
							if slot34_a28422.infostat.kbon == false then
								slot34_a28422.infostat.kbon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.kbon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Квадрат"))

						if slot1_a29133.ToggleButton("##масочка", maskon) then
							if slot34_a28422.infostat.maskon == false then
								slot34_a28422.infostat.maskon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.maskon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Таймер маски"))

						if slot1_a29133.ToggleButton("##мани", payon) then
							if slot34_a28422.infostat.payon == false then
								slot34_a28422.infostat.payon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.payon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("PayDayMaster"))

						if slot1_a29133.ToggleButton("##хпшка", hpon) then
							if slot34_a28422.infostat.hpon == false then
								slot34_a28422.infostat.hpon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.hpon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("ХП"))

						if slot1_a29133.ToggleButton("##арморчик", armon) then
							if slot34_a28422.infostat.armon == false then
								slot34_a28422.infostat.armon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.armon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Армор"))

						if slot1_a29133.ToggleButton("##онлайн за с", onlineson) then
							if slot34_a28422.infostat.onlineson == false then
								slot34_a28422.infostat.onlineson = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.onlineson = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Онлайн за сессию"))

						if slot1_a29133.ToggleButton("##офаы12 за д", onlinafk) then
							if slot34_a28422.infostat.onlinafk == false then
								slot34_a28422.infostat.onlinafk = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.onlinafk = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("АФК за сессию"))

						if slot1_a29133.ToggleButton("##онлайн за д", onlineon) then
							if slot34_a28422.infostat.onlineon == false then
								slot34_a28422.infostat.onlineon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.onlineon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Онлайн за день"))

						if slot1_a29133.ToggleButton("##офаыgb12 за д", onlinafkday) then
							if slot34_a28422.infostat.onlinafkday == false then
								slot34_a28422.infostat.onlinafkday = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.onlinafkday = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("АФК за день"))

						if slot1_a29133.ToggleButton("##фпсик", fpson) then
							if slot34_a28422.infostat.fpson == false then
								slot34_a28422.infostat.fpson = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.fpson = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("FPS"))

						if slot1_a29133.ToggleButton("##Таймер аренды", arendaon) then
							if slot34_a28422.infostat.arendaon == false then
								slot34_a28422.infostat.arendaon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.arendaon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Таймер аренды"))

						if slot1_a29133.ToggleButton("##хп кар", hpcaron) then
							if slot34_a28422.infostat.hpcaron == false then
								slot34_a28422.infostat.hpcaron = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.hpcaron = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("ХП машины"))

						if slot1_a29133.ToggleButton("##ид кар", idcaron) then
							if slot34_a28422.infostat.idcaron == false then
								slot34_a28422.infostat.idcaron = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.idcaron = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("ID машины"))

						if slot1_a29133.ToggleButton("##модель кар", modelcaron) then
							if slot34_a28422.infostat.modelcaron == false then
								slot34_a28422.infostat.modelcaron = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.modelcaron = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Модель транспорта"))

						if slot1_a29133.ToggleButton("##fafagfnk1", afkon) then
							if slot34_a28422.infostat.afkon == false then
								slot34_a28422.infostat.afkon = true

								slot17_a28610.save(slot34_a28422, "helper.ini")
							else
								slot34_a28422.infostat.afkon = false

								slot17_a28610.save(slot34_a28422, "helper.ini")
							end
						end

						slot1_a29133.SameLine()
						slot1_a29133.Text(u8("Статус АнтиАфк"))
					else
						slot1_a29133.NewLine()
						slot1_a29133.NewLine()
						slot1_a29133.NewLine()
						slot1_a29133.NewLine()
						slot1_a29133.NewLine()
						slot1_a29133.NewLine()
						slot1_a29133.NewLine()
						slot1_a29133.CenterText(u8("Оверлей - это простой способ для получения информации о вашем персонаже."))
						slot1_a29133.CenterText(u8("С индивидуальной кастомной настройкой цвета шрифта и фона окна."))
						slot1_a29133.CenterText(u8("При скринах данное окно будет отключаться с включенном пунктом в настройках"))
					end

					slot1_a29133.EndChild()

					if slot1_a29133.Button(slot3_a9760.ICON_FA_CROP_ALT .. u8(" Изменить место"), slot1_a29133.ImVec2(296, 25)) then
						sampAddChatMessage("[Universal Helper] {FFFFFF}Чтобы сохранить позицию нажмите Enter", 6591981)

						newmenu.v = false
						posstats = true
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(slot3_a9760.ICON_FA_DESKTOP .. u8(" Стандартные настройки"), slot1_a29133.ImVec2(296, 25)) then
						slot34_a28422.color.color_r = 0.06
						slot34_a28422.color.color_g = 0.06
						slot34_a28422.color.color_b = 0.06
						slot34_a28422.color.color_a = 0.84
						slot34_a28422.color.color_rh = 1
						slot34_a28422.color.color_gh = 1
						slot34_a28422.color.color_bh = 1
						slot34_a28422.color.color_ah = 1
					end

					if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(600, 35)) then
						newmenu.v = false
					end
				elseif menu == 4 then
					slot1_a29133.Text(slot3_a9760.ICON_FA_USER_ALT .. u8(" Автор скрипта:"))
					slot1_a29133.SameLine()
					slot1_a29133.TextColoredRGB("{FF0000}McLore fix by ikonka")
					slot1_a29133.Text(slot3_a9760.ICON_FA_HASHTAG .. u8(" Беседа VK"))
					slot1_a29133.SameLine()
					slot1_a29133.Link("https://vk.me/join/AJQ1dxcP2Bfs00C6jRDiP5J4")
					slot1_a29133.Text(slot3_a9760.ICON_FA_USERS .. u8(" Группа Discord "))
					slot1_a29133.SameLine()
					slot1_a29133.Link("https://discord.gg/BpkEFQVZxa")
					slot1_a29133.Text(slot3_a9760.ICON_FA_BLOG .. u8(" BlastHack автора fixa"))
					slot1_a29133.SameLine()
					slot1_a29133.Link("https://www.blast.hk/members/498071/")
					slot1_a29133.Text(slot3_a9760.ICON_FA_RUBLE_SIGN .. u8(" Донат:"))
					slot1_a29133.SameLine()
					slot1_a29133.Link("https://www.qiwi.com/n/MCLORE/")
					slot1_a29133.Text(slot3_a9760.ICON_FA_HANDSHAKE .. u8(" Скрипты на заказ"))
					slot1_a29133.SameLine()
					slot1_a29133.Link("https://vk.com/mclore1337")
					slot1_a29133.Text(slot3_a9760.ICON_FA_CODE .. u8(" Версия скрипта:"))
					slot1_a29133.SameLine()
					slot1_a29133.Text(tostring(thisScript().version) .. ".V")
					slot1_a29133.Text(slot3_a9760.ICON_FA_CLOCK .. u8(" Дата последнего обновления:"))
					slot1_a29133.SameLine()
					slot1_a29133.Text(tostring(updatedate))
					slot1_a29133.SameLine(515)

					if checkinfo == false then
						if slot1_a29133.Button(slot3_a9760.ICON_FA_INFO .. u8(" Команды ")) then
							checkinfo = not checkinfo
						end
					elseif slot1_a29133.Button(slot3_a9760.ICON_FA_INFO .. u8(" ChangeLog")) then
						checkinfo = not checkinfo
					end

					if checkinfo == false then
						slot1_a29133.InputTextMultiline("##multiline_Create", changelog, slot1_a29133.ImVec2(600, 252), slot1_a29133.InputTextFlags.ReadOnly)
					else
						slot1_a29133.InputTextMultiline("##infocommand", commandlist, slot1_a29133.ImVec2(600, 252), slot1_a29133.InputTextFlags.ReadOnly)
					end

					if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(600, 34)) then
						newmenu.v = false
					end
				elseif menu == 5 then
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(220)
					slot1_a29133.Text(u8("Команда для активации скрипта"))
					slot1_a29133.PushItemWidth(300)
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(160)

					if slot1_a29133.InputText("##Com", command) then
						slot34_a28422.settingshelper.command = command.v

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.NewLine()
					slot1_a29133.SameLine(162)
					slot1_a29133.Text(u8("Ранг для быстрого инвайта"))
					slot1_a29133.SameLine(360)
					slot1_a29133.PushItemWidth(100)

					if slot1_a29133.Combo(u8("##инвайте"), finvite, rangfastinvite, -1) then
						slot34_a28422.config.inviterank = finvite.v

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.NewLine()
					slot1_a29133.SameLine(162)
					slot1_a29133.Text(u8("Тип сбива"))
					slot1_a29133.SameLine(360)

					if slot1_a29133.Combo(u8("##типсбиваа"), tsbiv, typesbiv, -1) then
						slot34_a28422.config.typesbiv = tsbiv.v

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.NewLine()
					slot1_a29133.SameLine(162)
					slot1_a29133.Text(u8("Номер анимации:"))
					slot1_a29133.SameLine(360)

					if slot1_a29133.InputText("##Com123123123123", animsnumber) then
						slot34_a28422.config.animsnumber = animsnumber.v

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.NewLine()
					slot1_a29133.SameLine(162)
					slot1_a29133.Text(u8("Телефон для FastPhone"))
					slot1_a29133.SameLine(360)

					if slot1_a29133.Combo("##12Телефон для FastPhone", typephone, pphone, -1) then
						slot34_a28422.config.typephone = typephone.v

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.NewLine()
					slot1_a29133.SameLine(162)
					slot1_a29133.Text(u8("СМИ для piar"))
					slot1_a29133.SameLine(360)

					local slot0_a19082 = slot1_a29133.Combo
					local slot1_a19083 = "##12СМИ для piar"
					local slot2_a19084 = typesmi
					local slot3_a19085 = {
						u8("СМИ LS"),
						u8("СМИ LV"),
						u8("СМИ SF")
					}

					if slot0_a19082(slot1_a19083, slot2_a19084, slot3_a19085, -1) then
						slot34_a28422.config.typesmi = typesmi.v

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					slot1_a29133.SetCursorPosY(431)

					if slot1_a29133.Button(slot3_a9760.ICON_FA_SYNC_ALT .. u8(" Перезагрузить скрипт"), slot1_a29133.ImVec2(296, 20)) then
						lua_thread.create((function ()
							slot1_a29133.Process = false

							wait(100)
							thisScript():reload()
						end))
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(slot3_a9760.ICON_FA_MINUS_CIRCLE .. u8(" Выключить скрипт"), slot1_a29133.ImVec2(296, 20)) then
						helperoff()
					end

					if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(600, 32)) then
						newmenu.v = false
					end
				elseif menu == 6 then
					slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0, 0, 0, 0)

					slot1_a29133.BeginChild("##12133g3", slot1_a29133.ImVec2(600, 403), true, slot1_a29133.WindowFlags.NoScrollbar)

					if slot1_a29133.Button(slot3_a9760.ICON_FA_CROP_ALT .. u8(" Рендер"), slot1_a29133.ImVec2(187, 35)) then
						mmenu = 1
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(slot3_a9760.ICON_FA_ANGLE_DOUBLE_UP .. u8(" FPS UP|FIX"), slot1_a29133.ImVec2(185, 35)) then
						mmenu = 2
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(slot3_a9760.ICON_FA_KEYBOARD .. u8(" Сочетания клавиш"), slot1_a29133.ImVec2(195, 35)) then
						mmenu = 4
					end

					slot1_a29133.Separator()

					if mmenu == 1 then
						slot1_a29133.Hint(u8([[
Функция отображает на каждом авто информацию, а именно:
* Состояние двигателя
* Статус дверей
* Кол-во ХП
* Модель
 Функция может уменьшать кол-во ФПС]]))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("RenderCar"), rendercar) then
							slot34_a28422.functions.rendercar = rendercar.v

							if rendercar.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RenderCar включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RenderCar выключен!", 228, os.date()), 5)
							end
						end

						if rendercar.v then
							slot1_a29133.SameLine(127)
							slot1_a29133.PushItemWidth(100)

							if slot1_a29133.InputInt(u8("Размер шрифта##1231233"), font2size) then
								slot34_a28422.rendersettings.font2size = font2size.v

								renderReleaseFont(font2)

								font2 = renderCreateFont(slot34_a28422.rendersettings.font2, slot34_a28422.rendersettings.font2size, 5)
							end

							slot1_a29133.SameLine(370)

							if slot1_a29133.InputText(u8("Шрифт##155d1"), fontcarrender) then
								slot34_a28422.rendersettings.font2 = fontcarrender.v

								renderReleaseFont(font2)

								font2 = renderCreateFont(slot34_a28422.rendersettings.font2, slot34_a28422.rendersettings.font2size, 5)
							end
						end

						slot1_a29133.Hint(u8([[
Функция отображает на каждом скине информацию, а именно:
* Кол-во ХП
* Кол-во брони
* Статус Titan|Premium
 Функция может уменьшать кол-во ФПС]]))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("RenderPed"), renderped) then
							slot34_a28422.functions.renderped = renderped.v

							if renderped.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RenderPed включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RenderPed выключен!", 228, os.date()), 5)
							end
						end

						if renderped.v then
							slot1_a29133.SameLine(127)
							slot1_a29133.PushItemWidth(100)

							if slot1_a29133.InputInt(u8("Размер шрифта##123123"), font1size) then
								slot34_a28422.rendersettings.font1size = font1size.v

								renderReleaseFont(font1)

								font1 = renderCreateFont(slot34_a28422.rendersettings.font1, slot34_a28422.rendersettings.font1size, 5)
							end

							slot1_a29133.SameLine(370)

							if slot1_a29133.InputText(u8("Шрифт##155d3121"), fontpedrender) then
								slot34_a28422.rendersettings.font1 = fontpedrender.v

								renderReleaseFont(font1)

								font1 = renderCreateFont(slot34_a28422.rendersettings.font1, slot34_a28422.rendersettings.font1size, 5)
							end
						end

						slot1_a29133.Hint(u8("Отображает время на экране"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("RenderTime"), timeinscreen) then
							slot34_a28422.functions.timeinscreen = timeinscreen.v

							if timeinscreen.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RenderTime включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n RenderTime выключен!", 228, os.date()), 5)
							end
						end

						if timeinscreen.v then
							slot1_a29133.SameLine()
							slot1_a29133.PushItemWidth(100)

							if slot1_a29133.InputInt(u8("Размер шрифта##1231723"), font3size) then
								slot34_a28422.rendersettings.font3size = font3size.v

								renderReleaseFont(font3)

								font3 = renderCreateFont(slot34_a28422.rendersettings.font3, slot34_a28422.rendersettings.font3size, 5)
							end

							slot1_a29133.SameLine(370)

							if slot1_a29133.InputText(u8("Шрифт##1557d3121"), fonttimerender) then
								slot34_a28422.rendersettings.font3 = fonttimerender.v

								renderReleaseFont(font3)

								font3 = renderCreateFont(slot34_a28422.rendersettings.font3, slot34_a28422.rendersettings.font3size, 5)
							end

							slot1_a29133.SameLine()

							if slot1_a29133.ColorEdit3(u8("##Цветтайма"), colortime, slot1_a29133.ColorEditFlags.NoInputs) then
								slot34_a28422.color.color_rt = colortime.v[1] * 255
								slot34_a28422.color.color_gt = colortime.v[2] * 255
								slot34_a28422.color.color_bt = colortime.v[3] * 255
								coloroftime = join_argb(255, slot34_a28422.color.color_rt, slot34_a28422.color.color_gt, slot34_a28422.color.color_bt)
							end

							slot1_a29133.SameLine()

							if slot1_a29133.Button(slot3_a9760.ICON_FA_CROP_ALT) then
								timemesto = true
								newmenu.v = false

								sampAddChatMessage("[Universal Helper] {FFFFFF}Чтобы сохранить позицию нажмите Enter", 6591981)
							end
						end

						slot1_a29133.Hint(u8("Функция предназначенная для адвокатов, выводит список заключенных на экран"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("ZekRender"), zekrender) then
							slot34_a28422.functions.zekrender = zekrender.v

							if zekrender.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n ZekRender включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n ZekRender выключен!", 228, os.date()), 5)
							end
						end

						if zekrender.v then
							slot1_a29133.SameLine()
							slot1_a29133.PushItemWidth(100)

							if slot1_a29133.InputInt(u8("Размер шрифта##123g1723"), font4size) then
								slot34_a28422.rendersettings.font4size = font4size.v

								renderReleaseFont(font4)

								font4 = renderCreateFont(slot34_a28422.rendersettings.font4, slot34_a28422.rendersettings.font4size, 5)
							end

							slot1_a29133.SameLine(320)

							if slot1_a29133.InputText(u8("Шрифт##1557d3g121"), fontzekrender) then
								slot34_a28422.rendersettings.font4 = fontzekrender.v

								renderReleaseFont(font4)

								font4 = renderCreateFont(slot34_a28422.rendersettings.font4, slot34_a28422.rendersettings.font4size, 5)
							end

							slot1_a29133.SameLine()

							if slot1_a29133.Button(slot3_a9760.ICON_FA_CROP_ALT .. "##123") then
								newmenu.v = false
								zekmesto = true

								sampAddChatMessage("[Universal Helper] {FFFFFF}Чтобы сохранить позицию нажмите Enter", 6591981)
							end

							slot1_a29133.SameLine()
							slot1_a29133.PushItemWidth(90)

							local slot0_a19814 = slot1_a29133.Combo
							local slot1_a19815 = "##12454ппп7473"
							local slot2_a19816 = zektable
							local slot3_a19817 = {
								u8("Слева"),
								u8("Середина"),
								u8("Справа")
							}

							if slot0_a19814(slot1_a19815, slot2_a19816, slot3_a19817, -1) then
								slot34_a28422.config.zektable = zektable.v
							end
						end

						slot1_a29133.Hint(u8("Чекер игроков"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("ChekerPlayers"), chekerplayers) then
							slot34_a28422.functions.chekerplayers = chekerplayers.v

							if chekerplayers.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n ChekerPlayers включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n ChekerPlayers выключен!", 228, os.date()), 5)
							end
						end

						if chekerplayers.v then
							slot1_a29133.SameLine()

							if slot1_a29133.Button(slot3_a9760.ICON_FA_COGS .. u8("##НастройкиЦвет")) then
								slot1_a29133.OpenPopup(u8("##Настройкачекера"))
							end

							if slot1_a29133.BeginPopupModal(u8("##Настройкачекера"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar) then
								slot1_a29133.CenterText(u8("Список людей"))
								slot1_a29133.PushItemWidth(190)
								slot1_a29133.InputText("##фыафы241231231", addplayer)
								slot1_a29133.SameLine()

								if slot1_a29133.Button(slot3_a9760.ICON_FA_USER_PLUS .. "##asafasfa1", slot1_a29133.ImVec2(25, 20)) and addplayer.v ~= nil and addplayer.v ~= "" then
									table.insert(slot34_a28422.playerlist, tostring(addplayer.v))
									updateusercheck()
								end

								slot1_a29133.BeginChild("##sdaadasdgfasf123123asfadasdadgdsgsdd1111ф1а1", slot1_a29133.ImVec2(225, 257), true)

								if #slot34_a28422.playerlist == 0 then
									slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(50, 80))
									slot1_a29133.TextDisabled(u8("Список игроков пуст.."))
									slot1_a29133.CenterText(u8("Напишите ник человека"))
									slot1_a29133.CenterText(u8("Затем нажми кнопку добавить"))
									slot1_a29133.CenterText(u8("Чтобы пополнить список"))
								else
									for slot3_a20049, slot4_a20021 in pairs(slot34_a28422.playerlist) do
										slot1_a29133.Text(u8("[" .. slot3_a20049 .. "] " .. slot4_a20021))
										slot1_a29133.SameLine()
										slot1_a29133.SetCursorPosX(185)

										if slot1_a29133.Button(slot3_a9760.ICON_FA_TRASH .. "##" .. slot3_a20049, slot1_a29133.ImVec2(20, 20)) then
											table.remove(slot34_a28422.playerlist, slot3_a20049)
											updateusercheck()
										end
									end
								end

								slot1_a29133.EndChild()
								slot1_a29133.PushItemWidth(100)

								if slot1_a29133.InputText(u8("Шрифт##1557d3g1211asg23asgasg"), fontcheker) then
									slot34_a28422.rendersettings.font5 = fontcheker.v

									renderReleaseFont(font5)

									font5 = renderCreateFont(slot34_a28422.rendersettings.font5, slot34_a28422.rendersettings.font5size, 5)
								end

								if slot1_a29133.InputInt(u8("Размер шрифта##123g17213asgas3"), font5size) then
									slot34_a28422.rendersettings.font5size = font5size.v

									renderReleaseFont(font5)

									font5 = renderCreateFont(slot34_a28422.rendersettings.font5, slot34_a28422.rendersettings.font5size, 5)
								end

								if slot1_a29133.Button(u8(" Месторасположение"), slot1_a29133.ImVec2(225, 25)) then
									lua_thread.create((function ()
										newmenu.v = false
										norender = true

										while not sampIsChatInputActive() and norender do
											wait(0)
											showCursor(true)

											cX, cY = getCursorPos()
											local slot2_a20145 = 5
											slot34_a28422.cord.posXcheker = cX * 1
											local slot2_a20150 = 5
											slot34_a28422.cord.posYcheker = cY * 1

											if isKeyJustPressed(13) then
												if slot17_a28610.save(slot34_a28422, "helper.ini") then
													addOneOffSound(0, 0, 0, 1139)
													sampAddChatMessage("[Universal Helper] {FFFFFF}Расположение сохранено!", 6591981)
												else
													sampAddChatMessage("[Universal Helper] {FFFFFF}ОШИБКА СОХРАНЕНИЯ СВЯЖИТЕСЬ С АВТОРОМ СКРИПТА!", 6591981)
												end

												showCursor(false)

												norender = false
												newmenu.v = true
											end
										end
									end))
								end

								if slot1_a29133.Button(slot3_a9760.ICON_FA_ALIGN_RIGHT, slot1_a29133.ImVec2(70, 25)) then
									slot34_a28422.functions.playerspos = 3
								end

								slot1_a29133.SameLine()

								if slot1_a29133.Button(slot3_a9760.ICON_FA_ALIGN_JUSTIFY, slot1_a29133.ImVec2(70, 25)) then
									slot34_a28422.functions.playerspos = 2
								end

								slot1_a29133.SameLine()

								if slot1_a29133.Button(slot3_a9760.ICON_FA_ALIGN_LEFT, slot1_a29133.ImVec2(69, 25)) then
									slot34_a28422.functions.playerspos = 1
								end

								if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(225, 25)) then
									slot1_a29133.CloseCurrentPopup()
								end

								slot1_a29133.EndPopup()
							end
						end
					elseif mmenu == 2 then
						slot1_a29133.Hint(u8("Функция быстрой загрузки игры"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("FastLoad"), patchfix) then
							slot34_a28422.functionsfps.patchfix = patchfix.v

							if patchfix.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n FastLoad включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n FastLoad выключен!", 228, os.date()), 5)
							end
						end

						slot1_a29133.Hint(u8("Функция убирает названия семья на персонаже"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("FamOff"), famvisible) then
							slot34_a28422.functions.famvisible = famvisible.v

							if famvisible.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nFamOff включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nFamOff выключен!", 228, os.date()), 5)
							end
						end

						slot1_a29133.Hint(u8("Функция очищает память в зоне стрима если буффер больше 400 мегабайт"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("BufferCleaner"), buffercleaner) then
							slot34_a28422.functionsfps.buffercleaner = buffercleaner.v

							if buffercleaner.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n BufferCleaner включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n BufferCleaner выключен!", 228, os.date()), 5)
							end
						end

						slot1_a29133.Hint(u8("Блокировать обновление списка игроков (Tab)"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("TabFix"), tabfix) then
							slot34_a28422.functionsfps.tabfix = tabfix.v

							if tabfix.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n TabFix включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n TabFix выключен!", 228, os.date()), 5)
							end
						end

						slot1_a29133.Hint(u8("Полностью удаляет транспорт в радиусе стрима"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("DellCar"), del_car) and del_car.v then
							for slot3_a20467, slot4_a20470 in ipairs(getAllVehicles()) do
								deleteCar(slot4_a20470)
							end
						end

						slot1_a29133.Hint(u8("Полностью удаляет людей в радиусе стрима"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("DellPed"), del_ped) then
							for slot3_a20490, slot4_a20497 in ipairs(getAllChars()) do
								if doesCharExist(slot4_a20497) then
									local slot5_a20499, slot6_a20503 = sampGetPlayerIdByCharHandle(slot4_a20497)

									if slot6_a20503 ~= myid then
										deletePlayer(slot6_a20503)

										npc[#npc + 1] = slot6_a20503
									end
								end
							end

							if not del_ped.v then
								for slot3_a20519 = 1, #npc do
									slot46_a25139(npc[slot3_a20519], infnpc[npc[slot3_a20519]])

									npc[slot3_a20519] = nil
								end
							end
						end

						slot1_a29133.Hint(u8("Полностью удаляет 3D текст в радиусе стрима(описание, фама и тд)"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("Dell3D"), del_3d) then
							removeAll3dText()
						end

						slot1_a29133.Hint(u8("Отключение лодов авто"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("FPS UP Car"), loadoff) then
							slot34_a28422.functionsfps.loadoff = loadoff.v

							if loadoff.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n FPS UP Car включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n FPS UP Car выключен!", 228, os.date()), 5)
							end
						end

						slot1_a29133.Hint(u8("Функция отключения эффектов"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("EffectOff"), effectoff) then
							slot34_a28422.functionsfps.effectoff = effectoff.v

							if effectoff.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n EffectOff включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n EffectOff выключен!", 228, os.date()), 5)
							end
						end

						slot1_a29133.Hint(u8("Блокирует нажатие Alt + Enter тем самым не сворачивает игру в режим окна"))
						slot1_a29133.SameLine()

						if slot1_a29133.Checkbox(u8("AntiAltEnter"), altenter) then
							slot34_a28422.functionsfps.altenter = altenter.v

							if altenter.v then
								if slot17_a28610.save(slot34_a28422, "helper.ini") then
									slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n AntiAltEnter включен!", 228, os.date()), 5)
								end
							elseif slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\n AntiAltEnter выключен!", 228, os.date()), 5)
							end
						end
					elseif mmenu == 3 then
						-- Nothing
					elseif mmenu == 4 then
						slot1_a29133.PushItemWidth(50)

						for slot3_a20707 = 1, #klavabind do
							slot1_a29133.InputText("##dlmsodj1" .. slot3_a20707, klavabind[slot3_a20707][2])
							slot1_a29133.SameLine()
							slot1_a29133.Text(klavabind[slot3_a20707][1])
						end

						slot1_a29133.PopItemWidth()

						if slot1_a29133.Button(u8("Сохранить ") .. slot3_a9760.ICON_FA_SAVE, slot1_a29133.ImVec2(590, 35)) then
							slot34_a28422.bindertestchect.command1 = comman1.v
							slot34_a28422.bindertestchect.command2 = comman2.v
							slot34_a28422.bindertestchect.command3 = comman3.v
							slot34_a28422.bindertestchect.command4 = comman4.v
							slot34_a28422.bindertestchect.command6 = comman6.v
							slot34_a28422.bindertestchect.command7 = comman7.v
							slot34_a28422.bindertestchect.command8 = comman8.v
							slot34_a28422.bindertestchect.command10 = comman10.v
							slot34_a28422.bindertestchect.command11 = comman11.v
							slot34_a28422.bindertestchect.command12 = comman12.v
							slot34_a28422.bindertestchect.command15 = comman15.v
							slot34_a28422.bindertestchect.command16 = comman16.v
							slot34_a28422.bindertestchect.command17 = comman17.v

							if slot17_a28610.save(slot34_a28422, "helper.ini") then
								slot13_a25131.addNotification(string.format("Сохранение настроек!\n\nНастройки успешно сохранены!", 228, os.date()), 5)
								thisScript():reload()
							end
						end
					end

					slot1_a29133.EndChild()

					if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(600, 34)) then
						newmenu.v = false
					end
				end

				slot1_a29133.Columns(1)
				slot1_a29133.End()
			else
				newmenu.v = false
			end

			if stats.v then
				slot1_a29133.GetStyle().WindowRounding = 10
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Text] = slot1_a29133.ImVec4(slot34_a28422.color.color_rh, slot34_a28422.color.color_gh, slot34_a28422.color.color_bh, slot34_a28422.color.color_ah)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(slot34_a28422.color.color_r, slot34_a28422.color.color_g, slot34_a28422.color.color_b, slot34_a28422.color.color_a)

				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(slot34_a28422.cord.xCoord, slot34_a28422.cord.yCoord), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.Begin(u8("[Universal Helper] Оверлей"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoBringToFrontOnFocus + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar)
				slot1_a29133.SetMouseCursor(slot1_a29133.MouseCursor.None)

				_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
				money = separator(slot34_a28422.obnylenie.shet .. " $")

				if slot34_a28422.infostat.nickon then
					slot1_a29133.Text(string.format(u8("Ник: %s [%s]"), sampGetPlayerNickname(id), id))
				end

				if slot34_a28422.infostat.serveron then
					for slot3_a21028, slot4_a21044 in ipairs(stable) do
						if sampGetCurrentServerName():find(slot4_a21044) then
							slot1_a29133.Text(string.format(u8("Игровой сервер: Arizona %s "), slot4_a21044))
						end
					end
				end

				if slot34_a28422.infostat.dataon then
					slot1_a29133.Text(os.date(u8("Дата | Время: %d.%m.%y | %H:%M:%S "), os.time()))
				end

				if slot34_a28422.infostat.pingon then
					slot1_a29133.Text(string.format(u8("Пинг: %s"), sampGetPlayerPing(id)))
				end

				if slot34_a28422.infostat.kbon then
					slot1_a29133.Text(string.format(u8("Квадрат: %s"), u8(kvadrat())))
				end

				if slot34_a28422.infostat.maskon then
					minmask = math.floor(mask / 60)
					secmask = mask % 60

					if not maskobeta then
						slot1_a29133.Text(u8("Маска: Не использована"))
					elseif secmask >= 10 and tonumber(minmask) >= 10 then
						slot1_a29133.Text(string.format(u8("Маска: %s:%s"), minmask, secmask))
					elseif secmask < 10 and tonumber(minmask) >= 10 then
						slot1_a29133.Text(string.format(u8("Маска: %s:0%s"), minmask, secmask))
					elseif secmask >= 10 and tonumber(minmask) < 10 then
						slot1_a29133.Text(string.format(u8("Маска: 0%s:%s"), minmask, secmask))
					elseif secmask < 10 and tonumber(minmask) < 10 then
						slot1_a29133.Text(string.format(u8("Маска: 0%s:0%s"), minmask, secmask))
					end
				end

				if slot34_a28422.infostat.payon then
					slot1_a29133.Text(string.format(u8("Получено денег: %s"), money))
				end

				if slot34_a28422.infostat.hpon then
					if getCharHealth(playerPed) >= 0 and getCharHealth(playerPed) < 30 then
						slot1_a29133.Text(u8(string.format("Здоровье:")))
						slot1_a29133.SameLine()
						im_colored_text_with_shadow(slot1_a29133.ImColor(255, 0, 0).v, u8(string.format("%s", getCharHealth(playerPed))))
					elseif getCharHealth(playerPed) >= 30 and getCharHealth(playerPed) < 85 then
						slot1_a29133.Text(u8(string.format("Здоровье:")))
						slot1_a29133.SameLine()
						im_colored_text_with_shadow(slot1_a29133.ImColor(255, 255, 0).v, u8(string.format("%s", getCharHealth(playerPed))))
					elseif getCharHealth(playerPed) >= 85 then
						slot1_a29133.Text(u8(string.format("Здоровье:")))
						slot1_a29133.SameLine()
						im_colored_text_with_shadow(slot1_a29133.ImColor(0, 128, 0).v, u8(string.format("%s", getCharHealth(playerPed))))
					else
						slot1_a29133.Text(u8(string.format("Здоровье: %s", getCharHealth(playerPed))))
					end
				end

				if slot34_a28422.infostat.armon then
					slot1_a29133.Text(string.format(u8("Армор: %s"), sampGetPlayerArmor(id)))
				end

				if slot34_a28422.infostat.onlineson then
					slot1_a29133.Text(u8("Текущая сессия: " .. get_timer(slot40_a26631)))
				end

				if slot34_a28422.infostat.onlinafk then
					slot1_a29133.Text(u8("АФК за сессию: " .. get_timer(afktimer)))
				end

				if slot34_a28422.infostat.onlineon then
					slot1_a29133.Text(u8("Онлайн за день: " .. get_timer(slot34_a28422.obnylenie.online)))
				end

				if onlinafkday.v then
					slot1_a29133.Text(u8("АФК за день: " .. get_timer(slot34_a28422.obnylenie.onlineafk + afktimer)))
				end

				if slot34_a28422.infostat.fpson then
					slot1_a29133.Text("FPS:")
					slot1_a29133.SameLine()
					slot1_a29133.Text(tostring(fraimrei))
				end

				if slot34_a28422.infostat.arendaon then
					getarenda()
				end

				if isCharInAnyCar(PLAYER_PED) then
					car = storeCarCharIsInNoSave(playerPed)
					_, cid = sampGetVehicleIdByCarHandle(car)
					carmodel = getCarModel(car)

					if slot34_a28422.infostat.hpcaron then
						slot1_a29133.Text(u8("ХП машины: ") .. getCarHealth(car))
					end

					if slot34_a28422.infostat.idcaron then
						slot1_a29133.Text(u8("ID машины: ") .. cid)
					end

					if slot34_a28422.infostat.modelcaron then
						slot1_a29133.Text(u8("Транспорт: ") .. getGxtText(getNameOfVehicleModel(carmodel)) .. " [" .. carmodel .. "]")
					end
				end

				if slot34_a28422.infostat.afkon then
					if checkk then
						slot1_a29133.Text(u8(string.format("АнтиАфк:")))
						slot1_a29133.SameLine()
						im_colored_text_with_shadow(slot1_a29133.ImColor(0, 128, 0).v, u8(string.format("Включено")))
					else
						slot1_a29133.Text(u8(string.format("АнтиАфк:")))
						slot1_a29133.SameLine()
						im_colored_text_with_shadow(slot1_a29133.ImColor(255, 0, 0).v, u8(string.format("Выключено")))
					end
				end

				slot1_a29133.End()
			end

			theme2()

			if killinfo.v then
				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.SetNextWindowSize(slot1_a29133.ImVec2(290, 470), slot1_a29133.Cond.FirstUseEver)
				slot1_a29133.Begin(u8("##Информация о стрельбе"), killinfo, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoTitleBar + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoResize)

				if killinfomenu == true then
					slot1_a29133.CenterText(u8("Информация за сессию"))
					slot1_a29133.BeginChild("##sdfgsodmf", slot1_a29133.ImVec2(270, 115), true, slot1_a29133.WindowFlags.NoScrollbar)
					slot1_a29133.Columns(2, "kilinfo", true)
					slot1_a29133.Text(u8("Убито:"))
					slot1_a29133.NextColumn()
					slot1_a29133.Text(tostring(s_kills))
					slot1_a29133.Separator()
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8("Урон:"))
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8(math.floor(s_damage)))
					slot1_a29133.Separator()
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8("Смертей:"))
					slot1_a29133.NextColumn()
					slot1_a29133.Text(tostring(s_death))
					slot1_a29133.Separator()
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8("К|Д:"))
					slot1_a29133.NextColumn()

					if tostring(s_kills / s_death) == "nan" then
						slot1_a29133.Text(u8("0.00"))
					else
						slot1_a29133.Text(tostring(s_kills / s_death))
					end

					slot1_a29133.Separator()
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8("Серия убийств :"))
					slot1_a29133.NextColumn()
					slot1_a29133.Text(tostring(killstrik))
					slot1_a29133.Columns(1)
					slot1_a29133.EndChild()
					slot1_a29133.CenterText(u8("Информация за все время"))
					slot1_a29133.BeginChild("##sdfgsodm44f", slot1_a29133.ImVec2(270, 115), true, slot1_a29133.WindowFlags.NoScrollbar)
					slot1_a29133.Columns(2, "kilinfo2", true)
					slot1_a29133.Text(u8("Убито всего:"))
					slot1_a29133.NextColumn()
					slot1_a29133.Text(tostring(slot34_a28422.killinfo.a_kills))
					slot1_a29133.Separator()
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8("Урона всего:"))
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8(math.floor(slot34_a28422.killinfo.a_damage)))
					slot1_a29133.Separator()
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8("Смертей всего:"))
					slot1_a29133.NextColumn()
					slot1_a29133.Text(tostring(slot34_a28422.killinfo.a_death))
					slot1_a29133.Separator()
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8("Общие К|Д:"))
					slot1_a29133.NextColumn()

					if tostring(slot34_a28422.killinfo.a_kills / slot34_a28422.killinfo.a_death) == "nan" then
						slot1_a29133.Text(u8("0.00"))
					else
						slot1_a29133.Text(tostring(slot34_a28422.killinfo.a_kills / slot34_a28422.killinfo.a_death))
					end

					slot1_a29133.Separator()
					slot1_a29133.NextColumn()
					slot1_a29133.Text(u8("Серия убийств:"))
					slot1_a29133.NextColumn()
					slot1_a29133.Text(tostring(slot34_a28422.killinfo.killstrik))
					slot1_a29133.Columns(1)
					slot1_a29133.EndChild()
					slot1_a29133.CenterText(u8("Статистика оружия"))
					slot1_a29133.BeginChild("##sdfhtygs18", slot1_a29133.ImVec2(270, 70), true)
					slot1_a29133.CenterText(u8("Игровое время с Deagle: ") .. get_timer(slot34_a28422.killinfo.deagle_time))
					slot1_a29133.CenterText(u8("Игровое время с M4A1: ") .. get_timer(slot34_a28422.killinfo.m4_time))
					slot1_a29133.CenterText(u8("Игровое время с Shotgun: ") .. get_timer(slot34_a28422.killinfo.shot_time))
					slot1_a29133.EndChild()
				else
					slot1_a29133.CenterText(u8("Лог убийств"))
					slot1_a29133.BeginChild("##sdfhty8", slot1_a29133.ImVec2(270, 161), true)

					for slot3_a21873 = 1, #kills do
						slot1_a29133.Text(kills[slot3_a21873] .. "[" .. killsid[slot3_a21873] .. "]")

						if slot1_a29133.IsItemClicked(0) and setClipboardText(kills[slot3_a21873]) then
							printStringNow("NICK " .. kills[slot3_a21873] .. " COPY", 1000)
						end
					end

					slot1_a29133.EndChild()
					slot1_a29133.CenterText(u8("Лог смертей"))
					slot1_a29133.BeginChild("##sdfhtyfdnm8", slot1_a29133.ImVec2(270, 161), true)

					for slot3_a21923 = 1, #deathkill do
						slot1_a29133.Text(deathkill[slot3_a21923] .. "[" .. deathkillid[slot3_a21923] .. "] >> " .. killweapon[slot3_a21923])

						if slot1_a29133.IsItemClicked(0) and setClipboardText(deathkill[slot3_a21923]) then
							printStringNow("NICK " .. deathkill[slot3_a21923] .. " COPY", 1000)
						end
					end

					slot1_a29133.EndChild()
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_REDO_ALT .. u8(" Обнулить статистику"), slot1_a29133.ImVec2(270, 25)) then
					slot34_a28422.killinfo.a_kills = tonumber(0)
					slot34_a28422.killinfo.a_death = tonumber(0)
					slot34_a28422.killinfo.a_damage = tonumber(0)
					slot34_a28422.killinfo.shot_time = tonumber(0)
					slot34_a28422.killinfo.m4_time = tonumber(0)
					slot34_a28422.killinfo.deagle_time = tonumber(0)
					slot34_a28422.killinfo.killstrik = tonumber(0)

					slot17_a28610.save(slot34_a28422, "helper.ini")

					s_death = 0
					s_kills = 0
					s_damage = 0
					kills = {}
					killsid = {}
					deathkill = {}
					deathkillid = {}
					killweapon = {}
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_SKULL .. u8(" Лог Смерти|Убийств"), slot1_a29133.ImVec2(270, 25)) then
					killinfomenu = not killinfomenu
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(270, 25)) then
					killinfo.v = not killinfo.v
				end

				slot1_a29133.End()
			end

			if customreport.v then
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Text] = slot1_a29133.ImVec4(1, 1, 1, 1)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.WindowBg] = slot1_a29133.ImVec4(0.06, 0.05, 0.07, 0.95)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Button] = slot1_a29133.ImVec4(0.181, 0.36, 0.864, 0.8)
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.Header] = slot1_a29133.ImVec4(0.26, 0.47, 0.98, 1)

				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.SetNextWindowSize(slot1_a29133.ImVec2(400, 180), slot1_a29133.Cond.FirstUseEver)
				slot1_a29133.Begin(u8("[Universal Helper] Репорт"), customreport, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoBringToFrontOnFocus + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoTitleBar)
				slot1_a29133.Separator()
				slot1_a29133.CenterText(u8("[Universal Helper] Репорт"))
				slot1_a29133.Separator()
				slot1_a29133.TextColoredRGB("{FF0000}* {FFFFFF}Создать кнопки возможно в настройках функции.\n{FF0000}*{FFFFFF} Минимальное количество символов - 6, максимальное - 144.\n{FF0000}*{FFFFFF} В поле ввода возможно оправить репорт на 'Enter'.")
				slot1_a29133.Separator()
				slot1_a29133.CenterText(u8("Суть жалобы/вопроса:"))
				slot1_a29133.PushItemWidth(390)

				if slot1_a29133.InputText("##123213", inputreport, slot1_a29133.InputTextFlags.EnterReturnsTrue) then
					if inputreport.v ~= "" and inputreport.v ~= nil then
						local slot2_a22189 = 1

						sampSendDialogResponse(32, slot2_a22189, _, tags(u8:decode(inputreport.v)))

						customreport.v = false
						inputreport.v = ""
					else
						sampAddChatMessage("[Universal Helper] {FFFFFF}Введите вопрос, либо закройте репорт!", 6591981)
					end
				end

				slot1_a29133.Separator()

				reportkolvo = 0

				if slot1_a29133.Button(u8("Рекон"), slot1_a29133.ImVec2(125, 25)) then
					inputreport.v = u8("Зайдите за мной в рекон!")
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Флип"), slot1_a29133.ImVec2(125, 25)) then
					inputreport.v = u8("Флипните меня пожалуйста.")
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Спавн"), slot1_a29133.ImVec2(125, 25)) then
					inputreport.v = u8("Заспавните меня пожалуйста.")
				end

				for slot3_a22299, slot4_a22266 in pairs(slot34_a28422.reportname) do
					if slot1_a29133.Button(u8(slot4_a22266), slot1_a29133.ImVec2(125, 25)) then
						if slot34_a28422.reportotvet[slot3_a22299] ~= "" then
							inputreport.v = u8(tags(slot34_a28422.reportotvet[slot3_a22299]))
						else
							sampAddChatMessage("[Universal Helper] {FF0000}[Ошибка] {FFFFFF}Введите ответ, либо закройте репорт.", 6591981)
						end
					end

					reportkolvo = reportkolvo + 1

					if reportkolvo == 3 then
						reportkolvo = 0
					elseif #slot34_a28422.reportname ~= slot3_a22299 then
						slot1_a29133.SameLine()
					end
				end

				slot1_a29133.Separator()

				if slot1_a29133.Button(u8("Отправить"), slot1_a29133.ImVec2(194, 25)) then
					local slot1_a22315 = 32

					sampSendDialogResponse(slot1_a22315, 1, _, tags(u8:decode(inputreport.v)))

					customreport.v = false
					inputreport.v = ""
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(190, 25)) then
					customreport.v = false

					sampSendDialogResponse(32, 0, 0)
					sampCloseCurrentDialogWithButton(0)
				end

				slot1_a29133.End()
			end

			if colorcar.v then
				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.Begin(u8("[Universal Helper] ID Colors"), colorcar, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoResize)
				slot1_a29133.Image(color_png, slot1_a29133.ImVec2(ScreenX - 150, ScreenY - 250))
				slot1_a29133.End()
			end

			if cararenda.v and isCharInAnyCar(PLAYER_PED) and customarenda.v then
				slot1_a29133.LockPlayer = true

				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.Begin(u8("[Universal Helper] Аренда авто"), cararenda, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoResize)
				slot1_a29133.BeginChild("##и123ognjdoihjf", slot1_a29133.ImVec2(280, 70), true, slot1_a29133.WindowFlags.NoScrollbar)
				slot1_a29133.Columns(2)
				slot1_a29133.SetColumnWidth(-1, 150)
				slot1_a29133.CenterColumnText(u8("Модель"))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 175)
				slot1_a29133.CenterColumnText(u8("Стоимость"))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.SetColumnWidth(-1, 150)
				slot1_a29133.CenterColumnText(tostring(modelcar))
				slot1_a29133.NextColumn()
				slot1_a29133.SetColumnWidth(-1, 175)
				slot1_a29133.CenterColumnText(tostring(pricecar .. " $"))
				slot1_a29133.NextColumn()
				slot1_a29133.Separator()
				slot1_a29133.Columns(1)
				slot1_a29133.CenterText(u8("Выберите тип аренды"))
				slot1_a29133.EndChild()

				if slot1_a29133.Button(u8("Платная [Legit]"), slot1_a29133.ImVec2(136, 25)) then
					sampSendDialogResponse(230, 1)

					cararenda.v = false

					sampSendChat("/engine")
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Бесплатная [Rage]"), slot1_a29133.ImVec2(136, 25)) then
					freearenda = not freearenda
					cararenda.v = false

					sampAddChatMessage("[Universal Helper]{FFFFFF} Внимание, в реконе ваш двигатель отображается как {FF0000}ВЫКЛЮЧЕННЫЙ!", 6591981)
				end

				if slot1_a29133.Button(u8("Отмена"), slot1_a29133.ImVec2(280, 25)) then
					sampSendDialogResponse(230, 0)

					cararenda.v = false
				end

				slot1_a29133.End()
			end

			if settingsweather.v then
				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 1.1), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.Begin(u8("[Universal Helper] Настройка погоды"), settingsweather, slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize)
				slot1_a29133.BeginChild("##настройка погоды", slot1_a29133.ImVec2(300, 60), true)

				if weatherсhanger.v then
					if slot1_a29133.SliderInt(u8("Время"), slider_time, 0, 23) then
						slot34_a28422.slider.slider_time = tonumber(slider_time.v)

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end

					if slot1_a29133.SliderInt(u8("Погода"), slider_day, 0, 45) then
						slot34_a28422.slider.slider_day = tonumber(slider_day.v)

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end
				end

				slot1_a29133.EndChild()

				if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(300, 25)) then
					settingsweather.v = not settingsweather.v
				end

				slot1_a29133.End()
			end

			if connectarz.v then
				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.SetNextWindowSize(slot1_a29133.ImVec2(300, 175), slot1_a29133.Cond.FirstUseEver)
				slot1_a29133.Begin(u8("##коннект арз"), connectarz, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoTitleBar + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoResize)
				slot1_a29133.CenterText(u8("Выберите сервер для подключения"))

				_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)

				slot1_a29133.PushItemWidth(280)
				slot1_a29133.Combo(u8("##server"), serverarz, stable, -1)
				slot1_a29133.PushItemWidth(130)
				slot1_a29133.InputText(u8("##connectars"), connectname)
				slot1_a29133.SameLine()
				slot1_a29133.TextDisabled(u8("Ник для подключения"))

				if slot1_a29133.ToggleButton("##aw312321n", autorecon) then
					if slot34_a28422.functions.autorecon == false then
						slot34_a28422.functions.autorecon = true

						slot17_a28610.save(slot34_a28422, "helper.ini")
					else
						slot34_a28422.functions.autorecon = false

						slot17_a28610.save(slot34_a28422, "helper.ini")
					end
				end

				slot1_a29133.SameLine()
				slot1_a29133.Text(u8("Авто-реконнект"))

				if autorecon.v then
					slot1_a29133.SameLine()
					slot1_a29133.PushItemWidth(150)

					if slot1_a29133.SliderInt(u8("##Co23123123gdgm"), timerecon, 1, 30) then
						slot34_a28422.config.timerecon = timerecon.v
					end
				end

				slot1_a29133.TextColoredRGB("{FFFFFF}Рекомендуется установить {FF0000} ResetRemove.asi")

				if slot1_a29133.Button(slot3_a9760.ICON_FA_NETWORK_WIRED .. u8(" Подключиться"), slot1_a29133.ImVec2(285, 25)) then
					sampSetLocalPlayerName(u8:decode(connectname.v))

					if serverarz.v == 0 then
						sampConnectToServer("185.169.134.3", 7777)
					elseif serverarz.v == 1 then
						sampConnectToServer("185.169.134.4", 7777)
					elseif serverarz.v == 2 then
						sampConnectToServer("185.169.134.43", 7777)
					elseif serverarz.v == 3 then
						sampConnectToServer("185.169.134.44", 7777)
					elseif serverarz.v == 4 then
						sampConnectToServer("185.169.134.45", 7777)
					elseif serverarz.v == 5 then
						sampConnectToServer("185.169.134.5", 7777)
					elseif serverarz.v == 6 then
						sampConnectToServer("185.169.134.59", 7777)
					elseif serverarz.v == 7 then
						sampConnectToServer("185.169.134.61", 7777)
					elseif serverarz.v == 8 then
						sampConnectToServer("185.169.134.107", 7777)
					elseif serverarz.v == 9 then
						sampConnectToServer("185.169.134.109", 7777)
					elseif serverarz.v == 10 then
						sampConnectToServer("185.169.134.166", 7777)
					elseif serverarz.v == 11 then
						sampConnectToServer("185.169.134.171", 7777)
					elseif serverarz.v == 12 then
						sampConnectToServer("185.169.134.172", 7777)
					elseif serverarz.v == 13 then
						sampConnectToServer("185.169.134.173", 7777)
					elseif serverarz.v == 14 then
						sampConnectToServer("185.169.134.174", 7777)
					end

					connectarz.v = not connectarz.v
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(285, 25)) then
					connectarz.v = not connectarz.v
				end

				slot1_a29133.End()
			end

			if skinc.v then
				slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ChildWindowBg] = slot1_a29133.ImVec4(0, 0, 0, 0)

				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.Begin(u8("[Universal Helper] Skin Changer"), skinc, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoSavedSettings + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.AlwaysAutoResize)

				kl = 0
				posvehx = 5
				posvehy = 75
				postextx = 10
				postexty = 95

				if checkskin == true then
					slot1_a29133.CenterText(u8("Выберите нужный вам скин кликом ЛКМ"))
					slot1_a29133.CenterText(u8("Если у вас нету изображения - перезапустите скрипт [CRTL + R]"))
					slot1_a29133.Separator()

					for slot3_a23067 = 0, 311 do
						slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(posvehx, posvehy))
						slot1_a29133.BeginChild("##12dsgpokd" .. slot3_a23067, slot1_a29133.ImVec2(55, 100))
						slot1_a29133.EndChild()

						if slot1_a29133.IsItemHovered() then
							slot1_a29133.BeginTooltip()
							slot1_a29133.PushTextWrapPos(450)
							slot1_a29133.TextUnformatted(u8("Ид скина: " .. slot3_a23067 .. "\nНажмите ЛКМ чтобы установить скин"))
							slot1_a29133.PopTextWrapPos()
							slot1_a29133.EndTooltip()
						end

						if slot1_a29133.IsItemClicked() then
							MODEL = slot3_a23067
							_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)

							set_player_skin(id, MODEL)

							skinc.v = false

							sampAddChatMessage(string.format("[Universal Helper] {FFFFFF} Вы выбрали скин под ID [%d]", MODEL), 6591981)
						end

						slot1_a29133.SetCursorPos(slot1_a29133.ImVec2(posvehx, posvehy))
						slot1_a29133.Image(skinpng[slot3_a23067], slot1_a29133.ImVec2(55, 100))

						postextx = postextx + 100
						posvehx = posvehx + 70
						kl = kl + 1

						if kl > 11 then
							kl = 0
							posvehx = 5
							postextx = 10
							posvehy = posvehy + 120
							postexty = posvehy + 900
						end
					end
				else
					slot1_a29133.CenterText(u8("Происходит загрузка нужных файлов"))
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(50)
					getstatus()
					slot1_a29133.NewLine()
					slot1_a29133.SameLine(120)
					slot1_a29133.Spinner("##12312312пп", 15, 3, slot1_a29133.GetColorU32(slot1_a29133.GetStyle().Colors[slot1_a29133.Col.ButtonHovered]))

					if slot1_a29133.Button(u8("Проверить и запустить"), slot1_a29133.ImVec2(250, 25)) and doesFileExist("moonloader\\config\\Universal Helper\\peds\\skin_311.png") then
						for slot3_a23186 = 0, 311 do
							skinpng[slot3_a23186] = slot1_a29133.CreateTextureFromFile(getGameDirectory() .. "\\moonloader\\config\\Universal Helper\\peds\\skin_" .. slot3_a23186 .. ".png")
						end

						checkskin = true
					end
				end

				slot1_a29133.End()
			end

			if vzaimod.v and isPlayerStreamed(slot39_a27480) and distanceBetweenPlayer(slot39_a27480) < 25 then
				slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
				slot1_a29133.Begin(u8("[Universal Helper] Меню взаимодействий"), vzaimod, slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize)
				slot1_a29133.BeginChild("##g_sexbar", slot1_a29133.ImVec2(370, 310), true, slot1_a29133.WindowFlags.NoScrollbar)
				setmark()

				if slot1_a29133.Button(u8("Показать паспорт")) then
					lua_thread.create((function ()
						sampSendChat("/do В кармане был паспорт.")
						wait(2000)
						sampSendChat("/todo Вот держите!*засунул руку в карман, взял паспорт и передал его " .. sampGetPlayerNickname(slot39_a27480))
						wait(2000)
						sampSendChat(string.format(u8("/showpass %s"), slot39_a27480))
					end))

					vzaimod.v = false
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Показать мед-карту")) then
					lua_thread.create((function ()
						sampSendChat("/do В кармане была выписка из больницы.")
						wait(2000)
						sampSendChat("/todo Вот моя мед.карта!*засунул руку в карман, взял мед.карту и передал " .. sampGetPlayerNickname(slot39_a27480))
						wait(2000)
						sampSendChat(string.format(u8("/showmc %s"), slot39_a27480))
					end))

					vzaimod.v = false
				end

				slot1_a29133.SameLine()

				if slot1_a29133.Button(u8("Показать скиллы")) then
					lua_thread.create((function ()
						sampSendChat("/do В кармане была выписка из тира.")
						wait(2000)
						sampSendChat("/me достал выписку из тира и передал ее " .. sampGetPlayerNickname(slot39_a27480))
						wait(2000)
						sampSendChat(string.format(u8("/showskill %s"), slot39_a27480))
					end))

					vzaimod.v = false
				end

				if slot1_a29133.Button(u8("Показать лицензии"), slot1_a29133.ImVec2(360, 20)) then
					lua_thread.create((function ()
						sampSendChat("/do В руках находится пакет с лицензиями.")
						wait(2000)
						sampSendChat("/me открыл пакет, достал от туда нужные лицензии и передал их " .. sampGetPlayerNickname(slot39_a27480))
						wait(2000)
						sampSendChat("Вот держите это все мои лицензии.")
						sampSendChat(string.format(u8("/showlic %s"), slot39_a27480))
					end))

					vzaimod.v = false
				end

				slot1_a29133.Separator()

				if slot1_a29133.Button(u8("Пригласить во фракцию"), slot1_a29133.ImVec2(360, 20)) then
					lua_thread.create((function ()
						sampSendChat("/todo Хорошо , вот держи это ваша новая форма*передал форму человеку напротив")
						wait(2000)
						sampSendChat(string.format(u8("/invite %s"), slot39_a27480))
					end))

					vzaimod.v = false
				end

				if slot1_a29133.Button(u8("Уволить из фракции"), slot1_a29133.ImVec2(360, 20)) then
					slot1_a29133.OpenPopup(u8("Уволить"))
				end

				if slot1_a29133.BeginPopupModal(u8("Уволить"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoTitleBar + slot1_a29133.WindowFlags.AlwaysAutoResize) then
					slot1_a29133.SameLine(80)
					slot1_a29133.TextDisabled(u8("Введите причину увольнения"))
					slot1_a29133.PushItemWidth(300)

					if slot1_a29133.InputText(u8("##127"), yval, slot1_a29133.InputTextFlags.EnterReturnsTrue) then
						if yval.v ~= "" and yval.v ~= nil then
							local slot0_a23484 = sampSendChat
							local slot1_a23485 = "/uninvite "
							local slot2_a23486 = slot39_a27480
							local slot3_a23487 = " "
							local slot4_a23488 = u8

							slot0_a23484(slot1_a23485 .. slot2_a23486 .. slot3_a23487 .. slot4_a23488:decode(yval.v))

							yval.v = ""

							slot1_a29133.CloseCurrentPopup()
						else
							sendchat("Введите причину увольнения!")
						end
					end

					slot1_a29133.NewLine()

					if slot1_a29133.Button(u8("Уволить"), slot1_a29133.ImVec2(300, 25)) then
						if yval.v ~= "" and yval.v ~= nil then
							local slot0_a23519 = sampSendChat
							local slot1_a23520 = "/uninvite "
							local slot2_a23521 = slot39_a27480
							local slot3_a23522 = " "
							local slot4_a23523 = u8

							slot0_a23519(slot1_a23520 .. slot2_a23521 .. slot3_a23522 .. slot4_a23523:decode(yval.v))

							yval.v = ""

							slot1_a29133.CloseCurrentPopup()
						else
							sendchat("Введите причину увольнения!")
						end
					end

					if slot1_a29133.Button(u8("Отмена"), slot1_a29133.ImVec2(300, 25)) then
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.EndPopup()
				end

				if slot1_a29133.Button(u8("Повысить / Понизить"), slot1_a29133.ImVec2(360, 20)) then
					slot1_a29133.OpenPopup(u8("Повышения"))
				end

				if slot1_a29133.BeginPopupModal(u8("Повышения"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoTitleBar + slot1_a29133.WindowFlags.AlwaysAutoResize) then
					slot1_a29133.SameLine(100)
					slot1_a29133.TextDisabled(u8("Введите новый ранг"))
					slot1_a29133.PushItemWidth(300)

					if slot1_a29133.InputText(u8("##1253"), rank, slot1_a29133.InputTextFlags.EnterReturnsTrue) then
						if rank.v ~= "" and rank.v ~= nil then
							local slot0_a23623 = sampSendChat
							local slot1_a23624 = "/giverank "
							local slot2_a23625 = slot39_a27480
							local slot3_a23626 = " "
							local slot4_a23627 = u8

							slot0_a23623(slot1_a23624 .. slot2_a23625 .. slot3_a23626 .. slot4_a23627:decode(rank.v))

							rank.v = ""

							slot1_a29133.CloseCurrentPopup()
						else
							sendchat("Введите новый ранг или закройте меню!")
						end
					end

					slot1_a29133.NewLine()

					if slot1_a29133.Button(u8("Изменить ранг"), slot1_a29133.ImVec2(300, 25)) then
						if rank.v ~= "" and rank.v ~= nil then
							local slot0_a23658 = sampSendChat
							local slot1_a23659 = "/giverank "
							local slot2_a23660 = slot39_a27480
							local slot3_a23661 = " "
							local slot4_a23662 = u8

							slot0_a23658(slot1_a23659 .. slot2_a23660 .. slot3_a23661 .. slot4_a23662:decode(rank.v))

							rank.v = ""

							slot1_a29133.CloseCurrentPopup()
						else
							sendchat("Введите новый ранг или закройте меню!")
						end
					end

					if slot1_a29133.Button(u8("Отмена"), slot1_a29133.ImVec2(300, 25)) then
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.EndPopup()
				end

				slot1_a29133.Separator()

				if slot1_a29133.Button(u8("Передать оружие"), slot1_a29133.ImVec2(370, 20)) then
					if slot24_a28082.get_name(weapon) ~= "Fist" then
						slot1_a29133.OpenPopup(u8("Оружие"))
					else
						sendchat("Возьмите оружие в руку и повторите попытку!")
					end
				end

				if slot1_a29133.BeginPopupModal(u8("Оружие"), _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.NoTitleBar + slot1_a29133.WindowFlags.AlwaysAutoResize) then
					slot1_a29133.SameLine(90)
					slot1_a29133.TextDisabled(u8("Введите кол-во патрон"))
					slot1_a29133.CenterText(u8("Оружие: ") .. slot24_a28082.get_name(weapon))
					slot1_a29133.PushItemWidth(300)

					if slot1_a29133.InputText(u8("##12233"), give, slot1_a29133.InputTextFlags.EnterReturnsTrue) then
						if give.v ~= "" and give.v ~= nil then
							sampSendChat("/giveweapon " .. slot39_a27480 .. " " .. tonumber(give.v))

							give.v = ""

							sampSendChat("/me передал оружие")
							slot1_a29133.CloseCurrentPopup()
						else
							sendchat("Введите нужное кол-во патрон")
						end
					end

					slot1_a29133.NewLine()

					if slot1_a29133.Button(u8("100 ПТ"), slot1_a29133.ImVec2(95, 20)) then
						sampSendChat(string.format(u8("/giveweapon %s %s"), slot39_a27480, 200))
						sampSendChat("/me передал оружие")
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(u8("250 ПТ"), slot1_a29133.ImVec2(95, 20)) then
						sampSendChat(string.format(u8("/giveweapon %s %s"), slot39_a27480, 250))
						sampSendChat("/me передал оружие")
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(u8("500 ПТ"), slot1_a29133.ImVec2(94, 20)) then
						sampSendChat(string.format(u8("/giveweapon %s %s"), slot39_a27480, 500))
						sampSendChat("/me передал оружие")
						slot1_a29133.CloseCurrentPopup()
					end

					if slot1_a29133.Button(u8("Передать"), slot1_a29133.ImVec2(300, 25)) then
						if give.v ~= "" and give.v ~= nil then
							sampSendChat("/giveweapon " .. slot39_a27480 .. " " .. tonumber(give.v))

							give.v = ""

							slot1_a29133.CloseCurrentPopup()
						else
							sendchat("Введите нужное кол-во патрон")
						end
					end

					if slot1_a29133.Button(u8("Отмена"), slot1_a29133.ImVec2(300, 25)) then
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.EndPopup()
				end

				if slot1_a29133.Button(u8("Предложить игру в Орел/Решка(Бар)"), slot1_a29133.ImVec2(370, 20)) then
					slot1_a29133.OpenPopup("##Предложить игру в Орел/Решка(Бар)")
				end

				if slot1_a29133.Button(u8("Предложить игру на фишки(Казино)"), slot1_a29133.ImVec2(370, 20)) then
					slot1_a29133.OpenPopup("##Предложить игру на фишки(Казино)")
				end

				slot1_a29133.Separator()
				slot1_a29133.NewLine()
				slot1_a29133.NewLine()
				slot1_a29133.SameLine(65)

				if slot1_a29133.Button(u8("Создать бинд"), slot1_a29133.ImVec2(250, 30)) then
					slot1_a29133.OpenPopup("##Добавление бинда")
				end

				slot1_a29133.NewLine()
				slot1_a29133.SameLine(65)

				if showbinder then
					if slot1_a29133.Button(u8("Выкл список биндов"), slot1_a29133.ImVec2(250, 30)) then
						showbinder = not showbinder
					end
				elseif slot1_a29133.Button(u8("Вкл список биндов"), slot1_a29133.ImVec2(250, 30)) then
					if #slot34_a28422.vzbindname and #slot34_a28422.vzbind > 0 then
						showbinder = not showbinder
					else
						sendchat("У вас нету доступных биндов, создайте их чтобы открыть список!")
					end
				end

				if slot1_a29133.BeginPopupModal("##Предложить игру в Орел/Решка(Бар)", _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar) then
					slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
					slot1_a29133.SameLine(90)
					slot1_a29133.TextDisabled(u8("Введите кол-во долларов"))
					slot1_a29133.PushItemWidth(300)

					if slot1_a29133.InputText(u8("##Введите кол-во долларов"), giveorel, slot1_a29133.InputTextFlags.EnterReturnsTrue) then
						if giveorel.v ~= "" and giveorel.v ~= nil then
							sampSendChat("/orel " .. slot39_a27480 .. " " .. tonumber(giveorel.v))

							giveorel.v = ""

							slot1_a29133.CloseCurrentPopup()
						else
							sendchat("Введите кол-во долларов!")
						end
					end

					if slot1_a29133.Button(u8("250.000 $"), slot1_a29133.ImVec2(95, 20)) then
						sampSendChat(string.format(u8("/orel %s %s"), slot39_a27480, 250000))
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(u8("500.000 $"), slot1_a29133.ImVec2(95, 20)) then
						sampSendChat(string.format(u8("/orel %s %s"), slot39_a27480, 500000))
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(u8("1.000.000 $"), slot1_a29133.ImVec2(95, 20)) then
						sampSendChat(string.format(u8("/orel %s %s"), slot39_a27480, 1000000))
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.Separator()

					if slot1_a29133.Button(u8("Предложить"), slot1_a29133.ImVec2(300, 25)) then
						if #giveorel.v > 0 then
							sampSendChat(string.format(u8("/orel %s %s"), slot39_a27480, giveorel.v))
							slot1_a29133.CloseCurrentPopup()
						elseif #giveorel.v < 1 then
							sampAddChatMessage("[Universal Helper] {FFFFFF}Введите кол-во долларов!", 6591981)
						end
					end

					if slot1_a29133.Button(u8("Отмена"), slot1_a29133.ImVec2(300, 25)) then
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.EndPopup()
				end

				if slot1_a29133.BeginPopupModal("##Предложить игру на фишки(Казино)", _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar) then
					slot1_a29133.SetNextWindowPos(slot1_a29133.ImVec2(ScreenX / 2, ScreenY / 2), slot1_a29133.Cond.FirsUseEver, slot1_a29133.ImVec2(0.5, 0.5))
					slot1_a29133.SameLine(90)
					slot1_a29133.TextDisabled(u8("Введите кол-во фишек"))
					slot1_a29133.PushItemWidth(300)

					if slot1_a29133.InputText(u8("##Введите кол-во фишек"), giveorel, slot1_a29133.InputTextFlags.EnterReturnsTrue) then
						if givedice.v ~= "" and givedice.v ~= nil then
							sampSendChat("/orel " .. slot39_a27480 .. " " .. tonumber(givedice.v))

							givedice.v = ""

							slot1_a29133.CloseCurrentPopup()
						else
							sendchat("Введите кол-во фишек!")
						end
					end

					if slot1_a29133.Button(u8("2.500"), slot1_a29133.ImVec2(95, 20)) then
						sampSendChat(string.format(u8("/dice %s %s"), slot39_a27480, 2500))
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(u8("5.000 "), slot1_a29133.ImVec2(95, 20)) then
						sampSendChat(string.format(u8("/dice %s %s"), slot39_a27480, 5000))
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.SameLine()

					if slot1_a29133.Button(u8("10.000"), slot1_a29133.ImVec2(95, 20)) then
						sampSendChat(string.format(u8("/dice %s %s"), slot39_a27480, 10000))
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.Separator()

					if slot1_a29133.Button(u8("Предложить"), slot1_a29133.ImVec2(300, 25)) then
						if #givedice.v > 0 then
							sampSendChat(string.format(u8("/orel %s %s"), slot39_a27480, givedice.v))
							slot1_a29133.CloseCurrentPopup()
						elseif #givedice.v < 1 then
							sampAddChatMessage("[Universal Helper] {FFFFFF}Введите кол-во фишек!", 6591981)
						end
					end

					if slot1_a29133.Button(u8("Отмена"), slot1_a29133.ImVec2(300, 25)) then
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.EndPopup()
				end

				if slot1_a29133.BeginPopupModal("##Добавление бинда", _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoResize + slot1_a29133.WindowFlags.NoMove + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar) then
					slot1_a29133.PushItemWidth(265)
					slot1_a29133.Text(u8("Название бинда: "))
					slot1_a29133.SameLine(143)
					slot1_a29133.InputText("##штшги", addname)
					slot1_a29133.Text(u8("Содержание бинда:   "))
					slot1_a29133.SameLine()
					slot1_a29133.InputText("##штшг123и", addotvet)
					slot1_a29133.Text(u8("Достпные теги:\n{vzID} - выводит ID человека с которым вы взаимодействуете\n{vzName} - выводит ник человека с которым вы взаимодействуете"))

					if slot1_a29133.Button(u8("Добавить"), slot1_a29133.ImVec2(400, 20)) then
						if addname.v == "" or addname.v == nil or addotvet.v == nil or addotvet.v == "" then
							slot1_a29133.PushStyleColor(slot1_a29133.Col.Text, slot1_a29133.ImColor(253, 65, 63, 255):GetVec4())
							sampAddChatMessage("[Universal Helper] {FF0000}[Ошибка] {FFFFFF}Заполните все пункты!", 6591981)
							slot1_a29133.PopStyleColor()
						else
							table.insert(slot34_a28422.vzbindname, u8:decode(addname.v))
							table.insert(slot34_a28422.vzbind, u8:decode(addotvet.v))
							slot1_a29133.CloseCurrentPopup()

							local slot1_a24538 = "Вы успешно добавили бинд \""

							sendchat(slot1_a24538 .. u8:decode(addname.v) .. "\"")

							addname.v = ""
							addotvet.v = ""
						end
					end

					if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(400, 20)) then
						slot1_a29133.CloseCurrentPopup()
					end

					slot1_a29133.EndPopup()
				end

				slot1_a29133.EndChild()
				slot1_a29133.SameLine()
				slot1_a29133.BeginChild("##123123ggggr", slot1_a29133.ImVec2(200, 310), true, slot1_a29133.WindowFlags.NoScrollbar)

				vz_color = sampGetPlayerColor(slot39_a27480)
				vz_color = string.format("%06X", bit.band(vz_color, 16777215))

				slot1_a29133.TextColoredRGB("Игрок: {" .. vz_color .. "}" .. sampGetPlayerNickname(slot39_a27480) .. "[" .. slot39_a27480 .. "]")
				slot1_a29133.Columns(2, "infovz", true)
				slot1_a29133.SetColumnWidth(-1, 100)
				slot1_a29133.Separator()
				slot1_a29133.Text(u8("Уровень:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8(sampGetPlayerScore(slot39_a27480)))
				slot1_a29133.Separator()
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8("Здоровье:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8(sampGetPlayerHealth(slot39_a27480)))
				slot1_a29133.Separator()
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8("Броня:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8(sampGetPlayerArmor(slot39_a27480)))
				slot1_a29133.Separator()
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8("Пинг:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8(sampGetPlayerPing(slot39_a27480)))
				slot1_a29133.Separator()
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8("AFK:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8(sampGetPlayerPause(slot39_a27480)))
				slot1_a29133.Separator()
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8("Номер скина:"))
				slot1_a29133.NextColumn()

				local slot0_a24702, slot1_a24723 = sampGetPlayerSkin(slot39_a27480)

				if slot0_a24702 then
					slot1_a29133.Text(u8(slot1_a24723))

					if slot1_a29133.IsItemHovered() then
						slot1_a29133.BeginTooltip()
						slot1_a29133.PushTextWrapPos(450)
						slot1_a29133.Image(skinpng[slot1_a24723], slot1_a29133.ImVec2(55, 100))
						slot1_a29133.PopTextWrapPos()
						slot1_a29133.EndTooltip()
					end
				else
					slot1_a29133.Text(u8("Не найден"))
				end

				slot1_a29133.Separator()
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8("Фракция:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Text(sampGetPlayerOrganisation(slot39_a27480))
				slot1_a29133.Separator()
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8("Оружие:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8(sampGetPlayerGun(slot39_a27480)))
				slot1_a29133.Separator()
				slot1_a29133.NextColumn()

				local slot2_a24777 = table.concat(vipp, ", ")
				local slot3_a24781 = sampGetPlayerNickname(tonumber(slot39_a27480))

				slot1_a29133.Text(u8("Titan|Premium:"))
				slot1_a29133.NextColumn()
				slot1_a29133.Text(u8(slot2_a24777:find(slot3_a24781) and "Имеет" or "Не имеет"))
				slot1_a29133.Columns(1)
				slot1_a29133.Separator()

				if slot1_a29133.Button(slot3_a9760.ICON_FA_ID_CARD .. u8(" Скопировать ник"), slot1_a29133.ImVec2(185, 20)) then
					sampAddChatMessage("[Universal Helper] {FFFFFF}Игровой ник " .. sampGetPlayerNickname(slot39_a27480) .. " скопирован в буфер обмена.", 6591981)
					setClipboardText(sampGetPlayerNickname(slot39_a27480))
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_PHONE_VOLUME .. u8(" Скопировать номер"), slot1_a29133.ImVec2(185, 20)) then
					copynumber = true

					sampSendChat("/number " .. slot39_a27480)

					slot42_a10106 = 1
				end

				if slot1_a29133.Button(slot3_a9760.ICON_FA_WINDOW_CLOSE .. u8(" Закрыть"), slot1_a29133.ImVec2(185, 30)) then
					vzaimod.v = false

					removemark()
				end

				slot1_a29133.EndChild()

				if #slot34_a28422.vzbindname and #slot34_a28422.vzbind > 0 and showbinder then
					slot1_a29133.SameLine()
					slot1_a29133.BeginChild("##1212331п23ggggr", slot1_a29133.ImVec2(170, 310), true)
					slot1_a29133.CenterText(u8("Бинды"))
					slot1_a29133.Separator()

					for slot7_a24992, slot8_a24908 in pairs(slot34_a28422.vzbindname) do
						if slot1_a29133.Button(u8(slot8_a24908), slot1_a29133.ImVec2(100, 20)) then
							if slot34_a28422.vzbind[slot7_a24992] ~= "" then
								sampSendChat(slot34_a28422.vzbind[slot7_a24992])

								vzaimod.v = false
							else
								sampAddChatMessage("[Universal Helper] {FF0000}[Ошибка] {FFFFFF}Попытка отправки пустого сообщения.", 6591981)
							end
						end

						slot1_a29133.SameLine()

						if slot1_a29133.Button(slot3_a9760.ICON_FA_PEN .. "##" .. slot7_a24992, slot1_a29133.ImVec2(20, 20)) then
							slot1_a29133.OpenPopup("Редакт биндов")

							addname.v = u8(tostring(slot34_a28422.vzbindname[slot7_a24992]))
							addotvet.v = u8(tostring(slot34_a28422.vzbind[slot7_a24992]))
							check_k.v = slot7_a24992
						end

						slot1_a29133.SameLine()

						if slot1_a29133.Button(slot3_a9760.ICON_FA_TRASH .. "##" .. slot7_a24992, slot1_a29133.ImVec2(20, 20)) then
							table.remove(slot34_a28422.vzbindname, slot7_a24992)
							table.remove(slot34_a28422.vzbind, slot7_a24992)
						end
					end

					if slot1_a29133.BeginPopupModal("Редакт биндов", _, slot1_a29133.WindowFlags.NoCollapse + slot1_a29133.WindowFlags.NoScrollbar + slot1_a29133.WindowFlags.AlwaysAutoResize + slot1_a29133.WindowFlags.NoTitleBar) then
						slot1_a29133.PushItemWidth(265)
						slot1_a29133.Text(u8("Текущие название: "))
						slot1_a29133.SameLine(143)
						slot1_a29133.InputText("##штшги", addname)
						slot1_a29133.Text(u8("Содержание бинда:   "))
						slot1_a29133.SameLine()
						slot1_a29133.InputText("##штшг123и", addotvet)

						if slot1_a29133.Button(u8("Изменить"), slot1_a29133.ImVec2(400, 20)) then
							table.remove(slot34_a28422.vzbindname, check_k.v)
							table.remove(slot34_a28422.vzbind, check_k.v)
							table.insert(slot34_a28422.vzbindname, u8:decode(addname.v))
							table.insert(slot34_a28422.vzbind, u8:decode(addotvet.v))

							addname.v = ""
							addotvet.v = ""

							slot1_a29133.CloseCurrentPopup()
						end

						if slot1_a29133.Button(u8("Закрыть"), slot1_a29133.ImVec2(400, 20)) then
							addname.v = ""
							addotvet.v = ""

							slot1_a29133.CloseCurrentPopup()
						end

						slot1_a29133.EndPopup()
					end

					slot1_a29133.EndChild()
				end

				slot1_a29133.End()
			else
				if marker_1 then
					removemark()
				end

				if vzaimod.v then
					vzaimod.v = false
				end
			end
		end
	end

	function add_infokill()
		table.insert(deathkill, killernick)
		table.insert(deathkillid, killerid)
		table.insert(killweapon, killerweapon)
	end

	function nameTagOn()
		local slot0_a25157 = sampGetServerSettingsPtr()
		NTdist = slot18_a28309.getfloat(slot0_a25157 + 39)
		NTwalls = slot18_a28309.getint8(slot0_a25157 + 47)
		NTshow = slot18_a28309.getint8(slot0_a25157 + 56)

		slot18_a28309.setfloat(slot0_a25157 + 39, 1488)
		slot18_a28309.setint8(slot0_a25157 + 47, 0)
		slot18_a28309.setint8(slot0_a25157 + 56, 1)
	end

	function nameTagOff()
		local slot0_a25186 = sampGetServerSettingsPtr()

		slot18_a28309.setfloat(slot0_a25186 + 39, NTdist)
		slot18_a28309.setint8(slot0_a25186 + 47, NTwalls)
		slot18_a28309.setint8(slot0_a25186 + 56, NTshow)
	end

	function helperoff()
		lua_thread.create((function ()
			slot1_a29133.Process = false

			wait(100)
			showCursor(false, false)
			thisScript():unload()
		end))
	end

	function autoupdate(arg0, arg1, arg2)
		local slot3_a25223 = getWorkingDirectory()
		local slot4_a25224 = "\\"
		local slot5_a25227 = thisScript().name
		local slot6_a25228 = "-version.json"
		local slot3_a25240 = slot3_a25223 .. slot4_a25224 .. slot5_a25227 .. slot6_a25228

		if doesFileExist(slot3_a25240) then
			os.remove(slot3_a25240)
		end

		downloadUrlToFile(arg0, slot3_a25240, (function (arg0, arg1, arg2, arg3)
			if arg1 == slot19_a25374.STATUSEX_ENDDOWNLOAD then
				if doesFileExist(slot3_a25240) then
					local slot4_a25259 = io.open(slot3_a25240, "r")

					if io.open(slot3_a25240, "r") then
						local slot5_a25263 = decodeJson(slot4_a25259:read("*a"))
						updatelink = slot5_a25263.updateurl
						updateversion = slot5_a25263.versionunh
						updatedate = slot5_a25263.date

						slot4_a25259:close()
						os.remove(slot3_a25240)

						if updateversion ~= thisScript().version then
							lua_thread.create((function (arg0)
								local slot1_a25279 = 6591981

								sampAddChatMessage(arg0 .. "Обнаружено обновление. Обновляюсь c " .. thisScript().version .. " на " .. updateversion, slot1_a25279)
								wait(250)
								downloadUrlToFile(updatelink, thisScript().path, (function (arg0, arg1, arg2, arg3)
									if arg1 == slot19_a25374.STATUS_DOWNLOADINGDATA then
										print(string.format("Загружено %d из %d.", arg2, arg3))
									elseif arg1 == slot19_a25374.STATUS_ENDDOWNLOADDATA then
										sendconsol("Загрузка обновления завершена")
										sampAddChatMessage(arg0 .. "Обновление завершено!", slot1_a25279)

										goupdatestatus = true

										lua_thread.create((function ()
											wait(500)
											thisScript():reload()
										end))
									end

									if arg1 == slot19_a25374.STATUSEX_ENDDOWNLOAD and goupdatestatus == nil then
										sampAddChatMessage(arg0 .. "Обновление прошло неудачно. Запускаю устаревшую версию..", slot1_a25279)

										update = false
									end
								end))
							end), arg1)
						else
							update = false

							sendconsol("Обновление не требуется, версия скрипта: " .. thisScript().version .. ".v")
						end
					end
				else
					sampAddChatMessage(arg1 .. "Не удалось проверить версию скрипта!", 6591981)
					sampAddChatMessage(arg1 .. "Обновление скрипта не возможно! Обратитесь к разработчику!", 6591981)

					update = false
				end
			end
		end))

		while update ~= false do
			wait(100)
		end
	end

	function faminvitevip(arg0)
		checkplayes = slot1_a25377

		if arg0 and arg0:find("^%d+$") and tonumber(arg0) > 0 and tonumber(arg0) < 26 then
			for slot4_a25398, slot5_a25425 in pairs(getAllChars()) do
				local slot6_a25403, slot7_a25404, slot8_a25405 = getCharCoordinates(slot5_a25425)
				local slot9_a25408, slot10_a25409, slot11_a25410 = getCharCoordinates(PLAYER_PED)

				if getDistanceBetweenCoords3d(slot9_a25408, slot10_a25409, slot11_a25410, slot6_a25403, slot7_a25404, slot8_a25405) <= tonumber(arg0) and slot5_a25425 ~= 1 then
					res, id = sampGetPlayerIdByCharHandle(slot5_a25425)

					if res then
						name = sampGetPlayerNickname(id)
						strVips = table.concat(vipp, ", ")

						if strVips:find(name) then
							table.insert(checkplayes, name)
						end
					end
				end
			end

			if #checkplayes < 1 then
				sendchat("Рядом с вами нету людей с вип статусом!")
			else
				for slot4_a25457, slot5_a25461 in pairs(checkplayes) do
					sampSendChat("/faminvite " .. slot5_a25461)
				end
			end
		else
			sendchat("Используйте /ivip [Radius 1-25]")
		end
	end

	function faminviteall(arg0)
		checkplayes = slot1_a25468

		if arg0 and arg0:find("^%d+$") and tonumber(arg0) > 0 and tonumber(arg0) < 26 then
			for slot4_a25489, slot5_a25516 in pairs(getAllChars()) do
				local slot6_a25494, slot7_a25495, slot8_a25496 = getCharCoordinates(slot5_a25516)
				local slot9_a25499, slot10_a25500, slot11_a25501 = getCharCoordinates(PLAYER_PED)

				if getDistanceBetweenCoords3d(slot9_a25499, slot10_a25500, slot11_a25501, slot6_a25494, slot7_a25495, slot8_a25496) <= tonumber(arg0) and slot5_a25516 ~= 1 then
					res, id = sampGetPlayerIdByCharHandle(slot5_a25516)

					if res then
						name = sampGetPlayerNickname(id)

						table.insert(checkplayes, name)
					end
				end
			end

			if #checkplayes < 1 then
				sendchat("Рядом с вами нету людей!")
			else
				for slot4_a25538, slot5_a25542 in pairs(checkplayes) do
					sampSendChat("/faminvite " .. slot5_a25542)
				end
			end
		else
			sendchat("Используйте /iall [Radius 1-25]")
		end
	end

	function setmark()
		if marker_1 == nil then
			_, vz_hendel = sampGetCharHandleBySampPlayerId(slot39_a27480)
			marker_1 = addBlipForChar(vz_hendel)

			changeBlipColour(marker_1, 0)
		end
	end

	function removemark()
		removeBlip(marker_1)

		marker_1 = nil
	end

	function onExitScript()
		if NTdist then
			nameTagOff()
		end
	end

	function set_player_skin(arg0, arg1)
		local slot2_a25572 = raknetNewBitStream()

		raknetBitStreamWriteInt32(slot2_a25572, arg0)
		raknetBitStreamWriteInt32(slot2_a25572, arg1)
		raknetEmulRpcReceiveBitStream(153, slot2_a25572)
		raknetDeleteBitStream(slot2_a25572)
	end

	function renderFontDrawTextAlign(arg0, arg1, arg2, arg3, arg4, arg5)
		if not arg5 or arg5 == 1 then
			renderFontDrawText(arg0, arg1, arg2, arg3, arg4)
		end

		if arg5 == 2 then
			renderFontDrawText(arg0, arg1, arg2 - renderGetFontDrawTextLength(arg0, arg1) / 2, arg3, arg4)
		end

		if arg5 == 3 then
			renderFontDrawText(arg0, arg1, arg2 - renderGetFontDrawTextLength(arg0, arg1), arg3, arg4)
		end
	end

	function floorStep(arg0, arg1)
		return arg0 - arg0 % arg1
	end

	function onWindowMessage(arg0, arg1, arg2)
		if altenter.v and arg0 == 261 and arg1 == 13 then
			consumeWindowMessage(true, true)
		end

		if sampGetCurrentDialogId() == 22222 and sampIsDialogActive() and not firstKey then
			for slot6_a25662, slot7_a25667 in pairs(tKeys) do
				if arg1 == slot7_a25667 and isKeyDown(slot7_a25667) then
					firstKey = true
					firstKeyTime = floorStep(os.clock() - startTime, 0.01)
				end
			end
		end

		if (arg0 == 256 or arg0 == 257) and arg1 == 27 and customtab.v and not isPauseMenuActive() then
			consumeWindowMessage(true, false)

			if arg0 == 257 then
				customtab.v = false
			end
		end
	end

	function getarenda()
		if tonumber(secarenda) >= 1 and not isCharInAnyCar(PLAYER_PED) then
			slot1_a29133.Text(u8("Респавн аренды:"))
			slot1_a29133.SameLine()
			slot1_a29133.Text(tostring(secarenda))
		else
			secarenda = 0
		end
	end

	function getfps()
		lua_thread.create((function ()
			wait(1000)

			fraimrei = math.floor(slot18_a28309.getfloat(12045136, true))

			return true
		end))
	end

	function fastrun()
		while true do
			wait(0)
			slot18_a28309.setint8(12046052, 1)

			if antibike.v and isCharOnAnyBike(playerPed) then
				if isCarInWater(storeCarCharIsInNoSave(PLAYER_PED)) then
					setCharCanBeKnockedOffBike(PLAYER_PED, false)
				else
					setCharCanBeKnockedOffBike(PLAYER_PED, true)
				end
			else
				setCharCanBeKnockedOffBike(PLAYER_PED, false)
			end

			if isCharOnFoot(playerPed) and isKeyDown(49) and isKeyCheckAvailable() then
				setGameKeyState(16, 256)
				wait(10)
				setGameKeyState(16, 0)
			elseif isCharInWater(playerPed) and isKeyDown(49) and isKeyCheckAvailable() then
				setGameKeyState(16, 256)
				wait(10)
				setGameKeyState(16, 0)
			end

			if isCharOnAnyBike(playerPed) and isKeyCheckAvailable() and isKeyDown(160) then
				if bike[getCarModel(storeCarCharIsInNoSave(playerPed))] then
					setGameKeyState(16, 255)
					wait(10)
					setGameKeyState(16, 0)
				elseif moto[getCarModel(storeCarCharIsInNoSave(playerPed))] then
					setGameKeyState(1, -128)
					wait(10)
					setGameKeyState(1, 0)
				end
			end
		end
	end

	function getStrByState(arg0)
		if arg0 == 0 then
			return "{ffeeaa}Выкл{ffffff}"
		end

		return "{9EC73D}Вкл{ffffff}"
	end

	function isPlayerStreamed(arg0)
		local slot1_a25830, slot2_a25831 = sampGetCharHandleBySampPlayerId(arg0)

		return slot1_a25830
	end

	function hphud()
		while true do
			wait(0)

			while not isPlayerPlaying(PLAYER_HANDLE) do
				wait(0)
			end

			if hphudon.v then
				useRenderCommands(true)

				if hpcent.v then
					setTextCentre(true)
				else
					setTextCentre(false)
				end

				setTextScale(0.5, 0.8)
				setTextColour(255, 255, 255, 255)
				setTextEdge(1, 0, 0, 0, 255)
				displayTextWithNumber(578, 67.5, "NUMBER", getCharHealth(PLAYER_PED))

				if getCharArmour(PLAYER_PED) > 0 then
					if hpcent.v then
						setTextCentre(true)
					else
						setTextCentre(false)
					end

					setTextScale(0.5, 0.8)
					setTextColour(255, 255, 255, 255)
					setTextEdge(1, 0, 0, 0, 255)
					displayTextWithNumber(578, 45, "NUMBER", getCharArmour(PLAYER_PED))
				end
			end
		end
	end

	function patch_samp_time_set(arg0)
		if arg0 and default == nil then
			default = readMemory(sampGetBase() + 639136, 4, true)

			writeMemory(sampGetBase() + 639136, 4, 2242, true)
		elseif arg0 == false and default ~= nil then
			writeMemory(sampGetBase() + 639136, 4, default, true)

			default = nil
		end
	end

	function calc(arg0)
		local slot1_a25935 = load("return " .. tostring(arg0))
		local slot2_a25944 = select(2, pcall(slot1_a25935))

		return type(slot2_a25944) == "number" and slot2_a25944
	end

	function kvadrat()
		local slot0_a25950 = {
			"А",
			"Б",
			"В",
			"Г",
			"Д",
			"Ж",
			"З",
			"И",
			"К",
			"Л",
			"М",
			"Н",
			"О",
			"П",
			"Р",
			"С",
			"Т",
			"У",
			"Ф",
			"Х",
			"Ц",
			"Ч",
			"Ш",
			"Я"
		}
		local slot1_a25953, slot2_a25954, slot3_a25955 = getCharCoordinates(playerPed)

		return slot0_a25950[math.ceil((slot2_a25954 * -1 + 3000) / 250)] .. "-" .. math.ceil((slot1_a25953 + 3000) / 250)
	end

	function reconnect(arg0)
		time = tonumber(arg0)
		res = true

		rec()
	end

	check_timep = os.time()

	function callphone()
		lua_thread.create((function ()
			wait(math.random(500, 550))
			sampSendChat("/phone")
			wait(math.random(400, 450))

			if number ~= "" and number ~= nil then
				sampSendClickTextdraw(namephone[pphone[slot34_a28422.config.typephone + 1]]["Позвонить"])
				wait(math.random(250, 300))

				for slot3_a26035 in string.gmatch(number, "%d") do
					sampSendClickTextdraw(namephone[pphone[slot34_a28422.config.typephone + 1]][slot3_a26035])
					wait(math.random(250, 300))
				end

				wait(math.random(250, 300))
				sampSendClickTextdraw(namephone[pphone[slot34_a28422.config.typephone + 1]]["Вызов"])

				number = ""
			else
				sendchat("Ошибка, звонок данному человеку невозможен!")
				sampSendDialogResponse(1000, 0, 0)
				sampCloseCurrentDialogWithButton(0)
			end
		end))
	end

	function slot1_a29133.NewInputText(arg0, arg1, arg2, arg3, arg4)
		local slot5_a26148 = arg3 and arg3 or ""
		local slot6_a26122 = tonumber(arg4) and tonumber(arg4) or 1
		local slot7_a26135 = slot1_a29133.GetCursorPos()

		slot1_a29133.PushItemWidth(arg2)

		local slot8_a26152 = slot1_a29133.InputText(arg0, arg1)

		if #arg1.v == 0 then
			local slot9_a26127 = slot1_a29133.CalcTextSize(slot5_a26148)

			if slot6_a26122 == 2 then
				slot1_a29133.SameLine(slot7_a26135.x + (arg2 - slot9_a26127.x) / 2)
			elseif slot6_a26122 == 3 then
				slot1_a29133.SameLine(slot7_a26135.x + arg2 - slot9_a26127.x - 5)
			else
				slot1_a29133.SameLine(slot7_a26135.x + 5)
			end

			slot1_a29133.TextColored(slot1_a29133.ImVec4(1, 1, 1, 0.4), tostring(slot5_a26148))
		end

		slot1_a29133.PopItemWidth()

		return slot8_a26152
	end

	function tags(arg0)
		if getClosestPlayerId() > 1 then
			nearestplayerID = getClosestPlayerId()
			nearestname = sampGetPlayerNickname(nearestplayerID)
		else
			nearestplayerID = u8("Нету рядом")
			nearestname = u8("Нету рядом")
		end

		_, myID = sampGetPlayerIdByCharHandle(PLAYER_PED)
		mynick = sampGetPlayerNickname(myID)
		score = sampGetPlayerScore(myID)
		weapon = getCurrentCharWeapon(PLAYER_PED)

		return arg0:gsub("{mynick}", tostring(mynick)):gsub("{myid}", tostring(myID)):gsub("{phone}", tostring(phone)):gsub("{job}", tostring(job)):gsub("{org}", tostring(org)):gsub("{myrang}", tostring(myrang)):gsub("{myguns}", tostring(slot24_a28082.get_name(weapon))):gsub("{time}", string.format(os.date("%H:%M:%S"))):gsub("{day}", string.format(os.date("%d.%m.%y"))):gsub("{myname}", tostring(mynick:gsub("_.*", ""))):gsub("{mysurname}", tostring(mynick:gsub(".*_", ""))):gsub("{score}", tostring(score)):gsub("{paydaymoney}", tostring(money)):gsub("{city}", tostring(playerCity)):gsub("{zone}", tostring(ZoneInGame)):gsub("{nearest}", tostring(nearestname)):gsub("{nearestid}", tostring(nearestplayerID)):gsub("{killernick}", tostring(killernick)):gsub("{killerid}", tostring(killerid)):gsub("{killerweapon}", tostring(killerweapon))
	end

	function rec()
		lua_thread.create((function ()
			if res and time ~= nil then
				closeConnect()
				sampAddChatMessage("[Universal Helper] {FFFFFF}Реконект - " .. time .. " сек.", 6591981)
				wait(time * 1000)
				sampSetGamestate(1)

				res = false
			end

			if res and time == nil then
				closeConnect()
				sampAddChatMessage("[Universal Helper] {FFFFFF}Реконект - 15 сек.", 6591981)
				wait(15000)
				sampSetGamestate(1)

				res = false
			end
		end))
	end

	function closeConnect()
		raknetEmulPacketReceiveBitStream(PACKET_DISCONNECTION_NOTIFICATION, raknetNewBitStream())
		raknetDeleteBitStream(raknetNewBitStream())
	end

	function report(arg0)
		if #arg0 <= 6 then
			sampAddChatMessage("[Universal Helper] {FFFFFF}Сообщение должно быть не менее 6 символов!", 6591981)
		else
			report = 1

			sampSendChat("/report")
			sampSendDialogResponse(32, 1, _, arg0)
		end
	end

	function ClearChat()
		slot18_a28309.fill(sampGetChatInfoPtr() + 306, 0, 25200)
		slot18_a28309.write(sampGetChatInfoPtr() + 306, 25562, 4, 0)
		slot18_a28309.write(sampGetChatInfoPtr() + 25562, 1, 1)
	end

	_3dtexts = {}

	function removeAll3dText()
		lua_thread.create((function ()
			for slot3_a26428 = slot0_a26425, #_3dtexts do
				sampDestroy3dText(_3dtexts[slot3_a26428])
			end
		end))
	end

	function checkip()
		local slot0_a26442, slot1_a26445 = sampGetCurrentServerAddress()

		for slot5_a26451, slot6_a26448 in pairs(iparz) do
			if slot6_a26448 == slot0_a26442 .. ":" .. slot1_a26445 then
				sendconsol("Авторизация сервера пройдена, Вы на Arizona " .. slot5_a26451)

				gameServer = slot5_a26451

				for slot10_a26463, slot11_a26462 in ipairs(stable) do
					if slot11_a26462 == gameServer then
						ServerNumber = slot10_a26463
					end
				end

				return true
			end
		end

		sampAddChatMessage("[Universal Helper] {FFFFFF}Скрипт работает только на серверах {FF0000}Arizona RolePlay", 6591981)
		sampAddChatMessage("[Universal Helper] {FFFFFF}Скрипт работает только на серверах {FF0000}Arizona RolePlay", 6591981)
		sampAddChatMessage("[Universal Helper] {FFFFFF}Скрипт работает только на серверах {FF0000}Arizona RolePlay", 6591981)
		sampAddChatMessage("[Universal Helper] {FFFFFF}Скрипт работает только на серверах {FF0000}Arizona RolePlay", 6591981)
		sampAddChatMessage("[Universal Helper] {FFFFFF}Скрипт работает только на серверах {FF0000}Arizona RolePlay", 6591981)
		sendconsol("Не удачный вход на сервер, отключаю скрипт!")
		helperoff()
	end

	function rcmd(arg0, arg1, arg2)
		if arg0 ~= nil then
			if arg0 ~= "-" then
				sampUnregisterChatCommand(arg0)
			end

			sampRegisterChatCommand(arg0, (function (arg0)
				globalcmd = lua_thread.create((function ()
					if not keystatus then
						keystatus = true
						local slot0_a26504 = split(arg1, "~", false)

						for slot4_a26510, slot5_a26514 in ipairs(slot0_a26504) do
							sampProcessChatInput(tags(slot5_a26514))
							wait(arg2 * 1000)
						end

						keystatus = false
					end
				end))
			end))
		else
			globalkey = lua_thread.create((function ()
				keystatus = slot0_a26530
				local slot0_a26536 = split(arg1, "~", false)

				for slot4_a26542, slot5_a26548 in ipairs(slot0_a26536) do
					if not sampIsCursorActive() then
						sampProcessChatInput(tags(slot5_a26548))
						wait(arg2 * 1000)
					end
				end

				keystatus = false
			end))
		end
	end

	function split(arg0, arg1, arg2)
		local slot5_a26573 = arg2 ~= false

		repeat
			local slot6_a26587, slot7_a26596 = string.find(arg0, arg1, slot4_a26571, slot5_a26573)

			table.insert(slot3_a26579, string.sub(arg0, slot4_a26571, slot6_a26587 and slot6_a26587 - 1))

			local slot4_a26571 = slot7_a26596 and slot7_a26596 + 1
		until not slot4_a26571

		return slot3_a26579
	end

	function timer()
		osTime = os.time()

		while true do
			wait(1000)

			if sampGetGamestate() == 3 and sampIsLocalPlayerSpawned() then
				slot40_a26631 = slot40_a26631 + 1
				sessiononline2 = os.time() - osTime
				afktimer = sessiononline2 - slot40_a26631 + 1
				slot34_a28422.obnylenie.online = slot34_a28422.obnylenie.online + 1
			end
		end
	end

	function save()
		slot17_a28610.save(slot34_a28422, "helper.ini")
	end

	function getCarNamebyModel(arg0)
		return ({
			[577.0] = "AT400",
			[3195.0] = "Ducati Panigale",
			[581.0] = "BF-400",
			[3155.0] = "BMW ZF",
			[585.0] = "Emperor",
			[1199.0] = "Range Rover",
			[589.0] = "Club",
			[1198.0] = "Volvov",
			[593.0] = "Dodo",
			[559.0] = "Jester",
			[597.0] = "Police Car SF",
			[3223.0] = "Mater",
			[601.0] = "S.W.A.T.",
			[3207.0] = "Range Rover SVA",
			[605.0] = "Sadler",
			[569.0] = "Train",
			[609.0] = "Boxville",
			[3239.0] = "BMW M5 E60",
			[613.0] = "Mercedes G63 AMG",
			[558.0] = "Uranus",
			[456.0] = "Yankee",
			[562.0] = "Elegy",
			[458.0] = "Solair",
			[548.0] = "Cargobob",
			[452.0] = "Speeder",
			[573.0] = "Dune",
			[454.0] = "Tropic",
			[448.0] = "Pizzaboy",
			[1195.0] = "Aqeight",
			[1203.0] = "Volvoxc",
			[450.0] = "Article Trailer 2",
			[3202.0] = "Bugatti Chiron",
			[575.0] = "Broadway",
			[571.0] = "Kart",
			[567.0] = "Savanna",
			[565.0] = "Flash",
			[563.0] = "Raindance",
			[561.0] = "Stratum",
			[909.0] = "Mercedes S63",
			[557.0] = "Monster B",
			[555.0] = "Windsor",
			[553.0] = "Nevada",
			[551.0] = "Merit",
			[3222.0] = "Lightmcq",
			[665.0] = "Chevrolet Cruze",
			[3206.0] = "lambsvj",
			[699.0] = "Bentley Continental",
			[3254.0] = "Chevrolet Corvett 1980",
			[668.0] = "Porsche Cayenne",
			[3238.0] = "Toyota Camry XV70",
			[568.0] = "Bandito",
			[560.0] = "Sultan",
			[462.0] = "Faggio",
			[463.0] = "Freeway",
			[460.0] = "Skimmer",
			[461.0] = "PCJ-600",
			[466.0] = "Glendale",
			[467.0] = "Oceanic",
			[464.0] = "RC Baron",
			[465.0] = "RC Raider",
			[470.0] = "Patriot",
			[471.0] = "Quad",
			[468.0] = "Sanchez",
			[469.0] = "Spamrow",
			[474.0] = "Hermes",
			[572.0] = "Mower",
			[475.0] = "Sabre",
			[3158.0] = "Lexus RX",
			[472.0] = "Coastguard",
			[564.0] = "RC Tiger",
			[473.0] = "Dinghy",
			[1197.0] = "Acura NSX",
			[478.0] = "Walton",
			[1205.0] = "KIA Optima",
			[479.0] = "Regina",
			[552.0] = "Utility Van",
			[476.0] = "Rustler",
			[3205.0] = "Mercedes-AMG G65 AMG",
			[3210.0] = "Tesla Model X",
			[544.0] = "Firetruck",
			[3213.0] = "Subaru Forester",
			[540.0] = "Vincent",
			[3218.0] = "MBE 55",
			[536.0] = "Blade",
			[549.0] = "Tampa",
			[532.0] = "Combine",
			[667.0] = "Porsche 911",
			[528.0] = "FBI Truck",
			[3234.0] = "KIA Sportage",
			[524.0] = "Cement Truck",
			[3236.0] = "Audi R8",
			[520.0] = "Hydra",
			[3237.0] = "Toyota Camry XV40",
			[516.0] = "Nebula",
			[512.0] = "Cropduster",
			[663.0] = "Chevrolet Corvette",
			[556.0] = "Monster A",
			[3240.0] = "BMW M5 F90",
			[3245.0] = "Mercedes Maybach S650",
			[3157.0] = "BMW XF",
			[965.0] = "Volkswagen Tuareg",
			[3266.0] = "Dodge SRT",
			[3220.0] = "Jstorm",
			[3204.0] = "Mercedes-Benz GLS 2020",
			[793.0] = "BMW M8",
			[576.0] = "Tornado",
			[580.0] = "Stafford",
			[3156.0] = "Mercedes-Benz S",
			[584.0] = "Petrol Trailer",
			[588.0] = "Hotdog",
			[1196.0] = "Dodge Challenger",
			[592.0] = "Andromada",
			[1204.0] = "Jaguar F-Pace",
			[596.0] = "Police Car LS",
			[3219.0] = "MBE 500",
			[600.0] = "Picador",
			[3203.0] = "Fiat 500",
			[604.0] = "Glendale",
			[3251.0] = "Volkswagen Passat",
			[608.0] = "Tug Stairs Trailer",
			[3235.0] = "Volkswagen Golf R",
			[612.0] = "Mercedes GT63s AMG",
			[445.0] = "Admiral",
			[3348.0] = "Ford Mustang GT500",
			[447.0] = "Seaspamrow",
			[441.0] = "RC Bandit",
			[443.0] = "Packer",
			[437.0] = "Coach",
			[439.0] = "Stallion",
			[433.0] = "Barracks",
			[435.0] = "Article Trailer",
			[429.0] = "Banshee",
			[431.0] = "Bus",
			[425.0] = "Hunter",
			[427.0] = "Enforcer",
			[421.0] = "Washington",
			[423.0] = "Mr. Whoopee",
			[417.0] = "Leviathan",
			[419.0] = "Esperanto",
			[411.0] = "Infernus",
			[409.0] = "Stretch",
			[415.0] = "Cheetah",
			[413.0] = "Pony",
			[403.0] = "Linerunner",
			[401.0] = "Bravura",
			[407.0] = "Firetruck",
			[3217.0] = "BMW E38",
			[405.0] = "Sentinel",
			[3201.0] = "Bugatti Divo",
			[547.0] = "Primo",
			[543.0] = "Sadler",
			[3233.0] = "Lexus RX 450h",
			[539.0] = "Vortex",
			[535.0] = "Slamvan",
			[531.0] = "Tractor",
			[527.0] = "Cadrona",
			[523.0] = "HPV1000",
			[519.0] = "Shamal",
			[515.0] = "Roadtrain",
			[511.0] = "Beagle",
			[509.0] = "Bike",
			[507.0] = "Elegant",
			[505.0] = "Rancher",
			[503.0] = "Hotring Racer B",
			[501.0] = "RC Goblin",
			[3216.0] = "Hyundai Sonata",
			[499.0] = "Benson",
			[3200.0] = "Volkswagen Beetle",
			[497.0] = "Police Maverick",
			[3248.0] = "Porsche Panamera Turbo",
			[495.0] = "Sandking",
			[3232.0] = "Infinity FX 50",
			[493.0] = "Jetmax",
			[491.0] = "Virgo",
			[489.0] = "Rancher",
			[487.0] = "Maverick",
			[485.0] = "Baggage",
			[483.0] = "Camper",
			[481.0] = "BMX",
			[477.0] = "ZR-350",
			[579.0] = "Huntley",
			[583.0] = "Tug",
			[587.0] = "Euros",
			[1194.0] = "Lamborghini Urus",
			[591.0] = "Article Trailer 3",
			[1202.0] = "Ford Mustang",
			[595.0] = "Launch",
			[599.0] = "Police Ranger",
			[3215.0] = "Subaru Legasy",
			[603.0] = "Phoenix",
			[607.0] = "Baggage Trailer",
			[3247.0] = "Mercedes-Benz AMG GT",
			[611.0] = "Utility Traileraw ",
			[457.0] = "Caddy",
			[459.0] = "Topfun Van",
			[453.0] = "Reefer",
			[455.0] = "Flatbed",
			[449.0] = "Tram",
			[451.0] = "Turismo",
			[3199.0] = "Rolls-Royce Cullinan",
			[662.0] = "BMW X5",
			[666.0] = "Lexus LX",
			[574.0] = "Sweeper",
			[570.0] = "Train",
			[566.0] = "Tahoma",
			[3198.0] = "Western",
			[1201.0] = "Lexis",
			[554.0] = "Yosemite",
			[550.0] = "Sunrise",
			[546.0] = "Intruder",
			[542.0] = "Clover",
			[538.0] = "Train",
			[534.0] = "Remington",
			[530.0] = "Forklift",
			[526.0] = "Fortune",
			[522.0] = "NRG-500",
			[518.0] = "Buccaneer",
			[514.0] = "Tanker",
			[3197.0] = "Kawasaki Ninja ZX-10RR",
			[3212.0] = "Nissan Silvia",
			[578.0] = "DFT-30",
			[582.0] = "Newsvan",
			[586.0] = "Wayfarer",
			[3196.0] = "Ducati Ducnaked",
			[590.0] = "Train",
			[1200.0] = "Honda Civic Type-R",
			[594.0] = "RC Cam",
			[598.0] = "Police Car LV",
			[3211.0] = "Nisleaf",
			[602.0] = "Alpha",
			[606.0] = "Baggage Trailer",
			[610.0] = "Farm Trailer",
			[614.0] = "Audi RS6",
			[444.0] = "Monster",
			[446.0] = "Squallo",
			[440.0] = "Rumpo",
			[442.0] = "Romero",
			[436.0] = "Previon",
			[438.0] = "Cabbie",
			[432.0] = "Rhino",
			[434.0] = "Hotknife",
			[428.0] = "Securicar",
			[430.0] = "Predator",
			[424.0] = "BF Injection",
			[426.0] = "Premier",
			[420.0] = "Taxi",
			[422.0] = "Bobcat",
			[416.0] = "Ambulance",
			[418.0] = "Moonbeam",
			[410.0] = "Manana",
			[408.0] = "Trashmaster",
			[414.0] = "Mule",
			[412.0] = "Voodoo",
			[3194.0] = "Ducati Daivel",
			[402.0] = "Buffalo",
			[400.0] = "Landstalker",
			[406.0] = "Dumper",
			[3209.0] = "BMW 221",
			[404.0] = "Perennial",
			[545.0] = "Hustler",
			[541.0] = "Bullet",
			[537.0] = "Train",
			[533.0] = "Feltzer",
			[529.0] = "Willard",
			[525.0] = "Towtruck",
			[521.0] = "FCR-900",
			[517.0] = "Majestic",
			[513.0] = "Stuntplane",
			[510.0] = "Mountain Bike",
			[508.0] = "Journey",
			[506.0] = "Super GT",
			[504.0] = "Bloodring Banger",
			[502.0] = "Hotring Racer A",
			[500.0] = "Mesa",
			[3224.0] = "Buckingham",
			[498.0] = "Boxville",
			[3208.0] = "BMW 530i",
			[496.0] = "Blista Compact",
			[494.0] = "Hotring Racer",
			[794.0] = "Mercedes E63s AMG",
			[492.0] = "Greenwood",
			[490.0] = "FBI Rancher",
			[488.0] = "News Maverick",
			[486.0] = "Dozer",
			[484.0] = "Marquis",
			[482.0] = "Burrito",
			[480.0] = "Comet"
		})[arg0] or "Не определено"
	end

	function distanceBetweenPlayer(arg0)
		if sampIsPlayerConnected(arg0) then
			local slot1_a26654, slot2_a26666 = sampGetCharHandleBySampPlayerId(arg0)

			if slot1_a26654 and doesCharExist(slot2_a26666) then
				local slot3_a26662, slot4_a26663, slot5_a26664 = getCharCoordinates(playerPed)
				local slot6_a26668, slot7_a26669, slot8_a26670 = getCharCoordinates(slot2_a26666)

				return math.floor(getDistanceBetweenCoords3d(slot3_a26662, slot4_a26663, slot5_a26664, slot6_a26668, slot7_a26669, slot8_a26670))
			end
		end

		return nil
	end

	zanks = {}

	function render()
		lua_thread.create((function ()
			while true do
				wait(0)

				if not isGamePaused() and sampGetGamestate() == 3 and sampIsLocalPlayerSpawned() and zekrender.v then
					sampSendChat("/zeks")
					wait(5000)
				end
			end
		end))

		while true do
			wait(0)

			if not isGamePaused() and sampGetGamestate() == 3 and sampIsLocalPlayerSpawned() then
				if chekerplayers.v then
					renderFontDrawTextAlign(font5, "Игроки онлайн:", slot34_a28422.cord.posXcheker, slot34_a28422.cord.posYcheker - 15, -1, slot34_a28422.functions.playerspos)

					y = slot34_a28422.cord.posYcheker + 4

					if #users > 0 then
						for slot3_a26737, slot4_a26739 in pairs(users) do
							nickusers = slot4_a26739:match("(%w+.%w+)%[%d+%]")
							coloruser = sampGetPlayerColor(sampGetPlayerIdByNickname(nickusers))
							coloruser = string.format("%06X", bit.band(coloruser, 16777215))

							renderFontDrawTextAlign(font5, "{" .. coloruser .. "}" .. slot4_a26739, slot34_a28422.cord.posXcheker, y, -1, slot34_a28422.functions.playerspos)

							y = y + 25
						end
					end
				end

				if timeinscreen.v then
					rendertime = os.date("%H:%M:%S", os.time())
					coloroftime = join_argb(255, slot34_a28422.color.color_rt, slot34_a28422.color.color_gt, slot34_a28422.color.color_bt)

					renderFontDrawText(font3, rendertime, slot34_a28422.cord.xCoordtime, slot34_a28422.cord.yCoordtime, coloroftime)
				end

				if zekrender.v then
					ycord = slot34_a28422.cord.yCoordzek + 4

					renderFontDrawTextAlign(font4, "Заключенных: " .. #zanks, slot34_a28422.cord.xCoordzek, ycord - 20, -1, zektable.v + 1)

					if #zanks > 0 then
						for slot3_a26832, slot4_a26837 in ipairs(zanks) do
							if slot4_a26837[3] ~= "0" then
								zek_color = sampGetPlayerColor(slot4_a26837[2])
								zek_color = string.format("%06X", bit.band(zek_color, 16777215))

								renderFontDrawTextAlign(font4, "{" .. zek_color .. "}" .. slot4_a26837[1] .. "(" .. slot4_a26837[2] .. "){FFFFFF} | Время: " .. slot4_a26837[3] .. " мин | Залог: $" .. slot4_a26837[4] .. " | КПЗ: " .. slot4_a26837[5] .. "", slot34_a28422.cord.xCoordzek, ycord, -1, zektable.v + 1)

								ycord = ycord + 24
							else
								zanks = {}
							end
						end
					else
						renderFontDrawTextAlign(font4, "Список заключенных пуст..", slot34_a28422.cord.xCoordzek, slot34_a28422.cord.yCoordzek, -1, zektable.v + 1)
					end
				end

				for slot3_a26893, slot4_a26981 in pairs(getAllChars()) do
					if renderped.v and firstconnect then
						local slot5_a26901, slot6_a26991 = sampGetPlayerIdByCharHandle(slot4_a26981)

						if slot5_a26901 then
							local slot7_a26965, slot8_a26967, slot9_a26969 = getCharCoordinates(slot4_a26981)
							local slot10_a26959, slot11_a26961, slot12_a26963 = getCharCoordinates(PLAYER_PED)
							local slot13_a27009, slot14_a27011 = convert3DCoordsToScreen(slot7_a26965, slot8_a26967, slot9_a26969)
							local slot15_a26950 = sampGetPlayerHealth(slot6_a26991)
							local slot16_a26995 = table.concat(vipp, ", ")
							nick = sampGetPlayerNickname(slot6_a26991)
							local slot15_a26987 = slot15_a26950 >= 0 and slot15_a26950 < 30 and "{FF0000}" .. slot15_a26950 or slot15_a26950 >= 30 and slot15_a26950 < 85 and "{ffff00}" .. slot15_a26950 or slot15_a26950 >= 85 and "{00FF00}" .. slot15_a26950 or getCharHealth(slot4_a26981)
							local slot17_a26979 = getDistanceBetweenCoords3d(slot10_a26959, slot11_a26961, slot12_a26963, slot7_a26965, slot8_a26967, slot9_a26969)

							if isPointOnScreen(slot7_a26965, slot8_a26967, slot9_a26969, 0) and slot17_a26979 < 10 and not isCharInAnyCar(slot4_a26981) then
								local slot18_a27014 = renderFontDrawText
								local slot19_a27015 = font1
								local slot20_a27002 = "{FFFFFF}  HP: "
								local slot22_a27004 = "\n{FFFFFF} ARM: "
								local slot23_a27005 = sampGetPlayerArmor(slot6_a26991)
								local slot24_a27006 = "\nВип: "
								local slot25_a27007 = slot16_a26995:find(nick) and "{00FF00}Имеет" or "{FF0000}Не имеет"

								slot18_a27014(slot19_a27015, slot20_a27002 .. slot15_a26987 .. slot22_a27004 .. slot23_a27005 .. slot24_a27006 .. slot25_a27007, slot13_a27009 - 35, slot14_a27011 - 40, -255878787)
							end
						end
					end
				end

				if rendercar.v then
					for slot3_a27023, slot4_a27026 in pairs(getAllVehicles()) do
						local slot5_a27082, slot6_a27084, slot7_a27086 = getCarCoordinates(slot4_a27026)
						local slot8_a27076, slot9_a27078, slot10_a27080 = getCharCoordinates(PLAYER_PED)
						local slot11_a27073 = getCarDoorLockStatus(slot4_a27026)
						local slot12_a27111 = getCarModel(slot4_a27026)
						local slot13_a27044, slot14_a27115 = sampGetVehicleIdByCarHandle(slot4_a27026)
						local slot15_a27124, slot16_a27126 = convert3DCoordsToScreen(slot5_a27082, slot6_a27084, slot7_a27086)
						local slot17_a27067 = getCarHealth(slot4_a27026)
						local slot17_a27118 = slot17_a27067 > 900 and "{00FF00}" .. slot17_a27067 or slot17_a27067 < 650 and "{FF0000}" .. slot17_a27067 or "{ffff00}" .. slot17_a27067
						local slot18_a27107 = ""

						if slot11_a27073 == 0 then
							slot18_a27107 = "{00FF00}Открыты"
						elseif slot11_a27073 == 2 then
							slot18_a27107 = "{FF0000}Закрыты"
						end

						local slot19_a27096 = getDistanceBetweenCoords3d(slot8_a27076, slot9_a27078, slot10_a27080, slot5_a27082, slot6_a27084, slot7_a27086)

						if isPointOnScreen(slot5_a27082, slot6_a27084, slot7_a27086, 0) and slot19_a27096 < 10 then
							renderFontDrawText(font2, "{FFFFFF}Двигатель: " .. (isCarEngineOn(slot4_a27026) and "{00FF00}ВКЛ" or "{FF0000}ВЫКЛ") .. "\n{FFFFFF}Двери: " .. slot18_a27107 .. "\n{FFFFFF}" .. getCarNamebyModel(slot12_a27111) .. "[" .. slot14_a27115 .. "]\n{FFFFFF}ХП Авто: " .. slot17_a27118 .. "\n", slot15_a27124 - 40, slot16_a27126 - 20, -255878787)
						end
					end
				end
			end
		end
	end

	function rp_weapons()
		if rpguns_pol.v then
			sex = false
		else
			sex = true
		end

		local slot0_a27269 = {}
		local slot1_a27189 = {}
		local slot2_a27205 = {}
		local slot3_a27209 = {}
		local slot4_a27140 = nil
		local slot5_a27218 = getCurrentCharWeapon(PLAYER_PED)
		local slot6_a27202 = {
			{
				"из-за спины",
				"за спину"
			},
			{
				"из кармана",
				"в карман"
			},
			{
				"из пояса",
				"на пояс"
			},
			{
				"из кобуры",
				"в кобуру"
			}
		}
		local slot7_a27199 = {
			2,
			1,
			3,
			2,
			1,
			1,
			1,
			1,
			1,
			2,
			2,
			2,
			2,
			1,
			1,
			3,
			3,
			3,
			nil,
			nil,
			nil,
			4,
			4,
			4,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			1,
			3,
			3,
			2,
			1,
			2,
			2,
			2,
			2
		}

		for slot11_a27184, slot12_a27158 in pairs(slot24_a28082.names) do
			if slot11_a27184 == 3 or slot11_a27184 > 15 and slot11_a27184 < 19 then
				slot0_a27269[slot11_a27184] = sex and "снял" or "сняла"
			else
				slot0_a27269[slot11_a27184] = sex and "достал" or "достала"
			end

			if slot11_a27184 == 3 or slot11_a27184 > 15 and slot11_a27184 < 19 or slot11_a27184 > 38 and slot11_a27184 < 41 then
				slot1_a27189[slot11_a27184] = sex and "повесил" or "повесила"
			else
				slot1_a27189[slot11_a27184] = sex and "убрал" or "убрала"
			end

			if slot11_a27184 > 0 then
				slot2_a27205[slot11_a27184] = slot6_a27202[slot7_a27199[slot11_a27184]][1]
				slot3_a27209[slot11_a27184] = slot6_a27202[slot7_a27199[slot11_a27184]][2]
			end
		end

		while true do
			wait(0)

			if rpguns.v and slot5_a27218 ~= getCurrentCharWeapon(PLAYER_PED) then
				local slot4_a27258 = slot5_a27218
				slot5_a27218 = getCurrentCharWeapon(PLAYER_PED)

				if slot4_a27258 == 0 then
					sampSendChat("/me " .. slot0_a27269[slot5_a27218] .. " " .. slot24_a28082.get_name(slot5_a27218) .. " " .. slot2_a27205[slot5_a27218], -1)
				elseif slot5_a27218 == 0 then
					sampSendChat("/me " .. slot1_a27189[slot4_a27258] .. " " .. slot24_a28082.get_name(slot4_a27258) .. " " .. slot3_a27209[slot4_a27258], -1)
				else
					sampSendChat("/me " .. slot1_a27189[slot4_a27258] .. " " .. slot24_a28082.get_name(slot4_a27258) .. " " .. slot3_a27209[slot4_a27258] .. ", после чего " .. slot0_a27269[slot5_a27218] .. " " .. slot24_a28082.get_name(slot5_a27218) .. " " .. slot2_a27205[slot5_a27218], -1)
				end
			end
		end
	end

	if slot6_a27283 then
		function onHotKey(arg0, arg1)
			local slot2_a27474 = tostring(table.concat(arg1, " "))

			if not sampIsChatInputActive() then
				for slot6_a27457, slot7_a27304 in pairs(binderlist) do
					if slot2_a27474 == tostring(table.concat(slot7_a27304.v, " ")) then
						if slot6_a27457 == 1 then
							local slot8_a27312, slot9_a27319 = getCharPlayerIsTargeting(PLAYER_HANDLE)

							if slot8_a27312 and doesCharExist(slot9_a27319) then
								local slot10_a27321, slot39_a27480 = sampGetPlayerIdByCharHandle(slot9_a27319)

								if slot10_a27321 then
									vzaimod.v = true
									vipp = {}

									sampSendChat("/vipplayers")

									checkvip = true
								end
							end
						elseif slot6_a27457 == 2 then
							local slot8_a27334, slot9_a27335 = getCharPlayerIsTargeting(playerHandle)

							if slot8_a27334 then
								local slot8_a27341, slot11_a27339 = getCharPlayerIsTargeting(playerHandle)
								local slot8_a27347, slot0_a27363 = sampGetPlayerIdByCharHandle(slot11_a27339)

								if slot36_a27481 ~= slot0_a27363 then
									slot36_a27481 = slot0_a27363

									sampSendChat("/invite " .. slot0_a27363)
									wait(5000)

									if slot34_a28422.config.inviterank ~= 0 then
										sampSendChat("/giverank " .. slot0_a27363 .. " " .. slot34_a28422.config.inviterank)
									end

									sampSendChat("/todo Вот держи это твоя новая форма!*передал форму")
								end
							end
						elseif slot6_a27457 == 3 then
							if not sampIsCursorActive() then
								if slot34_a28422.config.typesbiv == 0 then
									lua_thread.create((function ()
										send_rpc_command("/anims " .. slot34_a28422.config.animsnumber)
										setVirtualKeyDown(13, true)
										wait(100)
										setVirtualKeyDown(13, false)
									end))
								elseif not isCharInAnyCar(PLAYER_PED) then
									clearCharTasksImmediately(PLAYER_PED)
								end
							end
						elseif slot6_a27457 == 4 then
							newmenu.v = not newmenu.v
						elseif slot6_a27457 == 5 then
							wh = not wh

							if wh then
								nameTagOn()
								addOneOffSound(0, 0, 0, 1139)
							else
								nameTagOff()
								addOneOffSound(0, 0, 0, 1138)
							end

							if isKeyDown(119) and wh then
								nameTagOff()
								wait(1000)
								nameTagOn()
							end
						elseif slot6_a27457 == 6 then
							cmd_piar()
						elseif slot6_a27457 == 7 then
							if antidmreport and antidm.v then
								report = 1

								sampSendChat("/report")
								sampSendDialogResponse(32, 1, _, tags(u8:decode(textreport.v)))

								antidmreport = false
							end
						elseif slot6_a27457 == 8 then
							SV()
						elseif slot6_a27457 == 9 then
							stats.v = not stats.v
						elseif slot6_a27457 == 10 then
							getDialog()
						end
					end
				end
			end

			for slot6_a27465, slot7_a27477 in pairs(slot29_a28607) do
				if slot2_a27474 == tostring(table.concat(slot7_a27477.v, " ")) then
					rcmd(nil, slot7_a27477.text, slot7_a27477.delay)
				end
			end
		end
	end

	function sampGetPlayerOrganisation(arg0)
		for slot4_a27500, slot5_a27497 in pairs(orgcolor) do
			if sampGetPlayerColor(arg0) == slot5_a27497 then
				return tostring(organname[slot4_a27500])
			end
		end

		return u8(tostring("Нет"))
	end

	function comma_value(arg0)
		local slot1_a27511, slot2_a27512, slot3_a27513 = string.match(arg0, "^([^%d]*%d)(%d*)(.-)$")

		return slot1_a27511 .. slot2_a27512:reverse():gsub("(%d%d%d)", "%1."):reverse() .. slot3_a27513
	end

	tKeys = {
		96,
		48,
		97,
		49,
		98,
		50,
		99,
		51,
		100,
		52,
		101,
		53,
		102,
		54,
		103,
		55,
		104,
		56,
		105,
		57
	}

	function getDialog()
		statusсaptcha = slot0_a27530
		startTime = os.clock()
		firstKey = false

		math.randomseed(os.clock())

		captcha = tostring(math.random(1000, 9999))
		captcha = captcha:gsub(captcha, math.random(1, 10) <= 6 and captcha .. "0" or captcha .. tostring(math.random(1, 9)))
		captcha = tonumber(captcha)
		local slot0_a27574 = {
			math.random(8, 15),
			math.random(8, 15),
			math.random(8, 15),
			math.random(8, 15),
			math.random(8, 15)
		}
		rth = slot0_a27574
		oneOffset = math.random(0, 45)

		sampShowDialog(22222, "{FF8B7A}Проверка на робота", "{ffffff}Введите {6CFF92}5{FFFFFF} символов, которые\nвидно на {6CFF92}вашем{FFFFFF} экране", "Принять", "Отмена", 1)
	end

	function drawCaptchaNum(arg0, arg1, arg2, arg3, arg4)
		if arg0 == 1 then
			renderDrawBox(arg1 + oneOffset, arg2, arg3, 70, arg4)
		end

		if arg0 == 2 then
			renderDrawBox(arg1, arg2, 50, arg3, arg4)
			renderDrawBox(arg1 + 50, arg2, arg3, 30, arg4)
			renderDrawBox(arg1, arg2 + 30, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1, arg2 + 30, arg3, 30, arg4)
			renderDrawBox(arg1, arg2 + 60, 50 + arg3, arg3, arg4)
		end

		if arg0 == 3 then
			renderDrawBox(arg1, arg2, 50, arg3, arg4)
			renderDrawBox(arg1, arg2 + 30, 50, arg3, arg4)
			renderDrawBox(arg1, arg2 + 60, 50, arg3, arg4)
			renderDrawBox(arg1 + 50, arg2, arg3, 60 + arg3, arg4)
		end

		if arg0 == 4 then
			renderDrawBox(arg1, arg2, arg3, 30, arg4)
			renderDrawBox(arg1, arg2 + 30, 50, arg3, arg4)
			renderDrawBox(arg1 + 50, arg2, arg3, 70, arg4)
		end

		if arg0 == 5 then
			renderDrawBox(arg1, arg2, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1, arg2, arg3, 30, arg4)
			renderDrawBox(arg1, arg2 + 30, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1 + 50, arg2 + 30, arg3, 30, arg4)
			renderDrawBox(arg1, arg2 + 60, 50 + arg3, arg3, arg4)
		end

		if arg0 == 6 then
			renderDrawBox(arg1, arg2, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1, arg2, arg3, 60, arg4)
			renderDrawBox(arg1, arg2 + 30, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1 + 50, arg2 + 30, arg3, 30, arg4)
			renderDrawBox(arg1, arg2 + 60, 50 + arg3, arg3, arg4)
		end

		if arg0 == 7 then
			renderDrawBox(arg1 + 40, arg2, arg3, 70, arg4)
			renderDrawBox(arg1, arg2, 40, arg3, arg4)
		end

		if arg0 == 8 then
			renderDrawBox(arg1, arg2, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1, arg2, arg3, 60, arg4)
			renderDrawBox(arg1, arg2 + 30, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1 + 50, arg2, arg3, 60, arg4)
			renderDrawBox(arg1, arg2 + 60, 50 + arg3, arg3, arg4)
		end

		if arg0 == 9 then
			renderDrawBox(arg1, arg2, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1, arg2, arg3, 30, arg4)
			renderDrawBox(arg1, arg2 + 30, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1 + 50, arg2, arg3, 60, arg4)
			renderDrawBox(arg1, arg2 + 60, 50 + arg3, arg3, arg4)
		end

		if arg0 == 0 then
			renderDrawBox(arg1, arg2, 50 + arg3, arg3, arg4)
			renderDrawBox(arg1, arg2, arg3, 60, arg4)
			renderDrawBox(arg1 + 50, arg2, arg3, 60, arg4)
			renderDrawBox(arg1, arg2 + 60, 50 + arg3, arg3, arg4)
		end
	end

	function separator(arg0)
		if arg0.find(slot2_a27906, "$") then
			for slot4_a27919 in string.gmatch(arg0, "%d+ %$") do
				slot4_a27919 = string.sub(slot4_a27919, 0, #slot4_a27919 - 1)
				local slot5_a27928 = comma_value(slot4_a27919)
				arg0 = string.gsub(arg0, slot4_a27919, slot5_a27928)
			end
		end

		return arg0
	end

	function join_argb(arg0, arg1, arg2, arg3)
		return bit.bor(bit.bor(bit.bor(slot4_a27945, bit.lshift(arg2, 8)), bit.lshift(arg1, 16)), bit.lshift(arg0, 24))
	end

	function rainbow(arg0, arg1)
		return math.floor(math.sin(os.clock() * arg0) * 127 + 128), math.floor(math.sin(os.clock() * arg0 + 2) * 127 + 128), math.floor(math.sin(os.clock() * arg0 + 4) * 127 + 128), arg1
	end

	function getguninvent(arg0, arg1)
		if arg1.len(slot3_a28017) > 0 and tonumber(arg1) > 0 then
			findedgun = false
			ammoclip = arg1
			gname = arg0

			sampSendChat("/invent")
		else
			sampAddChatMessage("[Universal Helper] {FFFFFF}Неверное значение патрон!", 6591981)
		end
	end

	function SetWeather(arg0)
		local slot1_a28045 = tonumber(arg0)

		if slot1_a28045 ~= nil and slot1_a28045 >= 0 and slot1_a28045 <= 45 then
			forceWeatherNow(slot1_a28045)
		end
	end

	function SetTime(arg0)
		local slot1_a28056 = tonumber(arg0)

		if slot1_a28056 ~= nil and slot1_a28056 >= 0 and slot1_a28056 <= 23 then
			timew = slot1_a28056

			patch_samp_time_set(true)
		else
			patch_samp_time_set(false)

			timew = nil
		end
	end

	function sampGetPlayerGun(arg0)
		if sampIsPlayerConnected(arg0) then
			local slot1_a28070, slot2_a28071 = sampGetCharHandleBySampPlayerId(arg0)
			local slot3_a28074 = getCurrentCharWeapon(slot2_a28071)
			local slot4_a28079 = slot24_a28082.get_name(slot3_a28074)

			return tostring(slot4_a28079)
		end
	end

	function sampGetPlayerSkin(arg0)
		if not arg0 or not sampIsPlayerConnected(tonumber(arg0)) and not tonumber(arg0) == select(2, sampGetPlayerIdByCharHandle(playerPed)) then
			return false
		end

		local slot1_a28121 = tonumber(arg0) == select(2, sampGetPlayerIdByCharHandle(playerPed))
		local slot2_a28116, slot5_a28126 = sampGetCharHandleBySampPlayerId(tonumber(arg0))

		if not slot2_a28116 and not slot1_a28121 then
			return false
		end

		local slot4_a28125 = getCharModel
		slot5_a28126 = slot1_a28121 and playerPed or false
		local slot4_a28133 = slot4_a28125(slot5_a28126)

		if slot4_a28133 < 0 or slot4_a28133 > 311 then
			return false
		end

		return true, slot4_a28133
	end

	function sampGetPlayerPause(arg0)
		if sampIsPlayerPaused(arg0) then
			return tostring("Да")
		else
			return tostring("Нет")
		end
	end

	function get_timer(arg0)
		return string.format("%s:%s:%s", string.format("%s%s", (tonumber(os.date("%H", arg0)) < tonumber(os.date("%H", 0)) and 24 + tonumber(os.date("%H", arg0)) - tonumber(os.date("%H", 0)) or tonumber(os.date("%H", arg0)) - tonumber(os.date("%H", 0))) < 10 and 0 or "", tonumber(os.date("%H", arg0)) < tonumber(os.date("%H", 0)) and 24 + tonumber(os.date("%H", arg0)) - tonumber(os.date("%H", 0)) or tonumber(os.date("%H", arg0)) - tonumber(os.date("%H", 0))), os.date("%M", arg0), os.date("%S", arg0))
	end

	function SV()
		checkk = not checkk

		if checkk then
			printString("~g~ AFK ON", 2000)
			slot18_a28309.setuint8(7634870, 1, false)
			slot18_a28309.setuint8(7635034, 1, false)
			slot18_a28309.fill(7623723, 144, 8, false)
			slot18_a28309.fill(5499528, 144, 6, false)
		else
			printString("~r~ AFK OFF", 2000)
			slot18_a28309.setuint8(7634870, 0, false)
			slot18_a28309.setuint8(7635034, 0, false)
			slot18_a28309.hex2bin("0F 84 7B 01 00 00", 7623723, 8)
			slot18_a28309.hex2bin("50 51 FF 15 00 83 85 00", 5499528, 6)
		end
	end

	function sendchat(arg0)
		sampAddChatMessage("[Universal Helper] {FFFFFF}" .. arg0, 6591981)
	end

	function sendconsol(arg0)
		local slot1_a28324 = os.date("%H:%M", os.time())

		print("{808080}" .. slot1_a28324 .. " |{6495ED} [UNH] {FFFFFF}" .. arg0)
	end

	function spawncara()
		if not isCharOnFoot(playerPed) then
			car = storeCarCharIsInNoSave(playerPed)
			_, id = sampGetVehicleIdByCarHandle(car)

			sampSendChat("/fixmycar " .. id)
		end
	end

	function getClosestPlayerId()
		local slot2_a28369, slot3_a28373, slot4_a28378 = getCharCoordinates(PLAYER_PED)

		for slot8_a28387 = 0, 999 do
			local slot9_a28359, slot10_a28362 = sampGetCharHandleBySampPlayerId(slot8_a28387)

			if slot9_a28359 then
				local slot11_a28364, slot12_a28365, slot13_a28366 = getCharCoordinates(slot10_a28362)

				if math.sqrt((slot11_a28364 - slot2_a28369)^2 + (slot12_a28365 - slot3_a28373)^2 + (slot13_a28366 - slot4_a28378)^2) < slot0_a28384 then
					local slot1_a28388 = slot8_a28387
				end
			end
		end

		return slot1_a28389
	end

	function cmd_sobes()
		sobess = not sobess

		if sobess then
			sampAddChatMessage("[Universal Helper] {FFFFFF}Запущен пиар собесок в организацию", 6591981)
			lua_thread.create((function ()
				if sobess then
					sampSendChat("/vr " .. slot34_a28422.config.sobes)
					sampSendChat("/ad 1 " .. slot34_a28422.config.sobes)
					wait(120000)

					return true
				end
			end))
		end

		if not sobess then
			sampAddChatMessage("[Universal Helper] {FFFFFF}Выключен пиар собесок в организацию", 6591981)
		end
	end

	function cmd_kb()
		kb = not kb

		if kb then
			sampAddChatMessage("[Universal Helper] {FFFFFF}Включен флуд о начале КБ", 6591981)
			lua_thread.create((function ()
				if kb then
					sampSendChat("/fb " .. slot34_a28422.config.flood_kb)
					wait(slider.v)

					return true
				end
			end))
		end

		if not kb then
			sampAddChatMessage("[Universal Helper] {FFFFFF}Выключен флуд о начале КБ", 6591981)
		end
	end

	function ssmod()
		while true do
			wait(0)

			if safe.v then
				health = getCharHealth(PLAYER_PED)
				armor = getCharArmour(PLAYER_PED)

				if health <= 49 and health >= 3 and armor == 0 and not isCharPlayingAnim(PLAYER_PED, "KO_SKID_BACK") and not dyrka then
					interior = getCharActiveInterior(PLAYER_PED)

					if interior ~= 2 and interior ~= 3 and interior ~= 6 then
						sampSendChat("/armour")
						wait(4000)

						if usenarko.v then
							sampSendChat("/usedrugs 3")

							if safemodsbiv.v then
								sampSendChat(slot34_a28422.config.sbittext)
							end
						elseif useapteka.v then
							sampSendChat("/usemed")

							if safemodsbiv.v then
								sampSendChat(slot34_a28422.config.sbittext)
							end
						end

						wait(2000)
					end
				end
			end
		end
	end

	function onScriptTerminate(arg0)
		if arg0 == script.this then
			removemark()
			lua_thread.create((function ()
				if doesFileExist(ffile) then
					os.remove(ffile)
				end

				if not sampIsDialogActive() then
					showCursor(false, false)
				end

				local slot0_a28527 = io.open(ffile, "w")

				if slot0_a28527 then
					slot0_a28527:write(encodeJson(binderlist))
					slot0_a28527:close()
				end

				if doesFileExist(slot28_a28606) then
					os.remove(slot28_a28606)
				end

				local slot1_a28546 = io.open(slot28_a28606, "w")

				if slot1_a28546 then
					slot1_a28546:write(encodeJson(slot29_a28607))
					slot1_a28546:close()
				end

				local slot2_a28560 = io.open(slot30_a28608, "w")

				if slot2_a28560 then
					slot2_a28560:write(encodeJson(slot31_a28609))
					slot2_a28560:close()
				end

				slot34_a28422.obnylenie.onlineafk = slot34_a28422.obnylenie.onlineafk + afktimer
				slot34_a28422.onlinfo[slot34_a28422.obnylenie.day] = slot34_a28422.obnylenie.online
				slot34_a28422.onlinfoafk[slot34_a28422.obnylenie.day] = slot34_a28422.obnylenie.onlineafk

				slot17_a28610.save(slot34_a28422, "helper.ini")
				sendconsol("Скрипт выключился. Настройки сохранены!")
			end))
		end
	end

	function cmd_drop()
		drop = not drop

		if drop then
			sampAddChatMessage("[Universal Helper] {FFFFFF}Включен флуд о начале дропа", 6591981)
			lua_thread.create((function ()
				if drop then
					sampSendChat("/fb " .. slot34_a28422.config.flood_drop)
					wait(slider.v)

					return true
				end
			end))
		end

		if not drop then
			sampAddChatMessage("[Universal Helper] {FFFFFF}Выключен флуд о начале дропа", 6591981)
		end
	end

	function cleanStreamMemoryBuffer()
		local slot0_a28645 = callFunction(5489920, 2, 2, true, true)
		local slot1_a28651 = callFunction(5490704, 1, 1, true)
		local slot2_a28656 = callFunction(4247424, 0, 0)
		local slot3_a28661 = callFunction(4231328, 0, 0)
		local slot4_a28666 = callFunction(5904560, 0, 0)
		local slot5_a28671 = callFunction(7370608, 0, 0)
		local slot6_a28674, slot7_a28675, slot8_a28676 = getCharCoordinates(PLAYER_PED)

		requestCollision(slot6_a28674, slot7_a28675)
		loadScene(slot6_a28674, slot7_a28675, slot8_a28676)
	end

	function cmd_piar()
		act = not act

		if act then
			sampAddChatMessage("[Universal Helper] {FFFFFF}Пиар включен", 6591981)
		else
			sampAddChatMessage("[Universal Helper] {FFFFFF}Пиар выключен", 6591981)
		end

		if fam.v then
			lua_thread.create((function ()
				if act then
					sampSendChat("/fam " .. slot34_a28422.config.flood_fam)
					wait(slider_fam.v * 60000 + slider_fam_sec.v * 1000)

					return true
				end
			end))
		end

		if ad.v then
			if typesmi.v ~= -1 then
				lua_thread.create((function ()
					if act then
						sampSendChat("/ad " .. slot34_a28422.config.flood_ad)
						wait(slider_ad.v * 60000 + slider_ad_sec.v * 1000)

						return true
					end
				end))
			else
				sendchat("Выберите СМИ в найстройках скрипта!")
			end
		end

		if vr.v then
			lua_thread.create((function ()
				if act then
					sampSendChat("/vr " .. slot34_a28422.config.flood_vr)
					wait(slider_vr.v * 60000 + slider_vr_sec.v * 1000)

					return true
				end
			end))
		end
	end

	function theme1()
		local slot1_a28770 = slot1_a29133.GetStyle().Colors
		local slot2_a28772 = slot1_a29133.ImVec4
		slot1_a28770[slot1_a29133.Col.Text] = slot2_a28772(0.8, 0.8, 0.83, 1)
		slot1_a28770[slot1_a29133.Col.TextDisabled] = slot2_a28772(0.24, 0.23, 0.29, 1)
		slot1_a28770[slot1_a29133.Col.WindowBg] = slot2_a28772(0.06, 0.05, 0.07, 1)
		slot1_a28770[slot1_a29133.Col.PopupBg] = slot2_a28772(0.07, 0.07, 0.09, 1)
		slot1_a28770[slot1_a29133.Col.Border] = slot2_a28772(0.8, 0.8, 0.83, 0.88)
		slot1_a28770[slot1_a29133.Col.BorderShadow] = slot2_a28772(0.92, 0.91, 0.88, 0)
		slot1_a28770[slot1_a29133.Col.ChildWindowBg] = slot2_a28772(0, 0, 0, 0)
		slot1_a28770[slot1_a29133.Col.FrameBg] = slot2_a28772(0.1, 0.09, 0.12, 1)
		slot1_a28770[slot1_a29133.Col.FrameBgHovered] = slot2_a28772(0.24, 0.23, 0.29, 1)
		slot1_a28770[slot1_a29133.Col.FrameBgActive] = slot2_a28772(0.56, 0.56, 0.58, 1)
		slot1_a28770[slot1_a29133.Col.TitleBg] = slot2_a28772(0.1, 0.09, 0.12, 1)
		slot1_a28770[slot1_a29133.Col.TitleBgCollapsed] = slot2_a28772(1, 0.98, 0.95, 0.75)
		slot1_a28770[slot1_a29133.Col.TitleBgActive] = slot2_a28772(0.07, 0.07, 0.09, 1)
		slot1_a28770[slot1_a29133.Col.MenuBarBg] = slot2_a28772(0.1, 0.09, 0.12, 1)
		slot1_a28770[slot1_a29133.Col.ScrollbarBg] = slot2_a28772(0.1, 0.09, 0.12, 1)
		slot1_a28770[slot1_a29133.Col.ScrollbarGrab] = slot2_a28772(0.8, 0.8, 0.83, 0.31)
		slot1_a28770[slot1_a29133.Col.ScrollbarGrabHovered] = slot2_a28772(0.56, 0.56, 0.58, 1)
		slot1_a28770[slot1_a29133.Col.ScrollbarGrabActive] = slot2_a28772(0.06, 0.05, 0.07, 1)
		slot1_a28770[slot1_a29133.Col.ComboBg] = slot2_a28772(0.19, 0.18, 0.21, 1)
		slot1_a28770[slot1_a29133.Col.CheckMark] = slot2_a28772(0.8, 0.8, 0.83, 0.31)
		slot1_a28770[slot1_a29133.Col.SliderGrab] = slot2_a28772(0.8, 0.8, 0.83, 0.31)
		slot1_a28770[slot1_a29133.Col.SliderGrabActive] = slot2_a28772(0.06, 0.05, 0.07, 1)
		slot1_a28770[slot1_a29133.Col.Button] = slot2_a28772(0.1, 0.09, 0.12, 1)
		slot1_a28770[slot1_a29133.Col.ButtonHovered] = slot2_a28772(0.24, 0.23, 0.29, 1)
		slot1_a28770[slot1_a29133.Col.ButtonActive] = slot2_a28772(0.56, 0.56, 0.58, 1)
		slot1_a28770[slot1_a29133.Col.Header] = slot2_a28772(0.1, 0.09, 0.12, 1)
		slot1_a28770[slot1_a29133.Col.HeaderHovered] = slot2_a28772(0.56, 0.56, 0.58, 1)
		slot1_a28770[slot1_a29133.Col.HeaderActive] = slot2_a28772(0.06, 0.05, 0.07, 1)
		slot1_a28770[slot1_a29133.Col.ResizeGrip] = slot2_a28772(0, 0, 0, 0)
		slot1_a28770[slot1_a29133.Col.ResizeGripHovered] = slot2_a28772(0.56, 0.56, 0.58, 1)
		slot1_a28770[slot1_a29133.Col.ResizeGripActive] = slot2_a28772(0.06, 0.05, 0.07, 1)
		slot1_a28770[slot1_a29133.Col.CloseButton] = slot2_a28772(0.4, 0.39, 0.38, 0.16)
		slot1_a28770[slot1_a29133.Col.CloseButtonHovered] = slot2_a28772(0.4, 0.39, 0.38, 0.39)
		slot1_a28770[slot1_a29133.Col.CloseButtonActive] = slot2_a28772(0.4, 0.39, 0.38, 1)
		slot1_a28770[slot1_a29133.Col.PlotLines] = slot2_a28772(0.4, 0.39, 0.38, 0.63)
		slot1_a28770[slot1_a29133.Col.PlotLinesHovered] = slot2_a28772(0.25, 1, 0, 1)
		slot1_a28770[slot1_a29133.Col.PlotHistogram] = slot2_a28772(0.4, 0.39, 0.38, 0.63)
		slot1_a28770[slot1_a29133.Col.PlotHistogramHovered] = slot2_a28772(0.25, 1, 0, 1)
		slot1_a28770[slot1_a29133.Col.TextSelectedBg] = slot2_a28772(0.25, 1, 0, 0.43)
		slot1_a28770[slot1_a29133.Col.ModalWindowDarkening] = slot2_a28772(1, 0.98, 0.95, 0.73)
	end

	function theme2()
		slot1_a29133.SwitchContext()

		local slot0_a29140 = slot1_a29133.GetStyle()
		local slot1_a29141 = slot0_a29140.Colors
		local slot2_a29143 = slot1_a29133.Col
		local slot3_a29145 = slot1_a29133.ImVec4
		local slot4_a29147 = slot1_a29133.ImVec2
		slot1_a29141[slot2_a29143.Text] = slot3_a29145(1, 1, 1, 1)
		slot1_a29141[slot2_a29143.TextDisabled] = slot3_a29145(0.5, 0.5, 0.5, 1)
		slot1_a29141[slot2_a29143.WindowBg] = slot3_a29145(0.06, 0.06, 0.06, 0.94)
		slot1_a29141[slot2_a29143.PopupBg] = slot3_a29145(0.08, 0.08, 0.08, 0.94)
		slot1_a29141[slot2_a29143.Border] = slot3_a29145(0.43, 0.43, 0.5, 0.5)
		slot1_a29141[slot2_a29143.BorderShadow] = slot3_a29145(0, 0, 0, 0)
		slot1_a29141[slot2_a29143.FrameBg] = slot3_a29145(0.16, 0.29, 0.48, 0.54)
		slot1_a29141[slot2_a29143.ChildWindowBg] = slot3_a29145(0, 0, 0, 0)
		slot1_a29141[slot2_a29143.FrameBgHovered] = slot3_a29145(0.26, 0.59, 0.98, 0.4)
		slot1_a29141[slot2_a29143.FrameBgActive] = slot3_a29145(0.26, 0.59, 0.98, 0.67)
		slot1_a29141[slot2_a29143.TitleBgCollapsed] = slot3_a29145(0, 0, 0, 0.51)
		slot1_a29141[slot2_a29143.MenuBarBg] = slot3_a29145(0.14, 0.14, 0.14, 1)
		slot1_a29141[slot2_a29143.ScrollbarBg] = slot3_a29145(0.02, 0.02, 0.02, 0.53)
		slot1_a29141[slot2_a29143.ScrollbarGrab] = slot3_a29145(0.31, 0.31, 0.31, 1)
		slot1_a29141[slot2_a29143.ScrollbarGrabHovered] = slot3_a29145(0.41, 0.41, 0.41, 1)
		slot1_a29141[slot2_a29143.ScrollbarGrabActive] = slot3_a29145(0.51, 0.51, 0.51, 1)
		slot1_a29141[slot2_a29143.CheckMark] = slot3_a29145(0.26, 0.59, 0.98, 1)
		slot1_a29141[slot2_a29143.SliderGrab] = slot3_a29145(0.24, 0.52, 0.88, 1)
		slot1_a29141[slot2_a29143.SliderGrabActive] = slot3_a29145(0.26, 0.59, 0.98, 1)
		slot1_a29141[slot2_a29143.Button] = slot3_a29145(0.26, 0.59, 0.98, 0.4)
		slot1_a29141[slot2_a29143.ButtonHovered] = slot3_a29145(0.26, 0.59, 0.98, 1)
		slot1_a29141[slot2_a29143.ButtonActive] = slot3_a29145(0.06, 0.53, 0.98, 1)
		slot1_a29141[slot2_a29143.Header] = slot3_a29145(0.26, 0.59, 0.98, 0.31)
		slot1_a29141[slot2_a29143.HeaderHovered] = slot3_a29145(0.26, 0.59, 0.98, 0.8)
		slot1_a29141[slot2_a29143.HeaderActive] = slot3_a29145(0.26, 0.59, 0.98, 1)
		slot1_a29141[slot2_a29143.Separator] = slot1_a29141[slot2_a29143.Border]
		slot1_a29141[slot2_a29143.SeparatorHovered] = slot3_a29145(0.1, 0.4, 0.75, 0.78)
		slot1_a29141[slot2_a29143.SeparatorActive] = slot3_a29145(0.1, 0.4, 0.75, 1)
		slot1_a29141[slot2_a29143.ResizeGrip] = slot3_a29145(0.26, 0.59, 0.98, 0.25)
		slot1_a29141[slot2_a29143.ResizeGripHovered] = slot3_a29145(0.26, 0.59, 0.98, 0.67)
		slot1_a29141[slot2_a29143.ResizeGripActive] = slot3_a29145(0.26, 0.59, 0.98, 0.95)
		slot1_a29141[slot2_a29143.PlotLines] = slot3_a29145(0.61, 0.61, 0.61, 1)
		slot1_a29141[slot2_a29143.PlotLinesHovered] = slot3_a29145(1, 0.43, 0.35, 1)
		slot1_a29141[slot2_a29143.PlotHistogram] = slot3_a29145(0.9, 0.7, 0, 1)
		slot1_a29141[slot2_a29143.PlotHistogramHovered] = slot3_a29145(1, 0.6, 0, 1)
		slot1_a29141[slot2_a29143.TextSelectedBg] = slot3_a29145(0.26, 0.59, 0.98, 0.35)

		slot1_a29133.SetColorEditOptions(slot1_a29133.ColorEditFlags.HEX)

		slot0_a29140.FrameRounding = 0
		slot0_a29140.WindowRounding = 15
		slot0_a29140.ChildWindowRounding = 0
		slot1_a29141[slot2_a29143.TitleBgActive] = slot3_a29145(0, 0.009, 0.12, 0.94)
		slot1_a29141[slot2_a29143.TitleBg] = slot3_a29145(0.2, 0.25, 0.3, 1)
		slot1_a29141[slot2_a29143.Button] = slot3_a29145(0.26, 0.59, 0.98, 0.67)
		slot1_a29141[slot2_a29143.Header] = slot3_a29145(0.26, 0.59, 0.98, 0.67)
		slot1_a29141[slot2_a29143.HeaderHovered] = slot3_a29145(0.26, 0.59, 0.98, 1)
		slot1_a29141[slot2_a29143.ButtonHovered] = slot3_a29145(0, 0.545, 1, 1)
		slot1_a29141[slot2_a29143.ButtonActive] = slot3_a29145(0.06, 0.416, 0.98, 1)
		slot1_a29141[slot2_a29143.FrameBg] = slot3_a29145(0.2, 0.25, 0.3, 1)
		slot1_a29141[slot2_a29143.WindowBg] = slot3_a29145(0, 0.009, 0.12, 0.94)
		slot1_a29141[slot2_a29143.PopupBg] = slot3_a29145(0.076, 0.143, 0.209, 1)
	end

	function theme3()
		local slot1_a29479 = slot1_a29133.GetStyle().Colors
		local slot2_a29481 = slot1_a29133.Col
		local slot3_a29483 = slot1_a29133.ImVec4
		slot1_a29479[slot2_a29481.FrameBg] = slot3_a29483(0.48, 0.16, 0.16, 0.54)
		slot1_a29479[slot2_a29481.FrameBgHovered] = slot3_a29483(0.98, 0.26, 0.26, 0.4)
		slot1_a29479[slot2_a29481.FrameBgActive] = slot3_a29483(0.98, 0.26, 0.26, 0.67)
		slot1_a29479[slot2_a29481.TitleBg] = slot3_a29483(0.04, 0.04, 0.04, 1)
		slot1_a29479[slot2_a29481.TitleBgActive] = slot3_a29483(0.48, 0.16, 0.16, 1)
		slot1_a29479[slot2_a29481.TitleBgCollapsed] = slot3_a29483(0, 0, 0, 0.51)
		slot1_a29479[slot2_a29481.ChildWindowBg] = slot3_a29483(0, 0, 0, 0)
		slot1_a29479[slot2_a29481.CheckMark] = slot3_a29483(0.98, 0.26, 0.26, 1)
		slot1_a29479[slot2_a29481.SliderGrab] = slot3_a29483(0.88, 0.26, 0.24, 1)
		slot1_a29479[slot2_a29481.SliderGrabActive] = slot3_a29483(0.98, 0.26, 0.26, 1)
		slot1_a29479[slot2_a29481.Button] = slot3_a29483(0.98, 0.26, 0.26, 0.4)
		slot1_a29479[slot2_a29481.ButtonHovered] = slot3_a29483(0.98, 0.26, 0.26, 1)
		slot1_a29479[slot2_a29481.ButtonActive] = slot3_a29483(0.98, 0.06, 0.06, 1)
		slot1_a29479[slot2_a29481.Header] = slot3_a29483(0.98, 0.26, 0.26, 0.31)
		slot1_a29479[slot2_a29481.HeaderHovered] = slot3_a29483(0.98, 0.26, 0.26, 0.8)
		slot1_a29479[slot2_a29481.HeaderActive] = slot3_a29483(0.98, 0.26, 0.26, 1)
		slot1_a29479[slot2_a29481.Separator] = slot1_a29479[slot2_a29481.Border]
		slot1_a29479[slot2_a29481.SeparatorHovered] = slot3_a29483(0.75, 0.1, 0.1, 0.78)
		slot1_a29479[slot2_a29481.SeparatorActive] = slot3_a29483(0.75, 0.1, 0.1, 1)
		slot1_a29479[slot2_a29481.ResizeGrip] = slot3_a29483(0.98, 0.26, 0.26, 0.25)
		slot1_a29479[slot2_a29481.ResizeGripHovered] = slot3_a29483(0.98, 0.26, 0.26, 0.67)
		slot1_a29479[slot2_a29481.ResizeGripActive] = slot3_a29483(0.98, 0.26, 0.26, 0.95)
		slot1_a29479[slot2_a29481.TextSelectedBg] = slot3_a29483(0.98, 0.26, 0.26, 0.35)
		slot1_a29479[slot2_a29481.Text] = slot3_a29483(1, 1, 1, 1)
		slot1_a29479[slot2_a29481.TextDisabled] = slot3_a29483(0.5, 0.5, 0.5, 1)
		slot1_a29479[slot2_a29481.WindowBg] = slot3_a29483(0.06, 0.06, 0.06, 0.94)
		slot1_a29479[slot2_a29481.PopupBg] = slot3_a29483(0.08, 0.08, 0.08, 0.94)
		slot1_a29479[slot2_a29481.ComboBg] = slot1_a29479[slot2_a29481.PopupBg]
		slot1_a29479[slot2_a29481.Border] = slot3_a29483(0.43, 0.43, 0.5, 0.5)
		slot1_a29479[slot2_a29481.BorderShadow] = slot3_a29483(0, 0, 0, 0)
		slot1_a29479[slot2_a29481.MenuBarBg] = slot3_a29483(0.14, 0.14, 0.14, 1)
		slot1_a29479[slot2_a29481.ScrollbarBg] = slot3_a29483(0.02, 0.02, 0.02, 0.53)
		slot1_a29479[slot2_a29481.ScrollbarGrab] = slot3_a29483(0.31, 0.31, 0.31, 1)
		slot1_a29479[slot2_a29481.ScrollbarGrabHovered] = slot3_a29483(0.41, 0.41, 0.41, 1)
		slot1_a29479[slot2_a29481.ScrollbarGrabActive] = slot3_a29483(0.51, 0.51, 0.51, 1)
		slot1_a29479[slot2_a29481.CloseButton] = slot3_a29483(0.41, 0.41, 0.41, 0.5)
		slot1_a29479[slot2_a29481.CloseButtonHovered] = slot3_a29483(0.98, 0.39, 0.36, 1)
		slot1_a29479[slot2_a29481.CloseButtonActive] = slot3_a29483(0.98, 0.39, 0.36, 1)
		slot1_a29479[slot2_a29481.PlotLines] = slot3_a29483(0.61, 0.61, 0.61, 1)
		slot1_a29479[slot2_a29481.PlotLinesHovered] = slot3_a29483(1, 0.43, 0.35, 1)
		slot1_a29479[slot2_a29481.PlotHistogram] = slot3_a29483(0.9, 0.7, 0, 1)
		slot1_a29479[slot2_a29481.PlotHistogramHovered] = slot3_a29483(1, 0.6, 0, 1)
		slot1_a29479[slot2_a29481.ModalWindowDarkening] = slot3_a29483(0.8, 0.8, 0.8, 0.35)
	end

	function theme4()
		local slot1_a29782 = slot1_a29133.GetStyle().Colors
		local slot2_a29784 = slot1_a29133.Col
		local slot3_a29786 = slot1_a29133.ImVec4
		slot1_a29782[slot2_a29784.FrameBg] = slot3_a29786(0.16, 0.48, 0.42, 0.54)
		slot1_a29782[slot2_a29784.FrameBgHovered] = slot3_a29786(0.26, 0.98, 0.85, 0.4)
		slot1_a29782[slot2_a29784.FrameBgActive] = slot3_a29786(0.26, 0.98, 0.85, 0.67)
		slot1_a29782[slot2_a29784.TitleBg] = slot3_a29786(0.04, 0.04, 0.04, 1)
		slot1_a29782[slot2_a29784.TitleBgActive] = slot3_a29786(0.16, 0.48, 0.42, 1)
		slot1_a29782[slot2_a29784.TitleBgCollapsed] = slot3_a29786(0, 0, 0, 0.51)
		slot1_a29782[slot2_a29784.CheckMark] = slot3_a29786(0.26, 0.98, 0.85, 1)
		slot1_a29782[slot2_a29784.SliderGrab] = slot3_a29786(0.24, 0.88, 0.77, 1)
		slot1_a29782[slot2_a29784.SliderGrabActive] = slot3_a29786(0.26, 0.98, 0.85, 1)
		slot1_a29782[slot2_a29784.Button] = slot3_a29786(0.26, 0.98, 0.85, 0.4)
		slot1_a29782[slot2_a29784.ButtonHovered] = slot3_a29786(0.26, 0.98, 0.85, 1)
		slot1_a29782[slot2_a29784.ChildWindowBg] = slot3_a29786(0, 0, 0, 0)
		slot1_a29782[slot2_a29784.ButtonActive] = slot3_a29786(0.06, 0.98, 0.82, 1)
		slot1_a29782[slot2_a29784.Header] = slot3_a29786(0.26, 0.98, 0.85, 0.31)
		slot1_a29782[slot2_a29784.HeaderHovered] = slot3_a29786(0.26, 0.98, 0.85, 0.8)
		slot1_a29782[slot2_a29784.HeaderActive] = slot3_a29786(0.26, 0.98, 0.85, 1)
		slot1_a29782[slot2_a29784.Separator] = slot1_a29782[slot2_a29784.Border]
		slot1_a29782[slot2_a29784.SeparatorHovered] = slot3_a29786(0.1, 0.75, 0.63, 0.78)
		slot1_a29782[slot2_a29784.SeparatorActive] = slot3_a29786(0.1, 0.75, 0.63, 1)
		slot1_a29782[slot2_a29784.ResizeGrip] = slot3_a29786(0.26, 0.98, 0.85, 0.25)
		slot1_a29782[slot2_a29784.ResizeGripHovered] = slot3_a29786(0.26, 0.98, 0.85, 0.67)
		slot1_a29782[slot2_a29784.ResizeGripActive] = slot3_a29786(0.26, 0.98, 0.85, 0.95)
		slot1_a29782[slot2_a29784.PlotLines] = slot3_a29786(0.61, 0.61, 0.61, 1)
		slot1_a29782[slot2_a29784.PlotLinesHovered] = slot3_a29786(1, 0.81, 0.35, 1)
		slot1_a29782[slot2_a29784.TextSelectedBg] = slot3_a29786(0.26, 0.98, 0.85, 0.35)
		slot1_a29782[slot2_a29784.Text] = slot3_a29786(1, 1, 1, 1)
		slot1_a29782[slot2_a29784.TextDisabled] = slot3_a29786(0.5, 0.5, 0.5, 1)
		slot1_a29782[slot2_a29784.WindowBg] = slot3_a29786(0.06, 0.06, 0.06, 0.94)
		slot1_a29782[slot2_a29784.PopupBg] = slot3_a29786(0.08, 0.08, 0.08, 0.94)
		slot1_a29782[slot2_a29784.ComboBg] = slot1_a29782[slot2_a29784.PopupBg]
		slot1_a29782[slot2_a29784.Border] = slot3_a29786(0.43, 0.43, 0.5, 0.5)
		slot1_a29782[slot2_a29784.BorderShadow] = slot3_a29786(0, 0, 0, 0)
		slot1_a29782[slot2_a29784.MenuBarBg] = slot3_a29786(0.14, 0.14, 0.14, 1)
		slot1_a29782[slot2_a29784.ScrollbarBg] = slot3_a29786(0.02, 0.02, 0.02, 0.53)
		slot1_a29782[slot2_a29784.ScrollbarGrab] = slot3_a29786(0.31, 0.31, 0.31, 1)
		slot1_a29782[slot2_a29784.ScrollbarGrabHovered] = slot3_a29786(0.41, 0.41, 0.41, 1)
		slot1_a29782[slot2_a29784.ScrollbarGrabActive] = slot3_a29786(0.51, 0.51, 0.51, 1)
		slot1_a29782[slot2_a29784.CloseButton] = slot3_a29786(0.41, 0.41, 0.41, 0.5)
		slot1_a29782[slot2_a29784.CloseButtonHovered] = slot3_a29786(0.98, 0.39, 0.36, 1)
		slot1_a29782[slot2_a29784.CloseButtonActive] = slot3_a29786(0.98, 0.39, 0.36, 1)
		slot1_a29782[slot2_a29784.PlotHistogram] = slot3_a29786(0.9, 0.7, 0, 1)
		slot1_a29782[slot2_a29784.PlotHistogramHovered] = slot3_a29786(1, 0.6, 0, 1)
		slot1_a29782[slot2_a29784.ModalWindowDarkening] = slot3_a29786(0.8, 0.8, 0.8, 0.35)
	end

	function theme5()
		local slot0_a30084 = slot1_a29133.GetStyle()
		local slot1_a30085 = slot0_a30084.Colors
		local slot2_a30087 = slot1_a29133.Col
		local slot3_a30089 = slot1_a29133.ImVec4
		slot0_a30084.WindowTitleAlign = slot1_a29133.ImVec2(0.5, 0.84)
		slot0_a30084.Alpha = 1
		slot0_a30084.Colors[slot2_a30087.Text] = slot3_a30089(1, 1, 1, 1)
		slot0_a30084.Colors[slot2_a30087.TextDisabled] = slot3_a30089(0.139, 0.508, 0, 1)
		slot0_a30084.Colors[slot2_a30087.WindowBg] = slot3_a30089(0, 0, 0, 0.895)
		slot0_a30084.Colors[slot2_a30087.ChildWindowBg] = slot3_a30089(0, 0, 0, 0)
		slot0_a30084.Colors[slot2_a30087.PopupBg] = slot3_a30089(0.07, 0.07, 0.09, 1)
		slot0_a30084.Colors[slot2_a30087.Border] = slot3_a30089(0.184, 0.878, 0, 0.5)
		slot0_a30084.Colors[slot2_a30087.BorderShadow] = slot3_a30089(1, 1, 1, 0.1)
		slot0_a30084.Colors[slot2_a30087.TitleBg] = slot3_a30089(0.026, 0.597, 0, 1)
		slot0_a30084.Colors[slot2_a30087.TitleBgCollapsed] = slot3_a30089(0.099, 0.315, 0, 0)
		slot0_a30084.Colors[slot2_a30087.TitleBgActive] = slot3_a30089(0.026, 0.597, 0, 1)
		slot1_a30085[slot2_a30087.MenuBarBg] = slot3_a30089(0.1, 0.09, 0.12, 1)
		slot0_a30084.Colors[slot2_a30087.ScrollbarBg] = slot3_a30089(0, 0, 0, 0.801)
		slot0_a30084.Colors[slot2_a30087.ScrollbarGrab] = slot3_a30089(0.238, 0.238, 0.238, 1)
		slot0_a30084.Colors[slot2_a30087.ScrollbarGrabHovered] = slot3_a30089(0.238, 0.238, 0.238, 1)
		slot0_a30084.Colors[slot2_a30087.ScrollbarGrabActive] = slot3_a30089(0.004, 0.381, 0, 1)
		slot0_a30084.Colors[slot2_a30087.CheckMark] = slot3_a30089(0.009, 0.845, 0, 1)
		slot0_a30084.Colors[slot2_a30087.SliderGrab] = slot3_a30089(0.139, 0.508, 0, 1)
		slot0_a30084.Colors[slot2_a30087.SliderGrabActive] = slot3_a30089(0.139, 0.508, 0, 1)
		slot0_a30084.Colors[slot2_a30087.Button] = slot3_a30089(0, 0, 0, 0.4)
		slot0_a30084.Colors[slot2_a30087.ButtonHovered] = slot3_a30089(0, 0.619, 0.014, 1)
		slot0_a30084.Colors[slot2_a30087.ButtonActive] = slot3_a30089(0.139, 0.508, 0, 1)
		slot0_a30084.Colors[slot2_a30087.Header] = slot3_a30089(0.139, 0.508, 0, 1)
		slot0_a30084.Colors[slot2_a30087.HeaderHovered] = slot3_a30089(0.139, 0.508, 0, 1)
		slot0_a30084.Colors[slot2_a30087.HeaderActive] = slot3_a30089(0.139, 0.508, 0, 1)
		slot0_a30084.Colors[slot2_a30087.ResizeGrip] = slot3_a30089(0, 1, 0.221, 0.597)
		slot0_a30084.Colors[slot2_a30087.ResizeGripHovered] = slot3_a30089(0.26, 0.59, 0.98, 0.67)
		slot0_a30084.Colors[slot2_a30087.ResizeGripActive] = slot3_a30089(0.26, 0.59, 0.98, 0.95)
		slot0_a30084.Colors[slot2_a30087.PlotLines] = slot3_a30089(0.39, 0.39, 0.39, 1)
		slot0_a30084.Colors[slot2_a30087.PlotLinesHovered] = slot3_a30089(1, 0.43, 0.35, 1)
		slot0_a30084.Colors[slot2_a30087.PlotHistogram] = slot3_a30089(0.9, 0.7, 0, 1)
		slot0_a30084.Colors[slot2_a30087.PlotHistogramHovered] = slot3_a30089(1, 0.6, 0, 1)
		slot0_a30084.Colors[slot2_a30087.TextSelectedBg] = slot3_a30089(0.139, 0.508, 0, 1)
		slot0_a30084.Colors[slot2_a30087.ModalWindowDarkening] = slot3_a30089(0.2, 0.2, 0.2, 0.35)
		slot0_a30084.ScrollbarSize = 16
		slot0_a30084.GrabMinSize = 8
		slot0_a30084.WindowRounding = 0
		slot0_a30084.AntiAliasedLines = true
	end

	function theme6()
		local slot1_a30368 = slot1_a29133.GetStyle().Colors
		local slot2_a30370 = slot1_a29133.Col
		local slot3_a30372 = slot1_a29133.ImVec4
		slot1_a30368[slot2_a30370.Text] = slot3_a30372(0.9, 0.9, 0.9, 1)
		slot1_a30368[slot2_a30370.TextDisabled] = slot3_a30372(0.24, 0.23, 0.29, 1)
		slot1_a30368[slot2_a30370.ChildWindowBg] = slot3_a30372(0, 0, 0, 0)
		slot1_a30368[slot2_a30370.WindowBg] = slot3_a30372(0.06, 0.05, 0.07, 1)
		slot1_a30368[slot2_a30370.PopupBg] = slot3_a30372(0.07, 0.07, 0.09, 1)
		slot1_a30368[slot2_a30370.Border] = slot3_a30372(0.8, 0.8, 0.83, 0.88)
		slot1_a30368[slot2_a30370.BorderShadow] = slot3_a30372(0.92, 0.91, 0.88, 0)
		slot1_a30368[slot2_a30370.FrameBg] = slot3_a30372(0.1, 0.09, 0.12, 1)
		slot1_a30368[slot2_a30370.FrameBgHovered] = slot3_a30372(0.24, 0.23, 0.29, 1)
		slot1_a30368[slot2_a30370.FrameBgActive] = slot3_a30372(0.56, 0.56, 0.58, 1)
		slot1_a30368[slot2_a30370.TitleBg] = slot3_a30372(0.76, 0.31, 0, 1)
		slot1_a30368[slot2_a30370.TitleBgCollapsed] = slot3_a30372(1, 0.98, 0.95, 0.75)
		slot1_a30368[slot2_a30370.TitleBgActive] = slot3_a30372(0.8, 0.33, 0, 1)
		slot1_a30368[slot2_a30370.MenuBarBg] = slot3_a30372(0.1, 0.09, 0.12, 1)
		slot1_a30368[slot2_a30370.ScrollbarBg] = slot3_a30372(0.1, 0.09, 0.12, 1)
		slot1_a30368[slot2_a30370.ScrollbarGrab] = slot3_a30372(0.8, 0.8, 0.83, 0.31)
		slot1_a30368[slot2_a30370.ScrollbarGrabHovered] = slot3_a30372(0.56, 0.56, 0.58, 1)
		slot1_a30368[slot2_a30370.ScrollbarGrabActive] = slot3_a30372(0.06, 0.05, 0.07, 1)
		slot1_a30368[slot2_a30370.ComboBg] = slot3_a30372(0.19, 0.18, 0.21, 1)
		slot1_a30368[slot2_a30370.CheckMark] = slot3_a30372(1, 0.42, 0, 0.53)
		slot1_a30368[slot2_a30370.SliderGrab] = slot3_a30372(1, 0.42, 0, 0.53)
		slot1_a30368[slot2_a30370.SliderGrabActive] = slot3_a30372(1, 0.42, 0, 1)
		slot1_a30368[slot2_a30370.Button] = slot3_a30372(0.1, 0.09, 0.12, 1)
		slot1_a30368[slot2_a30370.ButtonHovered] = slot3_a30372(0.24, 0.23, 0.29, 1)
		slot1_a30368[slot2_a30370.ButtonActive] = slot3_a30372(0.56, 0.56, 0.58, 1)
		slot1_a30368[slot2_a30370.Header] = slot3_a30372(0.1, 0.09, 0.12, 1)
		slot1_a30368[slot2_a30370.HeaderHovered] = slot3_a30372(0.56, 0.56, 0.58, 1)
		slot1_a30368[slot2_a30370.HeaderActive] = slot3_a30372(0.06, 0.05, 0.07, 1)
		slot1_a30368[slot2_a30370.ResizeGrip] = slot3_a30372(0, 0, 0, 0)
		slot1_a30368[slot2_a30370.ResizeGripHovered] = slot3_a30372(0.56, 0.56, 0.58, 1)
		slot1_a30368[slot2_a30370.ResizeGripActive] = slot3_a30372(0.06, 0.05, 0.07, 1)
		slot1_a30368[slot2_a30370.CloseButton] = slot3_a30372(0.4, 0.39, 0.38, 0.16)
		slot1_a30368[slot2_a30370.CloseButtonHovered] = slot3_a30372(0.4, 0.39, 0.38, 0.39)
		slot1_a30368[slot2_a30370.CloseButtonActive] = slot3_a30372(0.4, 0.39, 0.38, 1)
		slot1_a30368[slot2_a30370.PlotLines] = slot3_a30372(0.4, 0.39, 0.38, 0.63)
		slot1_a30368[slot2_a30370.PlotLinesHovered] = slot3_a30372(0.25, 1, 0, 1)
		slot1_a30368[slot2_a30370.PlotHistogram] = slot3_a30372(0.4, 0.39, 0.38, 0.63)
		slot1_a30368[slot2_a30370.PlotHistogramHovered] = slot3_a30372(0.25, 1, 0, 1)
		slot1_a30368[slot2_a30370.TextSelectedBg] = slot3_a30372(0.25, 1, 0, 0.43)
		slot1_a30368[slot2_a30370.ModalWindowDarkening] = slot3_a30372(1, 0.98, 0.95, 0.73)
	end

	function theme7()
		local slot1_a30658 = slot1_a29133.GetStyle().Colors
		local slot2_a30660 = slot1_a29133.Col
		local slot3_a30662 = slot1_a29133.ImVec4
		slot1_a30658[slot2_a30660.WindowBg] = slot3_a30662(0.14, 0.12, 0.16, 1)
		slot1_a30658[slot2_a30660.PopupBg] = slot3_a30662(0.05, 0.05, 0.1, 0.9)
		slot1_a30658[slot2_a30660.Border] = slot3_a30662(0.89, 0.85, 0.92, 0.3)
		slot1_a30658[slot2_a30660.BorderShadow] = slot3_a30662(0, 0, 0, 0)
		slot1_a30658[slot2_a30660.FrameBg] = slot3_a30662(0.3, 0.2, 0.39, 1)
		slot1_a30658[slot2_a30660.FrameBgHovered] = slot3_a30662(0.41, 0.19, 0.63, 0.68)
		slot1_a30658[slot2_a30660.FrameBgActive] = slot3_a30662(0.41, 0.19, 0.63, 1)
		slot1_a30658[slot2_a30660.ChildWindowBg] = slot3_a30662(0, 0, 0, 0)
		slot1_a30658[slot2_a30660.TitleBg] = slot3_a30662(0.41, 0.19, 0.63, 0.45)
		slot1_a30658[slot2_a30660.TitleBgCollapsed] = slot3_a30662(0.41, 0.19, 0.63, 0.35)
		slot1_a30658[slot2_a30660.TitleBgActive] = slot3_a30662(0.41, 0.19, 0.63, 0.78)
		slot1_a30658[slot2_a30660.MenuBarBg] = slot3_a30662(0.3, 0.2, 0.39, 0.57)
		slot1_a30658[slot2_a30660.ScrollbarBg] = slot3_a30662(0.3, 0.2, 0.39, 1)
		slot1_a30658[slot2_a30660.ScrollbarGrab] = slot3_a30662(0.41, 0.19, 0.63, 0.31)
		slot1_a30658[slot2_a30660.ScrollbarGrabHovered] = slot3_a30662(0.41, 0.19, 0.63, 0.78)
		slot1_a30658[slot2_a30660.ScrollbarGrabActive] = slot3_a30662(0.41, 0.19, 0.63, 1)
		slot1_a30658[slot2_a30660.ComboBg] = slot3_a30662(0.3, 0.2, 0.39, 1)
		slot1_a30658[slot2_a30660.CheckMark] = slot3_a30662(0.56, 0.61, 1, 1)
		slot1_a30658[slot2_a30660.SliderGrab] = slot3_a30662(0.41, 0.19, 0.63, 0.24)
		slot1_a30658[slot2_a30660.SliderGrabActive] = slot3_a30662(0.41, 0.19, 0.63, 1)
		slot1_a30658[slot2_a30660.Button] = slot3_a30662(0.41, 0.19, 0.63, 0.44)
		slot1_a30658[slot2_a30660.ButtonHovered] = slot3_a30662(0.41, 0.19, 0.63, 0.86)
		slot1_a30658[slot2_a30660.ButtonActive] = slot3_a30662(0.64, 0.33, 0.94, 1)
		slot1_a30658[slot2_a30660.Header] = slot3_a30662(0.41, 0.19, 0.63, 0.76)
		slot1_a30658[slot2_a30660.HeaderHovered] = slot3_a30662(0.41, 0.19, 0.63, 0.86)
		slot1_a30658[slot2_a30660.HeaderActive] = slot3_a30662(0.41, 0.19, 0.63, 1)
		slot1_a30658[slot2_a30660.ResizeGrip] = slot3_a30662(0.41, 0.19, 0.63, 0.2)
		slot1_a30658[slot2_a30660.ResizeGripHovered] = slot3_a30662(0.41, 0.19, 0.63, 0.78)
		slot1_a30658[slot2_a30660.ResizeGripActive] = slot3_a30662(0.41, 0.19, 0.63, 1)
		slot1_a30658[slot2_a30660.CloseButton] = slot3_a30662(1, 1, 1, 0.75)
		slot1_a30658[slot2_a30660.CloseButtonHovered] = slot3_a30662(0.88, 0.74, 1, 0.59)
		slot1_a30658[slot2_a30660.CloseButtonActive] = slot3_a30662(0.88, 0.85, 0.92, 1)
		slot1_a30658[slot2_a30660.PlotLines] = slot3_a30662(0.89, 0.85, 0.92, 0.63)
		slot1_a30658[slot2_a30660.PlotLinesHovered] = slot3_a30662(0.41, 0.19, 0.63, 1)
		slot1_a30658[slot2_a30660.PlotHistogram] = slot3_a30662(0.89, 0.85, 0.92, 0.63)
		slot1_a30658[slot2_a30660.PlotHistogramHovered] = slot3_a30662(0.41, 0.19, 0.63, 1)
		slot1_a30658[slot2_a30660.TextSelectedBg] = slot3_a30662(0.41, 0.19, 0.63, 0.43)
		slot1_a30658[slot2_a30660.ModalWindowDarkening] = slot3_a30662(0.2, 0.2, 0.2, 0.35)
	end

	function theme8()
		local slot1_a30934 = slot1_a29133.GetStyle().Colors
		local slot2_a30936 = slot1_a29133.Col
		local slot3_a30938 = slot1_a29133.ImVec4
		slot1_a30934[slot2_a30936.Text] = slot3_a30938(0.9, 0.9, 0.9, 1)
		slot1_a30934[slot2_a30936.TextDisabled] = slot3_a30938(1, 1, 1, 1)
		slot1_a30934[slot2_a30936.WindowBg] = slot3_a30938(0, 0, 0, 1)
		slot1_a30934[slot2_a30936.PopupBg] = slot3_a30938(0, 0, 0, 1)
		slot1_a30934[slot2_a30936.Border] = slot3_a30938(0.82, 0.77, 0.78, 1)
		slot1_a30934[slot2_a30936.BorderShadow] = slot3_a30938(0.35, 0.35, 0.35, 0.66)
		slot1_a30934[slot2_a30936.FrameBg] = slot3_a30938(1, 1, 1, 0.28)
		slot1_a30934[slot2_a30936.ChildWindowBg] = slot3_a30938(0, 0, 0, 0)
		slot1_a30934[slot2_a30936.FrameBgHovered] = slot3_a30938(0.68, 0.68, 0.68, 0.67)
		slot1_a30934[slot2_a30936.FrameBgActive] = slot3_a30938(0.79, 0.73, 0.73, 0.62)
		slot1_a30934[slot2_a30936.TitleBg] = slot3_a30938(0, 0, 0, 1)
		slot1_a30934[slot2_a30936.TitleBgActive] = slot3_a30938(0.46, 0.46, 0.46, 1)
		slot1_a30934[slot2_a30936.TitleBgCollapsed] = slot3_a30938(0, 0, 0, 1)
		slot1_a30934[slot2_a30936.MenuBarBg] = slot3_a30938(0, 0, 0, 0.8)
		slot1_a30934[slot2_a30936.ScrollbarBg] = slot3_a30938(0, 0, 0, 0.6)
		slot1_a30934[slot2_a30936.ScrollbarGrab] = slot3_a30938(1, 1, 1, 0.87)
		slot1_a30934[slot2_a30936.ScrollbarGrabHovered] = slot3_a30938(1, 1, 1, 0.79)
		slot1_a30934[slot2_a30936.ScrollbarGrabActive] = slot3_a30938(0.8, 0.5, 0.5, 0.4)
		slot1_a30934[slot2_a30936.ComboBg] = slot3_a30938(0.24, 0.24, 0.24, 0.99)
		slot1_a30934[slot2_a30936.CheckMark] = slot3_a30938(0.99, 0.99, 0.99, 0.52)
		slot1_a30934[slot2_a30936.SliderGrab] = slot3_a30938(1, 1, 1, 0.42)
		slot1_a30934[slot2_a30936.SliderGrabActive] = slot3_a30938(0.76, 0.76, 0.76, 1)
		slot1_a30934[slot2_a30936.Button] = slot3_a30938(0.51, 0.51, 0.51, 0.6)
		slot1_a30934[slot2_a30936.ButtonHovered] = slot3_a30938(0.68, 0.68, 0.68, 1)
		slot1_a30934[slot2_a30936.ButtonActive] = slot3_a30938(0.67, 0.67, 0.67, 1)
		slot1_a30934[slot2_a30936.Header] = slot3_a30938(0.72, 0.72, 0.72, 0.54)
		slot1_a30934[slot2_a30936.HeaderHovered] = slot3_a30938(0.92, 0.92, 0.95, 0.77)
		slot1_a30934[slot2_a30936.HeaderActive] = slot3_a30938(0.82, 0.82, 0.82, 0.8)
		slot1_a30934[slot2_a30936.Separator] = slot3_a30938(0.73, 0.73, 0.73, 1)
		slot1_a30934[slot2_a30936.SeparatorHovered] = slot3_a30938(0.81, 0.81, 0.81, 1)
		slot1_a30934[slot2_a30936.SeparatorActive] = slot3_a30938(0.74, 0.74, 0.74, 1)
		slot1_a30934[slot2_a30936.ResizeGrip] = slot3_a30938(0.8, 0.8, 0.8, 0.3)
		slot1_a30934[slot2_a30936.ResizeGripHovered] = slot3_a30938(0.95, 0.95, 0.95, 0.6)
		slot1_a30934[slot2_a30936.ResizeGripActive] = slot3_a30938(1, 1, 1, 0.9)
		slot1_a30934[slot2_a30936.CloseButton] = slot3_a30938(0.45, 0.45, 0.45, 0.5)
		slot1_a30934[slot2_a30936.CloseButtonHovered] = slot3_a30938(0.7, 0.7, 0.9, 0.6)
		slot1_a30934[slot2_a30936.CloseButtonActive] = slot3_a30938(0.7, 0.7, 0.7, 1)
		slot1_a30934[slot2_a30936.PlotLines] = slot3_a30938(1, 1, 1, 1)
		slot1_a30934[slot2_a30936.PlotLinesHovered] = slot3_a30938(1, 1, 1, 1)
		slot1_a30934[slot2_a30936.PlotHistogram] = slot3_a30938(1, 1, 1, 1)
		slot1_a30934[slot2_a30936.PlotHistogramHovered] = slot3_a30938(1, 1, 1, 1)
		slot1_a30934[slot2_a30936.TextSelectedBg] = slot3_a30938(1, 1, 1, 0.35)
		slot1_a30934[slot2_a30936.ModalWindowDarkening] = slot3_a30938(0.88, 0.88, 0.88, 0.35)
	end

	function theme9()
		slot1_a29133.SwitchContext()

		local slot1_a31247 = slot1_a29133.GetStyle().Colors
		local slot2_a31249 = slot1_a29133.Col
		local slot3_a31251 = slot1_a29133.ImVec4
		local slot4_a31253 = slot1_a29133.ImVec2
		slot1_a31247[slot2_a31249.Text] = slot3_a31251(0.95, 0.96, 0.98, 1)
		slot1_a31247[slot2_a31249.TextDisabled] = slot3_a31251(0.29, 0.29, 0.29, 1)
		slot1_a31247[slot2_a31249.WindowBg] = slot3_a31251(0.14, 0.14, 0.14, 1)
		slot1_a31247[slot2_a31249.PopupBg] = slot3_a31251(0.08, 0.08, 0.08, 0.94)
		slot1_a31247[slot2_a31249.Border] = slot3_a31251(0.14, 0.14, 0.14, 1)
		slot1_a31247[slot2_a31249.ChildWindowBg] = slot3_a31251(0, 0, 0, 0)
		slot1_a31247[slot2_a31249.BorderShadow] = slot3_a31251(1, 1, 1, 0.51)
		slot1_a31247[slot2_a31249.FrameBg] = slot3_a31251(0.22, 0.22, 0.22, 1)
		slot1_a31247[slot2_a31249.FrameBgHovered] = slot3_a31251(0.18, 0.18, 0.18, 1)
		slot1_a31247[slot2_a31249.FrameBgActive] = slot3_a31251(0.09, 0.12, 0.14, 1)
		slot1_a31247[slot2_a31249.TitleBg] = slot3_a31251(0.14, 0.14, 0.14, 0.81)
		slot1_a31247[slot2_a31249.TitleBgActive] = slot3_a31251(0.14, 0.14, 0.14, 1)
		slot1_a31247[slot2_a31249.TitleBgCollapsed] = slot3_a31251(0, 0, 0, 0.51)
		slot1_a31247[slot2_a31249.MenuBarBg] = slot3_a31251(0.2, 0.2, 0.2, 1)
		slot1_a31247[slot2_a31249.ScrollbarBg] = slot3_a31251(0.02, 0.02, 0.02, 0.39)
		slot1_a31247[slot2_a31249.ScrollbarGrab] = slot3_a31251(0.36, 0.36, 0.36, 1)
		slot1_a31247[slot2_a31249.ScrollbarGrabHovered] = slot3_a31251(0.18, 0.22, 0.25, 1)
		slot1_a31247[slot2_a31249.ScrollbarGrabActive] = slot3_a31251(0.24, 0.24, 0.24, 1)
		slot1_a31247[slot2_a31249.ComboBg] = slot3_a31251(0.24, 0.24, 0.24, 1)
		slot1_a31247[slot2_a31249.CheckMark] = slot3_a31251(1, 0.28, 0.28, 1)
		slot1_a31247[slot2_a31249.SliderGrab] = slot3_a31251(1, 0.28, 0.28, 1)
		slot1_a31247[slot2_a31249.SliderGrabActive] = slot3_a31251(1, 0.28, 0.28, 1)
		slot1_a31247[slot2_a31249.Button] = slot3_a31251(1, 0.28, 0.28, 1)
		slot1_a31247[slot2_a31249.ButtonHovered] = slot3_a31251(1, 0.39, 0.39, 1)
		slot1_a31247[slot2_a31249.ButtonActive] = slot3_a31251(1, 0.21, 0.21, 1)
		slot1_a31247[slot2_a31249.Header] = slot3_a31251(1, 0.28, 0.28, 1)
		slot1_a31247[slot2_a31249.HeaderHovered] = slot3_a31251(1, 0.39, 0.39, 1)
		slot1_a31247[slot2_a31249.HeaderActive] = slot3_a31251(1, 0.21, 0.21, 1)
		slot1_a31247[slot2_a31249.ResizeGrip] = slot3_a31251(1, 0.28, 0.28, 1)
		slot1_a31247[slot2_a31249.ResizeGripHovered] = slot3_a31251(1, 0.39, 0.39, 1)
		slot1_a31247[slot2_a31249.ResizeGripActive] = slot3_a31251(1, 0.19, 0.19, 1)
		slot1_a31247[slot2_a31249.CloseButton] = slot3_a31251(0.4, 0.39, 0.38, 0.16)
		slot1_a31247[slot2_a31249.CloseButtonHovered] = slot3_a31251(0.4, 0.39, 0.38, 0.39)
		slot1_a31247[slot2_a31249.CloseButtonActive] = slot3_a31251(0.4, 0.39, 0.38, 1)
		slot1_a31247[slot2_a31249.PlotLines] = slot3_a31251(0.61, 0.61, 0.61, 1)
		slot1_a31247[slot2_a31249.PlotLinesHovered] = slot3_a31251(1, 0.43, 0.35, 1)
		slot1_a31247[slot2_a31249.PlotHistogram] = slot3_a31251(1, 0.21, 0.21, 1)
		slot1_a31247[slot2_a31249.PlotHistogramHovered] = slot3_a31251(1, 0.18, 0.18, 1)
		slot1_a31247[slot2_a31249.TextSelectedBg] = slot3_a31251(1, 0.32, 0.32, 1)
		slot1_a31247[slot2_a31249.ModalWindowDarkening] = slot3_a31251(0.26, 0.26, 0.26, 0.6)
	end
end
