local function Chinese()
    -- 简体拼音
    -- hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Hans")
    hs.keycodes.currentSourceID("com.aodaren.inputmethod.Qingg")
end

local function English()
    -- ABC
    hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end

-- app to expected ime config
-- app和对应的输入法
local app2Ime = {
    -- 使用 bundleID 进行匹配 (推荐)
    {bundleID = "org.gnu.Emacs", ime = 'English'},
    {bundleID = "com.apple.finder", ime = 'English'},
    {bundleID = "com.apple.Spotlight", ime = 'English'},
    {bundleID = "org.vim.MacVim", ime = 'English'},
    {bundleID = "com.runningwithcrayons.Alfred", ime = 'English'},
    {bundleID = "com.raycast.macos", ime = 'English'},
    {bundleID = "com.googlecode.iterm2", ime = 'English'},
    {bundleID = "io.alacritty", ime = 'English'},
    {bundleID = "com.wez.wezterm", ime = 'English'},
    {bundleID = "dev.warp.Warp-Stable", ime = 'English'},
    {bundleID = "com.vandyke.SecureCRT", ime = 'English'},
    {bundleID = "com.microsoft.VSCode", ime = 'English'},
    {bundleID = "com.todesktop.230313mzl4w4u92", ime = 'English'},
    {bundleID = "com.apple.dt.Xcode", ime = 'English'},
    {bundleID = "com.google.Chrome", ime = 'English'},
    {bundleID = "org.mozilla.firefox", ime = 'English'},
    {bundleID = "org.mozilla.firefoxdeveloperedition", ime = 'English'},
    {bundleID = "com.ytang.Welly", ime = 'English'},
    {bundleID = "com.apple.systempreferences", ime = 'English'},
    {bundleID = "com.alibaba.DingTalkMac", ime = 'Chinese'},
    {bundleID = "com.tencent.xinWeChat", ime = 'Chinese'},
    {bundleID = "com.tencent.qq", ime = 'Chinese'},
    
    -- 使用应用名称进行匹配 (备选)
    {appName = "Emacs", ime = 'English'},
    {appName = "Spotlight", ime = 'English'},
    {appName = "Finder", ime = 'English'},
    {appName = "MacVim", ime = 'English'},
    {appName = "Alfred", ime = 'English'},
    {appName = "Raycast", ime = 'English'},
    {appName = "iTerm2", ime = 'English'},
    {appName = "Alacritty", ime = 'English'},
    {appName = "WezTerm", ime = 'English'},
    {appName = "Warp", ime = 'English'},
    {appName = "SecureCRT", ime = 'English'},
    {appName = "VSCode", ime = 'English'},
    {appName = "Cursor", ime = 'English'},
    {appName = "Xcode", ime = 'English'},
    {appName = "Chrome", ime = 'English'},
    {appName = "Firefox", ime = 'English'},
    {appName = "Welly", ime = 'English'},
    {appName = "系统设置", ime = 'English'},
    {appName = "钉钉", ime = 'Chinese'},
    {appName = "微信", ime = 'Chinese'},
    {appName = "QQ", ime = 'Chinese'},
    
    -- 保留一些路径匹配 (可选)
    {path = "/opt/homebrew/Cellar/emacs-plus@30/30.1/Emacs.app", ime = 'English'},
}

function updateFocusAppInputMethod()
    local ime = ''
    local currentApp = hs.window.frontmostWindow():application()
    local focusAppPath = currentApp:path()
    local focusAppName = currentApp:name()
    local focusAppBundleID = currentApp:bundleID()
    
    -- 遍历配置表，按优先级匹配：bundleID > appName > path
    for _, app in pairs(app2Ime) do
        -- Bundle ID 匹配（优先）
        if app.bundleID and focusAppBundleID == app.bundleID then
            ime = app.ime
            break
        -- 应用名称匹配（次优先）
        elseif app.appName and focusAppName:find(app.appName) then
            ime = app.ime
            break
        -- 路径匹配（最后考虑）
        elseif app.path and focusAppPath == app.path then
            ime = app.ime
            break
        end
    end

    if ime == 'English' then
        English()
    elseif ime == 'Chinese' then
        Chinese()
    end
end

-- helper hotkey to figure out the app path and name of current focused window
-- 当选中某窗口按下ctrl+command+.时会显示应用的路径等信息
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
    hs.alert.show("App path:        "
    ..hs.window.focusedWindow():application():path()
    .."\n"
    .."App name:      "
    ..hs.window.focusedWindow():application():name()
    .."\n"
    .."App ID:      "
    ..hs.window.focusedWindow():application():bundleID()
    .."\n"
    .."IM source id:  "
    ..hs.keycodes.currentSourceID())
end)

-- Handle cursor focus and application's screen manage.
-- 窗口激活时自动切换输入法
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated or eventType == hs.application.watcher.launched) then
        updateFocusAppInputMethod()
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
