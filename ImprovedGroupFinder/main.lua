local mainWindow = CreateFrame("Frame")
mainWindow:SetSize(600, 400)
mainWindow:SetPoint("CENTER")
mainWindow:SetClampedToScreen(true)
mainWindow:EnableMouse(true)
mainWindow:SetMovable(true)

mainWindow:SetScript("OnMouseDown", function(self, button)
    print("Started dragging")
    if not self.isMoving then
        self:StartMoving()
        self.isMoving = true 
    end
end)

mainWindow:SetScript("OnMouseUp", function(self, button) 
    print("Stopped Dragging")
    if self.isMoving then
        self:StopMovingOrSizing()
        self.isMoving = false
    end
end)

local background = mainWindow:CreateTexture(nil, "BACKGROUND")
background:SetAllPoints(mainWindow)
background:SetColorTexture(0, 0, 0)
background:SetAlpha(0.5)
