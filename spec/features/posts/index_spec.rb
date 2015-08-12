require "spec_helper.rb"

describe "Viewing posts" do
    context "there are no posts" do
        it "displays no posts" do
            expect(Post.all.count).to eq(0)
            visit "/posts" 
            expect(page.all("div.tile").count).to eq(0)
        end
    end
    context "there are posts" do
        it "displays all posts" do
            post = Post.create(title: "My first post", body: "This is some test text", author: "Simon")
            visit "/posts" 
            expect(page.all("div.tile").count).to eq(1)
        end
    end
end
    
