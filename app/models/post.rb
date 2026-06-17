class Post < ApplicationRecord
    before_create :set_published_at, :generate_slug

    enum :category, { blog: 0, review: 1, impression: 2, ranking: 3, guide: 4 }
    scope :published, -> { where("published_at <= ?", Time.current) }
    has_one_attached :cover_image do |attachable|
      attachable.variant :desktop,
        resize_to_limit: [ 1600, 1600 ],
        format: :webp

      attachable.variant :tablet,
        resize_to_limit: [ 1280, 1280 ],
        format: :webp,
        saver: { quality: 85 }

      attachable.variant :mobile,
        resize_to_limit: [ 480, 480 ],
        format: :webp,
        saver: { quality: 75 }
    end
    has_many_attached :images
    validates :title, presence: true
    validates :body, presence: true

    def to_param
      slug
    end

    private

    def set_published_at
      self.published_at ||= Time.current
    end

    def generate_slug
      self.slug = title.parameterize
    end
end
