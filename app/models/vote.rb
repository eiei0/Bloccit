class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
  validates_presence_of :user_id
  validates_presence_of :post_id

  after_save :update_post

  private

  def update_post
    post.update_rank
  end
   
end