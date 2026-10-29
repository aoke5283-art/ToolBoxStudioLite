-- Cek apakah game sudah fully loaded if not game:IsLoaded() then game.Loaded:Wait() end
local Players = game:GetService("Players")
local InsertService = game:GetService("InsertService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Hapus UI lama jika script dijalankan ulang
if playerGui:FindFirstChild("ZainllToolboxCrownGui") then
	playerGui.ZainllToolboxCrownGui:Destroy()
end

-- Membuat ScreenGui utama di PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZainllToolboxCrownGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Tombol Buka/Tutup (Bulat Kecil & Emoji Mahkota)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleButton"
toggleBtn.Size = UDim2.new(0, 36, 0, 36)
toggleBtn.Position = UDim2.new(0, 15, 0.5, -18)
toggleBtn.BackgroundColor3 = Color3.fromRGB(5, 10, 20) -- HITAM BIRU
toggleBtn.Text = "🇪🇪"
toggleBtn.TextColor3 = Color3.fromRGB(0, 180, 255) -- BIRU CERAH
toggleBtn.TextSize = 16
toggleBtn.Font = Enum.Font.Code
toggleBtn.Active = true
toggleBtn.Draggable = true
toggleBtn.Parent = screenGui
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleBtn
local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(0, 120, 255) -- BIRU
toggleStroke.Thickness = 2
toggleStroke.Parent = toggleBtn

-- Container Utama
local container = Instance.new("Frame")
container.Name = "MainContainer"
container.Size = UDim2.new(0, 395, 0, 335)
container.Position = UDim2.new(0.5, -197, 0.5, -167)
container.BackgroundTransparency = 1
container.Active = true
container.Draggable = true
container.Parent = screenGui

-- Frame Utama (Kiri)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 240, 0, 335)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(5, 10, 20) -- HITAM BIRU
mainFrame.BorderSizePixel = 0
mainFrame.Parent = container
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(0, 120, 255) -- BIRU
uiStroke.Thickness = 2
uiStroke.Parent = mainFrame

-- Output Log Section
local outputFrame = Instance.new("Frame")
outputFrame.Name = "OutputFrame"
outputFrame.Size = UDim2.new(0, 145, 0, 335)
outputFrame.Position = UDim2.new(0, 250, 0, 0)
outputFrame.BackgroundColor3 = Color3.fromRGB(2, 5, 12) -- HITAM PEKAT
outputFrame.Parent = container
local outputCorner = Instance.new("UICorner")
outputCorner.CornerRadius = UDim.new(0, 8)
outputCorner.Parent = outputFrame
local outputStroke = Instance.new("UIStroke")
outputStroke.Color = Color3.fromRGB(0, 80, 180) -- BIRU TUA
outputStroke.Thickness = 2
outputStroke.Parent = outputFrame

-- Judul Kotak Log
local logTitle = Instance.new("TextLabel")
logTitle.Size = UDim2.new(1, -12, 0, 25)
logTitle.Position = UDim2.new(0, 6, 0, 6)
logTitle.BackgroundTransparency = 1
logTitle.Text = "[ STATUS LOG ]"
logTitle.TextColor3 = Color3.fromRGB(0, 200, 255) -- BIRU LANGIT
logTitle.TextSize = 9
logTitle.Font = Enum.Font.Code
logTitle.TextXAlignment = Enum.TextXAlignment.Left
logTitle.Parent = outputFrame

local outputText = Instance.new("TextLabel")
outputText.Size = UDim2.new(1, -12, 1, -38)
outputText.Position = UDim2.new(0, 6, 0, 32)
outputText.BackgroundTransparency = 1
outputText.Text = "Ready..."
outputText.TextColor3 = Color3.fromRGB(180, 220, 255) -- BIRU MUDA
outputText.TextSize = 8
outputText.Font = Enum.Font.Code
outputText.TextXAlignment = Enum.TextXAlignment.Left
outputText.TextYAlignment = Enum.TextYAlignment.Top
outputText.TextWrapped = true
outputText.Parent = outputFrame

-- Fungsi Tombol Buka/Tutup
toggleBtn.MouseButton1Click:Connect(function()
	container.Visible = not container.Visible
end)

-- Definisi Warna Pelangi untuk Teks Judul Berputar - UBAH JADI BIRU
local rainbowColors = ColorSequence.new{
	ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 100, 255)),
	ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 180, 255)),
	ColorSequenceKeypoint.new(0.50, Color3.fromRGB(50, 150, 255)),
	ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 220, 255)),
	ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 150, 255))
}
local textGradients = {}
local function addTextGradient(textLabel)
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	local grad = Instance.new("UIGradient")
	grad.Color = rainbowColors
	grad.Parent = textLabel
	table.insert(textGradients, grad)
	return grad
