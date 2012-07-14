--- Copyright 2012 GMPA-Paradise

-- Author & Contributors: QCherry, VOID
local version = "0.1"
local gmname = "GMPA-Paradise"
local mysqlhost = "localhost"
local mysqlusername = "username" --- Zapamitać, zrobić wczytywanie z configu
local mysqlpass = "pass"
local databasedb = "db"

function InitGamemode()
		--MySQL
		mysql_connect(mysqlhost, mysqlusername, mysqlpass, databasedb);
		if ( not handler ) then
					print("         Unable to connect mysql           ");
				else
					print("         Connected to MySQL          ");
		end
		--End MySQL
		-- GameMode config
		SetGamemodeName(string.format("%s %s",gmname,version));
		EnableChat(0);
		-- End GameMode config
end
function guiCharacter(playerid)
		name = GetPlayerName(playerid);
		local NameDraw = CreateDraw(6500,400 , string.format("%s %s" , "Character :" , name) , "Font_Old_10_White_Hi.TGA" ,236 , 236 , 236);
		ShowDraw(playerid , testowyRysunek);
		local IdDraw = CreateDraw(6500 , 600 , string.format("%s %s" , "ID :" , playerid), "Font_Old_10_White_Hi.TGA" , 236 , 236 , 236);
		ShowDraw(playerid , Rysunekid);
		weaponmode = GetEquippedMeleeWeapon(playerid);
		linfooxx = string.format("%s %s" , "Weapon :" , weaponmode);
		local WeaponDraw = CreateDraw(6500 , 800 , infooxx , "Font_Old_10_White_Hi.TGA" , 236 , 236 , 236);
		ShowDraw(playerid , RysunekBron);
		local TimerDraws = SetTimerEx("guiCharacterUpdate" , 4000 , 1 , playerid);
end

function guiCharacterUpdate(playerid) -- Dobra poprawiłem :-)
		name = GetPlayerName(playerid);
		weaponmode = GetEquippedMeleeWeapon(playerid);
		linfooxx = string.format("%s %s" , "Weapon :" , weaponmode);
		UpdateDraw(NameDraw , 6500 , 400 , string.format("%s %s" , "Character :" , name) , "Font_Old_10_White_Hi.TGA" ,236 , 236 , 236);
		UpdateDraw(IdDraw , 6500 , 600 , string.format("%s %s" , "ID :" , playerid), "Font_Old_10_White_Hi.TGA" , 236 , 236 , 236);
		UpdateDraw(WeaponDraw , 6350 , 800 , infooxx , "Font_Old_10_White_Hi.TGA" , 236 , 236 , 236);
end
function OnGamemodeInit()
	print("------------------------------------------------------");
	print("Loading GMPA-Paradise 0.1 for Gothic Multiplayer: Accrescere");
	print("         Author & Contributors: QCherry, V0ID          ");
	print("         OpenSource - For develop RP Servers           ");
	print("------------------------------------------------------");
	InitGamemode();
end

function OnPlayerSpawn(playerid)
	guiCharacter(playerid);
end
