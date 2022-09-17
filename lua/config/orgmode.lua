local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then return end

local status_ok, bullets = pcall(require, "org-bullets")
if not status_ok then return end

local status_ok, headlines = pcall(require, "headlines")
if not status_ok then return end

orgmode.setup_ts_grammar()

orgmode.setup()
headlines.setup({
    markdown = {
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
    },
    norg = {
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
        headline_highlights = { "Headline1", "Headline2", "Headline3" },
        codeblock_highlight = { "NeorgCodeBlock" },
    },
    org = {
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
        headline_highlights = { "Headline1", "Headline2", "Headline3" }
    },
    rmd = {
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
    },
})
bullets.setup()