end

-- Header Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 28)
topBar.BackgroundColor3 = Color3.fromRGB(2, 5, 12) -- HITAM PEKAT
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame
local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 8)
topBarCorner.Parent = topBar

-- Judul Toolbox
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 150, 1, 0)
titleLabel.Position = UDim2.new(0, 8, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "ZAINL TOOLBOX STUDIO LITE"
titleLabel.TextSize = 9
titleLabel.Font = Enum.Font.Code
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar
addTextGradient(titleLabel)

-- Tombol Close (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 18, 0, 18)
closeButton.Position = UDim2.new(1, -22, 0.5, -9)
closeButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255) -- BIRU
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 9
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = topBar
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeButton
closeButton.MouseButton1Click:Connect(function()
	container.Visible = false
end)

-- Search Bar Container
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -16, 0, 28)
searchBox.Position = UDim2.new(0, 8, 0, 34)
searchBox.BackgroundColor3 = Color3.fromRGB(10, 20, 35) -- BIRU GELAP
searchBox.PlaceholderText = "Cari aset..."
searchBox.Text = "pulau"
searchBox.TextColor3 = Color3.fromRGB(200, 230, 255)
searchBox.PlaceholderColor3 = Color3.fromRGB(80, 120, 160)
searchBox.TextSize = 11
searchBox.Font = Enum.Font.Code
searchBox.ClearTextOnFocus = false
searchBox.Parent = mainFrame
local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 5)
searchCorner.Parent = searchBox
local searchStroke = Instance.new("UIStroke")
searchStroke.Color = Color3.fromRGB(0, 120, 255) -- BIRU
searchStroke.Thickness = 1
searchStroke.Parent = searchBox

-- Tombol GO
local goButton = Instance.new("TextButton")
goButton.Size = UDim2.new(0, 38, 0, 22)
goButton.Position = UDim2.new(1, -42, 0.5, -11)
goButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255) -- BIRU
goButton.Text = "GO"
goButton.TextColor3 = Color3.fromRGB(255, 255, 255)
goButton.TextSize = 9
goButton.Font = Enum.Font.Code
goButton.Parent = searchBox
local goCorner = Instance.new("UICorner")
goCorner.CornerRadius = UDim.new(0, 4)
goCorner.Parent = goButton

-- Kategori
local categoryContainer = Instance.new("Frame")
categoryContainer.Size = UDim2.new(1, -16, 0, 24)
categoryContainer.Position = UDim2.new(0, 8, 0, 68)
categoryContainer.BackgroundTransparency = 1
categoryContainer.Parent = mainFrame

local currentCategory = "Model"
local currentPage = 1
local categoryButtons = {}
local function createCategoryButton(name, posX, width)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(width, 0, 1, 0)
	btn.Position = UDim2.new(posX, 0, 0, 0)
	btn.BackgroundColor3 = (name == currentCategory) and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(15, 25, 40) -- BIRU / BIRU GELAP
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 9
	btn.Font = Enum.Font.Code
	btn.Parent = categoryContainer
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 4)
	corner.Parent = btn
	categoryButtons[name] = btn
	return btn
end
local btnModel = createCategoryButton("Model", 0, 0.32)
local btnDecal = createCategoryButton("Decal", 0.34, 0.32)
local btnAudio = createCategoryButton("Audio", 0.68, 0.32)

-- ScrollingFrame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -16, 0, 225)
scrollFrame.Position = UDim2.new(0, 8, 0, 98)
scrollFrame.BackgroundColor3 = Color3.fromRGB(8, 15, 28) -- BIRU SANGAT GELAP
scrollFrame.BorderSizePixel = 0
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 4
scrollFrame.Parent = mainFrame
local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 5)
scrollCorner.Parent = scrollFrame

-- Sisa script sama persis, cuma warna card dan tombol diubah juga
-- Forward declarations
local performSearch, loadMoreResults

local function clearCards()
	for _, child in ipairs(scrollFrame:GetChildren()) do
		if child:IsA("Frame") or child:IsA("TextButton") then
			child:Destroy()
		end
	end
end

