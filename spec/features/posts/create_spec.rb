require "spec_helper.rb"

describe "Creating posts" do
    def create_post(options={})
       options[:title] ||= "A new post"
       options[:body] ||= "Content of a new post"

       visit "/posts"
       expect(page.all("div.post_wrapper").count).to eq(0)
       click_link "New post"
       fill_in "post_title", with: options[:title]
       fill_in "post_body", with: options[:body]
       click_button "Create post"
    end

   it "successfully creates a post" do 
       create_post

       expect(page.all("div.post_wrapper").count).to eq(1)
       expect(page).to have_content("A new post")
       expect(page).to have_content("Successfully created post")
   end

   context "title is not present" do
       it "doesn't create the post and shows an error message" do
       create_post title: ""
        
       expect(page).to have_content("Could not save post")
       end
   end
   
   context "body is too short" do
       it "doesn't create the post and shows an error message" do
       create_post body: "This short"
        
       expect(page).to have_content("Could not save post")
       end
   end

   
end
 
