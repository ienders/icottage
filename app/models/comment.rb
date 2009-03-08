class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  validates_presence_of :user_id, :commentable_id, :commentable_type, :body
  
  def to_s
    "#{body}"
  end
end