local function renderResults(results, appendMode)
	if not appendMode then clearCards() else
		local oldLoadMore = scrollFrame:FindFirstChild("LoadMoreButton")
		if oldLoadMore then oldLoadMore:Destroy() end
	end
	local yPos = 5
	if appendMode then
		for _, child in ipairs(scrollFrame:GetChildren()) do
			if child:IsA("Frame") then
				yPos = math.max(yPos, child.Position.Y.Offset + child.Size.Y.Offset + 5)
			end
		end
	end
	local totalItems = #results
	for i = 1, totalItems do
		local item = results[i]
		local assetName = item.Name or "Unknown Asset"
		local creatorName = item.CreatorName or "Roblox"
		local assetId = tostring(item.AssetId or 0)
		local card = Instance.new("Frame")
		card.Size = UDim2.new(1, -10, 0, 65)
		card.Position = UDim2.new(0, 5, 0, yPos)
		card.BackgroundColor3 = Color3.fromRGB(15, 25, 40) -- BIRU GELAP
		card.Parent = scrollFrame
		local cardCorner = Instance.new("UICorner")
		cardCorner.CornerRadius = UDim.new(0, 5)
		cardCorner.Parent = card

		local thumbImg = Instance.new("ImageLabel")
		thumbImg.Size = UDim2.new(0, 48, 0, 48)
		thumbImg.Position = UDim2.new(0, 8, 0.5, -24)
	thumbImg.BackgroundColor3 = Color3.fromRGB(5, 10, 20)
	thumbImg.BorderSizePixel = 0
	thumbImg.Image = "https://www.roblox.com/asset-thumbnail/image?assetId=".. assetId.. "&width=150&height=150&format=png"
		thumbImg.Parent = card
		local thumbCorner = Instance.new("UICorner")
		thumbCorner.CornerRadius = UDim.new(0, 4)
		thumbCorner.Parent = thumbImg

		local titleLbl = Instance.new("TextLabel")
		titleLbl.Size = UDim2.new(1, -62, 0, 18)
		titleLbl.Position = UDim2.new(0, 62, 0, 5)
		titleLbl.BackgroundTransparency = 1
		titleLbl.Text = assetName
		titleLbl.TextColor3 = Color3.fromRGB(220, 240, 255)
		titleLbl.TextSize = 9
		titleLbl.Font = Enum.Font.Code
		titleLbl.TextXAlignment = Enum.TextXAlignment.Left
		titleLbl.Parent = card

		local infoLbl = Instance.new("TextLabel")
		infoLbl.Size = UDim2.new(1, -62, 0, 22)
		infoLbl.Position = UDim2.new(0, 62, 0, 23)
		infoLbl.BackgroundTransparency = 1
		infoLbl.Text = "by ".. creatorName.. "\nID: ".. assetId
		infoLbl.TextColor3 = Color3.fromRGB(120, 180, 220)
		infoLbl.TextSize = 7
		infoLbl.Font = Enum.Font.Code
		infoLbl.TextXAlignment = Enum.TextXAlignment.Left
		infoLbl.Parent = card

		local copyBtn = Instance.new("TextButton")
		copyBtn.Size = UDim2.new(0, 38, 0, 16)
		copyBtn.Position = UDim2.new(1, -85, 1, -19)
		copyBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 160) -- BIRU TUA
		copyBtn.Text = "COPY"
		copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		copyBtn.TextSize = 7
		copyBtn.Font = Enum.Font.Code
		copyBtn.Parent = card
		local copyCorner = Instance.new("UICorner")
		copyCorner.CornerRadius = UDim.new(0, 4)
		copyCorner.Parent = copyBtn
		copyBtn.MouseButton1Click:Connect(function()
			if setclipboard then setclipboard(assetId) outputText.Text = "Copied ID:\n".. assetId end
		end)

		local actionBtn = Instance.new("TextButton")
		actionBtn.Size = UDim2.new(0, 42, 0, 16)
		actionBtn.Position = UDim2.new(1, -43, 1, -19)
		actionBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255) -- BIRU
		actionBtn.Text = (currentCategory == "Audio") and "PLAY" or "INSERT"
		actionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		actionBtn.TextSize = 7
		actionBtn.Font = Enum.Font.Code
		actionBtn.Parent = card
		local actionCorner = Instance.new("UICorner")
		actionCorner.CornerRadius = UDim.new(0, 4)
		actionCorner.Parent = actionBtn
		actionBtn.MouseButton1Click:Connect(function()
			task.spawn(function()
				if currentCategory == "Audio" then
					local success, err = pcall(function()
						local sound = Instance.new("Sound")
						sound.SoundId = "rbxassetid://".. assetId
						sound.Volume = 1
						sound.Parent = workspace
						sound:Play()
					end)
					if success then outputText.Text = "Playing Audio:\n".. assetId else outputText.Text = "Failed to play audio." end
				else
					local success, result = pcall(function()
						local model = InsertService:LoadAsset(tonumber(assetId))
						if model then model.Parent = workspace
							if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								for _, obj in ipairs(model:GetChildren()) do
									if obj:IsA("BasePart") then
										obj.Position = player.Character.HumanoidRootPart.Position + (player.Character.HumanoidRootPart.CFrame.LookVector * 5)
										break
									end
								end
							end
						end
					end)
					if success then outputText.Text = "Inserted ID:\n".. assetId else outputText.Text = "Restricted. Use Copy instead." end
				end
			end)
		end)
		yPos = yPos + 70
	end
	if totalItems > 0 then
		local loadMoreBtn = Instance.new("TextButton")
		loadMoreBtn.Name = "LoadMoreButton"
		loadMoreBtn.Size = UDim2.new(1, -10, 0, 30)
		loadMoreBtn.Position = UDim2.new(0, 5, 0, yPos)
		loadMoreBtn.BackgroundColor3 = Color3.fromRGB(0, 90, 200) -- BIRU
		loadMoreBtn.Text = "▶ LOAD PAGE ".. (currentPage + 1)
		loadMoreBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		loadMoreBtn.TextSize = 8
		loadMoreBtn.Font = Enum.Font.Code
		loadMoreBtn.Parent = scrollFrame
		local lmCorner = Instance.new("UICorner")
		lmCorner.CornerRadius = UDim.new(0, 5)
		lmCorner.Parent = loadMoreBtn
		loadMoreBtn.MouseButton1Click:Connect(function() loadMoreResults() end)
		yPos = yPos + 38
	end
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

