require "spec_helper.rb"

describe "Viewing a post" do
    let!(:post) {Post.create(title:"Testing post", body:"This is some test text")}
    
    it "displays all posts" do
        visit "/posts" 
        within(dom_id_for(post)) do
            click_link "Read on"
        end

        expect(page).to have_content(post.title)
        expect(page).to have_content(post.body)
    end
end
    
