local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
    [[           :h-                                  Nhy`               ]],
    [[          -mh.                           h.    `Ndho               ]],
    [[          hmh+                          oNm.   oNdhh               ]],
    [[         `Nmhd`                        /NNmd  /NNhhd               ]],
    [[         -NNhhy                      `hMNmmm`+NNdhhh               ]],
    [[         .NNmhhs              ```....`..-:/./mNdhhh+               ]],
    [[          mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ]],
    [[          oNNNdhhdo..://++//++++++/+++//++///++/-.`                ]],
    [[     y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ]],
    [[.    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ]],
    [[h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ]],
    [[hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ]],
    [[/Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ]],
    [[ oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ]],
    [[  /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ]],
    [[    /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ]],
    [[      .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ]],
    [[      -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ]],
    [[      /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ]],
    [[      //+++//++++++////+++///::--                 .::::-------::   ]],
    [[      :/++++///////////++++//////.                -:/:----::../-   ]],
    [[      -/++++//++///+//////////////               .::::---:::-.+`   ]],
    [[      `////////////////////////////:.            --::-----...-/    ]],
    [[       -///://////////////////////::::-..      :-:-:-..-::.`.+`    ]],
    [[        :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ]],
    [[          ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ]],
    [[           -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``]],
    [[          s-`::--:::------:////----:---.-:::...-.....`./:          ]],
    [[         yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ]],
    [[        oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ]],
    [[       :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ]],
    [[                       .-:mNdhh:.......--::::-`                    ]],
    [[                          yNh/..------..`                          ]],
}

dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

local function footer()
    return "vasilecampeanu.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)