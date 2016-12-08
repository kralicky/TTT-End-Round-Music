if ( SERVER ) then
	
	--[[
	
		Set up sound tables here. 
		Must be in the format of { "url", "Artist - Songname" }
		Make sure to add commas between table entries, and don't put a comma on the last entry.
	
	--]]
	
	innowinsounds = {
		{ "https://www.dropbox.com/s/m460os1qlfp9xa0/Queen%20-%20Don%27t%20stop%20me%20now.mp3?dl=1", "Queen - Don't Stop Me Now" },
		{ "https://www.dropbox.com/s/qtzguewozdx7o8z/Europe%20-%20The%20Final%20Countdown%20chorus.mp3?dl=1", "Europe - The Final Countdown (Chorus)" },
		{ "http://ltbttt.site.nfoservers.com/erm/bimh.mp3", "Redlight King - Bullet In My Hand" },
		{ "http://ltbttt.site.nfoservers.com/erm/99p.mp3", "Jay-Z - 99 Problems" },
		{ "http://ltbttt.site.nfoservers.com/erm/bondtheme.mp3", "James Bond Theme" },
		{ "http://ltbttt.site.nfoservers.com/erm/ra.mp3", "Imagine Dragons - Radioactive" },
		{ "http://ltbttt.site.nfoservers.com/erm/csi.mp3", "The Who - Won't get fooled again" },
		{ "http://ltbttt.site.nfoservers.com/erm/wnb.mp3", "Breaking Benjamin - I Will Not Bow" },
		{ "http://ltbttt.site.nfoservers.com/erm/kwyd.mp3", "Fallout Boy - My Songs Know What You Did In The Dark (Light 'em Up)" },
		{ "http://ltbttt.site.nfoservers.com/erm/betrayal.mp3", "Bullet For My Valantine - Your Betrayal" }
		
		
	}

	traitorwinsounds = {

		{ "http://ltbttt.site.nfoservers.com/erm/ggfk.mp3", "The Offspring - Gonna Go Far Kid" },
		{ "http://ltbttt.site.nfoservers.com/erm/awtd.mp3", "Alicia Keyes - Another Way to Die ft. Jack White" },
		{ "http://ltbttt.site.nfoservers.com/erm/ew.mp3", "Moby - Extreme Ways" },
		{ "http://ltbttt.site.nfoservers.com/erm/monster.mp3", "Skillet - Monster" },
		{ "http://ltbttt.site.nfoservers.com/erm/city.mp3", "Hollywood Undead - City" },
		{ "http://ltbttt.site.nfoservers.com/erm/momentum.mp3", "Dancing Lotus - Momentum ft. 2deep" },
		{ "http://ltbttt.site.nfoservers.com/erm/aobtd.mp3", "Queen - Another One Bites the Dust" },
		{ "http://ltbttt.site.nfoservers.com/erm/horseshoes.mp3", "Green Day - Horseshoes and Hand Grenades" },
		{ "http://ltbttt.site.nfoservers.com/erm/wid.mp3", "Linkin Park - What I've done" },
		{ "http://ltbttt.site.nfoservers.com/erm/griefers.mp3", "Deadmau5 - Professional Griefers" },
		{ "http://ltbttt.site.nfoservers.com/erm/backdown.mp3", "Eminem - Won't Back Down ft. P!nk" },
		{ "https://www.dropbox.com/s/omamsbfy2r0qscg/Queen%20-%20%27Bohemian%20Rhapsody%27.mp3?dl=1", "Queen - Bohemian Rhapsody" }
		
	}

	timelimitsounds = {

		{ "https://www.dropbox.com/s/qtzguewozdx7o8z/Europe%20-%20The%20Final%20Countdown%20chorus.mp3?dl=1", "Europe - The Final Countdown (Chorus)" },
		{ "http://ltbttt.site.nfoservers.com/erm/yolo.mp3", "Lonely Island - YOLO" },
		{ "http://ltbttt.site.nfoservers.com/erm/poke.mp3", "Pokemon Theme" },
		{ "http://ltbttt.site.nfoservers.com/erm/nggyu.mp3", "Rick Astley - Never Gonna Give you Up" },
		{ "http://ltbttt.site.nfoservers.com/erm/bitw.mp3", "Trashmen - Bird is the Word" },
		{ "https://www.dropbox.com/s/m460os1qlfp9xa0/Queen%20-%20Don%27t%20stop%20me%20now.mp3?dl=1", "Queen - Don't Stop Me Now" },
		{ "http://ltbttt.site.nfoservers.com/erm/spaghetti.mp3", "Lose Yourself Spaghetti Remix" },
		{ "http://ltbttt.site.nfoservers.com/erm/slatfaltf.mp3", "Hitchhiker's Guide - So Long and Thanks For All The Fish" },
		{ "http://ltbttt.site.nfoservers.com/erm/thriftshop.mp3", "Macklemore - Thrift Shop ft. Wanz" },
		{ "http://ltbttt.site.nfoservers.com/erm/ggf.mp3", "GOTTA GO FAST" },
		{ "http://ltbttt.site.nfoservers.com/erm/oot.mp3", "Rolling Stones - Out Of Time" },
		{ "http://ltbttt.site.nfoservers.com/erm/dance.mp3", "Men Without Hats - Safety Dance" },
		{ "http://ltbttt.site.nfoservers.com/erm/longesttime.mp3", "Billy Joel - For the Longest Time" }

	}

	extrasounds = {

	}

	
