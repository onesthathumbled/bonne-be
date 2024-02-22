class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category

    validates :task_name, presence: true
    validates :task_details, presence: true

    # Additonal attributes
    enum priority: [:low, :medium, :high]
    validates :priority, inclusion: { in: priorities.keys }

    # validates :due_date, presence: true

    # Soft deletion
    default_scope { where(deleted_at: nil) }

    def soft_delete
        update(deleted_at: Time.current)
    end
    
    def deleted?
        deleted_at.present?
    end
end
