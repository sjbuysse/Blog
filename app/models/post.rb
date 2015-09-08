class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy do 
        def persisted
            select(&:persisted?)
        end
    end

    has_many :pictures, dependent: :destroy

    mount_uploader :thumb, ThumbUploader

    scope :descending, -> {order('created_at DESC')}
    
    validates :title, presence: true, length: {minimum: 3}
    validates :body, presence: true, length: {minimum: 5}
    validates :author, presence: true 

    def self.about
        where(title: "About us")
    end
end
