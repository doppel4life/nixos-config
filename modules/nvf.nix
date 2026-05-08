{ ... } : {
    programs.nvf = {
        enable = true;
        settings = {
          vim = {
            options = {
                    shiftwidth = 4;
                    tabstop = 4;
                    autoindent = true;
                    smartindent = true;
                    showmode = false;
                    };
            viAlias = true;
            vimAlias = true;
            clipboard.enable = true;
        
            autocomplete.blink-cmp = {
                enable = true;
                setupOpts = {
                    keymap.preset = "enter";
                    completion.ghost_text.enabled = true;
                    sources.default = [ "lsp" "path" "snippets" "buffer" ];
                    };
                };

            statusline.lualine = {
                enable = true;
                sectionSeparator = {left ="|"; right ="|";};
                componentSeparator = {left = "|"; right = "|";};
                
                refresh = {
                    statusline = 1000;
                    tabline = 1000;
                    winbar = 1000;
                        };

                # Defining the actual sections
                activeSection = {
                    a = [ "{'mode'}" ];
                    b = [ "{'branch'}" "{'diff'}" "{'diagnostics'}" ];
                    c = [ "{'filename'}" ];
                    x = [ "{'encoding'}" "{'fileformat'}" "{'filetype'}" ];
                    y = [ "{'progress'}" ];
                    z = [ "{'location'}" ];
                        };
                };
            #languages.enableTreesitter = true;

            # Enable some basic features
            lsp.enable = true;
            telescope.enable = true;
            autocomplete.nvim-cmp.enable = false;

            # Language support examples
            languages = {
                enableTreesitter = true;
                nix = { 
                    enable = true;
                    format.enable = true;
                    format.type = ["nixfmt"];
                    };

                python = {
                    enable = true;
                    lsp.enable = true;
                    lsp.servers = ["pyright"];
                    format.enable = false;
                    dap.enable = true ;
                    };
                
                typst = {
                    enable = true;
                    lsp.enable = true;
                    lsp.servers = ["tinymist"];
                    format.enable = true;
                    extensions.typst-preview-nvim.enable = true;
                    };

                rust.enable = true;

                go = {
                    enable = true;
                    lsp.enable = true;
                    lsp.servers =["gopls"];
                    format.enable = true;
                    };
                markdown.enable = true;
                
            };
          };
        };
      };

}
