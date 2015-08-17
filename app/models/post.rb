class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy do 
        def persisted
            select(&:persisted?)
        end
    end

    has_many :pictures, dependent: :destroy

    has_attached_file :thumb, styles: {thumb: "453x300>" },
        :path => ":rails_root/public/images/:id/:filename",
        :url  => "/images/:id/:filename"
 
    validates_attachment_content_type :thumb, :content_type => /\Aimage\/.*\Z/

    scope :descending, -> {order('created_at DESC')}
    
    validates :title, presence: true, length: {minimum: 3}
    validates :body, presence: true, length: {minimum: 5}
    validates :author, presence: true 
end
