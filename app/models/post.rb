class Post < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: {maximum: 100}

    def completed?
        completed_at.present?
    end
end
