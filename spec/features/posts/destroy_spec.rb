require "spec_helper.rb"

describe "Deleting a post" do
    let!(:post) {Post.create(title: "A new post", body:"This is the first body")}
    it "Deletes a post successfully" do
        visit "/posts"
        within(dom_id_for(post)) do
            click_link "Read on"
        end
        click_button "Delete post"

        expect(page).to have_content("Successfully deleted post")
        expect(Post.all.count).to eq(0)
        expect(page).to_not have_content(post.title)
    end
end
