class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true
  validates :idea, presence: true


end
