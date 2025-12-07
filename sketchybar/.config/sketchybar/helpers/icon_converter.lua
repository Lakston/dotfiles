local settings = require("settings")

-- Mapping of placeholder strings to actual icon characters
-- Using NerdFont icons which have better app icon coverage
local icon_map = {
	-- Code editors & IDEs
	[":cursor:"] = "󰨞", -- Cursor editor
	[":code:"] = "󰨞", -- VS Code / Code editor
	[":neovim:"] = "", -- Neovim
	[":vim:"] = "", -- Vim
	[":pycharm:"] = "", -- PyCharm
	[":web_storm:"] = "󰨞", -- WebStorm
	[":goland:"] = "󰨞", -- GoLand
	[":datagrip:"] = "󰨞", -- DataGrip
  [":reactotron:"] = "", -- Reactotron
  [":xcode:"] = "", -- Xcode

	-- Terminals
	[":ghostty:"] = "", -- Ghostty terminal
	[":terminal:"] = "󰆍", -- Terminal
	[":iterm:"] = "󰆍", -- iTerm
	[":alacritty:"] = "󰆍", -- Alacritty
	[":kitty:"] = "󰆍", -- Kitty
	[":warp:"] = "󰆍", -- Warp
	[":wezterm:"] = "󰆍", -- WezTerm
	[":hyper:"] = "󰆍", -- Hyper
	
	-- Communication
	[":slack:"] = "󰒱", -- Slack
	[":discord:"] = "󰙯", -- Discord
	[":telegram:"] = "󰨙", -- Telegram
	[":whats_app:"] = "󰖣", -- WhatsApp
	[":signal:"] = "󰨙", -- Signal
	[":messages:"] = "󰍦", -- Messages
	[":mail:"] = "", -- Mail
	[":zoom:"] = "󰕧", -- Zoom
	
	-- Browsers
	[":safari:"] = "󰀺", -- Safari
	[":firefox:"] = "󰈹", -- Firefox
	[":google_chrome:"] = "󰊯", -- Chrome
  [":zen_browser:"] = "󰈹", -- Zen Browser
	
	-- System & Utilities
	[":finder:"] = "󰀶", -- Finder
	[":gear:"] = "󰒓", -- Settings/Gear
	[":calculator:"] = "󰃬", -- Calculator
	[":calendar:"] = "󰃭", -- Calendar
	[":notes:"] = "󰈔", -- Notes
	[":photos:"] = "󰉏", -- Photos
	[":music:"] = "󰝚", -- Music
	[":weather:"] = "󰖐", -- Weather
	[":preview:"] = "", -- Preview
	[":activity_monitor:"] = "󰍛", -- Activity Monitor
	
	-- Media
	[":spotify:"] = "󰓇", -- Spotify
	[":vlc:"] = "󰕼", -- VLC
	[":youtube:"] = "󰗃", -- YouTube
	
	-- Development tools
	[":docker:"] = "󰡨", -- Docker
	[":git_hub:"] = "󰊤", -- GitHub
	[":figma:"] = "󰈖", -- Figma
	
	-- Productivity
	[":notion:"] = "", -- Notion
	[":obsidian:"] = "󰈙", -- Obsidian
	[":todoist:"] = "󰄱", -- Todoist
	[":things:"] = "󰄱", -- Things
	
	-- Default fallback
	[":default:"] = "󰀄", -- Default app icon
}

-- Convert placeholder string to actual icon character
local function convert_icon(placeholder)
	if not placeholder then
		return "󰀄" -- Default icon
	end
	
	-- If it's already an icon character (not a placeholder), return as-is
	if not placeholder:match("^:.*:$") then
		return placeholder
	end
	
	-- Convert placeholder to icon
	return icon_map[placeholder] or "󰀄" -- Default icon if not found
end

return {
	convert = convert_icon,
	map = icon_map
}

