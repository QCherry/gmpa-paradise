--- Copyright 2012 GMPA-Paradise

-- Author & Contributors: QCherry, VOID
local version = "0.1"
local servername = "GMPA Paradise RP"
local gmname = "GMPA-Paradise"
--local mysqlhost = "localhost"
--local mysqlusername = "username"
--local mysqlpass = "pass"
--local databasedb = "db"

--other locals
local MAX_PLAYERS = GetMaxPlayers();
local MaxPlayers = 100;
local Player = {};

function InitGamemode()
   --pêtla
   for i = 0, MaxPlayers - 1 do
                Player[i] = {};
                Player[i].loggedIn = nil;
   end
   -- end pêtla
		--MySQL
		
		--local conmysql = mysql_connect(mysqlhost, mysqlusername, mysqlpass, databasedb);
		--if ( not conmysql ) then
			--		print("         Unable to connect mysql           ");
				--else
					--print("         Connected to MySQL          ");
		--end
		print(", , , , , , , , ,,... , , , , , , , , , ,,,,, , , , , , , , , ,   , , ,     , , , , ,   , ");
		print(", , , , , , 1BOSSSBB. ,BQr, , ,BQ  HQFWWMEZ,, , QBS ,   , ,   , , , ,   ,   ,   ,     ,");
		print(",   , , ,   , QB  , , v.  QHQ,, ,BFB, SB, , ,BE , 8B,BH , , , , , , ,   , ,   , , , , , , ");
		print(", ,   , , , ,B: , lFKYJ ,B,:Q ,ZJ Q ,HQHFSW0QO. tB.,vBl , , , , , , , , , , ,   , , , ,  ");
		print(", , , , , , , QB, , , OB, Q.,BMvQ .B, FB ,.,, E.;BLlJ;HQ; ,   , , , , ,       , , , , , , ");
		print(", , , , , , , y0W1110Er ,Q. ,QQ  .Q ,YQ , ,   ,Q. , , ;B.   , , , , ,   , , , , ,   , , ,");
		print(", ,:;;l;r , , , . ,.. , ::;:i.  , , ,:, , , .:r;;..   , . , .vHJL., ,,:rl;llY,, ,   , , , ");
		print(",hQ;lllHQy, , QBQ   , QS::i:UBv , ,OQB. , ,BQ;LlJ0Q:, QQ, QB:..;QO, QB:i;rlv, , , , , , ,");
		print(", HQ, , ,BQ   Qh,CQ , ,QL ,,,.QK, ,KQ .Q, , QE, , ,lQ ,BQ ,ZQvr., , ,RQ ,,.., , , , ,   , ");
		print(",LQ1W0E0U , QBYvUBQ   QWUyOBQ , ,;QSY;QB, ,BZ   , ,Q. QQ, , :YKCOF  RB;vJUH;, , , , ,   ,");
		print("FB, , , , BB,...,BQ ,B: , ,BQ.,;Q:... BB, QB, ,,rBZ ,BQ .BJ , ,rQ.,BQ , , , ,   ,   ,   ");
		print(",rB , , , .Q, , , ,Q. B., , ,KZ,RY, ,   BJ,hOCEEEF: , SK, .MREEMM., JOCME0EEr   , ,   , ,");
		print(", , ,   , , , , , , , , , , , , , ,   , , , , ,   , ,   , , , , , , ,     , , , , , , , ,");
			 
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
	print("         Author & Contributors: QCherry, V0ID, Seq          ");
	print("         OpenSource - For develop RP Servers           ");
	print("------------------------------------------------------");
	InitGamemode();
end

function OnPlayerSpawn(playerid)
	FreezePlayer(playerid,1);
end
function OnPlayerConnect(playerid)
        FreezePlayer(playerid,1);
        Player[playerid].name = GetPlayerName(playerid);
        local file = io.open(Player[playerid].name..".par","r+");
        if file then
                SendPlayerMessage(playerid,230,230,230,"There is saved data for your character. Enter your credentials please!");
                file:close();
        else
                SendPlayerMessage(playerid,230,230,230,"No data exists for this name. Please register!");
        end
end

function OnPlayerChangeClass(playerid, classid) 
    SpawnPlayer(playerid);
