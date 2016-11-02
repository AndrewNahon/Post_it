class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, :description, :url, presence: true
  validates :title, :url, uniqueness: true

  def vote_count
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
end