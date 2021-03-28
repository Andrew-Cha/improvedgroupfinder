function handleDragStart(self, button)
    if not self.isMoving then
        self:StartMoving()
        self.isMoving = true
    end
end

function handleDragStop(self, button)
    if self.isMoving then
        self:StopMovingOrSizing()
        self.isMoving = false
    end
end 

local mainWindow = CreateFrame("Frame", "mainWindow")
mainWindow:SetSize(600, 400)
mainWindow:SetPoint("CENTER")
mainWindow:SetClampedToScreen(true)
mainWindow:EnableMouse(true)
mainWindow:SetMovable(true)
mainWindow:SetScript("OnMouseDown", handleDragStart)
mainWindow:SetScript("OnMouseUp", handleDragStop)
mainWindow:RegisterEvent("UPDATE_LFG_LIST")
mainWindow:Hide()

local background = mainWindow:CreateTexture(nil, "BACKGROUND")
background:SetAllPoints(mainWindow)
background:SetColorTexture(0, 0, 0)
background:SetAlpha(0.65)

local closeButton = CreateFrame("Button", "closeButton", mainWindow)
closeButton:SetPoint("TOPRIGHT")
closeButton:SetSize(24, 24)
closeButton:SetNormalTexture("Interface/Buttons/UI-Panel-Minimizebutton-up")
closeButton:SetHighlightTexture("Interface/Buttons/UI-Panel-MinimizeButton-Highlight")
closeButton:SetPushedTexture("Interface/Buttons/UI-Panel-MinimizeButton-Down")
closeButton:SetScript("OnClick", function()
    mainWindow:Hide()
end)


function onLFGOpen(self, event, ...)
    if PVEFrame:IsVisible() and LFGListFrame.activePanel == LFGListFrame.SearchPanel and LFGListFrame.SearchPanel:IsVisible() then
        mainWindow:Show()
    else 
        mainWindow:Hide()
    end
end

hooksecurefunc("LFGListFrame_SetActivePanel", onLFGOpen)