end

function OnPlayerCommandText(playerid , cmdtext)
	local cmd , params = GetCommand(cmdtext);

        if cmd == "/register" then
                if Player[playerid].loggedIn == nil then
                        CMD_Register(playerid,params);
                else
                        SendPlayerMessage(playerid,230,230,230,"You've already registered a character!");
                end
        elseif cmd == "/login" then
                if Player[playerid].loggedIn == nil then
                        CMD_Login(playerid,params);
                else
                        SendPlayerMessage(playerid,230,230,230,"You're logged in already!");
                end
        elseif cmd == "/changepw" then
                if Player[playerid].loggedIn == 1 then
                        CMD_ChangePassword(playerid,params);
                else
                        SendPlayerMessage(playerid,230,230,230,"You need to be logged in!");
                end
        end
		
	if cmd == "/b" then

	CMD_OOC(playerid , params);

	elseif cmd == "/w" then

	CMD_PM(playerid , params);

	end
end



function OnPlayerText(playerid , text)
	local name = GetPlayerName(playerid);
for i = 0, MAX_PLAYERS - 1 do

	if GetDistancePlayers(playerid , i) <= 1000 then
		
			SendPlayerMessage(i , 236 , 236 , 236 , string.format("%s %s %s" , name , "say:" , text)); 

	end
end

end


function CMD_OOC(playerid , params)
local result , chattext = sscanf(params , "s")
local name = GetPlayerName(playerid);
		for i = 0, MAX_PLAYERS - 1 do

	if GetDistancePlayers(playerid , i) <= 900 then
		
		SendPlayerMessage(i , 236 , 236 , 236 , string.format("%s : ((%s))" ,name , chattext));
	end

		end 

end


function CMD_PM(playerid , params)
	local name = GetPlayerName(playerid);
	local result , lid , msg = sscanf(params , "ds");
if result == 1 then
	if IsPlayerConnected(lid) then
	
		SendPlayerMessage(lid , 236 , 236 , 236 , string.format("%s : %s" , name , msg));
		GameTextForPlayer(lid , 3000 , 3000 , "You have got PM!" , "Font_Old_20_White_Hi.TGA" , 236 , 236 , 236 , 1000);
		GameTextForPlayer(playerid , 3000 , 3000 , "Message sended!" , "Font_Old_20_White_Hi.TGA" , 236 , 236 , 236 , 1000);

	else
		GameTextForPlayer(playerid , 3000 , 3000 , "Player is not online!" , "Font_Old_20_White_Hi.TGA" , 236 , 236 , 236 , 1000);
	end
else 

	SendPlayerMessage(playerid, 236 , 236 , 236 , "Bad message format!");
	SendPlayerMessage(playerid , 236 , 236 , 236 , "use : /pm id message");

end

end

function CMD_Register(playerid,params)
        local result, password = sscanf(params,"s");
        if result == 1 then
                local fileRead = io.open(Player[playerid].name..".par","r+");
                if fileRead then
                        SendPlayerMessage(playerid,230,230,230,"An account with this name exists! Login or choose a different name!");
                        fileRead:close();
                else
                        Player[playerid].password = password;
                        print(Player[playerid].name.." registered!");
                        WriteDatabase(playerid);
                        Player[playerid].loggedIn = 1;
                        SendPlayerMessage(playerid,230,230,230,"You've completed your registration successfully!");
                        FreezePlayer(playerid,0);
                end
        else
                SendPlayerMessage(playerid,230,230,230,"Use: /register (password)");
        end
end

function CMD_Login(playerid,params)
        local result, password = sscanf(params,"s");
        if result == 1 then
                local file = io.open(Player[playerid].name..".par","r+");
                if file then
                        local tempvar = file:read("*l");
                        local result, trashName, pass = sscanf(tempvar,"ss");
                        if result == 1 then
                                if pass == password then
                                        Player[playerid].password = password;
                                        ReadDatabase(playerid);
                                        print(Player[playerid].name.." logged in!");
                                        SendPlayerMessage(playerid,230,230,230,"You've logged in successfully!");
                                        Player[playerid].loggedIn = 1;
                                        FreezePlayer(playerid,0);
										guiCharacter(playerid);
                                else
                                        SendPlayerMessage(playerid,230,230,230,"The password is not correct!");
                                end
                        end
                        file:close();
                else
                        SendPlayerMessage(playerid,230,230,230,"No data exists for this name. Please register with /register!");
                end
        else
                SendPlayerMessage(playerid,230,230,230,"Use: /login (password)");
        end
