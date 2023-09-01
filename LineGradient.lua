local Camera = game:GetService("Workspace").CurrentCamera

local drawings = {}
local currentTime = 0
local lineCount = 60

for i = 1, lineCount do
    drawings[i] = Drawing.new('Line')
    drawings[i].ZIndex = 2
    drawings[i].Thickness = 5
end

game:GetService('RunService').RenderStepped:Connect(function()
    currentTime = currentTime + game:GetService('RunService').RenderStepped:Wait()
    for i, line in ipairs(drawings) do
        local alpha = 0.1 + (i / #drawings) * 0.8 -- the first number to change transparency
        line.From = Vector2.new(Camera.ViewportSize.X / 1.98 - (i - 1) * 5, 50)
        line.To = Vector2.new(Camera.ViewportSize.X / 2 - (i - 1) * 5 - 5, 50)
        line.Color = Color3.new(208/255, 123/255, 255/255) 
        line.Transparency = 1 - alpha
        line.Visible = true
    end
end)
