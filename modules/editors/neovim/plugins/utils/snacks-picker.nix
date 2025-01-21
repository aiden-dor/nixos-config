{
  plugins.snacks = {
    enable = true;
    # Replacement for telescope
    # config lifted from
    # https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
    settings.picker = {
      enabled = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.buffers() end";
      key = "<leader>,";
      options = {
        desc = "Buffers";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.grep() end";
      key = "<leader>/";
      options = {
        desc = "Grep";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.command_history() end";
      key = "<leader>:";
      options = {
        desc = "Command History";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.files() end";
      key = "<leader><space>";
      options = {
        desc = "Find Files";
      };
    }
    # find
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.buffers() end";
      key = "<leader>fb";
      options = {
        desc = "Buffers";
      };
    }
    {
      mode = "n";
      action.__raw = ''function()  Snacks.picker.files({cwd = vim.fn.stdpath("config")}) end'';
      key = "<leader>fc";
      options = {
        desc = "Find Config File";
      };
    }

    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.files() end";
      key = "<leader>ff";
      options = {
        desc = "Find Files";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.git_files() end";
      key = "<leader>fg";
      options = {
        desc = "Find Git Files";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.recent() end";
      key = "<leader>fr";
      options = {
        desc = "Recent";
      };
    }
    # git
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.git_log() end";
      key = "<leader>gc";
      options = {
        desc = "Git Log";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.git_status() end";
      key = "<leader>gs";
      options = {
        desc = "Git Status";
      };
    }
    # Grep
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.lines() end";
      key = "<leader>sb";
      options = {
        desc = "Buffer Lines";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.grep_buffers() end";
      key = "<leader>sB";
      options = {
        desc = "Grep Open Buffers";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.grep() end";
      key = "<leader>sg";
      options = {
        desc = "Grep";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.grep_word() end";
      key = "<leader>sw";
      options = {
        desc = "Visual selection or word";
      };
    }
    # search
    {
      mode = "n";
      key = ''<leader>s"'';
      action.__raw = "function()  Snacks.picker.registers() end";
      options = {
        desc = "Registers";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.autocmds() end";
      key = "<leader>sa";
      options = {
        desc = "Autocmds";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.command_history() end";
      key = "<leader>sc";
      options = {
        desc = "Command History";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.commands() end";
      key = "<leader>sC";
      options = {
        desc = "Commands";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.diagnostics() end";
      key = "<leader>sd";
      options = {
        desc = "Diagnostics";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.help() end";
      key = "<leader>sh";
      options = {
        desc = "Help Pages";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.highlights() end";
      key = "<leader>sH";
      options = {
        desc = "Highlights";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.jumps() end";
      key = "<leader>sj";
      options = {
        desc = "Jumps";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.keymaps() end";
      key = "<leader>sk";
      options = {
        desc = "Keymaps";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.loclist() end";
      key = "<leader>sl";
      options = {
        desc = "Location List";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.man() end";
      key = "<leader>sM";
      options = {
        desc = "Man Pages";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.marks() end";
      key = "<leader>sm";
      options = {
        desc = "Marks";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.resume() end";
      key = "<leader>sR";
      options = {
        desc = "Resume";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.qflist() end";
      key = "<leader>sq";
      options = {
        desc = "Quickfix List";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.colorschemes() end";
      key = "<leader>uC";
      options = {
        desc = "Colorschemes";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.projects() end";
      key = "<leader>qp";
      options = {
        desc = "Projects";
      };
    }
    # LSP
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.lsp_definitions() end";
      key = "gd";
      options = {
        desc = "Goto Definition";
      };
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = "function()  Snacks.picker.lsp_references() end";
      options = {
        nowait = true;
        desc = "References";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.lsp_implementations() end";
      key = "gI";
      options = {
        desc = "Goto Implementation";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.lsp_type_definitions() end";
      key = "gy";
      options = {
        desc = "Goto T[y]pe Definition";
      };
    }
    {
      mode = "n";
      action.__raw = "function()  Snacks.picker.lsp_symbols() end";
      key = "<leader>ss";
      options = {
        desc = "LSP Symbols";
      };
    }
  ];
}
