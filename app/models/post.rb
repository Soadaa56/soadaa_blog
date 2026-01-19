class Post < ApplicationRecord
    enum :category, { review: 0, impression: 1, ranking: 2, guide: 3, blog: 4 }
    scope :published, -> { where("published_at <= ?", Time.current) }
end