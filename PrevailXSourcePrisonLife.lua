if not setmetatable and not getmetatable then return warn("Unable to load Prevail X (missing setmetatable | getmetatable)") end

Prevail = {
	dev = "02hacks",
	verison = "v2.30"
}

LP = game:GetService("Players").LocalPlayer
warn("PX: Prevail X " ..Prevail.verison)

if game.PlaceId ~= 155615604 then
	return print("PX: wrong game")
end

getmetatable = getrawmetatable or debug.getmetatable
setcontext = setthreadcontext or syn_context_set
for i,v in next, {getmetatable,setreadonly,getnamecallmethod,newcclosure,setcontext} do
	if typeof(v) ~= "function" then
		SilentCD = true
		print("PX: Silent Command not supported")
		break
	end
end

getregistry = getreg or debug.getregistry
setupvalue = debug.setupvalue or setupvalue or setupval
getupvalues = debug.getupvalues or getupvalues or getupvals
for i,v in next, {getregistry,setupvalue,getupvalues} do
	if typeof(v) ~= "function" then
		print("PX: Inf Stamina not supported")
		break
	end
end

if typeof(getconnections) ~= "function" then
	AntiD = true
	print("PX: AntiTaze, AntiArrest not supported")
end

if not _G.PrevailX then
	_G.PrevailX = {}
end

if _G.PrevailX.Loaded then
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = "PX",Text = "Prevail X is already loaded",Duration = 5})
	return
end

if typeof(loadstring) == "function" then
	get = loadstring(game:HttpGet("https://pastebin.com/raw/epCT49yq", true))()
	Disc, DiscServ, titleBar, Pulldownmenu = get["g"], get["b"], get["c"], get["e"]
end
if not Disc then
	Disc = "02hacks#2393"
end
if not DiscServ then
	DiscServ = "discord.gg/EBTjwJy9kq"
end
if not titleBar then
	titleBar = "02hacks Prevail X"
end
if not Pulldownmenu then
	Pulldownmenu = "Prevail X, where small details do matter."
end

_G.PrevailX.Loaded = true
wait(0.2)

function StringGenerator(Args)
	local String = ""
		for i = 1, Args do 
			if math.random(0,9) <= 5 then
				String = String..string.char(math.random(48,57))
			else
				if math.random(0,9) <= 5 then
					String = String..string.char(math.random(65,90))
				else
					String = String..string.char(math.random(97,122))
				end
			end
		end
	return String
end

function Create(Type,Properties) 
	local NewInstance = Instance.new(Type) 
	for i,v in pairs(Properties) do 
		NewInstance[i] = v 
	end 
	return NewInstance 
end

function Vis(Args,Arg2)
	for i,v in next, {Tab1Frame, Tab2Frame, Tab3Frame, Tab4Frame, Tab5Frame} do
		if tostring(Args) == v.Name then
			v.Visible = true
		else
			v.Visible = false
		end
	end
	for i,v in next, {Tab1Button, Tab2Button, Tab3Button, Tab4Button, Tab5Button} do
		if tostring(Arg2) == v.Name then
			v.BorderColor3 = Secondary
			CurTab = Arg2
		else
			v.BorderColor3 = Color3.new(25/255,25/255,25/255)
		end
	end
end

function GetCenter(Frame,Filter)
	local AS,XS,YS = Frame.Parent.AbsoluteSize, string.split(tostring(Frame.Size.X)," ")[2], string.split(tostring(Frame.Size.Y)," ")[2]
	local X,Y = 1/AS.X*(AS.X-XS)/2,1/AS.Y*(AS.Y-YS)/2
	if Filter == "X" then
		return X
	end
	if Filter == "Y" then
		return Y
	end
	return UDim2.new(X,0,Y,0)
end

ArrN = 0
Roastn = 0
SpedCart = false
FastPunchLock = true
Arrested = false
InfStaminaLock = true
KillAura = false
UIVisible = true
LOG = false
Rev2 = false
WalkSpeed = 16
JumpPower = 50
AutoRespawn = false
AboosiveGuard = false
Noclip = false
Loop = false
LockPosition = false
GetBypass = false
SilentC = false
FFL = false

DED_FS = false
weapon = "M9"
Prefix = "?"
Zero = LP.Name
SEArgs = LP.Name

TT = {
	Default = {
		Primary = Color3.new(1,1,1),
		Secondary = Color3.new(13/255,105/255,172/255),
		Image = "rbxassetid://5990941302"
	},
	Pink = {
		Primary = Color3.new(1,1,1),
		Secondary = Color3.new(207/255,178/255,208/255)
	},
	Red = {
		Primary = Color3.new(1,1,1),
		Secondary = Color3.new(220/255,8/255,14/255)
	},
	Yellow = {
		Primary = Color3.new(1,1,1),
		Secondary = Color3.new(232/255,214/255,0)
	},
	Orange = {
		Primary = Color3.new(1,1,1),
		Secondary = Color3.new(225/255,96/255,0)
	},
	["Pastel violet"] = {
		Primary = Color3.new(1,1,1),
		Secondary = Color3.new(177/255,167/255,255/255)
	},
	["Pastel orange"] = { -- Peach
		Primary = Color3.new(1,1,1),
		Secondary = Color3.new(1,160/255,160/255)
	},
	["Dark green"] = {
		Primary = Color3.new(1,1,1),
		Secondary = Color3.new(40/255,127/255,71/255)
	}
}

Theme = "Default"
Primary = TT[Theme].Primary
Secondary = TT[Theme].Secondary
Background = Color3.new(25/255,25/255,25/255)

Prevailv3 = Create("ScreenGui",{Parent=game.CoreGui,Name="PX_"..StringGenerator(16)})
UI = Create("Frame", {Parent=Prevailv3,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,600,0,320),Active=true,BorderColor3=Background,Draggable=true,Name="Root"})
UI.Position = GetCenter(UI)
Title = Create("TextLabel", {Parent=UI,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,BorderColor3=Background,BorderSizePixel=1,Font=Enum.Font.SourceSansSemibold,Text="Prevail X",TextColor3=Secondary,Name="Title",TextScaled=true,Position=UDim2.new(0.0,0,0.0,0),FontSize=5,Size=UDim2.new(0,600,0,20)})
TabFrame = Create("Frame", {Parent=UI,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,590,0,20),Position=UDim2.new(0.01,0,0.0825,0),BorderColor3=Background,Name="TabButtons"})

FrameA = Create("Frame", {Parent=UI,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,590,0,265),Position=UDim2.new(0.01,0,0.1575,0),BorderColor3=Background,Name="Welcome"})
Welcome = Create("TextButton", {Parent=FrameA,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,20,0,20),Position=UDim2.new(0.7125,0,0.225,0),BorderColor3=Background,Text="Welcome to Prevail X",TextColor3=Secondary,Name="Welcome",Font=Enum.Font.SourceSansSemibold,FontSize=7})
Create("TextLabel", {Parent=FrameA,Name="LogoColor",Text="",Size=UDim2.new(0,200,0,200),BorderColor3=Background,BackgroundColor3=Secondary,Position=UDim2.new(0.05,0,0.075,0)})
Logo = Create("ImageButton", {Parent=FrameA,Name="Logo",Visible=true,Size=UDim2.new(0,200,0,200),BorderColor3=Color3.new(0,0,0),Position=UDim2.new(0.05,0,0.075,0),BackgroundTransparency=1,Image=TT.Default.Image})
Join = Create("TextButton", {Parent=FrameA,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,125,0,30),Position=UDim2.new(0.75,0,0.65,0),BorderColor3=Secondary,Text="Join Discord",TextColor3=Primary,Name="Join",Font=Enum.Font.SourceSansBold,FontSize=6})
Enter = Create("TextButton", {Parent=FrameA,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,125,0,30),Position=UDim2.new(0.5125,0,0.65,0),BorderColor3=Secondary,Text="Boot",TextColor3=Primary,Name="Boot",Font=Enum.Font.SourceSansBold,FontSize=6})
disctxt = Create("TextLabel", {Parent=FrameA,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,80,0,5),Position=UDim2.new(0.76,0,0.3,0),BorderColor3=Background,Text=""..Disc,TextColor3=Primary,Name="02hx",Font=Enum.Font.SourceSansBold,FontSize=4})

Join.MouseButton1Down:connect(function()
	if DiscServ ~= nil then
		setclipboard(DiscServ)
		Join.FontSize = 5
		Join.Text = "Copied to Clipboard"
		wait(1)
		Join.FontSize = 6
		Join.Text = "Join Discord"
	end
end)

Enter.MouseButton1Down:connect(function()
	Boot = true
	FrameA.Visible = false
	disctxt.Position = UDim2.new(0.435,0,-0.43,0)
	disctxt.Parent = TabFrame
end)

-- Main
repeat wait() until Boot

Tab1Button = Create("TextButton", {Parent=TabFrame,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,60,0,20),Position=UDim2.new(0,0,0.0,0),BorderColor3=Background,Text="Main",TextColor3=Primary,Name="Main",Font=Enum.Font.SourceSansSemibold,FontSize=6})
Tab1Frame = Create("Frame", {Parent=UI,Visible=false,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,590,0,265),Position=UDim2.new(0.01,0,0.1575,0),BorderColor3=Background,Name="Main"})

Tab1Button.MouseButton1Down:connect(function()
	Vis(Tab1Frame, Tab1Button)
end)

Tab2Button = Create("TextButton", {Parent=TabFrame,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,60,0,20),Position=UDim2.new(0.1075,0,0,0),BorderColor3=Background,Text="Toggles",TextColor3=Primary,Name="Toggles",Font=Enum.Font.SourceSansSemibold,FontSize=6})
Tab2Frame = Create("Frame", {Parent=UI,Visible=false,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,590,0,265),Position=UDim2.new(0.01,0,0.1575,0),BorderColor3=Background,Name="Toggles"})

Tab2Button.MouseButton1Down:connect(function()
	Vis(Tab2Frame, Tab2Button)
end)

Tab3Button = Create("TextButton", {Parent=TabFrame,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,60,0,20),Position=UDim2.new(0.3225,0,0,0),BorderColor3=Secondary,Text="Credit",TextColor3=Primary,Name="Credit",Font=Enum.Font.SourceSansSemibold,FontSize=6})
Tab3Frame = Create("Frame", {Parent=UI,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,590,0,265),Position=UDim2.new(0.01,0,0.1575,0),BorderColor3=Background,Name="Credit"})
CurTab = Tab3Button
Tab3Button.MouseButton1Down:connect(function()
	Vis(Tab3Frame, Tab3Button)
end)

Tab4Button = Create("TextButton", {Parent=TabFrame,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,60,0,20),Position=UDim2.new(0.43,0,0,0),BorderColor3=Background,Text="Help",TextColor3=Primary,Name="Help",Font=Enum.Font.SourceSansSemibold,FontSize=6})
Tab4Frame = Create("Frame", {Parent=UI,Visible=false,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,590,0,265),Position=UDim2.new(0.01,0,0.1575,0),BorderColor3=Background,Name="Help"})

Tab4Button.MouseButton1Down:connect(function()
	Vis(Tab4Frame, Tab4Button)
end)

Tab5Button = Create("TextButton", {Parent=TabFrame,Visible=true,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,60,0,20),Position=UDim2.new(0.215,0,0,0),BorderColor3=Background,Text="Theme",TextColor3=Primary,Name="Theme",Font=Enum.Font.SourceSansSemibold,FontSize=6})
Tab5Frame = Create("Frame", {Parent=UI,Visible=false,BackgroundColor3=Background,BackgroundTransparency=0,Size=UDim2.new(0,590,0,265),Position=UDim2.new(0.01,0,0.1575,0),BorderColor3=Background,Name="Theme"})

Tab5Button.MouseButton1Down:connect(function()
	Vis(Tab5Frame, Tab5Button)
end)

XXR = Create("Frame", {Parent=UI,Name="JoinDiscord",BorderColor3=Background,BackgroundColor3=Background,Position=UDim2.new(0.83,0,0.015,0),Size=UDim2.new(0,100,0,24)})
--XIX = Create("Frame", {Parent=XXR,Name="Color",BorderColor3=Background,BackgroundColor3=Secondary,Size=UDim2.new(0,24,0,24)})
DisLogo = Create("ImageButton", {Parent=XXR,Name="Logo",Size=UDim2.new(0,24,0,24),BackgroundTransparency=1,Image="rbxassetid://5247557898"})
XXD = Create("TextButton", {Parent=XXR,Visible=true,BackgroundColor3=Background,BackgroundTransparency=1,Size=UDim2.new(0,80,0,24),Position=UDim2.new(0.2,0,0,0),BorderColor3=Background,Text="Join Discord",TextColor3=Primary,Name="Discord",Font=Enum.Font.SourceSansSemibold,FontSize=5})
XXD.MouseButton1Down:connect(function()
	if DiscServ ~= nil then
		local setclip,msg = setclipboard or writeclipboard,"Invite copied to clipboard"
		if not setclip then
			setclip,msg = print,"Press F9"
		end
		setclip(DiscServ)
		StaminaMsg(msg,2)
	end
end)

