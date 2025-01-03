local TextService = game:GetService("TextService")
local letters = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

local function getRandomLetter()
    local randomIndex = math.random(1, #letters)
    return letters[randomIndex]
end

local function filterAndSetText(textLabel)
    local randomLetter = getRandomLetter()
    local placeholderUserId = 0
    local success, filteredTextResult = pcall(function()
        return TextService:FilterStringAsync(randomLetter, placeholderUserId)
    end)
    if success then
        local filteredText = filteredTextResult:GetNonChatStringForBroadcastAsync()
        textLabel.Text = filteredText
    else
        textLabel.Text = randomLetter
    end
end

local blocksModel = script.Parent

for _, block in blocksModel:GetChildren() do
    if block:IsA("Part") then
        local surfaceGui = block:FindFirstChildOfClass("SurfaceGui")
        if surfaceGui then
            local textLabel = surfaceGui:FindFirstChildOfClass("TextLabel")
            if textLabel then
                filterAndSetText(textLabel)
            end
        end
    end
end
