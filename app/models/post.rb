class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy do 
        def persisted
            select(&:persisted?)
        end
    end

    has_attached_file :thumb, styles: {thumb: "453x300>" }
    validates_attachment_content_type :thumb, :content_type => /\Aimage\/.*\Z/

    validates :title, presence: true, length: {minimum: 3}
    validates :body, presence: true, length: {minimum: 15}
    validates :author, presence: true

    scope :descending, -> {order('created_at DESC')}
end
