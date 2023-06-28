----------------------------------------------------------------------------------------------------

-- author: zuorn
-- mail: zuorn@qq.com
-- github: https://github.com/zuorn/hammerspoon_config

----------------------------------------------------------------------------------------------------

----------------------------------------- 配 置 文 件 -----------------------------------------------

----------------------------------------------------------------------------------------------------

--指定要启用的模块
hspoon_list = {
    "AClock",
    -- "ClipShow",
    "CountDown",
    "KSheet",
    "WinWin",
    -- "VolumeScroll",
    -- "PopupTranslateSelection",
    -- "DeepLTranslate"
    -- "HSaria2"
    -- "HSearch"
    -- "SpeedMenu",
    -- "MountedVolumes",
    -- "HeadphoneAutoPause",
}

----------------------------------------------------------------------------------------------------
----------------------------------------- 快速启动配置  ----------------------------------------------

-- 绑定 启动 app 快捷键

hsapp_list = {
    {key = 'a', name = 'Alfred 5'},
    {key = 'c', id = 'com.google.Chrome'},
    {key = 'e', name = 'Emacs'},
    {key = 'f', id = 'org.mozilla.firefoxdeveloperedition'},
    {key = 'i', name = 'iTerm'},
    {key = 'm', name = 'MacVim'},
    {key = 'v', id = 'com.microsoft.VSCode'},
    {key = 'p', name = 'Finder'},
    {key = 'q', name = 'QQ'},
    {key = 's', name = 'Slack'},
    {key = 't', name = 'Telegram'},
    {key = 'w', name = 'WeChat'},
    {key = 'y', name = '印象笔记'},
    {key = 'z', name = 'MacZip'},
}


----------------------------------------------------------------------------------------------------
---------------------------------------- 模式快捷键绑定  ----------------------------------------------

-- 窗口提示键绑定，快速切换到你想要的窗口上
hswhints_keys = {{"ctrl", "alt"}, "tab"}

-- 快速启动面板快捷键绑定
hsappM_keys = {{"ctrl", "alt"}, "A"}

-- 系统剪切板快捷键绑定
hsclipsM_keys = {{"ctrl", "alt"}, "C"}


-- 在默认浏览器中打开 Hammerspoon 和 Spoons API 手册
hsman_keys = {{"ctrl", "alt"}, "H"}

-- 倒计时快捷键绑定
hscountdM_keys = {{"ctrl", "alt"}, "I"}

-- 锁定电脑快捷键绑定
hslock_keys = {{"ctrl", "alt"}, "L"}

-- 窗口自定义大小及位置快捷键绑定
hsresizeM_keys = {{"ctrl", "alt"}, "R"}

-- 定义应用程序快捷键面板快捷键
hscheats_keys = {{"ctrl", "alt"}, "S"}

-- 显示时钟快捷键绑定
hsaclock_keys = {{"ctrl", "alt"}, "T"}

-- 粘贴 chrome 或 safari 打开最前置的网址
hstype_keys = {{"ctrl", "alt"}, "V"}

-- 显示 Hammerspoon 控制台
hsconsole_keys = {{"ctrl", "alt"}, "/"}

-- 显示 MountedVolumes
hstype_keys = {{"ctrl", "alt"}, "M"}

-- 显示搜索
hsearch_keys = {{"ctrl", "alt"}, "G"}

----------------------------------------------------------------------------------------------------
--------------------------------- hammerspoon 快捷键绑定配置  -----------------------------------------

-- 临时禁用所有快捷键(注意：只能手动接禁。)
hsupervisor_keys = {{"cmd", "shift", "ctrl"}, "Q"}

-- 重新加载配置文件
hsreload_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- 显示各种模式绑定快捷键
hshelp_keys = {{"alt", "shift"}, "/"}


----------------------------------------------------------------------------------------------------
---------------------------------------------- end  ------------------------------------------------
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
------------------------------------------- YH Custom  ---------------------------------------------
----------------------------------------------------------------------------------------------------
require("private/ime")
require("private/sizeup")
-- require("private/weather")

hs.hotkey.bind({"ctrl","shift","cmd"}, ",", function()
  local alacritty = hs.application.find('alacritty')
  if (alacritty ~= nil and alacritty:mainWindow() and alacritty:isFrontmost()) then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)
hs.hotkey.bind({"ctrl","shift","cmd"}, ".", function()
  local alacritty = hs.application.find('alacritty')
  if (alacritty ~= nil and alacritty:mainWindow() and alacritty:isFrontmost()) then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)
