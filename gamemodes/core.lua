--- Copyright 2012 GMPA-Paradise

-- Author & Contributors: QCherry, VOID
local version = "0.1"
local mysqlhost = "localhost"
local mysqlusername = "username"
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
		SetGamemodeName("GMPA-Paradise",version);
		-- End GameMode config
end
function guiCharacter()
		local name = GetPlayerName(playerid);
		local testowyRysunek = CreateDraw(6500,400 , string.format("%s %s" , "Character :" , name) , "Font_Old_10_White_Hi.TGA" ,236 , 236 , 236);
		ShowDraw(playerid , testowyRysunek);
		local Rysunekid = CreateDraw(6500 , 600 , string.format("%s %s" , "ID :" , playerid), "Font_Old_10_White_Hi.TGA" , 236 , 236 , 236);
		ShowDraw(playerid , Rysunekid);
		weaponmode = GetPlayerWeaponMode(playerid);
		local infooxx = string.format("%s %d" , "Weapon :" , weaponmode);
		local RysunekBron = CreateDraw(6500 , 800 , infooxx , "Font_Old_10_White_Hi.TGA" , 236 , 236 , 236);
		ShowDraw(playerid , RysunekBron);
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
	guiCharacter();
end
