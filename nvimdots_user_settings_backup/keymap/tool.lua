local bind = require("keymap.bind")
local map_cr = bind.map_cr

return {
	["n|<leader>e"] = map_cr("NvimTreeFocus"):with_noremap():with_silent():with_desc("filetree: Focus"),
}
