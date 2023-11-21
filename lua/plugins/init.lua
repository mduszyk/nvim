local plugins = require("plugins.plugins")

table.insert(plugins, require("plugins.neotree"))
table.insert(plugins, require("plugins.cmp"))

require("plugins.lazyrepo").clone()
require("lazy").setup(plugins)