performSearch = function()
	currentPage = 1
	local keyword = searchBox.Text
	outputText.Text = "Searching '".. keyword.. "' (Pg 1)..."
	task.spawn(function()
		local success, page = pcall(function()
			if currentCategory == "Model" then return unpack(InsertService:GetFreeModelsAsync(keyword, currentPage))
			elseif currentCategory == "Decal" then return unpack(InsertService:GetFreeDecalsAsync(keyword, currentPage))
			elseif currentCategory == "Audio" then return unpack(InsertService:GetFreeAudiosAsync(keyword, currentPage)) end
		end)
		if success and page and page.Results then
			outputText.Text = "Loaded Page 1 (".. #page.Results.. " items)."
			renderResults(page.Results, false)
		else
			outputText.Text = "No results found."
			clearCards()
		end
	end)
end

loadMoreResults = function()
	currentPage = currentPage + 1
	local keyword = searchBox.Text
	outputText.Text = "Loading Page ".. currentPage.. "..."
	task.spawn(function()
		local success, page = pcall(function()
			if currentCategory == "Model" then return unpack(InsertService:GetFreeModelsAsync(keyword, currentPage))
			elseif currentCategory == "Decal" then return unpack(InsertService:GetFreeDecalsAsync(keyword, currentPage))
			elseif currentCategory == "Audio" then return unpack(InsertService:GetFreeAudiosAsync(keyword, currentPage)) end
		end)
		if success and page and page.Results and #page.Results > 0 then
			outputText.Text = "Loaded Page ".. currentPage.. "."
			renderResults(page.Results, true)
		else
			outputText.Text = "Reached end of results."
			currentPage = currentPage - 1
			local oldLoadMore = scrollFrame:FindFirstChild("LoadMoreButton")
			if oldLoadMore then oldLoadMore:Destroy() end
		end
	end)
end

goButton.MouseButton1Click:Connect(performSearch)
searchBox.FocusLost:Connect(function(enterPressed) if enterPressed then performSearch() end end)

local function switchCategory(catName)
	currentCategory = catName
	currentPage = 1
	for name, btn in pairs(categoryButtons) do
		if name == catName then btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255) -- BIRU AKTIF
		else btn.BackgroundColor3 = Color3.fromRGB(15, 25, 40) end -- BIRU GELAP
	end
	performSearch()
end
btnModel.MouseButton1Click:Connect(function() switchCategory("Model") end)
btnDecal.MouseButton1Click:Connect(function() switchCategory("Decal") end)
btnAudio.MouseButton1Click:Connect(function() switchCategory("Audio") end)

-- Animasi Teks Judul Berputar
task.spawn(function()
	local angle = 0
	while screenGui.Parent do
	angle = (angle + 3) % 360
		local timeVal = tick() * 2
		local offsetX = math.sin(timeVal) * 0.3
		local offsetY = math.cos(timeVal) * 0.3
		for _, grad in ipairs(textGradients) do
			if grad and grad.Parent then
				grad.Rotation = angle
				grad.Offset = Vector2.new(offsetX, offsetY)
			end
		end
	RunService.RenderStepped:Wait()
	end
end)
performSearch()
