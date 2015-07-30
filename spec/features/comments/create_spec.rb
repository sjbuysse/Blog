require "spec_helper.rb"

describe "Creating a comment" do
    let!(:post) {Post.create(title:"A post for comments", body:"And there shall be comments!")}
    def create_comment(options={})
        options[:name] ||= "Eline"
        options[:body] ||= "Looks like heaven over there, I love it"
       
        visit "/posts"
        within(dom_id_for(post)) do
            click_link "Read on"
        end

        fill_in "comment_name", with: options[:name] 
        fill_in "comment_body", with: options[:body] 
        click_button "Save comment"
    end
    
    it "successfully creates a comment" do
        create_comment

        expect(page).to have_content("Looks like heaven over there")
        post.reload
        expect(post.comments.count).to eq(1)
    end
    
end


