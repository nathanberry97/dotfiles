return {
    'vimwiki/vimwiki',
    init = function()
        -- Disable default key mappings
        vim.g.vimwiki_key_mappings = { all_maps = 0 }

        -- Set Vimwiki settings
        vim.g.vimwiki_global_ext = 0
        vim.g.vimwiki_list = {
            {
                path = '~/Documents/repos/wiki',
                syntax = 'markdown',
                ext = '.md'
            }
        }

        -- Vimwiki key mappings
        vim.keymap.set('n', '<enter>', '<Plug>VimwikiFollowLink')
        vim.keymap.set('n', '<Tab>', '<Plug>VimwikiNextLink')
        vim.keymap.set('n', '<S-Tab>', '<Plug>VimwikiPrevLink')

        -- VimwikiTags function
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "vimwiki",
            callback = function()
                vim.api.nvim_buf_create_user_command(0, "VimwikiTags", function()
                    local handle = io.popen(
                        "rg '^tags:' ~/Documents/repos/wiki --no-heading | sed 's/^.*tags: //' | tr ' ' '\\n' | sort -u"
                    )
                    local result = handle:read("*a")
                    handle:close()

                    local tags = {}
                    for tag in result:gmatch("[^\n]+") do
                        table.insert(tags, tag)
                    end

                    if vim.fn.empty(tags) == 1 then
                        print("No tags found")
                        return
                    end

                    vim.fn["fzf#run"](vim.fn["fzf#wrap"]({
                        source = tags,
                        sink = function(tag)
                            vim.cmd("Rg " .. tag)
                        end,
                        options = "--prompt='Tags> '"
                    }))
                end, { desc = "Search Vimwiki tags" })

                -- Only map <Ctrl-t> in Vimwiki buffers
                vim.keymap.set('n', '<C-t>', ':VimwikiTags<CR>', {
                    buffer = true,
                    desc = 'Search Vimwiki tags',
                })
            end,
        })
    end
}
