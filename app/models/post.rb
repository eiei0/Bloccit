class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :topic

    default_scope { order(created_at: :desc) }
    scope :ordered_by_title, -> { reorder(title: :asc) }
    scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
    scope :alexs, -> { where(user_id: 5) }

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
end