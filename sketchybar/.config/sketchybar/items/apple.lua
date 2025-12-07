local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local apple = sbar.add("item", {
  icon = {
    font = {
      family = "Hack Nerd Font",
      style = "Regular",
      size = 16.0
    },
    string = icons.apple,
    padding_right = 8,
    padding_left = 8,
  },
  label = { drawing = false },
  background = {
    color = colors.bg1,
  },
  padding_left = 6,
  padding_right = 6,
  click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0"
})
