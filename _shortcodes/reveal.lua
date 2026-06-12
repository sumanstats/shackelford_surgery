return {
  ["reveal"] = function(args, kwargs)
    -- Safeguard: return nothing if no path is provided
    if not args[1] then return pandoc.Null() end
    
    local path = pandoc.utils.stringify(args[1])
    
    -- Auto-append .html
    if not path:match("%.html$") then
      path = path .. ".html"
    end

    -- FIX: Pandoc returns "" for missing kwargs, not nil.
    -- Lua's "or" doesn't catch "" because empty strings are truthy.
    local width = pandoc.utils.stringify(kwargs["width"])
    if width == "" then width = "100%" end
    
    local height = pandoc.utils.stringify(kwargs["height"])
    if height == "" then height = "600" end

    -- Absolute path from site root (recommended for Quarto books)
    local src = "/presentation/" .. path

    local iframe_html = string.format(
      '<iframe src="%s" width="%s" height="%s" style="border:none;"></iframe>',
      src, width, height
    )

    return pandoc.RawInline('html', iframe_html)
  end
}