end

if ( CLIENT ) then

	MsgN( "End Round Music by Cobalt loaded!" )

end

-- ULX Commands
function ulx.playurl( calling_ply, url, volume )

	umsg.Start( "playurl", player.GetAll() )
		umsg.String( url )
		umsg.Long ( volume )
	umsg.End()
	
	ulx.fancyLogAdmin( calling_ply, "#A played URL #s (type !stop to stop)", url )
	
end
local playurl = ulx.command( "Fun", "ulx playurl", ulx.playurl, "!playurl" )
playurl:addParam{ type=ULib.cmds.StringArg, hint="url" }
playurl:addParam{ type=ULib.cmds.NumArg, min=0, max=100, default=50, hint="volume", ULib.cmds.optional, ULib.cmds.round }
playurl:defaultAccess( ULib.ACCESS_ADMIN )
playurl:help( "Play a sound from a URL." )

function ulx.playurlcl( calling_ply, url, volume )

	umsg.Start( "playurlcl", calling_ply )
		umsg.String( url )
		umsg.Long( volume )
	umsg.End()
	
	ulx.fancyLog( { calling_ply }, "URL #s playing locally (type !stop to stop)", url )
	
end
local playurlcl = ulx.command( "Fun", "ulx playurlcl", ulx.playurlcl, "!playurlcl" )
playurlcl:addParam{ type=ULib.cmds.StringArg, hint="url" }
playurlcl:addParam{ type=ULib.cmds.NumArg, min=0, max=100, default=50, hint="volume", ULib.cmds.optional, ULib.cmds.round }
playurlcl:defaultAccess( ULib.ACCESS_ALL )
playurlcl:help( "Play a sound from a URL for yourself." )

function ulx.playvolume( calling_ply, volume )

	umsg.Start( "playvolume", player.GetAll() )
		umsg.Long( volume )
	umsg.End()
	
	ulx.fancyLogAdmin( calling_ply, "#A set volume #s", volume )
	
end


local playvolume = ulx.command( "Fun", "ulx playvolume", ulx.playvolume, "!playvolume" )
playvolume:addParam{ type=ULib.cmds.NumArg, min=0, max=100, default=50, hint="times", ULib.cmds.optional, ULib.cmds.round }
playvolume:defaultAccess( ULib.ACCESS_ADMIN )
playvolume:help( "Sets the volume." )

function ulx.stopurl( calling_ply )

	umsg.Start( "stopurl", player.GetAll() )
	umsg.End()
	
	ulx.fancyLogAdmin( calling_ply, "#A stopped the URL for the server" )
	