a = Create("Frame", {Parent=Tab1Frame,Name="Player",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.025,0,0.075,0),Size=UDim2.new(0,220,0,80)})
b0 = Create("TextBox",{Text="<Player>",Parent=a,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,-0.125,0),Size=UDim2.new(0,80,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

b2 = Create("TextButton",{Text="Bring",Parent=a,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.05,0,0.25,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
b3 = Create("TextButton",{Text="Taze",Parent=a,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.05,0,0.6,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

b4 = Create("TextButton",{Text="Teleport",Parent=a,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.3675,0,0.25,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
b5 = Create("TextButton",{Text="Criminal",Parent=a,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.3675,0,0.6,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

b6 = Create("TextButton",{Text="Arrest",Parent=a,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.675,0,0.25,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
b7 = Create("TextButton",{Text="Roast",Parent=a,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.675,0,0.6,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
-- Number
c = Create("Frame", {Parent=Tab1Frame,Name="Number",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.4235,0,0.075,0),Size=UDim2.new(0,150,0,80)})
d = Create("TextBox",{Text="<Number>",Parent=c,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.25,0,-0.125,0),Size=UDim2.new(0,80,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

d2 = Create("TextButton",{Text="Walkspeed",Parent=c,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.0625,0,0.25,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
d3 = Create("TextButton",{Text="Gravity",Parent=c,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.0625,0,0.6,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

d4 = Create("TextButton",{Text="Hipheight",Parent=c,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.5225,0,0.25,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
d5 = Create("TextButton",{Text="Jumppower",Parent=c,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.5225,0,0.6,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
-- Teams
h2 = Create("Frame", {Parent=Tab1Frame,Name="Teams",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.7,0,0.075,0),Size=UDim2.new(0,160,0,80)})
gK = Create("TextLabel",{Text="",Parent=h2,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.28,0,-0.125,0),Size=UDim2.new(0,70,0,20,0)})
g = Create("TextButton",{Text="Teams",Parent=h2,TextColor3=Primary,BackgroundTransparency=1,BorderColor3=Background,Position=UDim2.new(0.28,0,-0.125,0),Size=UDim2.new(0,70,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

g2 = Create("TextButton",{Text="Guard",Parent=h2,TextColor3=Color3.new(13/255,105/255,172/255),BackgroundColor3=Background,BorderColor3=Color3.new(13/255,105/255,172/255),Position=UDim2.new(0.1,0,0.25,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
g3 = Create("TextButton",{Text="Criminal",Parent=h2,TextColor3=Color3.new(1,0,0),BackgroundColor3=Background,BorderColor3=Color3.new(1,0,0),Position=UDim2.new(0.1,0,0.6,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

g4 = Create("TextButton",{Text="Inmate",Parent=h2,TextColor3=Color3.new(218/255,133/255,65/255),BackgroundColor3=Background,BorderColor3=Color3.new(218/255,133/255,65/255),Position=UDim2.new(0.53,0,0.25,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
g5 = Create("TextButton",{Text="Neutral",Parent=h2,TextColor3=Color3.new(163/255,162/255,165/255),BackgroundColor3=Background,BorderColor3=Color3.new(163/255,162/255,165/255),Position=UDim2.new(0.53,0,0.6,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

g6 = Create("TextBox",{Text="<Args>",Parent=h2,Visible=false,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.1,0,0.25,0),Size=UDim2.new(0,128,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
g7 = Create("TextButton",{Text="Execute",Parent=h2,Visible=false,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.1,0,0.6,0),Size=UDim2.new(0,128,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

gN = 1
g.MouseButton1Down:connect(function()
	local t = {"Teams", "KillAura", "2nd"}
	gN=gN+1
	g.Text = t[gN]
	if t[gN] == "Teams" or t[gN] == "KillAura" then
		g25,g67 = true,false
	end
	if t[gN] == "2nd" then
		g25,g67 = false,true
	end
	for i,v in next, {g2, g3, g4, g5} do
		v.Visible = g25
	end
	for i,v in next, {g6, g7} do
		v.Visible = g67
	end
	if gN == 3 then
		gN = 0
	end
end)

g7.MouseButton1Down:connect(function() -- 2nd Neutral
	if tostring(BrickColor.new(g6.Text)) ~= "Medium stone grey" then
		ReturnTM(g6.Text)
		if v5.Text == "OFF" then
			AutoRespawn = ToggleFunc(v5, AutoRespawn)
		end
	end
	if g6.Text == "737600" then
		GetBypass = ToggleFunc(Text,GetBypass)
		if GetBypass then
			StaminaMsg("Unlocked GetAccess",1)
		end
	end
end)

-- Extras
et = Create("Frame", {Parent=Tab1Frame,Name="Extras",Visible=true,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.405,0,0.475,0),Size=UDim2.new(0,100,0,120)})
ft = Create("TextLabel",{Text="Extras",Parent=et,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.25,0,-0.1,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

e4 = Create("TextButton",{Text="Gun Mods",Parent=et,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.2,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
f5 = Create("TextButton",{Text="Suicide",Parent=et,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.425,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
e6 = Create("TextButton",{Text="Naked",Parent=et,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.65,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

-- All
e = Create("Frame", {Parent=Tab1Frame,Name="All",Visible=true,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.215,0,0.475,0),Size=UDim2.new(0,100,0,120)})
f = Create("TextLabel",{Text="All",Parent=e,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.35,0,-0.1,0),Size=UDim2.new(0,30,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

e2 = Create("TextButton",{Text="Arrest All",Parent=e,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.2,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
f2 = Create("TextButton",{Text="Taze All",Parent=e,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.425,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
f3 = Create("TextButton",{Text="Items All",Parent=e,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.65,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

--Client
e0 = Create("Frame", {Parent=Tab1Frame,Name="Client",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.025,0,0.475,0),Size=UDim2.new(0,100,0,120)})
f0 = Create("TextLabel",{Text="Client",Parent=e0,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.25,0,-0.1,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

e7 = Create("TextButton",{Text="MapFuck v2",Parent=e0,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.2,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
f6 = Create("TextButton",{Text="Btools",Parent=e0,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.425,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
e5 = Create("TextButton",{Text="Nodoors",Parent=e0,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.2,0,0.65,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

-- Teleport
h = Create("Frame", {Parent=Tab1Frame,Name="Teleport",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.59825,0,0.475,0),Size=UDim2.new(0,220,0,120)})
q = Create("TextLabel",{Text="Teleports",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.325,0,-0.1,0),Size=UDim2.new(0,80,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

q2 = Create("TextButton",{Text="Armory",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.0625,0,0.2,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
q3 = Create("TextButton",{Text="Entrance",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.3625,0,0.2,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
q4 = Create("TextButton",{Text="Cellblock",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.6625,0,0.2,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

q5 = Create("TextButton",{Text="Prison",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.0625,0,0.425,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
q6 = Create("TextButton",{Text="Escape",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.3625,0,0.425,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
q7 = Create("TextButton",{Text="Yard Tower",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.6625,0,0.425,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

q8 = Create("TextButton",{Text="Sewer",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.0625,0,0.65,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
q9 = Create("TextButton",{Text="Roof",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.3625,0,0.65,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
q0 = Create("TextButton",{Text="Downtown",Parent=h,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Position=UDim2.new(0.6625,0,0.65,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})

-- Mods
Default = {
	["AK-47"] = {
		FireRate = 0.1,
		Bullets = 1,
		AutoFire = true,
		Image = "rbxassetid://7134071046"
	},
	["Remington 870"] = {
		FireRate = 0.8,
		Bullets = 5,
		AutoFire = false,
		Image = "rbxassetid://7134072183"
	},
	["M9"] = {
		FireRate = 0.08,
		Bullets = 1,
		AutoFire = false,
		Image = "rbxassetid://7134116670"
	},
	["M4A1"] = {
		FireRate = 0.0875,
		Bullets = 1,
		AutoFire = true,
		Image = "rbxassetid://7134069778"
	}
}
Mods = {}
for i,v in next, Default do
	Mods[i] = v
end
ModSel = "Remington 870"

function RapidFire(Args,Eq)
	if game.Workspace:FindFirstChild(LP.Name) then
		if game.Workspace[LP.Name]:FindFirstChild(Args) and Default[Args] ~= nil then
			LP.Character.Humanoid:UnequipTools(game.Workspace[LP.Name][Args])
			Eq = true
		end
		if LP.Backpack:FindFirstChild(Args) then
			if Default[Args] ~= nil and LP.Backpack[Args]:FindFirstChild("GunStates") then
				local Val = Instance.new("StringValue", LP.Backpack[Args])
				Val.Name = "RapidFirePX"
				local rF,gM = require(LP.Backpack[Args].GunStates),Mods[Args]
				rF["FireRate"] = gM.FireRate
				rF["Bullets"] = gM.Bullets
				rF["AutoFire"] = gM.AutoFire
			end
		end
		if Eq then
			LP.Character.Humanoid:EquipTool(LP.Backpack[Args])
		end
	end
end

function AutoTog(Args)
	if not Args then
		Args = Ms5.Text
	end
	if Args == "false" then
		Ms5.Text = "true"
		Ms5.TextColor3 = Color3.new(0,1,0)
		Mods[ModSel].AutoFire = true
	else
		Ms5.Text = "false"
		Ms5.TextColor3 = Color3.new(1,0,0)
		Mods[ModSel].AutoFire = false
	end
end

h4 = Create("Frame", {Visible=false,Parent=Tab1Frame,Name="Mods",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.59825,0,0.075,0),Size=UDim2.new(0,220,0,226)})
h5 = Create("Frame", {Parent=h4,Name="Icons",BorderSizePixel=0,BackgroundColor3=Background,Position=UDim2.new(0.05,0,0.058,0),Size=UDim2.new(0,50,0,200)})
Create("UIListLayout",{Parent=h5})
for i,v in next, Default do
	local p = Create("ImageLabel",{Parent=h5.UIListLayout,Name=i,Size=UDim2.new(0,50,0,50),Image=v.Image,BackgroundTransparency=1})
	local tb = Create("TextButton",{Parent=p,Text="",Size=UDim2.new(0,40,0,50),BackgroundTransparency=1,Position=UDim2.new(0,0,0.1,0)})
	tb.MouseButton1Down:connect(function()
		ModSel = i
		--print("Sel",ModSel)
		local t = Mods[ModSel]
		Ms3.Text,Ms4.Text,Ms2.Text = t.Bullets,t.FireRate,ModSel
		AutoTog(tostring(not t.AutoFire))
		RapidFire(ModSel)
	end)
end

spawn(function()
	repeat wait()
		if game.Workspace:FindFirstChild(LP.Name) then
			for i,v in next, Default do
				if LP.Backpack:FindFirstChild(i) or LP.Character:FindFirstChild(i) then
					if h5.UIListLayout:FindFirstChild(i) then
						h5.UIListLayout[i].Parent = h5
					end
				else
					if h5:FindFirstChild(i) then
						h5[i].Parent = h5.UIListLayout
					end
				end
				if #h5:GetChildren() == 1 then
					Ms3.Text,Ms4.Text,Ms2.Text = "-","-","No Gun Selected"
				end
			end
		end
	until nil
end)

c0 = Create("Frame",{Parent=h4,BackgroundTransparency=1,BorderColor3=Background,Position=UDim2.new(0.395,0,0.058,0),Size=UDim2.new(0,120,0,200)})
Create("UIListLayout",{Parent=c0})

c2 = Create("Frame",{Parent=c0,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,120,0,24)})
m2 = Create("Frame",{Parent=c0,BackgroundColor3=Secondary,BorderColor3=Background,Size=UDim2.new(0,120,0,24)})
Ms2 = Create("TextLabel",{Parent=c2,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,120,0,24),Font=Enum.Font.SpecialElite,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.new(1,1,1),Text="Remington 870"})

c3 = Create("Frame",{Parent=c0,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,120,0,24)})
m3 = Create("Frame",{Parent=c0,BackgroundColor3=Secondary,BorderColor3=Background,Size=UDim2.new(0,120,0,24)})
Create("TextLabel",{Parent=c3,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,60,0,24),Font=Enum.Font.SpecialElite,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.new(1,1,1),Text="Bullets:"})
Ms3 = Create("TextBox",{Parent=c3,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,54,0,24),Font=Enum.Font.SpecialElite,Position=UDim2.new(0.55,0,0,0),TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.new(1,1,1),Text="5"})

c4 = Create("Frame",{Parent=c0,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,120,0,24)})
m4 = Create("Frame",{Parent=c0,BackgroundColor3=Secondary,BorderColor3=Background,Size=UDim2.new(0,120,0,24)})
Create("TextLabel",{Parent=c4,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,60,0,24),Font=Enum.Font.SpecialElite,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.new(1,1,1),Text="FireRate:"})
Ms4 = Create("TextBox",{Parent=c4,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,50,0,24),Font=Enum.Font.SpecialElite,Position=UDim2.new(0.583,0,0,0),TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.new(1,1,1),Text="0.8"})

do
	local function AdvFilter(Args,Mod)
		if Args.Text == "" or Args.Text == "-" then
			return
		end
		if not tonumber(Args.Text) then
			Args.Text = 0
		end
		if tonumber(Args.Text) > 25 then
			Args.Text = 25
		end
		--print(Args.Text)
		Mods[ModSel][Mod] = Args.Text
		RapidFire(ModSel)
	end
	Ms3:GetPropertyChangedSignal("Text"):connect(function()
		AdvFilter(Ms3,"Bullets")
	end)

	Ms4:GetPropertyChangedSignal("Text"):connect(function()
		AdvFilter(Ms4,"FireRate")
	end)
end

c5 = Create("Frame",{Parent=c0,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,120,0,24)})
m5 = Create("Frame",{Parent=c0,BackgroundColor3=Secondary,BorderColor3=Background,Size=UDim2.new(0,120,0,24)})
Create("TextLabel",{Parent=c5,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,120,0,24),Font=Enum.Font.SpecialElite,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.new(1,1,1),Text="Automatic:"})
Ms5 = Create("TextButton",{Parent=c5,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,44,0,24),Font=Enum.Font.SpecialElite,Position=UDim2.new(0.633,0,0,0),TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.new(1,0,0),Text="false"})
Ms5.MouseButton1Down:connect(function()
	AutoTog()
	RapidFire(ModSel)
end)

c6 = Create("TextButton",{Parent=h4,BackgroundTransparency=1,BorderColor3=Background,Size=UDim2.new(0,60,0,12),Font=Enum.Font.SourceSansBold,Position=UDim2.new(0.395,0,0.907,0),TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=Color3.new(1,1,1),Text="Load defaults"})
c6.MouseButton1Down:connect(function()
	local t = Default[ModSel]
	Ms3.Text,Ms4.Text,Ms2.Text = t.Bullets,t.FireRate,ModSel
	AutoTog(tostring(not t.AutoFire))
	RapidFire(ModSel)
end)

-- Toggles
b = 0.035
t = Create("Frame", {Parent=Tab2Frame,Name="Inf Stamina",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.025+b,0,0.075,0),Size=UDim2.new(0,120,0,50)})
u = Create("TextLabel",{Text="Inf Stamina",Parent=t,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.135,0,-0.2,0),Size=UDim2.new(0,90,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v1 = Create("TextButton",{Text="OFF",Parent=t,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t2 = Create("Frame", {Parent=Tab2Frame,Name="FriendService",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.25+b,0,0.075,0),Size=UDim2.new(0,120,0,50)})
u2 = Create("TextLabel",{Text="FriendService",Parent=t2,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.095,0,-0.2,0),Size=UDim2.new(0,100,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v2 = Create("TextButton",{Text="OFF",Parent=t2,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t3 = Create("Frame", {Parent=Tab2Frame,Name="AutoReload",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.475+b,0,0.075,0),Size=UDim2.new(0,120,0,50)})
u3 = Create("TextLabel",{Text="Auto-Reload",Parent=t3,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.075,0,-0.2,0),Size=UDim2.new(0,105,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v3 = Create("TextButton",{Text="OFF",Parent=t3,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t5 = Create("Frame", {Parent=Tab2Frame,Name="AutoRespawn",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.025+b,0,0.35,0),Size=UDim2.new(0,120,0,50)})
u5 = Create("TextLabel",{Text="AutoRespawn",Parent=t5,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.095,0,-0.2,0),Size=UDim2.new(0,100,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v5 = Create("TextButton",{Text="OFF",Parent=t5,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t6 = Create("Frame", {Parent=Tab2Frame,Name="1Punch",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.25+b,0,0.35,0),Size=UDim2.new(0,120,0,50)})
u6 = Create("TextLabel",{Text="1Punch",Parent=t6,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.225,0,-0.2,0),Size=UDim2.new(0,60,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v6 = Create("TextButton",{Text="OFF",Parent=t6,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t7 = Create("Frame", {Parent=Tab2Frame,Name="Sped Car",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.475+b,0,0.35,0),Size=UDim2.new(0,120,0,50)})
u7 = Create("TextLabel",{Text="Sped Car",Parent=t7,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.1675,0,-0.2,0),Size=UDim2.new(0,80,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v7 = Create("TextButton",{Text="OFF",Parent=t7,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t8 = Create("Frame", {Parent=Tab2Frame,Name="Sped Punch",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.7+b,0,0.075,0),Size=UDim2.new(0,120,0,50)})
u8 = Create("TextLabel",{Text="Sped Punch",Parent=t8,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.095,0,-0.2,0),Size=UDim2.new(0,100,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v8 = Create("TextButton",{Text="OFF",Parent=t8,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t9 = Create("Frame", {Parent=Tab2Frame,Name="Anti Taze",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.7+b,0,0.35,0),Size=UDim2.new(0,120,0,50)})
u9 = Create("TextLabel",{Text="Anti Taze",Parent=t9,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.1675,0,-0.2,0),Size=UDim2.new(0,80,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v9 = Create("TextButton",{Text="OFF",Parent=t9,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t10 = Create("Frame", {Parent=Tab2Frame,Name="Anti Arrest",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.025+b,0,0.625,0),Size=UDim2.new(0,120,0,50)})
u10 = Create("TextLabel",{Text="Anti Arrest",Parent=t10,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.1675,0,-0.2,0),Size=UDim2.new(0,80,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v10 = Create("TextButton",{Text="OFF",Parent=t10,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

t11 = Create("Frame", {Parent=Tab2Frame,Name="SilentC",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.25+b,0,0.625,0),Size=UDim2.new(0,120,0,50)})
u11 = Create("TextLabel",{Text="Silent CMD",Parent=t11,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.075,0,-0.2,0),Size=UDim2.new(0,95,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
v11 = Create("TextButton",{Text="OFF",Parent=t11,TextColor3=Color3.new(1,0,0),BackgroundTransparency=1,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3,0,0.3,0),Size=UDim2.new(0,50,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=7})

-- ReTheme
xN = Create("Frame", {Parent=Tab5Frame,Name="Presets",BorderColor3=Secondary,BackgroundColor3=Background,Size=UDim2.new(0,250,0,100)})
xN.Position=UDim2.new(0.0525,0,GetCenter(xN,"Y"),0)
x2N = Create("TextLabel",{Text="Preset",Parent=xN,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Size=UDim2.new(0,65,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
x2N.Position=UDim2.new(GetCenter(x2N,"X"),0,-0.125,0)

zN = Create("Frame", {Parent=Tab5Frame,Name="UILazyLayout",BackgroundTransparency=1,Size=UDim2.new(0,250,0,100)})
zN.Position=UDim2.new(0.0525,0,GetCenter(zN,"Y"),0)
UILazyLayout = Create("UIListLayout", {Parent=zN,FillDirection = Enum.FillDirection.Horizontal,HorizontalAlignment = Enum.HorizontalAlignment.Center,VerticalAlignment = Enum.VerticalAlignment.Center,Padding=UDim.new(0,4)})

for i,v in next, TT do
	zRe = Create("TextButton",{Text="",Parent=zN,TextColor3=Primary,BackgroundColor3=v.Secondary,BorderColor3=Background,Size=UDim2.new(0,20,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
	zRe.MouseButton1Down:connect(function()
		local Theme = v
		ReTheme(Theme)
	end)
end
-- Advanced
xP = Create("Frame", {Parent=Tab5Frame,Name="Advanced",BorderColor3=Secondary,BackgroundColor3=Background,Size=UDim2.new(0,250,0,100)})
xP.Position=UDim2.new(0.525,0,GetCenter(xP,"Y"),0)
x2P = Create("TextLabel",{Text="Advanced",Parent=xP,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Size=UDim2.new(0,85,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
x2P.Position=UDim2.new(GetCenter(x2P,"X"),0,-0.125,0)

zP = Create("Frame", {Parent=Tab5Frame,Name="UILazyLayout",BackgroundTransparency=1,Size=UDim2.new(0,250,0,25)})
zP.Position=UDim2.new(0.525,0,GetCenter(zP,"Y"),0)
UILazyLayoutv2 = Create("UIListLayout", {Parent=zP,FillDirection = Enum.FillDirection.Horizontal,HorizontalAlignment = Enum.HorizontalAlignment.Center,VerticalAlignment = Enum.VerticalAlignment.Center,Padding=UDim.new(0,4)})
function AdvFilter(Args)
	if Args.Text == "" then
		return
	end
	if not tonumber(Args.Text) then
		Args.Text = "0"
	else
		if tonumber(Args.Text) > 255 then
			Args.Text = "255"
		end
	end
end
zP3 = Create("TextBox",{Text="0",Parent=zP,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,36,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
zP3:GetPropertyChangedSignal("Text"):connect(function()
	AdvFilter(zP3)
end)

zP4 = Create("TextBox",{Text="0",Parent=zP,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,36,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
zP4:GetPropertyChangedSignal("Text"):connect(function()
	AdvFilter(zP4)
end)

zP5 = Create("TextBox",{Text="0",Parent=zP,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,36,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
zP5:GetPropertyChangedSignal("Text"):connect(function()
	AdvFilter(zP5)
end)

zP6 = Create("TextButton",{Text="Set",Parent=zP,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,40,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
zP6.MouseButton1Down:connect(function()
	local x,y,z = tonumber(zP3.Text),tonumber(zP4.Text),tonumber(zP5.Text) 
	if x ~= nil and y ~= nil and z ~= nil then
		ReTheme(TT.Default, Vector3.new(x,y,z))
	end
end)

-- Credit
r = Create("Frame", {Parent=Tab3Frame,Name="02hacks",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.065,0,0.075,0),Size=UDim2.new(0,250,0,65)})
s0 = Create("TextLabel",{Text="02hacks",Parent=r,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Size=UDim2.new(0,70,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
s0.Position = UDim2.new(GetCenter(s0,"X"),0,-0.175,0)
s2 = Create("TextLabel",{Text="Scripting, UI.",Parent=r,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,160,0,30,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
s2.Position = GetCenter(s2)

r3 = Create("Frame", {Parent=Tab3Frame,Name="GeneralMatieux",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.51,0,0.075,0),Size=UDim2.new(0,250,0,65)})
s4 = Create("TextLabel",{Text="WolfBladez981",Parent=r3,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Size=UDim2.new(0,110,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
s4.Position = UDim2.new(GetCenter(s4,"X"),0,-0.175,0)
s5 = Create("TextLabel",{Text="NinthKnight, Testing, Ideas.",Parent=r3,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,160,0,30,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
s5.Position = GetCenter(s5)

r7 = Create("Frame", {Parent=Tab3Frame,Name="Exodots",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.065,0,0.375,0),Size=UDim2.new(0,250,0,65)})
s1 = Create("TextLabel",{Text="Exodots",Parent=r7,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Size=UDim2.new(0,70,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
s1.Position = UDim2.new(GetCenter(s1,"X"),0,-0.175,0)
s3 = Create("TextLabel",{Text="Youtube.com/exodots",Parent=r7,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,160,0,30,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
s3.Position = GetCenter(s3)

nc1 = Create("Frame", {Parent=Tab3Frame,Name="Blitz_FG",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.51,0,0.375,0),Size=UDim2.new(0,250,0,65)})
nc2 = Create("TextLabel",{Text="Blitz_FG",Parent=nc1,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Size=UDim2.new(0,72,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
nc2.Position = UDim2.new(GetCenter(nc2,"X"),0,-0.175,0)
nc3 = Create("TextLabel",{Text="Prevail X Bot",Parent=nc1,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,160,0,30,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
nc3.Position = GetCenter(nc3)

nc4 = Create("Frame", {Parent=Tab3Frame,Name="Krypto",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.51,0,0.675,0),Size=UDim2.new(0,250,0,65)})
nc5 = Create("TextLabel",{Text="Krypto",Parent=nc4,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Size=UDim2.new(0,62,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
nc5.Position = UDim2.new(GetCenter(nc5,"X"),0,-0.175,0)
nc6 = Create("TextLabel",{Text="Tiny.cc/Krypto",Parent=nc4,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,160,0,30,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
nc6.Position = GetCenter(nc6)

r8 = Create("Frame", {Parent=Tab3Frame,Name="PainExist",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.065,0,0.675,0),Size=UDim2.new(0,250,0,65)})
s6 = Create("TextLabel",{Text="PainExist",Parent=r8,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Size=UDim2.new(0,76,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})
s6.Position = UDim2.new(GetCenter(s6,"X"),0,-0.175,0)
s9 = Create("TextLabel",{Text="Cheat.gg",Parent=r8,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Secondary,Size=UDim2.new(0,160,0,30,0),Font=Enum.Font.SourceSansSemibold,FontSize=5})
s9.Position = GetCenter(s9)

-- Help
x = Create("Frame", {Parent=Tab4Frame,Name="Keybinds",BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.0525,0,0.125,0),Size=UDim2.new(0,180,0,200)})
xt = Create("TextLabel",{Text="Keybinds",Name="Title",Parent=x,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.275,0,-0.0625,0),Size=UDim2.new(0,80,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

z = Create("TextButton", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.075,0,0.075,0),Size=UDim2.new(0,20,0,20),Text="E",TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=6})
k = Create("TextLabel", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.2375,0,0.075,0),Size=UDim2.new(0,125,0,20),Text="  RapidFire Equipped",TextXAlignment=0,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=4})
z.MouseButton1Down:connect(function()
	LOG,SetKey = true,"RapidFire"
end)

z2 = Create("TextButton", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.075,0,0.215,0),Size=UDim2.new(0,20,0,20),Text="N",TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=6})
k2 = Create("TextLabel", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.2375,0,0.215,0),Size=UDim2.new(0,125,0,20),Text="  Invisible",TextXAlignment=0,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=4})
z2.MouseButton1Down:connect(function()
	LOG,SetKey = true,"Invisible"
end)

z3 = Create("TextButton", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.075,0,0.355,0),Size=UDim2.new(0,20,0,20),Text="H",TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=6})
k3 = Create("TextLabel", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.2375,0,0.355,0),Size=UDim2.new(0,125,0,20),Text="  Hide/Show UI",TextXAlignment=0,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=4})
z3.MouseButton1Down:connect(function()
	LOG,SetKey = true,"UI"
end)

z4 = Create("TextButton", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.075,0,0.495,0),Size=UDim2.new(0,20,0,20),Text="K",TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=6})
k4 = Create("TextLabel", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.2375,0,0.495,0),Size=UDim2.new(0,125,0,20),Text="  Toggle KillAura",TextXAlignment=0,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=4})
z4.MouseButton1Down:connect(function()
	LOG,SetKey = true,"KillAura"
end)

z5 = Create("TextButton", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.075,0,0.635,0),Size=UDim2.new(0,20,0,20),Text="Q",TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=6})
k5 = Create("TextLabel", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.2375,0,0.635,0),Size=UDim2.new(0,125,0,20),Text="  Respawnv2",TextXAlignment=0,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=4})
z5.MouseButton1Down:connect(function()
	LOG,SetKey = true,"Respawnv2"
end)

z6 = Create("TextButton", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.075,0,0.775,0),Size=UDim2.new(0,20,0,20),Text="Z",TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=6})
k6 = Create("TextLabel", {Parent=x,BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.2375,0,0.775,0),Size=UDim2.new(0,125,0,20),Text="  Noclip Toggle",TextXAlignment=0,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=4})
z6.MouseButton1Down:connect(function()
	LOG,SetKey = true,"Noclip"
end)

x3 = Create("ScrollingFrame", {Parent=Tab4Frame,ScrollBarThickness=5,ScrollBarImageTransparency=0,CanvasSize=UDim2.new(0,0,4,0),BorderColor3=Secondary,BackgroundColor3=Background,Position=UDim2.new(0.4125,0,0.125,0),Size=UDim2.new(0,320,0,200)})
function x4()
	x3:ClearAllChildren()
	Create("TextLabel", {Parent=x3,Text="#",Name="NumberLabel",BackgroundColor3=Background,BorderColor3=Secondary,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=5,Position=UDim2.new(0.025,0,0.0125,0),Size=UDim2.new(0,20,0,20)})
	Create("TextLabel", {Parent=x3,Text="Usage",Name="UsageLabel",BackgroundColor3=Background,BorderColor3=Secondary,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=5,Position=UDim2.new(0.105,0,0.0125,0),Size=UDim2.new(0,120,0,20)})
	Create("TextLabel", {Parent=x3,Text="Info",Name="DescLabel",BackgroundColor3=Background,BorderColor3=Secondary,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=5,Position=UDim2.new(0.5,0,0.0125,0),Size=UDim2.new(0,145,0,20)})

	nV = 0.0375
	for i,v in next, {"DED_Kill All", "Dab_[FE] Dabs", "Gate_[FE] Opens gate", "Rej_Rejoins game", "M4_Gets M4A1", "AK_Gets AK47", "M9_Gets M9", "Animate <Id>_[FE] Runs an animation", "Aura <Victim>_Toggles KillAura for Victim", "DED <Victim>_Kills Victim", "Backward_[FE] Makes guns backward", "Car <Sedan, Squad>_Teleports Car to you", "Prefix <Prefix>_Changes Prefix"} do
		if i < 10 then
			i = "0"..tostring(i)
		end
		Create("TextLabel", {Parent=x3,Text=i,Name=i,BackgroundColor3=Background,BorderColor3=Secondary,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=5,Position=UDim2.new(0.025,0,nV,0),Size=UDim2.new(0,20,0,20)})
		local v = string.split(v,"_")
		Create("TextLabel", {Parent=x3,Text="   "..v[1],Name=i.."Usage",TextXAlignment=0,BackgroundColor3=Background,BorderColor3=Secondary,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=5,Position=UDim2.new(0.105,0,nV,0),Size=UDim2.new(0,120,0,20)})
		Create("TextLabel", {Parent=x3,Text="   "..v[2],Name=i.."Desc",TextXAlignment=0,BackgroundColor3=Background,BorderColor3=Secondary,TextColor3=Primary,Font=Enum.Font.SourceSansBold,FontSize=5,Position=UDim2.new(0.5,0,nV,0),Size=UDim2.new(0,145,0,20)})
		nV= nV+0.025
	end
end
x4()
x2 = Create("Frame", {Parent=Tab4Frame,Name="Hold",BackgroundTransparency=1,Position=UDim2.new(0.4125,0,0.125,0),Size=UDim2.new(0,320,0,200)})
PF4 = Create("TextLabel",{Text="Current Prefix: "..Prefix,Name="Prefix",Parent=x2,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.69,0,-0.08,0),Size=UDim2.new(0,120,0,14,0),Font=Enum.Font.SourceSansSemibold,FontSize=4})
x8 = Create("TextLabel",{Text="Chat Commands",Name="Title",Parent=x2,TextColor3=Primary,BackgroundColor3=Background,BorderColor3=Background,Position=UDim2.new(0.3125,0,-0.0625,0),Size=UDim2.new(0,120,0,20,0),Font=Enum.Font.SourceSansSemibold,FontSize=6})

wait(0.1) -- Setups
if LP.TeamColor.Name == "Medium stone grey" and LP.PlayerGui.Home.intro.Visible then
	game.Workspace.Remote.loadchar:InvokeServer(LP, "Bright orange")
end

hud = LP.PlayerGui.Home.hud
MsgPX = hud.AddedGui.tooltip:Clone()
MsgPX.TextLabel.Visible = true
MsgPX.Visible = false
MsgPX.Size = UDim2.new(0,445,0,34)
MsgPX.Parent = hud
MsgPX.Name = "MsgPX"

Text = Instance.new("TextBox")

KEY = {
	RapidFire = "e",
	UI = "h",
	KillAura = "k",
	Respawnv2 = "q",
	Noclip = "z",
	Invisible = "n"
}
TXT = {
	RapidFire = z,
	UI = z3,
	KillAura = z4,
	Respawnv2 = z5,
	Noclip = z6,
	Invisible = z2
}
t_GA = {
	["02Hub"] = 1786075412,
	AntiAntiCheat = 1175090749, 
	WolfBladez981 = 1129487089, 
	eln7 = 432903055, 
	JmuseYT = 1394058468, 
	LuaDevz = 1543429331,
	Exodots = 243607476,
	mercypIz = 1616181382, 
	iiWhitePersonn = 457392251,
	mrs_sturgill = 1565715075,
	Memz_0 = 42715,
	blobsenburg = 294604890,
	TheKoopaShell = 561482099,
	rytay = 5498,
	lil_shjt = 857453948,
	FattyMcNoob = 934357983,
	MirroredObject = 288677454,
	wq4 = 20154193,
	n1ght0wI = 1640413987,
	Kyvaura = 1793047284
}
CFrames = {
	Armoury = CFrame.new(836.77, 99.99, 2284.43),
	Cells = CFrame.new(916.53, 99.98, 2473.53),
	["Criminal Base"] = CFrame.new(-896.80, 94.12, 2049.05),
	Downtown = CFrame.new(-269.61, 54.57, 1850.24),
	Entrance = CFrame.new(652.77, 99.99, 2289.34),
	Prison = CFrame.new(946.08, 99.99, 2374.65),
	Roof = CFrame.new(885.55, 135.20, 2455.61),
	Sewer = CFrame.new(917.02, 78.69, 2412.69),
	Tower = CFrame.new(817.57, 130.03, 2572.52),
	Invisible = CFrame.new(0, math.random(4^5,4^7), 0)
}
KillAura = {
	Active = true,
	Teams = {
		Guards = false,
		Inmates = false,
		Neutral = false,
		Criminals = false,
		Everyone = false
	},
	Solo = {},
	Players = {}
}
AutoReload = {
	Active = false
}
Anti = {
	arrest = {
		Active = false
	},
	taze = {
		Active = false
	}
}
Punch1 = {
	Active = false,
	Lock = false
}
FS_t = {}

-- Functions
function GetAccess(Args) -- Updated 11.13.20
	local Vec,Access = Vector2.new(1,1),true
	if game.Players:FindFirstChild(Args) and t_GA[Args] ~= nil then
		if Args == tostring(game.Players:GetPlayerByUserId(t_GA[Args])) then
			Vec = Vector2.new(0,Vec.Y)
		end
		if t_GA[Args] == tonumber(string.sub(game.Players[Args].CharacterAppearance,68)) then
			Vec = Vector2.new(Vec.X,0)
		end
		local v2 = Vec.X ~= 1 or Vec.Y ~= 1
		if v2 and not GetBypass then
			Access = false
		end
	end
	return Access
end

function FriendService(Args) -- FriendService v2
	local Enemy = true
	if FS_t[Args] and DED_FS or not game.Players:FindFirstChild(Args) then
		Enemy = false
	end
	return Enemy
end

function Anti.Func(Args,Vis)
	if AntiD then
		return
	end
	if Vis ~= nil then
		Anti[Args].Active = ToggleFunc(Vis,Anti[Args].Active)
	end
	local t = getconnections(game.Workspace.Remote[Args.."Player"].OnClientEvent)
	for i,v in next, t do
		if Anti[Args].Active then
			v:Disable()
		else
			v:Enable()
		end
		--print(v["__OBJECT_ENABLED"])
	end
end

function RFEquiped(Args)
	if game.Workspace:FindFirstChild(LP.Name) and game.Workspace[LP.Name]:FindFirstChildOfClass("Tool") then
		local FindEquip = LP.Character:FindFirstChildOfClass("Tool").Name
		if not Args then
			LP.Character.Humanoid:UnequipTools(game.Workspace[LP.Name][FindEquip])
			if LP.Backpack[FindEquip]:FindFirstChild("RapidFirePX") then
				LP.Backpack[FindEquip].RapidFirePX:Remove()
			else
				RapidFire(FindEquip)
			end
			LP.Character.Humanoid:EquipTool(LP.Backpack[FindEquip])
		else
			return FindEquip
		end
	end
end

function GetRoast(Args)
	local Get = GetPlayer(Args)
	Roastn = Roastn+1
	if not game.Players:FindFirstChild(Get) then
		return
	end
	local Roasts = {
		Get.."’s ego looking bigger than grandma’s stage 9 terminal cancer.",
		"Some things are unfixable, like "..Get..".",
		Get.." looks just about as hot as my freezer.",
		"Remember the rubber or you end up with "..Get..".",
		"Is it here? oh wait it’s just "..Get..".",
		"What? there’s no mistake, except for "..Get..".",
		"They say no two humans can be the same, after seeing "..Get.." I’d hope so.",
		Get.." is the type of person to throw a rock at the ground and miss.",
		"Is that a gorilla? oh it's just "..Get..".",
		"When "..Get.." has more chromosomes than cash.",
		"The only similarities between "..Get.." and Batman is that they both have no parents that love them.",
		"Zoo just called, they're wondering how "..Get.." got out of it's cage.",
		Get.." is like a cloud. When you disappear it's a beautiful day."
	}
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Roasts[Roastn],"All")
	if Roastn >= 8 then
		StaminaMsg("n1ghtowl#0124 for this Roast",1)
	end
	if Roastn == #Roasts then
		Roastn = 0
	end
end

function SetBind(Args)
	if LOG then
		KEY[SetKey] = Args
		TXT[SetKey].Text = Args:upper()
	end
end

function StaminaMsg(Args,t)
	MsgPX.ImageLabel.ImageTransparency = 0.8
	MsgPX.BackgroundTransparency = 0.2
	MsgPX.TextLabel.TextTransparency = 0
	for i = 1,string.len(Args) do
		MsgPX.TextLabel.Text = string.sub(Args,1,i)
		wait(0.03)
	end
	if t ~= nil then
		wait(t)
		for i = 1,33 do wait()
			MsgPX.ImageLabel.ImageTransparency = 1/33*i+0.8
			MsgPX.BackgroundTransparency = 1/33*i+0.2
			MsgPX.TextLabel.TextTransparency = 1/33*i
		end
	end
end

function GetPlayer(Args)
	local StringMatch = nil
	if not Args or Args == "" then
		Args = b0.Text
	end
	for i,v in pairs(game.Players:GetChildren()) do
		if string.match(v.Name:lower(),Args:lower()) or string.match(v.DisplayName:lower(),Args:lower()) then
			StringMatch = v.Name
			return StringMatch
		end
	end
	if not StringMatch then
		return ""
	end
end

function SEFunc(SEArgs)
	if game.Players:FindFirstChild(SEArgs) and game.Workspace:FindFirstChild(SEArgs) and game.Workspace[SEArgs]:FindFirstChild("Head") and GetAccess(SEArgs) then
		local A_1 = {}
		for i = 1,10 do
			table.insert(A_1,{
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] = 0.00,
				["Cframe"] = CFrame.new(), 
				["Hit"] = game.Workspace[SEArgs].Head
			})
		end
		game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[weapon].ITEMPICKUP)
		local A_2 = LP.Backpack:FindFirstChild(weapon) or LP.Character:FindFirstChild(weapon)
		game.ReplicatedStorage.ReloadEvent:FireServer(A_2)
		wait(0.07)
		game.ReplicatedStorage.ShootEvent:FireServer(A_1, A_2)
		wait(0.03)
	end
end

function DrK(Args)
	local t = {}
	for i,v in next, {"r","g","b"} do
		local M = Args[v]*255/5+20
		t[v] = Args[v]-M/255
		if t[v] < 0 then
			t[v] = 0
		end
	end
	return Color3.new(t.r,t.g,t.b)
end

function ReTheme(Data,Adv) -- Internal
	Primary = Data.Primary
	Secondary = Data.Secondary
	if typeof(Adv) == "Vector3" then
		Primary = Color3.new(1,1,1)
		Secondary = Color3.new(Adv.X/255,Adv.Y/255,Adv.Z/255)
	end
	for i,v in next, {hud.Topbar.titleBar, hud.Topbar.Pulldownmenu, hud.Topbar.Pulldownmenu.tb, hud.ClockFrame,hud.MenuButton, hud.MenuButton.MenuFrame.respawn, hud.MenuButton.MenuFrame.votekick, hud.MenuButton.MenuFrame.gamepasses, MsgPX} do
		v.BackgroundColor3 = Secondary
		v.BorderColor3 = Secondary
	end
	hud.GunFrame:GetChildren()[4].BackgroundColor3 = DrK(Secondary)
	hud.GunFrame.BackgroundColor3 = Secondary
	Title.TextColor3 = Secondary
	--XIX.BackgroundColor3 = Secondary
	for i,v in next, {Tab1Button, Tab2Button, Tab3Button, Tab4Button, disctxt, b0, b2, b3, b4, b5, b6, b7, d, d2, d3, d4, d5, g, ft, e4, f5, e6, f, e2, f2, f3, f0, e7, f6, e5, q, q1, q3, q4, q5, q6, q7, q8, q9, q0, u, u2, u3, u5, u6, u7, u8, u9, u10, u11, s0, s2, s4, s5, s1, s3, s6, s9, xt, z, k, z2, z3, k3, z4, k4, z5, k5, z6, k6, x8, g6, g7, PF4, nc2, nc3, nc5, nc6} do
		v.TextColor3 = Primary
	end
	for i,v in next, {CurTab, a, b2, b3, b4, b5, b6, b7, c, d2, d3, d4, d5, et, e4, f5, e6, e, e2, f2, f3, e0, e7, f6, e5, h, h2, q1, q2, q3, q4, q5, q6, q7, q8, q9, q0, t, t2, t3, t5, t6, t7, t8, t9, t10, t11, r, s2, r3, s5, r7, s3, r8, s9, z, k, z2, k2, z3, k3, z4, k4, z5, k5, z6, k6, x, x3, xN, xP, zP3, zP4, zP5, zP6, g6, g7, nc1, nc3, nc4, nc6, h4} do
		v.BorderColor3 = Secondary
	end
	for i,v in next, {v1, v2, v3, v5, v6, v7, v8, v9, v10, v11} do
		if v.Text == "ON" then
			v.TextColor3 = Secondary
		end
	end
	for i,v in next, {m2, m3, m4, m5} do
		v.BackgroundColor3 = Secondary
	end
	x4()
end

function TazFunc(Args)
	local A_1 = {}
	for i,v in next, Args do
		local TM = tostring(game.Players[v.Name].Team) == "Inmates" or tostring(game.Players[v.Name].Team) == "Criminals"
		if game.Workspace:FindFirstChild(v.Name) and TM and GetAccess(v.Name) and FriendService(v.Name) then
			A_1[i] = {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
				["Distance"] = 0.00,
				["Cframe"] = CFrame.new(),
				["Hit"] = game.Players[v.Name].Character.Head
			}
		end
	end
	local A_2 = LP.Backpack:FindFirstChild("Taser") or Workspace[LP.Name]:FindFirstChild("Taser")
	game.ReplicatedStorage.ReloadEvent:FireServer(A_2)
	wait(0.07)
	game.ReplicatedStorage.ShootEvent:FireServer(A_1, A_2)
end

function Teleport(Args)
	if game.Workspace:FindFirstChild(LP.Name) and typeof(Args) == "CFrame" then
		game.Workspace[LP.Name].HumanoidRootPart.CFrame = Args
		GetCFrame()
	end
end

function GetCar(Args,Posi) -- Args: Sedan, Squad
	if game.Workspace:FindFirstChild(LP.Name) then
		if typeof(Posi) ~= "Vector3" or not Posi then
			Posi = LP.Character.HumanoidRootPart.Position + Vector3.new(0,-5,0)
		end
		for i,v in next, game.Workspace.CarContainer:GetChildren() do 
			v.Parent = game.Workspace
		end
		for i,v in next, game.Workspace.Prison_ITEMS.buttons:GetChildren() do
			if v.Name == "Car Spawner" and v["Car Spawner"]["type"].Value == Args then
				Spawner = v["Car Spawner"]
				break
			end
		end
		game.Workspace.Remote.ItemHandler:InvokeServer(Spawner)
		Vehicle = game.Workspace.CarContainer:WaitForChild(Args)
		if Vehicle and Vehicle.Body:WaitForChild("VehicleSeat") then
			if LP.Character.Humanoid.Sit then
				LP.Character.Humanoid.Sit = false
			end
			LP.Character.HumanoidRootPart.CFrame =  Vehicle.Body.VehicleSeat.CFrame
			wait(0.1)
			Vehicle:MoveTo(Posi)
			LP.Character.HumanoidRootPart.CFrame =  Vehicle.Body.VehicleSeat.CFrame
		end
	end
end

function Item(ItemReq)
	if ItemReq == "M4A1" or ItemReq == "Riot Shield" then
		if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LP.UserId, 96651) then 
			game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[ItemReq].ITEMPICKUP)
		end
	else
		game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[ItemReq].ITEMPICKUP) 
	end
end

function removev2(Table,Args)
	for i,v in next, Table do
		if v == Args then 
			table.remove(Table,i)
			break
		end
	end
end

function KillAura.Panel(Args)
	local pt,tt,t = KillAura.Players,KillAura.Teams
	if Args == "Everyone" then
		t = game.Players:GetChildren()
	end
	if game.Teams:FindFirstChild(Args) then
		t = game.Teams[Args]:GetPlayers()
	end
	if game.Players:FindFirstChild(Args) then
		local st = KillAura.Solo
		if st[Args] then
			st[Args] = false
		else
			st[Args] = true
		end
		--warn(Args, st[Args])
		if not st[Args] then
			removev2(pt,Args)
		else
			table.insert(pt,Args)
		end
		return
	end
	if not t or Args == "" then
		return
	end
	if tt[Args] then
		tt[Args] = false
	else
		tt[Args] = true
	end
	for i,v in next, t do
		if not tt[Args] then
			if KillAura.Solo[v] ~= true then
				removev2(pt,v.Name)
			end
		else
			table.insert(pt,v.Name)
		end
	end
end

function KillAura.Func(Args)
	repeat wait(0.25)
		for i,v in next, KillAura.Teams do -- Team AutoUpdate
			if KillAura.Teams[i] then
				for n = 1,2 do
					KillAura.Panel(i,true)
				end
			end
		end
		for i,v in next, KillAura.Players do
			if game.Workspace:FindFirstChild(v) and game.Workspace:FindFirstChild(LP.Name) then
				if game.Workspace[v]:FindFirstChild("HumanoidRootPart") and game.Workspace[LP.Name]:FindFirstChild("HumanoidRootPart") then
					if (game.Workspace[LP.Name].HumanoidRootPart.Position - game.Workspace[v].HumanoidRootPart.Position).magnitude < 24 then
						if v ~= LP.Name and FriendService(v) and GetAccess(v) then
							if tostring(LP.Team) == "Guards" then 
								ReturnTM("Medium stone grey")
							end
							local v = game.Players[v]
							for i = 1,12 do
								game.ReplicatedStorage.meleeEvent:FireServer(v)
							end
							wait()
						end
					end
				end
			end
		end
	until nil
end

function KillAura.Teleport()
	local weld02 = LP.Character.HumanoidRootPart.CFrame
	for i,v in next, game.Players:GetChildren() do
		if LP.Name ~= v.Name and game.Workspace:FindFirstChild(LP.Name) then
			if LP.Character.Humanoid.Sit then
				LP.Character.Humanoid.Sit = false
			end
			LP.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
			for i = 1,10 do
				game.ReplicatedStorage.meleeEvent:FireServer(game.Workspace[v.Name])
			end
			wait(0.3)
		end
	end
	LP.Character.HumanoidRootPart.CFrame = weld02
end

function AutoReload.Func()
	local AR = {}
	repeat wait()
		if game.Workspace:FindFirstChild(LP.Name) and AutoReload.Active then
			local tool = LP.Character:FindFirstChildOfClass("Tool")
			if tool and tool:FindFirstChild("GunStates") then
				local r = require(tool.GunStates)
				if r["CurrentAmmo"] == 0 and AR[tool.Name] ~= true then
					spawn(function()
						AR[tool.Name] = true
						--print(tool.Name .." empty, reloading")
						game.ReplicatedStorage.ReloadEvent:FireServer(tool)
						wait(r["ReloadTime"])
						local tool = tool
						if game.Workspace:FindFirstChild(LP.Name) then
							tool = LP.Character:FindFirstChild(tool.Name) or LP.Backpack:FindFirstChild(tool.Name)
							if tool then
								if tool.Parent == LP.Backpack then
									r = require(tool.GunStates)
								end
								r["CurrentAmmo"] = r["MaxAmmo"]
								--warn("finished reloading " ..tool.Name)
							end
						end
						AR[tool.Name] = false
					end)
					wait()
				end
			end
		end
	until nil
end

function GetCFrame()
	if game.Workspace:FindFirstChild(LP.Name) and not LockPosition then
		if LP.Character:FindFirstChild("HumanoidRootPart") then
			RE = LP.Character.HumanoidRootPart.CFrame
		end
	end
end

function ScanStats()
	if game.Workspace:FindFirstChild(LP.Name) and LP.Character:FindFirstChild("Humanoid") then
		WalkSpeed = LP.Character.Humanoid.WalkSpeed
		JumpPower = LP.Character.Humanoid.JumpPower
	end
end

function ReturnStats(Args) -- StatOS
	if game.Workspace:FindFirstChild(LP.Name) and LP.Character:FindFirstChild("Humanoid") then
		if WalkSpeed == 0 then 
			LP.Character.Humanoid.WalkSpeed = 16 
		else 
			if Args == "Prone" then
				wait(0.186)
			end
			LP.Character.Humanoid.WalkSpeed = WalkSpeed
		end
		if JumpPower == 0 then 
			LP.Character.Humanoid.JumpPower = 50 
		else 
			if Args == "Prone" then
				wait(0.186)
			end
			LP.Character.Humanoid.JumpPower = JumpPower
		end
	end
end

function ScanTM()
	OldTM = LP.TeamColor.Name
end

function ReturnTM(Args) -- ReturnTM v3.20 Created: 3.21.21
	if Args == "Setup" then
		CRIMv2 = {
			Spawn = Workspace["Criminals Spawn"]:GetChildren()[1]
		}
		CRIMv2.Vec = CRIMv2.Spawn.Position
		CRIMv2.Spawn["CanCollide"] = false
		return
	end
	if not Args or Args == "" then
		Args = OldTM
	end
	if game.Workspace:FindFirstChild(LP.Name) and LP.Character:FindFirstChild("Humanoid") then
		local NinthKnight = #game.Teams["Guards"]:GetPlayers() < 8 and Args == "Bright blue" -- 9th Knight Bypass
		if Args == "Bright orange" or Args == "Medium stone grey" or NinthKnight then
			Workspace.Remote.TeamEvent:FireServer(Args)
		else
			if LP.Character.Humanoid.Sit then
				LP.Character.Humanoid.Sit = false
			end
			if LP.Character:FindFirstChild("HumanoidRootPart") then
				NotGuard = tostring(LP.Team) ~= "Guards" or not LP.Team
				if Args == "Really red" and NotGuard then -- Criminal v2.00
					CRIMv2.Spawn.CFrame = LP.Character.HumanoidRootPart.CFrame
					wait()
					CRIMv2.Spawn.CFrame = CFrame.new(CRIMv2.Vec)
					return
				end
				weld02 = LP.Character.HumanoidRootPart.CFrame
				game.Workspace.Remote.loadchar:InvokeServer(LP, Args)
				LP.Character.HumanoidRootPart.CFrame = weld02
			end
		end
	end
end

function ScanInv()
	Inv = {}
	EquipWeapon = RFEquiped("Get")
	if LP.Character:FindFirstChild("Humanoid") then
		game.Workspace[LP.Name].Humanoid:UnequipTools()
	end
	for i,v in next, LP.Backpack:GetChildren() do
		InvData = v.Name
		if InvData ~= "Taser" or InvData ~= "Handcuffs" then
			if v:FindFirstChild("RapidFirePX") then
				InvData = InvData.."_RF"
			end
			table.insert(Inv, InvData)
		end
	end
end

function ReturnInv() -- ReturnInv v2.00 Created: 4.23.20
	for i,v in next, Inv do
		if not string.split(v,"_") then
			return
		end
		ItemReq = string.split(v,"_")[1]
		if ItemReq == "M9" or ItemReq == "Remington 870" or ItemReq == "AK-47" or ItemReq == "M4A1" then
			game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[ItemReq].ITEMPICKUP)
			if LP.Backpack:WaitForChild(ItemReq) and string.split(v,"_")[2] == "RF" then
				RapidFire(ItemReq)
			end
		else
			if game.Workspace.Prison_ITEMS.single:FindFirstChild(ItemReq) then 
				game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.single[ItemReq].ITEMPICKUP)
			end
		end
	end
end

function Respawnv2(Args)
	if Args == "Setup" then
		Workspace.Remote.UpdateTopbar.OnClientEvent:connect(function(name, desc)
			LDV = name
		end)
		return
	end
	if not Loop and game.Workspace:FindFirstChild(LP.Name) then
		Rev2 = true
		ScanTM()
		if tostring(LP.Team) == "Neutral" or not LP.Team then
			ReturnTM("Bright orange") 
		end
		ScanInv()
		ScanStats()
		
		CameraCF = game.Workspace.Camera.CFrame
		game:GetService('StarterGui'):setCoreGuiEnabled("Backpack", true)

		if not RE then
			RE = LP.Character.HumanoidRootPart.CFrame
		end

		game.Workspace.Remote.loadchar:InvokeServer(LP,Args)

		local int = LP.PlayerGui.Home.intro
		if int.Visible then
			int.Visible = false
		end
		
		if tostring(LP.Team) == "Inmates" and LDV == "Lights out" then
			wait(0.1) 
			ReturnTM("Medium stone grey") 
		end
		
		LP.Character:WaitForChild("HumanoidRootPart").CFrame = RE
		wait()
		game.Workspace.Camera.CFrame = CameraCF

		ReturnTM()
		ReturnStats()
		ReturnInv()
		
		if LP.Character:WaitForChild("ClientInputHandler") and not InfStaminaLock then
			InfStamina()
		end
		if Anti["taze"].Active then
			Anti.Func("taze")
		end
		if Anti["arrest"].Active then
			Anti.Func("arrest")
		end
		ncII()
		F1.Touched:connect(ncf)
		
		if game.Workspace:FindFirstChild(LP.Name) and EquipWeapon then
			LP.Character.Humanoid:EquipTool(LP.Backpack[EquipWeapon])
		end
		Rev2 = false
	end
end

function FastPunch()
	repeat wait()
		if game.Workspace:FindFirstChild(LP.Name) and LP.Character:FindFirstChild("ClientInputHandler") then
			CIH = getsenv(LP.Character.ClientInputHandler)
			CIH.cs.isFighting = false
		end
	until FastPunchLock
end

function Invisible()
	if game.Workspace:FindFirstChild(LP.Name) then
		local weld02 = LP.Character.HumanoidRootPart.Position 
		Teleport(CFrames["Invisible"])
		wait(0.25)
		CloneHRP = LP.Character.HumanoidRootPart:Clone()
		LP.Character.HumanoidRootPart:Destroy() 
		CloneHRP.Parent = LP.Character
		LP.Character.HumanoidRootPart.CFrame = CFrame.new(weld02)
		StaminaMsg("Became Invisible",1)
	end
end

function s0nicsc0pe(Args)
	sZero = GetPlayer(Args)
	if game.Players:FindFirstChild(sZero) and game.Workspace:FindFirstChild(sZero) then
		ScanTM()
		if tostring(game.Players[sZero].Team) == "Neutral" or not game.Players[sZero].Team then
			ReturnTM("Bright orange")
		else 
			ReturnTM("Medium stone grey") 
		end
		SEFunc(sZero)
		ReturnTM()
		StaminaMsg("Killed "..sZero,1)
	end
end

function DEDF()
	ScanTM()
	for i,v in next, game.Players:GetChildren() do
		if v.Name ~= LP.Name then
			if tostring(LP.Team) == tostring(v.Team) then
				if tostring(v.Team) == "Neutral" or not v.Team then
					ReturnTM("Bright orange")
				else 
					ReturnTM("Medium stone grey") 
				end
			end
		end
		SEFunc(v.Name)
	end
	ReturnTM()
	StaminaMsg("Killed Everyone",1)
end

function Punch1.Func() -- 1Punch v2.20 Created 11.30.20
	if not Punch1.Lock and Punch1.Active and game.Workspace:FindFirstChild(LP.Name) then
		Punch1.Lock = true
		for i,Arm in next, {"Left Arm", "Right Arm"} do
			local Part = Instance.new("Part", LP.Character[Arm])
			Part.Transparency = 1
			Part.Size = Vector3.new(0.75, 0.25, 0.75)

			local Weld = Instance.new("Weld", Part)
			Weld.Part0 = LP.Character[Arm]
			Weld.Part1 = Part
			Weld.C1 = CFrame.new(0,1,0)
			local conn
			local function Hit(touch)
				if game.Players:FindFirstChild(touch.Parent.Name) then
					MeleeMe = touch.Parent.Name
					if MeleeMe ~= LP.Name and GetAccess(MeleeMe) and FriendService(MeleeMe) then
						conn:Disconnect()
						local AboosiveGuard
						if tostring(LP.Team) == "Guards" then
							AboosiveGuard = true
							ReturnTM("Medium stone grey")
						end
						for i = 1,10 do
							game.ReplicatedStorage.meleeEvent:FireServer(game.Players[MeleeMe])
						end
						if AboosiveGuard then
							wait(0.72)
							ReturnTM("Bright blue")
						end
					end
				end
			end
			conn = Part.Touched:connect(Hit)
		end
		wait(0.5)
		for i,Arm in next, {"Left Arm", "Right Arm"} do
			if LP.Character[Arm]:FindFirstChild("Part") then
				LP.Character[Arm].Part:Remove()
			end
		end
		Punch1.Lock = false
	end
end

function InfStamina() -- Updated 7.11.20
	local a,b = 0,0
	for i,v in next, getregistry() do
		if type(v) == 'function' then
			a = a+1
			if a >= 120 then
				wait()
				a = 0
			end
			for i2, v2 in next, getupvalues(v) do
				b = b+1
				if b >= 120 then
					wait()
					b = 0
				end
				if i2 == 5 and typeof(v2) == "number" and tostring(v2) == string.split(v2,".")[1] then
					if not InfStaminaLock then
						setupvalue(v,i2,math.huge)
					else
						setupvalue(v,i2,12)
					end
				end
			end
		end
	end
end

function FindVeh() -- FindVeh Created 4.23.20
	if game.Workspace:FindFirstChild(LP.Name) and LP.Character:FindFirstChild("Humanoid") then 
		LP.Character.Humanoid:GetPropertyChangedSignal("SeatPart"):connect(function()
			Seat = LP.Character.Humanoid.SeatPart
			if tostring(Seat) == "VehicleSeat" and SpedCart then
				SpedCar(Seat.Parent.Parent)
			end
		end)
	end
end

function Backward()
	if game.Workspace:FindFirstChild(LP.Name) then
		game.Workspace[LP.Name].Humanoid:UnequipTools()
		for i,v in next, LP.Backpack:GetChildren() do
			if v:IsA("Tool") and v:FindFirstChild("GunStates") then
				v.GripRight = Vector3.new(-1,0,0)
			end
		end
	end
end

function FEPP()
	if game.Workspace:FindFirstChild(LP.Name) then
		local Get = "Remington 870"
		game.Workspace[LP.Name].Humanoid:UnequipTools()
		game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[Get].ITEMPICKUP)
		LP.Backpack[Get].GripPos = Vector3.new(0.85,2,0.5)
		LP.Character.Humanoid:EquipTool(LP.Backpack[Get])
	end
end

function SpedCar(Args) -- SpedCar Created 4.23.20
	local Vehicle = Args
	Vehicle.Name = LP.Name
	for i,v2 in next, Vehicle.Wheels:GetChildren() do -- DowntoEarth
		if i > 2 then
			vec = Vector3.new(100,-10,100)
		else
			vec = Vector3.new(100,-30,100)
		end
		v2.BodyGyro.MaxTorque = vec
	end
	repeat wait() -- Bypass/Speed
		if Vehicle:FindFirstChild("RWD") then
			Vehicle.RWD.Torque = 20
			Vehicle.RWD.MaxSpeed = 800
			Vehicle.LW.VS.Torque = 20
			Vehicle.LW.VS.MaxSpeed = 800
			Vehicle.RW.VS.Torque = 20
			Vehicle.RW.VS.MaxSpeed = 800
		end
	until not game.Workspace:FindFirstChild(LP.Name) or not LP.Character.Humanoid.SeatPart or not Vehicle or not SpedCart
end

function ToggleFunc(Args,Args2)
	if Args.Text == "OFF" then 
		Args.TextColor3 = Secondary 
		Args.Text = "ON" 
	else
		Args.TextColor3 = Color3.new(1,0,0) 
		Args.Text = "OFF" 
	end
	if Args2 ~= nil then
		if Args2 then
			Args2 = false
		else
			Args2 = true
		end
		return Args2
	end
end

function Animation(Args)
	if not Args then
		return
	end
	local obj = Instance.new("Animation")
	obj.AnimationId = "rbxassetid://"..Args
	if game.Workspace:FindFirstChild(LP.Name) then
		LP.Character.Humanoid:LoadAnimation(obj):Play()
	end
end

function BringFunc(Args)
	if game.Workspace:FindFirstChild(LP.Name) and game.Workspace:FindFirstChild(Args) then
		weld02 = LP.Character.HumanoidRootPart.CFrame
		game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		LP.Character.Humanoid:Remove() Instance.new("Humanoid",game.Workspace[LP.Name])
		if LP.Backpack:FindFirstChild("Remington 870") then 
			LP.Character.Humanoid:EquipTool(LP.Backpack["Remington 870"])
		end 
		wait()
		game.Players[Args].Character.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.new(0.85, 2, -1)
		game.Players[Args].Character.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.new(0.85, 1.5, -1.2) wait()
		game.Players[Args].Character.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.new(0.95, 0.8, -0.5) wait()
		LP.Character.HumanoidRootPart.CFrame = weld02 wait(0.325)
		game.Workspace.Remote.loadchar:InvokeServer() wait()
		LP.Character.HumanoidRootPart.CFrame = weld02
		StaminaMsg("Bring v1.00, Brought "..Args,1)
	end
end

function BringHook(Arg1,Arg2,Arg3,Arg4)
	if game.Players:FindFirstChild(Arg1) and game.Players[Arg1].Character:FindFirstChild("HumanoidRootPart") and game.Workspace:FindFirstChild(LP.Name) then
		game.Players[Arg1].Character.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.new(Arg2,Arg3,Arg4)
		wait()
	end
end

function Chatted(msg)
	rawmsg,msg = msg,msg:upper()
	if msg == Prefix.."DAB" then 
		Animation(248263260) 
	end
	if msg == Prefix.."GATE" then 
		game.Workspace.Remote.ItemHandler:InvokeServer(game.Workspace["Prison_ITEMS"].buttons["Prison Gate"]["Prison Gate"]) 
	end
	if msg == Prefix.."REJ" then 
		game:GetService("TeleportService"):Teleport(155615604, LP) 
	end
	if string.sub(msg,1,9) == Prefix.."ANIMATE " then
		Animation(tonumber(string.sub(rawmsg,10)))
	end
	if msg == Prefix.."M4" then 
		Item("M4A1") 
	end
	if msg == Prefix.."AK" then 
		Item("AK-47") 
	end
	if msg == Prefix.."R870" then 
		Item("Remington 870") 
	end
	if msg == Prefix.."M9" then 
		Item("M9") 
	end
	if string.sub(msg,1,5) == Prefix.."MSG " then
		StaminaMsg(string.sub(rawmsg,6),2)
	end
	if string.sub(msg,1,6) == Prefix.."AURA " then
		KillAura.Panel(GetPlayer(string.sub(msg,7)))
	end
	if msg == Prefix.."TPAURA" then 
		KillAura.Teleport()
	end
	if msg == Prefix.."WILD" then 
		FEPP() 
	end
	if msg == Prefix.."BACKWARD" then 
		Backward()
	end
	if string.sub(msg, 1,5) == Prefix.."CAR " then
		GetCar("S"..string.sub(msg, 7,10):lower())
	end
	if string.sub(msg, 1,4) == Prefix.."DED" and string.sub(msg, 5,5) == "" then 
		DEDF()
	end
	if string.sub(msg, 1,5) == Prefix.."DED " and string.sub(msg, 6,6) ~= "." then 
		s0nicsc0pe(string.sub(msg, 6)) 
	end
	if string.sub(msg, 1,8) == Prefix.."PREFIX " then
		if string.sub(msg, 9,9) ~= " " or string.sub(msg, 9,9) ~= nil then 
			Prefix = string.sub(msg, 9,9) 
			PF4.Text = "Current Prefix: "..Prefix
			LP.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.TextLabel.Text = "Prevail X's Current Prefix: "..Prefix
			StaminaMsg("New Prefix is "..Prefix,2)
		end 
	end
end

function Silentf()
	if SilentCD then
		return SilentCD
	end
	local mt = getmetatable(game)
	local old = {
		index = mt.__index,
		namecall = mt.__namecall
	}
	setreadonly(mt, false)

	mt.__namecall = function(self,...)
		local dot3 = ...
		if getnamecallmethod() == "FireServer" and tostring(self) == "SayMessageRequest" and string.sub(dot3,1,1) == Prefix then
			setcontext(6)
			Chatted(dot3)
			setcontext(2)
			if SilentC then
				return nil
			end
		end
		return old.namecall(self,...)
	end
	setreadonly(mt, true)
end

function Criminal(Arg1)
	if game.Workspace:FindFirstChild(Arg1) and game.Workspace:FindFirstChild(LP.Name) then
		weld02 = LP.Character.HumanoidRootPart.CFrame
		if game.Workspace[Arg1].Humanoid.Sit then
			return
		end
		game.Workspace.Remote.loadchar:InvokeServer(LP, "Really red")
		game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		LP.Character.Humanoid:Remove() Instance.new("Humanoid", game.Workspace[LP.Name])
		LP.Character.Humanoid:EquipTool(LP.Backpack["Remington 870"]) wait(0.05)
		LP.Character.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.new(0,-4,0)
		BringHook(Arg1, 0.95, 2, -0.5)
		BringHook(Arg1, 0.85, 2, -1) 
		BringHook(Arg1, 0.85, 2, -1.2)
		BringHook(Arg1, 0.95, 1.5, -0.5) 
		BringHook(Arg1, 0.85, 1.5, -1) 
		BringHook(Arg1, 0.85, 1.5, -1.2) 
		BringHook(Arg1, 0.95, 0.8, -0.5) 
		BringHook(Arg1, 0.85, 0.8, -1) 
		BringHook(Arg1, 0.85, 0.8, -1.2)
		game.Workspace.Remote.loadchar:InvokeServer()
		LP.Character.HumanoidRootPart.CFrame = weld02
		if tostring(game.Players[Arg1].Team) == "Criminals" then
			StaminaMsg("Made "..Arg1.." a Criminal",1)
		end
	end
end

function ncII() -- touchclip prototype
	F1 = Instance.new("Part", LP.Character["Torso"])
	F1.Size = Vector3.new(2.2,2,1.3)
	F1.Transparency = 1

	F2 = Instance.new("Weld", F1)
	F2.Part0 = F1
	F2.Part1 = F1.Parent
end

spawn(function()
	CCt = {}
	repeat wait()
		for i,v in next, CCt do
			if tick() > v then
				i.CanCollide = true
				print("restored",i.Name)
				CCt[i] = nil
			end
		end
	until nil
end)
function ncf(Args)
	if Args:IsDescendantOf(game.Players) ~= true and Noclip and game.Players:FindFirstChild(LP.Name) then
		local LL = LP.Character["Left Leg"]
		if (Args.Position.Y > F1.Position.Y or Args.Position.Y > LL.Position.Y) and Args.CanCollide then
			CCt[Args] = tick()+3
			Args.CanCollide = false
		end
	end
end

function FEFF()
	if not FFL then
		return
	end
	repeat
		if game.Workspace:WaitForChild(LP.Name) and game.Workspace[LP.Name]:WaitForChild("HumanoidRootPart") then
			Respawnv2("Really red")
			game.Workspace[LP.Name].ForceField.Visible = false
		end
		wait(9.25)
	until not FFL
end

function Setup()
	ReturnTM("Setup")
	Respawnv2("Setup")
	hud.AddedGui.Visible = false
	hud.MenuButton.MenuFrame.respawn.TextColor3 = Primary
	if titleBar ~= nil then
		hud.Topbar.titleBar.Title.Text = titleBar 
	end
	if Pulldownmenu ~= nil then
		hud.Topbar.Pulldownmenu.Frame.Description.Text = Pulldownmenu 
	end
	for i,v2 in next, {hud.Topbar.titleBar, hud.Topbar.Pulldownmenu, hud.Topbar.Pulldownmenu.tb, hud.ClockFrame,hud.MenuButton, hud.MenuButton.MenuFrame.respawn, hud.MenuButton.MenuFrame.votekick, hud.MenuButton.MenuFrame.gamepasses, MsgPX} do
		v2.BackgroundColor3 = Secondary
		v2.BorderColor3 = Secondary
	end
	local GFc = hud.GunFrame:GetChildren()
	if GFc[3]:FindFirstChild("TextLabel") then
		GFc[3].TextLabel:Remove()
	end
	GFc[4].BackgroundColor3 = DrK(Secondary)
	hud.GunFrame.BackgroundColor3 = Secondary
	for i,v2 in next, {hud.Topbar.Pulldownmenu.tb, hud.Topbar.titleBar.Title, hud.Topbar.Pulldownmenu.Frame.Description, hud.MenuButton.MenuFrame.respawn, hud.ClockFrame.tl} do 
		v2.Font = Enum.Font.SourceSansSemibold
	end
	if GetAccess(LP.Name) then
		AntiAntiCheat = "1594427591"
	end
	if game.Workspace:FindFirstChild(LP.Name) then
		LP.Character:WaitForChild("Humanoid").Died:Connect(function()
			if AutoRespawn and not Arrested then
				GetCFrame()
				LockPosition = true
				Respawnv2()
				wait(2)
				LockPosition = false
			end
		end)
	end
	if Silentf() then
		LP.Chatted:connect(Chatted)
	end
	FindVeh()
	LP.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.TextLabel.Text = "Prevail X's current prefix: "..Prefix
	MsgPX.Visible = true
	spawn(KillAura.Func)
	spawn(AutoReload.Func)
	for i,v in next, game.Players:GetChildren() do
		if v.Name ~= LP.Name and v:IsFriendsWith(LP.UserId) then
			FS_t[v.Name] = true
		end
	end
	game.Players.PlayerAdded:Connect(function(New)
		if New:IsFriendsWith(LP.UserId) then
			FS_t[New.Name] = true
		end
	end)
	ncII()
	F1.Touched:connect(ncf)
end

wait(0.1) -- connects
b4.MouseButton1Down:connect(function() -- Teleport
	TPData = GetPlayer()
	if game.Workspace:FindFirstChild(LP.Name) and game.Workspace:FindFirstChild(TPData) then
		LP.Character.HumanoidRootPart.CFrame = game.Players[TPData].Character.HumanoidRootPart.CFrame
		StaminaMsg("Teleported to "..TPData,1)
	end
end)

e7.MouseButton1Down:connect(function() -- MapFuck v2
	if FuckRan then
		for i = 1,2 do
			MapF.PATCH_GRASS.Parent = game.Workspace
		end
		MapF:Remove()
		return
	end
	Preserve,MapF = {},Instance.new("Folder", game.Workspace)
	MapF.Name = "MapFuck v2.1"
	game.Workspace.Prison_Guard_Outpost.floor.BrickColor = BrickColor.new("Medium stone grey")
	for i,v in next, {game.Workspace.Prison_Halls.floor, game.Workspace.Prison_Cellblock.c_floor, game.Workspace.Prison_Guard_Outpost.floor, game.Workspace.Prison_Cafeteria.floor, game.Workspace.Prison_Administration.stairs, game.Workspace.stairs} do
		Preserve["A"..i] = v
	end
	for i,v in next, game.Workspace.Prison_Administration:GetChildren() do
		if v.Name == "part" and string.sub(v.Position.X,1,6) == "722.80" and string.sub(v.Position.Y,1,4) == "95.9" then
			Preserve["B"..i] = v
		end
	end
	for i,v in next, game.Workspace.Warehouses:GetChildren() do
		if v.Name == "Part" and string.sub(v.Position.X,1,7) == "-933.70" and string.sub(v.Position.Y,1,5) == "90.82" then
			Preserve["C"..i] = v
		end
	end
	for i,v in next, game.Workspace.Town_Sideroad:GetChildren() do
		if v.Name == "Floor" and string.sub(v.Position.X,1,6) == "-858.8" and string.sub(v.Position.Y,1,4) == "88.7" then
			Preserve["D"..i] = v
		end
	end
	for i,v in next, game.Workspace.Warehouses.Warehouse1:GetChildren() do
		if v.Name == "Smooth Block Model" then
			if string.sub(v.Position.Z,1,4) == "2078" then
				Preserve["E"..i] = v
			end
			if string.sub(v.Position.X,1,6) == "-977.1" and string.sub(v.Position.Z,1,6) == "2054.4" then
				Preserve["F"..i] = v
			end
		end
	end
	for i,v in next, game.Workspace.Warehouses.Outside:GetChildren() do
		if v.Name == "Smooth Block Model" and string.sub(v.Position.Y,1,4) == "91.6" then
			Preserve["G"..i] = v
		end
	end
	for i,v in next, game.Workspace.Prison_Cafeteria:GetChildren() do
		if v.Name == "floor" and string.sub(v.Position.X,1,3) == "916" then 
			if string.sub(v.Position.Z,1,4) == "2276" or string.sub(v.Position.Z,1,4) == "2345" then
				Preserve["H"..i] = v
			end
		end
	end
	for i,v in next, game.Workspace.Warehouses.Warehouse1["Shipping containers"]:GetChildren() do
		if v.Name == "Smooth Block Model" and v.Material == Enum.Material.Wood then
			Preserve["I"..i] = v
		end
	end
	for i,v in next, game.Workspace:GetChildren() do
		if v.ClassName == "Model" and v:FindFirstChild("paths") then
			for i,v2 in next, v.paths:GetChildren() do 
				if v2.Name == "main_path" and string.sub(v2.Position.X,1,5) == "630.8" then
					v2:Remove()
					Preserve["J"..i] = v
					break
				end
			end
		end
	end
	for i,v in next, game.Workspace.Prison_road:GetChildren() do
		if tostring(v.BrickColor) == "Black" then
			Preserve["K"..i] = v
		end
	end
	for i,v in next, game.Workspace.mainRoads:GetChildren()  do
		if tostring(v.BrickColor) == "Black" then
			Preserve["L"..i] = v
		end
	end
	for i,v in next, game.Workspace.Prison_Halls:GetChildren() do
		if v.Name == "stairs" then
			Preserve["M"..i] = v
		end
	end
	for i,v in next, game.Workspace.GuardBooth:GetChildren() do
		if v.Name == "Stonewall" and string.sub(v.Position.X,1,5) == "504.7" and string.sub(v.Position.Y,1,4) == "96.4" then
			Preserve["N"..i] = v
		end
	end
	if game.Workspace:FindFirstChild("Prison_Fences") and game.Workspace.Prison_Fences:FindFirstChild("Prison_Gate") then
		Preserve["O2"] = game.Workspace.Prison_Fences.Prison_Gate
	end
	for i,v in next, Preserve do -- RaR
		local gen = StringGenerator(8)
		for i,v2 in next, v:GetDescendants() do
			v2.Name = gen
		end
		v.Name = gen
		v.Parent = MapF
	end
	for i,v in next, game.Workspace:GetChildren() do -- Remove
		if v.Name == "sign" or v.Name == "part" or v.Name == "Part" or v.Name == "Floor" or v.Name == "Wedge" or v.Name == "Truss" or v.Name == "Model" then 
			if v.ClassName ~= "Terrain" and game.Workspace:FindFirstChild(v.Name) then
				v:Remove()
			end
		end
	end
	if game.Workspace:FindFirstChild("Prison_spawn") and game.Workspace.Prison_spawn:FindFirstChild("Cells") then
		game.Workspace.Prison_spawn.Cells:Remove()
	end
	if game.Workspace:FindFirstChild("Prison_ITEMS") and game.Workspace.Prison_ITEMS:FindFirstChild("buttons") then
		game.Workspace.Prison_ITEMS.buttons["Garage Buttons"]:Remove()
	end
	for i,v in next, {"Prison_Cellblock", "stairs", "Town_Fence", "Properties", "Shippingcontainers", "BOUNDARY", "Prison_road", "Town_ParkingLot", "Ceiling", "City_buildings", "Town_stores", "busstop", "Prison_Halls", "Prison_Guard_Outpost", "Town_Sideroad", "Sewer", "mainRoads", "Prison_Flag", "Treadmills", "Prison_Fences", "Prison_Parking", "Prison_Cafeteria", "seweropening", "Benchpresses", "Prison_Signs", "Prison_Trees", "GuardBooth", "Garages", "ramp", "Desks", "Prison_Administration", "Trees", "Prison_OuterWall", "powerline", "Warehouses", "Plant", "Parkinglines", "Stop Sign", "Street lights", "Square trees", "SideRoad"} do 
		if game.Workspace:FindFirstChild(v) then
			game.Workspace[v]:Remove()
		end
	end

	local Wedge = Instance.new("WedgePart", MapF)
	Wedge.Anchored = true
	Wedge.Size = Vector3.new(160, 15, 1.75)
	Wedge.CFrame = CFrame.new(660.3, 96.1, 2313.6)
	Wedge.Orientation = Wedge.Orientation + Vector3.new(90, 270, 0)

	local PATCH_GRASS = Instance.new("Part", MapF)
	PATCH_GRASS.Anchored = true
	PATCH_GRASS.BrickColor = BrickColor.new("Bright green")
	PATCH_GRASS.Material = "Grass"
	PATCH_GRASS.Position = Vector3.new(916, 94.199, 2380)
	PATCH_GRASS.Size = Vector3.new(120, 1.6, 260)
	PATCH_GRASS.Name = "PATCH_GRASS"

	local NEW_GR_ASS = PATCH_GRASS:Clone()
	NEW_GR_ASS.Size = Vector3.new(40, 1.6, 22)
	NEW_GR_ASS.Position = Vector3.new(926, 94.199, 2110)
	NEW_GR_ASS.Parent = MapF
	StaminaMsg("MapFuck v2.1 Loaded.",1.5)
	FuckRan = true
end)

b5.MouseButton1Down:connect(function() -- Criminal Solo v1.00
	Criminal(GetPlayer())
end)

b7.MouseButton1Down:connect(function() -- Roast
	GetRoast(b0.Text)
end)

b6.MouseButton1Down:connect(function() -- arrestsc0pe v1.00 
	arrestsc0peData = GetPlayer()
	if game.Workspace:FindFirstChild(arrestsc0peData) and game.Workspace:FindFirstChild(LP.Name) then
		if tostring(game.Players[arrestsc0peData].Team) == "Criminals" and GetAccess(arrestsc0peData) then
			att = 0
			weld02 = LP.Character.HumanoidRootPart.CFrame
				repeat wait()
					if game.Players:FindFirstChild(arrestsc0peData) then 
						LP.Character.Humanoid.Sit = false
						LP.Character.HumanoidRootPart.CFrame = game.Players[arrestsc0peData].Character.HumanoidRootPart.CFrame * CFrame.new(0, 3.3, 0)
						game.Workspace.Remote.arrest:InvokeServer(Workspace[arrestsc0peData]["Head"])
						att = att+1
					else
						att = 6
					end
				until game.Players[arrestsc0peData].Character.Head:FindFirstChild("handcuffedGui") or att == 6
			SEFunc(arrestsc0peData)
			LP.Character.HumanoidRootPart.CFrame = weld02
			StaminaMsg("Arrested "..arrestsc0peData,1)
		else
			StaminaMsg("Cant Arrest "..arrestsc0peData,1)
		end
	end
end)

b3.MouseButton1Down:connect(function() -- tazesc0pe v1.00 
	local tazesc0pe = GetPlayer()
	if game.Workspace:FindFirstChild(tazesc0pe) and game.Workspace:FindFirstChild(LP.Name) then
		if tostring(game.Players[tazesc0pe].Team) == "Inmates" or tostring(game.Players[tazesc0pe].Team) == "Criminals" then
			game.Workspace[LP.Name].Humanoid:UnequipTools()
			if tostring(LP.Team) ~= "Guards" or not LP.Backpack:FindFirstChild("Taser") then
				weld02 = LP.Character.HumanoidRootPart.CFrame
				game.Workspace.Remote.loadchar:InvokeServer(LP, "Bright blue")
				LP.Character.HumanoidRootPart.CFrame = weld02
			end
			TazFunc({["1"] = {Name = tazesc0pe}})
			StaminaMsg("Tazed "..tazesc0pe,1)
		end
	end
end)

e2.MouseButton1Down:connect(function() -- Arrest All
	ScanTM()
	weld02 = LP.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
		if v.Name ~= LP.Name then ArrestAura = v.Name
			if FriendService(ArrestAura) and GetAccess(ArrestAura) then
				att = 0
				repeat wait()
					if game.Players:FindFirstChild(ArrestAura) then 
						LP.Character.Humanoid.Sit = false
						LP.Character.HumanoidRootPart.CFrame = game.Players[ArrestAura].Character.HumanoidRootPart.CFrame * CFrame.new(0, 3.3, 0)
						game.Workspace.Remote.arrest:InvokeServer(Workspace[ArrestAura]["Head"])
						att = att+1
					else
						att = 6
					end
				until game.Players[ArrestAura].Character.Head:FindFirstChild("handcuffedGui") or att == 6
				if tostring(LP.Team) == "Criminals" then
					ReturnTM("Medium stone grey")
				end
				SEFunc(ArrestAura)
			end
		end
	end
	LP.Character.Humanoid.Sit = false
	LP.Character.HumanoidRootPart.CFrame = weld02
	ReturnTM()
	StaminaMsg("Arrested All Criminals",1)
end)

f2.MouseButton1Down:connect(function() -- Taze All
	game.Workspace[LP.Name].Humanoid:UnequipTools()
	if tostring(LP.Team) ~= "Guards" or not LP.Backpack:FindFirstChild("Taser") then 
		weld02 = LP.Character.HumanoidRootPart.CFrame
		game.Workspace.Remote.loadchar:InvokeServer(LP, "Bright blue")
		LP.Character.HumanoidRootPart.CFrame = weld02
	end
	TazFunc(game.Players:GetChildren())
	StaminaMsg("Tazed Everyone",1)
end)

e4.MouseButton1Down:connect(function()
	if e4.Text == "Gun Mods" then
		h.Visible,h2.Visible,c.Visible,h4.Visible = false,false,false,true
		e4.Text = "Close"
	else
		h.Visible,h2.Visible,c.Visible,h4.Visible = true,true,true,false
		e4.Text = "Gun Mods"
		return
	end
end)

e6.MouseButton1Down:connect(function() -- NAKED
	for i,v in pairs(LP.Character:GetChildren()) do 
		if v.ClassName == "Hat" or v.ClassName == "Shirt" or v.ClassName == "Pants" then 
			v:Destroy() 
		end
	end
end)

b2.MouseButton1Down:connect(function() -- Bring v1.00
	BringFunc(GetPlayer())
end)

d5.MouseButton1Down:connect(function() -- JumpPower
	if tonumber(d.Text) ~= nil and game.Workspace:FindFirstChild(LP.Name) then
		LP.Character.Humanoid.JumpPower = d.Text
		ScanStats()
	end
end)

d2.MouseButton1Down:connect(function() -- WalkSpeed
	if tonumber(d.Text) ~= nil and game.Workspace:FindFirstChild(LP.Name) then
		LP.Character.Humanoid.WalkSpeed = d.Text
		ScanStats()
	end
end)

d4.MouseButton1Down:connect(function() -- HH
	if tonumber(d.Text) ~= nil and game.Workspace:FindFirstChild(LP.Name) then
		LP.Character.Humanoid.HipHeight = d.Text
	end
end)

d3.MouseButton1Down:connect(function() -- Grav
	if tonumber(d.Text) ~= nil then
		game.Workspace.Gravity = d.Text
	end
end)

f6.MouseButton1Down:connect(function() -- BTOOLS
	for i = 2,4 do 
		Instance.new('HopperBin', LP.Backpack).BinType = i 
	end
end)

f3.MouseButton1Down:connect(function()
	for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do 
		ItemReq = v.Name
		if ItemReq == "M4A1" or ItemReq == "Riot Shield" then 
			if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LP.UserId, 96651) then 
				game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[ItemReq].ITEMPICKUP) 
			end 
		else 
			game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[ItemReq].ITEMPICKUP) 
		end
	end
	for i,v in pairs(workspace.Prison_ITEMS.single:GetChildren()) do 
		game.Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP) 
	end
end)

-- TEAMS
g4.MouseButton1Down:connect(function()
	if g.Text == "Teams" then
		ReturnTM("Bright orange")
	end
	if g.Text == "KillAura" then
		KillAura.Panel("Inmates")
	end
end)

g2.MouseButton1Down:connect(function()
	if g.Text == "Teams" then
		ReturnTM("Bright blue")
	end
	if g.Text == "KillAura" then
		KillAura.Panel("Guards")
	end
end)

g5.MouseButton1Down:connect(function()
	if g.Text == "Teams" then
		ReturnTM("Medium stone grey")
	end
	if g.Text == "KillAura" then
		KillAura.Panel("Neutral")
	end
end)

g3.MouseButton1Down:connect(function()
	if g.Text == "Teams" then
		ReturnTM("Really red")
	end
	if g.Text == "KillAura" then
		KillAura.Panel("Criminals")
	end
end)

f5.MouseButton1Down:connect(function() -- Suicide
	if Loop or tostring(LP.Team) == "Neutral" then 
		ReturnTM("Bright orange")
	end
	if game.Workspace:FindFirstChild(LP.Name) then
		local Get = "M9"
		game.Workspace[LP.Name].Humanoid:UnequipTools()
		game.Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[Get].ITEMPICKUP)
		LP.Backpack[Get].GripForward = Vector3.new(0.57735, 0.57735, 0.57735)
		LP.Character.Humanoid:EquipTool(LP.Backpack[Get])
		wait(0.8)
		LP.Character.Humanoid.Health = 0
		wait(0.3)
		game.Workspace.Remote.loadchar:InvokeServer()
		StaminaMsg("Chaotic Mind#0666 for GripForward Position",1)
	end
end)

e5.MouseButton1Down:connect(function() -- NODOORS
	if game.Workspace:FindFirstChild("Doors") then
		game.Workspace.Doors:Destroy()
	end
	if game.Workspace:FindFirstChild("Prison_Cellblock") and game.Workspace.Prison_Cellblock:FindFirstChild("doors") then
		game.Workspace.Prison_Cellblock.doors:Remove()
	end
end)

q2.MouseButton1Down:connect(function()
	Teleport(CFrames["Armoury"])
end)

q3.MouseButton1Down:connect(function()
	Teleport(CFrames["Entrance"])
end)

q4.MouseButton1Down:connect(function() 
	Teleport(CFrames["Cells"])
end)

q5.MouseButton1Down:connect(function()
	Teleport(CFrames["Prison"])
end)

q6.MouseButton1Down:connect(function()
	Teleport(CFrames["Criminal Base"])
end)

q7.MouseButton1Down:connect(function()
	Teleport(CFrames["Tower"])
end)

q8.MouseButton1Down:connect(function()
	Teleport(CFrames["Sewer"])
end)

q9.MouseButton1Down:connect(function()
	Teleport(CFrames["Roof"])
end)

q0.MouseButton1Down:connect(function()
	Teleport(CFrames["Downtown"])
end)

v6.MouseButton1Down:connect(function() -- 1Punch
	Punch1.Active = ToggleFunc(v6, Punch1.Active)
end)

v5.MouseButton1Down:connect(function() -- AutoRespawn
	AutoRespawn = ToggleFunc(v5, AutoRespawn)
end)

v1.MouseButton1Down:connect(function() -- InfStaminaLock
	InfStaminaLock = ToggleFunc(v1, InfStaminaLock)
	InfStamina()
end)

v2.MouseButton1Down:connect(function() -- DED_FS
	DED_FS = ToggleFunc(v2, DED_FS)
end)

v3.MouseButton1Down:connect(function()
	AutoReload.Active = ToggleFunc(v3, AutoReload.Active)
end)

v8.MouseButton1Down:connect(function() -- FastPunch 
	FastPunchLock = ToggleFunc(v8, FastPunchLock)
	if not FastPunchLock then
		FastPunch()
	end
end)

v7.MouseButton1Down:connect(function() -- Sped Car 
	SpedCart = ToggleFunc(v7, SpedCart)
	if tostring(LP.Character.Humanoid.SeatPart) == "VehicleSeat" and SpedCart then 
		SpedCar(Seat.Parent.Parent)
	end
end)

v9.MouseButton1Down:connect(function()
	Anti.Func("taze",v9)
end)

v10.MouseButton1Down:connect(function()
	Anti.Func("arrest",v10)
end)

v11.MouseButton1Down:connect(function()
	SilentC = ToggleFunc(v11, SilentC)
end)

LP.Status.isBadGuard:GetPropertyChangedSignal("Value"):connect(function()
	LP.Status.isBadGuard.Value = false
end)

hud.AddedGui:GetPropertyChangedSignal("Visible"):connect(function()
	hud.AddedGui.Visible = false
end)

if hud.Topbar:FindFirstChild("GuiScript") then
	hud.Topbar.GuiScript:Remove()
end

LP.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ChildAdded:connect(function(Fa)
	if Fa.Name ~= "UIListLayout" and Fa:FindFirstChild("TextLabel") then
		if Fa.TextLabel:FindFirstChild("TextButton") then
			if Fa.TextLabel.TextButton.Text == "{Team}" then
				if Last ~= nil then
					Last:Remove()
				end
				Last = Fa
			end
		end
	end
end)

game.Workspace.Remote.tazePlayer.OnClientEvent:connect(function()
	-- Save items
end)

game.Workspace.Remote.arrestPlayer.OnClientEvent:connect(function() -- Anti-Spam Arrest
	if AntiAntiCheat == "1594427591" then
		ArrN = ArrN+1
	end
	Arrested, ArrestLoop = true, true
	if ArrN == 5 then
		ArrN = 0
		ReturnTM("Medium stone grey")
		wait(0.25)
	end
	if AutoRespawn then
		ScanTM()
		GetCFrame()
		repeat wait() 
			if Arrested and LPAdded then 
				ArrestLoop = false 
			end
		until not ArrestLoop
		if AutoRespawn then
			Respawnv2()
		end
	end
	Arrested = false
end)

LP.CharacterAdded:connect(function()
	LPAdded = true
	
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
	hud.Visible = true

	LP.Character:WaitForChild("Humanoid").Died:Connect(function()
		if AutoRespawn and not Arrested then
			GetCFrame()
			LockPosition = true
			Respawnv2()
			wait(2)
			LockPosition = false
		end
	end)
	if Rev2 == false then 
		wait(0.1)
		if LP.Character:WaitForChild("ClientInputHandler") and not InfStaminaLock then
			InfStamina()
		end
		if Anti["taze"].Active then
			Anti.Func("taze")
		end
		if Anti["arrest"].Active then
			Anti.Func("arrest")
		end
		ncII()
		F1.Touched:connect(ncf)
	end
	FindVeh()
	LPAdded = false
end)

LP:GetMouse().KeyDown:connect(function(key)
	local key = key:lower()
	if LOG then
		for b = 97,122 do
			if key == string.char(b) then
				SetBind(key)
				LOG = false
			end
		end
	else
		if key == "a" then GetCFrame()
		elseif key == "b" then
		elseif key == "c" then ReturnStats("Prone")
		elseif key == "d" then GetCFrame()
		elseif key == KEY.RapidFire then RFEquiped()
		elseif key == "f" then Punch1.Func()
		elseif key == "g" then FFL = ToggleFunc(Text,FFL) FEFF()
		elseif key == KEY.UI then UIVisible = ToggleFunc(Text,UIVisible) UI.Visible = UIVisible
		elseif key == KEY.Invisible then Invisible()
		elseif key == "j" then
		elseif key == KEY.KillAura then KillAura.Panel("Everyone")
		elseif key == "l" then Loop = false
		elseif key == "m" then
		elseif key == "n" then
		elseif key == "o" then
		elseif key == "p" then
		elseif key == KEY.Respawnv2 then if not AutoRespawn then Respawnv2() end
		elseif key == "r" then
		elseif key == "s" then GetCFrame()
		elseif key == "t" then
		elseif key == "u" then
		elseif key == "v" then vLoop = false
		elseif key == "w" then GetCFrame()
		elseif key == "x" then
		elseif key == "y" then
		elseif key == KEY.Noclip then Noclip = ToggleFunc(Text,Noclip)
		end
	end
end)

LP:GetMouse().KeyUp:connect(function(key)
	if not LOG then
		local key = key:lower()
		if key == "a" or key == "s" or key == "d" or key == "w" then
			GetCFrame()
		end
	end
end)

Setup()
StaminaMsg("02hacks Prevail X has loaded",2)
