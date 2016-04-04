class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :approval_votes, dependent: :destroy
  has_many :approval_downvotes, dependent: :destroy
  acts_as_votable
  validates :content, presence: true
  

  def approved?
  	!approved_at.blank?
  end
  
end
