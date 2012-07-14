--- Copyright 2012 GMPA-Paradise

-- Author & Contributors: QCherry, VOID
local version = "0.1"
local servername = "GMPA Paradise RP"
local gmname = "GMPA-Paradise"
local mysqlhost = "localhost"
local mysqlusername = "username"
local mysqlpass = "pass"
local databasedb = "db"

function InitGamemode()
		--MySQL
		local conmysql = mysql_connect(mysqlhost, mysqlusername, mysqlpass, databasedb);
		if ( not conmysql ) then
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
		local servernmd = CreateDraw(6500,200 , string.format("%s" , servername) , "Font_Old_10_White_Hi.TGA" ,236 , 236 , 236);
		ShowDraw(playerid , servernmd);
		local testowyRysunek = CreateDraw(6500,400 , string.format("%s" , "|Character: ") , "Font_Old_10_White_Hi.TGA" ,236 , 236 , 236);
		ShowDraw(playerid , testowyRysunek);
		name = GetPlayerName(playerid);
		local usern = CreateDraw(6500,600 , string.format("%s%s" , "|",name) , "Font_Old_10_White_Hi.TGA" ,236 , 236 , 236);
		ShowDraw(playerid , usern);
		level = GetPlayerLevel(playerid);
		local Rysunekid = CreateDraw(6500 , 800 , string.format("%s %d" , "|Level: " , level), "Font_Old_10_White_Hi.TGA" , 236 , 236 , 236);
		ShowDraw(playerid , Rysunekid);
		nxtlvl = GetPlayerExperienceNextLevel(playerid);
		local instancee = CreateDraw(6500,1000 , string.format("%s %s" , "|Next LVL:" , nxtlvl) , "Font_Old_10_White_Hi.TGA" ,236 , 236 , 236);
		ShowDraw(playerid , instancee);
		local linee = "|";
		local line = CreateDraw(6500,1200 , string.format("%s %s" , "|______________________________" , linee) , "Font_Old_10_White_Hi.TGA" ,236 , 236 , 236);
		ShowDraw(playerid , line)
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