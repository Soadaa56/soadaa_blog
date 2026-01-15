class Post < ApplicationRecord
    enum :category, { review: 0, impression: 1, general: 2, guide: 3, miscellaneous: 4 }
end