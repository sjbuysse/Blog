require "spec_helper.rb"

describe "Editting a post" do
    let!(:post) {Post.create(title: "A new post", body:"This is the first body")}
    def edit_post(options={})
        options[:title] ||= "A new title"
        options[:body] ||= "A new body text eeh"

        visit "/posts"
        within(dom_id_for(post)) do
            click_link "Read on"
        end
        within("div.post_content") do 
            click_link "Edit"
        end
        fill_in "post_title", with: options[:title] 
        fill_in "post_body", with: options[:body] 
        click_button "Save post"
    end

    it "edits a post succesfully" do 
        edit_post

        expect(page).to have_content("A new title")
        expect(page).to have_content("Successfully updated post")
    end
end
