hs.loadSpoon("ReloadConfiguration")

spoon.ReloadConfiguration:start()

local studioDisplay = "Studio Display"
local laptopScreen = "Built-in Retina Display"

local xcode = "Xcode"
local chrome = "Google Chrome"
local terminal = "Terminal"
local vscode = "Code"
local slack = "Slack"

function focus(app)
  hs.window.filter.new(false):setAppFilter(app):getWindows()[1]:focus()
end

function xcodeTerminalChrome()
  focus(xcode)
  focus(terminal)
  focus(chrome)
  hs.layout.apply({
    {xcode, nil, studioDisplay, hs.layout.left75, nil, nil},
    {terminal, nil, studioDisplay, hs.layout.right25, nil, nil},
    {chrome, nil, laptopScreen, hs.layout.maximized, nil, nil},
  })
end

function vscodeTerminalChrome()
  focus(vscode)
  focus(chrome)
  focus(terminal)
  hs.layout.apply({
    {vscode, nil, studioDisplay, hs.layout.left75, nil, nil},
    {terminal, nil, studioDisplay, hs.layout.right25, nil, nil},
    {chrome, nil, laptopScreen, hs.layout.maximized, nil, nil},
  })
end

function chromeSlack()
  focus(chrome)
  focus(slack)
  hs.layout.apply({
    {chrome, nil, studioDisplay, hs.layout.maximized, nil, nil},
    {slack, nil, laptopScreen, hs.layout.maximized, nil, nil},
  })
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", xcodeTerminalChrome)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", vscodeTerminalChrome)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", chromeSlack)
