module ApplicationHelper
    def markdown(text)
        options = {
        }
        #the following parses the text into kramdown syntax which is based on Markdown and easily written to html afterwards
        #markdown = Liquid::Template.parse(text).render("pictures" => @post.pictures.map{|p| {'id' => p.id, 'image_url' => p.image.url}})
        kramdown = Kramdown::Document.new(text, options)
        kramdown.to_html.html_safe
    end
end