end
local stopurl = ulx.command( "Fun", "ulx stopurl", ulx.stopurl, "!stopurl" )
stopurl:defaultAccess( ULib.ACCESS_ADMIN )
stopurl:help( "Play a sound from a URL." )

function ulx.endroundmenu( calling_ply )

	umsg.Start( "open_endround_menu", calling_ply )
	umsg.End()
	
end
local endroundmenu = ulx.command( "Fun", "ulx endroundmenu", ulx.endroundmenu, "!endround" )
endroundmenu:defaultAccess( ULib.ACCESS_ALL )
endroundmenu:help( "Open the end round music menu." )

function ulx.queuesong( calling_ply )
	
	if calling_ply:GetPData( "Cooldown" ) and tonumber( calling_ply:GetPData( "Cooldown" ) ) > 0 then
		calling_ply:ChatPrint( "You are unable to queue a song right now. Try again in " .. calling_ply:GetPData( "Cooldown" ) .. " minute(s)." )
		return
	end
	
	umsg.Start( "EnterInfo", calling_ply )
	umsg.End()
	
end
local queuesong = ulx.command( "Fun", "ulx queuesong", ulx.queuesong, { "!queuesong", "!queue" } )
queuesong:defaultAccess( ULib.ACCESS_ADMIN )
queuesong:help( "Queue a song for the end of the round." )

function ulx.stopurlcl( calling_ply )

	umsg.Start( "stopurl", calling_ply )
	umsg.End()
	
end
local stopurlcl = ulx.command( "Fun", "ulx stopurlcl", ulx.stopurlcl, { "!stop", "!stopurlcl" } )
stopurlcl:defaultAccess( ULib.ACCESS_ALL )
stopurlcl:help( "Stop sounds for yourself." )

