class Post < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  # This sets a default url for img_url
  def img_url(url= "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7G9JTqB8z1AVU-Lq7xLy1fQ3RMO-Tt6PRplyhaw75XCAnYvAYxg")
    self[:img_url] || url
  end

  # This adds up all votes on a Post instance
  def score
    votes.sum(:vote)
  end

end
