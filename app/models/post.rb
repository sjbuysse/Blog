class Post < ActiveRecord::Base
    has_many :comments

    validates :title, presence: true, length: {minimum: 3}
    validates :body, presence: true, length: {minimum: 15}

    scope :descending, -> {order('created_at DESC').limit(4)}
end
