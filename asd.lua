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

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.ScreenGui.TextBox
G2L["2"] = Instance.new("TextBox", G2L["1"]);
G2L["2"]["CursorPosition"] = -1;
G2L["2"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["TextSize"] = 14;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["2"]["Position"] = UDim2.new(0.72063, 0, 0.55112, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Text"] = [[]];


-- StarterGui.ScreenGui.TextBox.LocalScript
G2L["3"] = Instance.new("LocalScript", G2L["2"]);



-- StarterGui.ScreenGui.TextBox.LocalScript
local function C_3()
local script = G2L["3"];
	-- Get the ScreenGui, TextBox, and player
	local screenGui = script.Parent.Parent -- Assuming the script is a child of the TextBox
	local textbox = screenGui:WaitForChild("TextBox") -- Access the TextBox
	local player = game.Players.LocalPlayer
	
	-- Function to parse string input into a Vector3
	local function parsePosition(input)
		local success, result = pcall(function()
			local coords = input:split(",") -- Split input by commas
			return Vector3.new(tonumber(coords[1]), tonumber(coords[2]), tonumber(coords[3]))
		end)
		return success and result or nil
	end
	
	-- When the TextBox loses focus (e.g., Enter key pressed or clicked away)
	textbox.FocusLost:Connect(function(entered)
		-- Check if the user pressed the Enter key or clicked away
		if entered then
			local inputText = textbox.Text -- Get the text from the TextBox
			local targetPosition = parsePosition(inputText) -- Parse the input into Vector3
	
			if targetPosition then
				-- Ensure the player's character exists
				local character = player.Character or player.CharacterAdded:Wait()
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	
				if humanoidRootPart then
					-- Teleport the player to the target position
					humanoidRootPart.CFrame = CFrame.new(targetPosition)
				else
					warn("HumanoidRootPart not found!")
				end
			else
				warn("Invalid input! Use format: x,y,z (e.g., 100,50,200)")
			end
		end
	end)
	
end;
task.spawn(C_3);

return G2L["1"], require;