-- Serverside Networking
if ( SERVER ) then

	util.AddNetworkString( "RequestTables" )
	util.AddNetworkString( "RequestTablesCallback" )
	util.AddNetworkString( "SendQueueInfo" )
	util.AddNetworkString( "RequestQueue" )
	util.AddNetworkString( "RequestQueueCallback" )
	util.AddNetworkString( "Queue_Remove" )
	util.AddNetworkString( "SendCooldownInfo" )
	
	local QueueTable = {}
	
	if GetConVar( "gamemode" ):GetString() == "terrortown" then
	
		hook.Add( "TTTEndRound", "PlayMusicOnEndRound", function( win )
		
			if table.Count( QueueTable ) > 0 then
			
				local toPlay = QueueTable[ 1 ]
				
				umsg.Start( "playurl", player.GetAll() )
					umsg.String( toPlay[ 3 ] )
					umsg.Long ( 50 )
				umsg.End()
				
				umsg.Start( "SendSongName", player.GetAll() )
					umsg.String( toPlay[ 2 ] )
				umsg.End()
				
				ulx.fancyLog( player.GetAll(), "Playing queued song #s requested by #s", toPlay[ 2 ], toPlay[ 1 ] )
				
				table.remove( QueueTable, 1 )
				
			else
			
				if win == WIN_INNOCENT then
				
					local toPlay = table.Random( innowinsounds )
					
					umsg.Start( "playurl", player.GetAll() )
						umsg.String( toPlay[ 1 ] )
						umsg.Long ( 50 )						
					umsg.End()
					
					umsg.Start( "SendSongName", player.GetAll() )
						umsg.String( toPlay[ 2 ] )
					umsg.End()
					
				elseif win == WIN_TRAITOR then
				
					local toPlay = table.Random( traitorwinsounds )
					
					umsg.Start( "playurl", player.GetAll() )
						umsg.String( toPlay[ 1 ] )
						umsg.Long ( 50 )	
					umsg.End()
					
					umsg.Start( "SendSongName", player.GetAll() )
						umsg.String( toPlay[ 2 ] )
					umsg.End()
					
				elseif win == WIN_TIMELIMIT then
				
					local toPlay = table.Random( timelimitsounds )
					
					umsg.Start( "playurl", player.GetAll() )
						umsg.String( toPlay[ 1 ] )
						umsg.Long ( 50 )	
					umsg.End()
					
					umsg.Start( "SendSongName", player.GetAll() )
						umsg.String( toPlay[ 2 ] )
					umsg.End()
				end
			end
			
		end )
	
		hook.Add( "TTTPrepareRound", "StopSounds", function()
			
			umsg.Start( "stop_preround", player.GetAll() )
			umsg.End() 
			
			umsg.Start( "StopHUDPaint", player.GetAll() )
			umsg.End()
			
		end )
		
	end	

	concommand.Add( "endround_menu", function( ply, cmd, args )
	
		umsg.Start( "open_endround_menu", ply )
		umsg.End()
		
	end )
	
	net.Receive( "RequestTables", function( len, ply )
		
		net.Start( "RequestTablesCallback" )
			net.WriteTable( innowinsounds )
			net.WriteTable( traitorwinsounds )
			net.WriteTable( timelimitsounds )
			net.WriteTable( extrasounds )
		net.Send( ply )
		
	end )
	
	net.Receive( "SendQueueInfo", function( len, ply )
	
		local sName = net.ReadString()
		local sUrl = net.ReadString()
		
		if sName:len() > 0 and sUrl:len() > 0 then
			table.insert( QueueTable, { ply:Nick(), sName, sUrl } )
		end
		
		ulx.fancyLog( player.GetAll(), "#s queued song #s", ply:Nick(), sName )
		
	end )
	
	net.Receive( "RequestQueue", function( len, ply )
	
		if ply:IsValid() then
		
			net.Start( "RequestQueueCallback" )
				net.WriteTable( QueueTable )
			net.Send( ply )
			
		end
		
	end )
	
	net.Receive( "Queue_Remove", function( len, ply )
		
		if not ply:IsAdmin() then
			ply:ChatPrint( "You don't have access to this command, " .. ply:Nick() .. "!" )
			return
		end
		
		local name = net.ReadString()
		local pos = net.ReadDouble()
		
		table.remove( QueueTable, pos )
		
		ulx.fancyLog( player.GetAll(), "#s removed song #s from the queue", ply:Nick(), name )
		
	end )
	
	net.Receive( "SendCooldownInfo", function( len, ply )
	
		ply:SetPData( "Cooldown", 3 )
		
	end )
	
	timer.Create( "CooldownTimer", 60, 0, function()
	
		for k, v in pairs( player.GetAll() ) do
		
			if v:GetPData( "Cooldown" ) and tonumber( v:GetPData( "Cooldown" ) ) > 0  then
			
				if tonumber( v:GetPData( "Cooldown" ) ) - 1 == 0 then	
				
					v:RemovePData( "Cooldown" )
					v:ChatPrint( "You are now able to request a song again." )	
					
				else
					v:SetPData( "Cooldown", tonumber( v:GetPData( "Cooldown" ) ) - 1 )
				end
				
			end
			
		end
		
	end )

end


