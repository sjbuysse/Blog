class FillSlider < Liquid::Block
    def initialize(tag_name, images, tokens)
        super
        @images = images
    end
    def render(context)
<div class="slider">
    %{<a href="#" class="unslider-arrow prev icon-chevron-with-circle-left"></a>
    <a href="#" class="unslider-arrow next icon-chevron-with-circle-right"></a>
    <ul>
        {% for image in #{@images}%}
            <li style="background-image: url({{image}});">
        {% endfor %}
       </li>
    </ul>
</div>}
    end
end

Liquid::Template.register_tag('fillSlider', FillSlider)

