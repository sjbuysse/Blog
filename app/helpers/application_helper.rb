module ApplicationHelper
    def markdown(text)
        options = {
            #does not allow user-inputted HTML (much more secure for comments)
            filter_html: false,
            #for creating a break whenever we press return
            hard_wrap: true,
            #automatically detect urls and link them
            autolink: true,
            #don't create <em> tags with underscores
            no_intra_emphasis: true,
            # requires a space between the beginning of a header and it's name
            space_after_headers: true
        }
        #choose a renderer (html, or xhtml)
        renderer = Redcarpet::Render::HTML
        markdown = Redcarpet::Markdown.new(renderer, options)
        markdown.render(text).html_safe
    end

    def slider(*images)
        render partial: "banner", locals: {imgs: images} 
    end
end
