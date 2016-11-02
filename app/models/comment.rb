class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable

  validates :body, presence: true

  def vote_count
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
end