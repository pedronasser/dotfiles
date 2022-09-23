vim.g.dashboard_custom_header = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

local db = require('dashboard')
db.custom_header = vim.g.dashboard_custom_header

db.custom_center = {
  {
    icon = '  ',
    desc = 'New file                                ',
    action = 'DashboardNewFile'
  },
  {
    icon = '  ',
    desc = 'Recently latest session                 ',
    action = 'SessionLoad'
  },
  {
    icon = '  ',
    desc = 'Recently opened files                   ',
    action = 'DashboardFindHistory',
  },
  {
    icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
  },
  {
    icon = '  ',
    desc = 'File Browser                            ',
    action = 'Telescope file_browser',
  },
  {
    icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
  },
}