-- Clientside networking and GUI
if ( CLIENT ) then
	
	CreateClientConVar( "ttt_eor_music_disabled", "0", false, FCVAR_USERINFO, FCVAR_ARCHIVE )
	
	if not file.Exists( "radio", "DATA" ) then
		file.CreateDir( "radio" )
	end
	
	if not file.Exists( "radio/stations.txt", "DATA" ) then
		file.Write( "radio/stations.txt" )
	end
	
	usermessage.Hook( "playurlcl", function( um )
	
		local url = um:ReadString()
		local volume = um:ReadLong() / 100
		local ply = LocalPlayer()
		
		if ply.channel and IsValid( ply.channel ) then
			ply.channel:Stop()
        end
		
        sound.PlayURL( url, "", function( station )		
			if station and IsValid( station ) then			
				station:Play()
				LocalPlayer().channel = station	
				LocalPlayer().channel:SetVolume(volume)			
			end			
        end )
		
	end )	
	
	usermessage.Hook( "playurl", function( um )
	
		if GetConVar( "ttt_eor_music_disabled" ):GetBool( ) then
			local ply = LocalPlayer()
		
			if ply.channel and IsValid( ply.channel ) then
				ply.channel:Stop()
			end
			
		else
		
			local url = um:ReadString()
			local volume = um:ReadLong() / 100
			local isEOR = um:ReadBool()
			
			sound.PlayURL( url, "", function( station )
				if station and IsValid( station ) then
					station:Play()
					LocalPlayer().channel = station
					LocalPlayer().channel:SetVolume(volume)
				end
				
			end )
		
		end
		
	end )	

	usermessage.Hook( "playvolume", function( um )
	
		local volume = um:ReadLong() / 100
		local ply = LocalPlayer()
		
		if ply.channel and IsValid( ply.channel ) then
			ply.channel:SetVolume(volume)
        end
		
	end )	
	
	usermessage.Hook( "stopurl", function( um )
	
		local ply = LocalPlayer()
		
		if ply.channel and IsValid( ply.channel ) then	
			ply.channel:Stop()			
			chat.AddText( "Sound stopped." )			
		else		
			chat.AddText( "No music playing!" )			
		end
		
	end )	
	
	usermessage.Hook( "SendSongName", function( um )
		
		if !GetConVar( "ttt_eor_music_disabled" ):GetBool( ) then
	
			local name = um:ReadString()
		
			hook.Add( "HUDPaint", "DrawSongName", function()
			
				local width
			
				if string.len( name ) >= 15 then
					width = 18 * string.len( name )
				else
					width = 270
				end
			
				draw.WordBox( 8, 5, 5, "Now Playing: " .. name, "Trebuchet24", Color( 0, 0, 0, 100 ), Color( 255, 255, 255, 200 ) )
			end )
		else
			hook.Add( "HUDPaint", "DrawSongName", function()
				draw.WordBox( 8, 5, 5, "End Round Music Disabled! (Enable in F1 Menu)", "Trebuchet24", Color( 255, 0, 0, 100 ), Color( 255, 255, 255, 255 ) )
			end )
		end
		
	end )	
	
	usermessage.Hook( "StopHUDPaint", function( um )
	
		hook.Remove( "HUDPaint", "DrawSongName" )
		
	end )
	
	usermessage.Hook( "stop_preround", function( um )
		
		local ply = LocalPlayer()
		
		if ply.channel and IsValid( ply.channel ) then
			ply.channel:Stop()
		end
		
	end )
	
	usermessage.Hook( "EnterInfo", function()
	
		local name = ""
		local url = ""
		
		Derma_StringRequest(
			"Request Song", 
			"Enter the artist and song title",
			"",
			
			function( text ) 
			
				name = text 
				
				if text:len() >= 10 then
				
					Derma_StringRequest(
						"Request Song",
						"Enter the .mp3 URL of the song",
						"",
						
						function( text2 )
						
							if string.sub( text2, 1, 4 ) == "http" then
							
								url = text2
								
								net.Start( "SendQueueInfo" )
									net.WriteString( name )
									net.WriteString( url )
								net.SendToServer()
								
								net.Start( "SendCooldownInfo" )
								net.SendToServer()
								
							else
								chat.AddText( "Invalid URL!" )
							end
							
						end,
						
						function()
							chat.AddText( "Song Queue Canceled." )
						end,
						"Finish"
						
					)
				
				else
					chat.AddText( "This text must be ten or more characters." )
				end
				
			end,
			
			function() 
				chat.AddText( "Song Queue Canceled." ) 
			end,
			"Next"
		)
		
	end )
	
	usermessage.Hook( "open_endround_menu", function()	
	
		local main = vgui.Create( "DFrame" )	
	
		main:SetPos( 50,50 )
		main:SetSize( 700, 500 )
		main:SetTitle( "End Round Music Menu" )
		main:SetVisible( true )
		main:SetDraggable( true )
		main:ShowCloseButton( true )
		main:MakePopup()
		main:Center()
		
		local PropertySheet = vgui.Create( "DPropertySheet", main )
			PropertySheet:SetPos( 0, 25 )
			PropertySheet:SetSize( 700, 475 )			
			
		local ulist = vgui.Create( "DListView", PropertySheet )
			ulist:SetPos( 4, 27 )
			ulist:SetSize( 692, 469 )
			ulist:SetMultiSelect( false )
			ulist:AddColumn( "Type" ):SetMaxWidth( 40 )
			ulist:AddColumn( "Song Title" ):SetMaxWidth( 275 )
			ulist:AddColumn( "URL" )		
			
				net.Start( "RequestTables" )
				net.SendToServer()
				
				net.Receive( "RequestTablesCallback", function()
				
					local innowinsound = net.ReadTable()
					local traitorwinsound = net.ReadTable()
					local timelimitsound = net.ReadTable()
					local extrasound = net.ReadTable()
					ulist:Clear()
					
					for k, v in ipairs( innowinsound ) do
						ulist:AddLine( "Inno", v[ 2 ], v[ 1 ] )
					end
					
					for k, v in ipairs( traitorwinsound ) do
						ulist:AddLine( "Trator", v[ 2 ], v[ 1 ] )
					end
					
					for k, v in ipairs( timelimitsound ) do
						ulist:AddLine( "Time", v[ 2 ], v[ 1 ] )
					end
					
					if table.Count( extrasound ) > 0 then					
						for k, v in ipairs( extrasound ) do
							ulist:AddLine( "Extra", v[ 2 ], v[ 1 ] )
						end
					end
					
				end )
				
			ulist.OnRowRightClick = function( main, line )	
			
				local menu = DermaMenu()
				
					menu:AddOption( "Play for all", function()
						RunConsoleCommand( "ulx", "playurl", ulist:GetLine( line ):GetValue( 3 ) )
					end ):SetIcon( "icon16/control_play_blue.png" )		
					
					menu:AddOption( "Play for self", function()
						RunConsoleCommand( "ulx", "playurlcl" , ulist:GetLine( line ):GetValue( 3 ) )
					end ):SetIcon( "icon16/control_play.png")	
					
					menu:AddOption( "Stop all sounds", function()
						RunConsoleCommand( "ulx", "stopurl" )					
					end ):SetIcon( "icon16/control_stop_blue.png" )		
					
					menu:AddOption( "Stop sounds for self", function()
					
						local ply = LocalPlayer()
						
						if ply.channel and IsValid( ply.channel ) then
							ply.channel:Stop()
							chat.AddText( "Sound stopped." )
						else
							chat.AddText( "No music playing!" )
						end
						
					end ):SetIcon("icon16/control_stop.png")	

					menu:AddOption( "Queue Song", function()
					
						if ULib.ucl.query( LocalPlayer(), "ulx queuesong" ) then
							net.Start( "SendQueueInfo" )
								net.WriteString( ulist:GetLine( line ):GetValue( 2 ) )
								net.WriteString( ulist:GetLine( line ):GetValue( 3 ) )
							net.SendToServer()
							
							net.Start( "SendCooldownInfo" )
							net.SendToServer()
						else
							chat.AddText( "You don't have access to this command!" )
						end
						
					end ):SetIcon( "icon16/table_row_insert.png" )
					
				menu:Open()	
				
			end
			
		PropertySheet:AddSheet( "Music", ulist, "icon16/music.png", false, false, "Show all songs in the webserver" )	
		
		local queuetab = vgui.Create( "DPanel", PropertySheet )
		
			queuetab:SetPos( 4, 27 )
			queuetab:SetSize( 692, 469 )		
		
		local queue = vgui.Create( "DListView", queuetab )
		
			queue:SetPos( 4, 4 )
			queue:SetSize( 572, 431 )
			queue:SetMultiSelect( false )
			queue:AddColumn( "User" )
			queue:AddColumn( "Song Title" )
			queue:AddColumn( "URL" )			
			queue:SetSortable( false )
			
				net.Start( "RequestQueue" )
				net.SendToServer()
				
				net.Receive( "RequestQueueCallback", function()
				
					local queuetab = net.ReadTable()
					queue:Clear()
					
					for k, v in ipairs( queuetab ) do
						queue:AddLine( v[ 1 ], v[ 2 ], v[ 3 ] )
					end
					
				end )
				
			queue.OnRowRightClick = function( main, line, number )	
			
				local menu = DermaMenu()
				
					menu:AddOption( "Play for all", function()
						RunConsoleCommand( "ulx", "playurl", queue:GetLine( line ):GetValue( 3 ) )
					end ):SetIcon( "icon16/control_play_blue.png" )	
					
					menu:AddOption( "Play for self", function()
						RunConsoleCommand( "ulx", "playurlcl", queue:GetLine( line ):GetValue( 3 ) )
					end ):SetIcon( "icon16/control_play.png" )	
					
					menu:AddOption( "Remove", function()
					
						net.Start( "Queue_Remove" )
							net.WriteString( queue:GetLine( line ):GetValue( 2 ) )
							net.WriteDouble( tonumber( queue:GetSelectedLine( number ) ) )
						net.SendToServer()
						
						net.Start( "RequestQueue" )
						net.SendToServer()
						
						net.Receive( "RequestQueueCallback", function()
						
							local queuetab = net.ReadTable()
							
							queue:Clear()
							
							for k, v in ipairs( queuetab ) do
								queue:AddLine( v[ 1 ], v[ 2 ], v[ 3 ] )
							end
							
						end )
						
					end ):SetIcon( "icon16/table_row_delete.png" )
					
				menu:Open()		
				
			end		

			local browse = vgui.Create( "DButton", queuetab )
				browse:SetSize( 100, 30 )
				browse:SetPos( 580, 4 )
				browse:SetText( "Browse .mp3s" )
				browse.DoClick = function( browse )
					gui.OpenURL( "http://mp3skull.com/" )
			end			

			local q = vgui.Create( "DButton", queuetab )
				q:SetSize( 100, 30 )
				q:SetPos( 580, 40 )
				q:SetText( "Queue a song" )
				q.DoClick = function( q )
					RunConsoleCommand( "ulx", "queuesong" )
			end	
			
		PropertySheet:AddSheet( "Queue", queuetab, "icon16/table_go.png", false, false, "View Queued Songs" )
		
		local radio = vgui.Create( "DPanel", PropertySheet )
		
			radio:SetPos( 4, 27 )
			radio:SetSize( 692, 469 )		
			
		local stations = vgui.Create( "DListView", radio )
			
			stations:SetPos( 4, 4 )
			stations:SetSize( 572, 431 )
			stations:SetMultiSelect( false )
			stations:AddColumn( "Station" )		
			
				local toAdd = file.Read( "radio/stations.txt", "DATA" )
				
				if toAdd:len() > 0 then
				
					local tab = string.Explode( "\n", toAdd )

					for k, v in ipairs( tab ) do
						if v ~= "" then
							stations:AddLine( v )
						end
					end

				end
				
			stations.OnRowRightClick = function( main, line, number )
			
				local menu = DermaMenu()
				
					menu:AddOption( "Start Radio", function()
						RunConsoleCommand( "ulx", "playurlcl", string.sub( stations:GetLine( line ):GetValue( 1 ), string.find( stations:GetLine( line ):GetValue( 1 ), "|" ) + 2 ) )
					end ):SetIcon( "icon16/control_play.png" )	
					
					menu:AddOption( "Stop Radio", function()
						RunConsoleCommand( "ulx", "stopurlcl" )
					end ):SetIcon( "icon16/control_stop.png" )
					
					menu:AddOption( "Copy URL", function()
						SetClipboardText( string.sub( stations:GetLine( line ):GetValue( 1 ), string.find( stations:GetLine( line ):GetValue( 1 ), "|" ) + 2 ) )
						chat.AddText( "URL Copied." )
					end ):SetIcon( "icon16/tag_blue_edit.png" )
					
					menu:AddOption( "Remove Station", function()
						
						chat.AddText( "Station \"" .. string.sub( stations:GetLine( line ):GetValue( 1 ), 1, string.find( stations:GetLine( line ):GetValue( 1 ), "|" ) - 2 ) .. "\" removed." )
						stations:RemoveLine( line )
						
						local newTab2 = {}
						
						for k, v in pairs( stations:GetLines() ) do
							local url = v:GetValue( 1 )
							table.insert( newTab2, url )
						end
						
						file.Delete( "radio/stations.txt" )
						file.Write( "radio/stations.txt" )
						
						for k, v in pairs( newTab2 ) do
							file.Append( "radio/stations.txt", v .. "\n" )
						end
						
						stations:Clear()
						
						local toAdd = file.Read( "radio/stations.txt", "DATA" )
				
						if toAdd:len() > 0 then
						
							local tab = string.Explode( "\n", toAdd )

							for k, v in ipairs( tab ) do
								stations:AddLine( v )
							end
						
						end
						
					end ):SetIcon( "icon16/table_row_delete.png" )
					
				menu:Open()		
				
			end		

		local browse = vgui.Create( "DButton", radio )
			browse:SetSize( 100, 30 )
			browse:SetPos( 580, 4 )
			browse:SetText( "Browse Stations" )
			browse.DoClick = function( browse )
				gui.OpenURL( "http://www.shoutcast.com/" )
		end
		
		local add = vgui.Create( "DButton", radio )
			add:SetSize( 100, 30 )
			add:SetPos( 580, 40 )
			add:SetText( "Add Station by URL" )
			add.DoClick = function( add )
			
				local name = ""
				
				Derma_StringRequest( 
					"Add Station",
					"Name this station",
					"",

					function( text )	
					
						name = text	
						
						Derma_StringRequest(
							"Add Station", 
							"Enter the URL for this station",
							"",

							function( text2 ) 	
							
								file.Append( "radio/stations.txt", text .. " | " .. text2 .. "\n" )	
								
								stations:AddLine( text:Trim() .. " | " .. text2:Trim() )
								
								local newTab = {}
								
								for i = 1, #stations:GetLines() do
									local url = stations:GetLine( i ):GetValue( 1 )
									table.insert( newTab, url ) 
								end
								
								file.Delete( "radio/stations.txt" )
								file.Write( "radio/stations.txt" )
								
								for k, v in pairs( newTab ) do
									file.Append( "radio/stations.txt", v .. "\n" )
								end
								
							end,
							
							function() 
								chat.AddText( "Station Add Canceled." ) 
							end,
							"Add"
							
						)
						
					end,
					
					function() 
							chat.AddText( "Station Add Canceled." ) 
						end,
					"Next"
					
				)
				
		end
		
		PropertySheet:AddSheet( "Radio", radio, "icon16/sound.png", false, false, "View Radio Stations" )
		
	end )
	
	local function AddSettings( dtabs )
		local musicsettings = vgui.Create( "DPanelList", dtabs )
		musicsettings:StretchToParent( 0, 0, padding, 0 )
		musicsettings:EnableVerticalScrollbar( true )
		musicsettings:SetPadding( 10 )
		musicsettings:SetSpacing( 10 )

		local setting = nil
		local Music = vgui.Create( "DForm", musicsettings )
		Music:SetName( "End Round Music" )
		
		setting = Music:CheckBox( "Disable End Round Music", "ttt_eor_music_disabled" )
		setting:SetTooltip( "Disables End Of Round Music" )

		musicsettings:AddItem( Music )

		dtabs:AddSheet( "EOR Music", musicsettings, "icon16/music.png", false, false, "End Round Music Settings" )
	end
	hook.Add( "TTTSettingsTabs", "AddSettings", AddSettings )
	
end 
