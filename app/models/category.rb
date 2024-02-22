class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks

    validates :category_name, presence: true
    validates :category_details, presence: true

    # Soft deletion
    default_scope { where(deleted_at: nil) }
end
