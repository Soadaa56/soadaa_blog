class Post < ApplicationRecord
    before_create :set_published_at

    enum :category, { blog: 0, review: 1, impression: 2, ranking: 3, guide: 4 }
    scope :published, -> { where("published_at <= ?", Time.current) }
    has_one_attached :cover_image
    has_many_attached :images
    validates :title, presence: true
    validates :body, presence: true


    private
    
    def set_published_at
      self.published_at ||= Time.current
    end
end