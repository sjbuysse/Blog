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
    validates :author, presence: true 
    validate :at_least_one_body

    def self.about
        where(title: "About us")
    end
    def at_least_one_body
        if [self.first_body, self.second_body].reject(&:blank?).size == 0 
            errors[:base] << ("Please fill in at least one body")
        end
    end 
end
