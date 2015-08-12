require "spec_helper.rb"

describe "Viewing a post" do
    let!(:post) {Post.create(title:"Testing post", body:"This is some test text", author:"Simon")}
    
    it "displays all posts" do
        visit "/posts" 
        within(dom_id_for(post)) do
            click_link post.title
        end

        expect(page).to have_content(post.title)
        expect(page).to have_content(post.author)
        expect(page).to have_content(post.body)
    end
end
    
