class Photo < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments, :as => :commentable, :dependent => :destroy
end
