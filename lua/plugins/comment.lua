return {
    "terrortylor/nvim-comment",
    config = function()
        require("nvim_comment").setup({
            marker_padding = true,
            -- should comment out empty or whitespace only lines
            comment_empty = true,
            -- trim empty comment whitespace
            comment_empty_trim_whitespace = true,
            -- Should key mappings be created
            create_mappings = true,
            -- Normal mode mapping left hand side
            line_mapping = "gcc",
            -- Visual/Operator mapping left hand side
            operator_mapping = "gc",
            -- text object mapping, comment chunk,,
            comment_chunk_text_object = "ic",
        })
    end
}