local wk = require("which-key")

wk.register({
    f = {
        name = "Cellular Automaton",
        m = { "<CMD>CellularAutomaton make_it_rain<CR>", "Make it Rain" },
        g = { "<CMD>CellularAutomaton game_of_life<CR>", "Game of Life" },
        s = { "<CMD>CellularAutomaton scramble<CR>", "Scramble" },
    },
}, { prefix = "<leader>" })