end

function CMD_ChangePassword(playerid,params)
        local result, oldpw, newpw = sscanf(params,"ss");
        if result == 1 then
                if oldpw == Player[playerid].password then
                        Player[playerid].password = newpw;
                        print(Player[playerid].name.." changed his password!");
                        WriteDatabase(playerid);
                        SendPlayerMessage(playerid,230,230,230,"You've changed your password!");
                else
                        SendPlayerMessage(playerid,230,230,230,"You didn't enter your old password properly!");
                end
        else
                SendPlayerMessage(playerid,230,230,230,"Use: /changepw (oldpassword) (newpassword)");
        end
end

function OnPlayerDisconnect(playerid, reason)
        if Player[playerid].loggedIn == 1 then
                print(Player[playerid].name.." logged off!");
                WriteDatabase(playerid);
                Player[playerid].loggedIn = nil;
        else
                Player[playerid].loggedIn = nil;
        end
end

function WriteDatabase(playerid)
        local world = GetPlayerWorld(playerid);
        local x, y, z = GetPlayerPos(playerid);
        local angle = GetPlayerAngle(playerid);
        local fatness = GetPlayerFatness(playerid);
        local HP = GetPlayerHealth(playerid);
        local MaxHP = GetPlayerMaxHealth(playerid);
        local Mana = GetPlayerMana(playerid);
        local MaxMana = GetPlayerMaxMana(playerid);
        local Lvl = GetPlayerLevel(playerid);
        local MagLvl = GetPlayerMagicLevel(playerid);
        local LP = GetPlayerLearnPoints(playerid);
        local XP = GetPlayerExperience(playerid);
        local NextXP = GetPlayerExperienceNextLevel(playerid);
        local Str = GetPlayerStrength(playerid);
        local Dex = GetPlayerDexterity(playerid);
        local OneH = GetPlayerSkillWeapon(playerid, 0);
        local TwoH = GetPlayerSkillWeapon(playerid, 1);
        local Bow = GetPlayerSkillWeapon(playerid, 2);
        local Xbow = GetPlayerSkillWeapon(playerid, 3);
        local Acro = GetPlayerAcrobatic(playerid);
        local equippedMeleeWeapon = GetEquippedMeleeWeapon(playerid);
        local equippedRangedWeapon = GetEquippedRangedWeapon(playerid);
        local equippedArmor = GetEquippedArmor(playerid);
        local class = setPlayerClass(playerid, class);
        local fileWrite = io.open(Player[playerid].name..".par", "w+");
        fileWrite:write(Player[playerid].name.." "..Player[playerid].password.."\n");
        fileWrite:write(world," ",x," ",y," ",z," ",angle,"\n");
        fileWrite:write(fatness,"\n");
        fileWrite:write(HP," ",MaxHP," ",Mana," ",MaxMana,"\n");
        fileWrite:write(Lvl," ",MagLvl," ",LP," ",XP," ",NextXP,"\n");
        --fileWrite:write(Str," ",Dex," ",OneH," ",TwoH," ",Bow," ",Xbow," ",class,"\n");
		fileWrite:write(Str," ",Dex," ",OneH," ",TwoH," ",Bow," ",Xbow,"\n");
        fileWrite:write(Acro,"\n");
        fileWrite:write(equippedMeleeWeapon," ",equippedRangedWeapon," ",equippedArmor);
        fileWrite:close();
end

