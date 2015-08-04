require "spec_helper.rb"

describe "Deleting a comment" do
    let!(:post) {Post.create(title:"A post for comments", body:"And there shall be comments!")}
    let!(:comment) {post.comments.create(name:"Eline", body:"Looks like heaven over there, I love it!")}
    
    context "from post content page" do
        it "deletes successfully" do
            visit "/posts"
            within(dom_id_for(post)) do
                click_link "Read on"
            end

            within(dom_id_for(comment)) do
                click_button "Delete"
            end
        end
    end
    
    context "from post index page" do
        it "deletes successfully" do
            visit "/posts"
            within(dom_id_for(post)) do
                click_button "Delete"
            end
        end
    end

end

