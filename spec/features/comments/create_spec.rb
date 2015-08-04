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

    context "name is not present" do
       it "doesn't create the name and shows an error message" do
       create_comment name: ""
        
       expect(page).to have_content("Name can't be blank")
       post.reload
       expect(post.comments.count).to eq(0)
       end
   end
   
   context "body is too short" do
       it "doesn't create the comment and shows an error message" do
       create_comment body: "short"
        
       expect(page).to have_content("Body is too short")
       post.reload
       expect(post.comments.count).to eq(0)
       end
   end
   
end


