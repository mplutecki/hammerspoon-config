hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon("ClipboardTool")

spoon.ReloadConfiguration:start()

local studioDisplay = "Studio Display"
local laptopScreen = "Built-in Retina Display"

local xcode = "Xcode"
local chrome = "Google Chrome"
local terminal = "Terminal"
local vscode = "Visual Studio Code"
local slack = "Slack"

local hyper = {'ctrl', 'shift', 'alt', 'cmd'}

function focus(appNames)
  for index, appName in ipairs(appNames) do
    hs.application.launchOrFocus(appName)
  end
end

function xcodeTerminalChrome()
  focus({xcode, terminal, chrome})
  hs.layout.apply({
    {xcode, nil, studioDisplay, hs.layout.left75, nil, nil},
    {terminal, nil, studioDisplay, hs.layout.right25, nil, nil},
    {chrome, nil, laptopScreen, hs.layout.maximized, nil, nil},
  })
end

function vscodeTerminalChrome()
  focus({vscode, terminal, chrome})
  hs.layout.apply({
    {vscode, nil, studioDisplay, hs.layout.left75, nil, nil},
    {terminal, nil, studioDisplay, hs.layout.right25, nil, nil},
    {chrome, nil, laptopScreen, hs.layout.maximized, nil, nil},
  })
end

function chromeSlack()
  focus({chrome, slack})
  hs.layout.apply({
    {chrome, nil, studioDisplay, hs.layout.maximized, nil, nil},
    {slack, nil, laptopScreen, hs.layout.maximized, nil, nil},
  })
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", xcodeTerminalChrome)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", vscodeTerminalChrome)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", chromeSlack)

function setUpClipboardTool()
  ClipboardTool = hs.loadSpoon('ClipboardTool')
  ClipboardTool.show_in_menubar = false
  ClipboardTool.show_copied_alert = false
  ClipboardTool:start()
  ClipboardTool:bindHotkeys({
    toggle_clipboard = {hyper, "p"}
  })
end

setUpClipboardTool()