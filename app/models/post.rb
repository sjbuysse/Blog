class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy do 
        def persisted
            select(&:persisted?)
        end
    end

    has_many :pictures, dependent: :destroy

    has_attached_file :thumb, styles: {thumb: "453x300>" }
    validates_attachment_content_type :thumb, :content_type => /\Aimage\/.*\Z/

    scope :descending, -> {order('created_at DESC')}

    liquid_methods :pictures, :title
end
