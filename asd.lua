--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 3 | Scripts: 1 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.A
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[A]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.A.TextBox
G2L["2"] = Instance.new("TextBox", G2L["1"]);
G2L["2"]["CursorPosition"] = -1;
G2L["2"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["TextSize"] = 14;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2"]["PlaceholderText"] = [[GG]];
G2L["2"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["2"]["Position"] = UDim2.new(0.72176, 0, 0.39297, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Text"] = [[]];


-- StarterGui.A.TextBox.LocalScript
G2L["3"] = Instance.new("LocalScript", G2L["2"]);



-- StarterGui.A.TextBox.LocalScript
local function C_3()
local script = G2L["3"];
	local TextBox = script.Parent
	local RemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("SendToWebhook")
	
	TextBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local inputText = TextBox.Text
			RemoteEvent:FireServer(inputText) -- Send the input to the server
		end
	end)
	
end;
task.spawn(C_3);

return G2L["1"], require;