function ReadDatabase(playerid)
        local fileRead = io.open(Player[playerid].name..".par","r+");
        tempvar = fileRead:read("*l"); --name and password, these are global -> unprocessed, this line is read just to jump to line two
        tempvar = fileRead:read("*l");
        local result, world, x, y, z, angle = sscanf(tempvar,"sdddd");
        if result == 1 then
                local currentWorld = GetPlayerWorld(playerid);
                if currentWorld ~= world then
                        if world == "ADDON\\ADDONWORLD.ZEN" then
                                SetPlayerWorld(playerid,"ADDON\\ADDONWORLD.ZEN","ADW_ENTRANCE");
                        elseif world == "AETEROX_LAGERFEUER.ZEN" then
                                SetPlayerWorld(playerid,"AETEROX_LAGERFEUER.ZEN","ADW_ENTRANCE");
                        elseif world == "OLDWORLD\\OLDWORLD.ZEN" then
                                SetPlayerWorld(playerid,"OLDWORLD\\OLDWORLD.ZEN","START");
                        elseif world == "NEWWORLD\\NEWWORLD.ZEN" then
                                SetPlayerWorld(playerid,"NEWWORLD\\NEWWORLD.ZEN","START");
                        elseif world == "NEWWORLD\\DRAGONISLAND.ZEN" then
                                SetPlayerWorld(playerid,"NEWWORLD\\DRAGONISLAND.ZEN","SHIP");
                        end
                end
                SetPlayerPos(playerid, x, y, z);
                SetPlayerAngle(playerid,angle);
        end
        tempvar = fileRead:read("*l");
        local result, fatness = sscanf(tempvar,"d");
        if result == 1 then
                SetPlayerFatness(playerid,fatness);
        end
        tempvar = fileRead:read("*l");
        local result, HP, MaxHP, Mana, MaxMana = sscanf(tempvar,"dddd");
        if result == 1 then
                SetPlayerHealth(playerid, HP);
                SetPlayerMaxHealth(playerid,MaxHP);
                SetPlayerMana(playerid, Mana);
                SetPlayerMaxMana(playerid, MaxMana);
        end
        tempvar = fileRead:read("*l");
        local result, Lvl, MagLvl, LP, XP, NextXP = sscanf(tempvar,"ddddd");
        if result == 1 then
                SetPlayerLevel(playerid, Lvl);
                SetPlayerMagicLevel(playerid, MagLvl);
                SetPlayerLearnPoints(playerid, LP);
                SetPlayerExperience(playerid, XP);
                SetPlayerExperienceNextLevel(playerid, NextXP);
        end
        tempvar = fileRead:read("*l");
        local result, Str, Dex, OneH, TwoH, Bow, Xbow, class = sscanf(tempvar,"ddddddd");
        if result == 1 then
                SetPlayerStrength(playerid, Str);
                SetPlayerDexterity(playerid, Dex);
                SetPlayerSkillWeapon(playerid, 0, OneH);
                SetPlayerSkillWeapon(playerid, 1, TwoH);
                SetPlayerSkillWeapon(playerid, 2, Bow);
                SetPlayerSkillWeapon(playerid, 3, Xbow);
				setPlayerClass(playerid, class);
        end
        tempvar = fileRead:read("*l");
        local result, Acro = sscanf(tempvar,"s");       
        if result == 1 then
                SetPlayerAcrobatic(playerid, Acro);
        end
        tempvar = fileRead:read("*l");
        local result, Melee, Ranged, Armor = sscanf(tempvar,"sss");
        if result == 1 then
                if MeleeWep ~= "NULL" then
                        EquipMeleeWeapon(playerid, Melee);
                end
                if RangWep ~= "NULL" then
                        EquipRangedWeapon(playerid, Ranged);
                end
                if Armor ~= "NULL" then
                        EquipArmor(playerid, Armor);
                end
        end
        fileRead:close();
end


--Classes
function GPlayerClass(playerid, class)
--code
end

function setPlayerClass(playerid, class)
 if fire == 1 then
    Fire(playerid);
 elseif water == 2 then
    Water(playerid);
 elseif paladin == 3 then
    Paladin(playerid);
 elseif mpolice == 4 then
    MPolice(playerid);
 elseif king == 5 then
 king(playerid);
 end
end

function Fire (playerid)
        SetPlayerStrength(playerid,200);
		local level = 27;
	    SetPlayerLevel(playerid,level);
end

function Water (playerid)
        SetPlayerStrength(playerid,200);
end

function Paladin (playerid)
        SetPlayerStrength(playerid,200);
end

function MPolice (playerid)
        SetPlayerStrength(playerid,200);
end

function king (playerid)
        SetPlayerStrength(playerid,200);
end