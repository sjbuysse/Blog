module ApplicationHelper
    def markdown(text)
        options = {
        }
        #the following parses the text into kramdown syntax which is based on Markdown and easily written to html afterwards
        markdown = Liquid::Template.parse(text).render
        kramdown = Kramdown::Document.new(markdown, options)
        kramdown.to_html.html_safe
    end

    def slider(*images)
        render partial: "banner", locals: {imgs: images} 
    end
end
