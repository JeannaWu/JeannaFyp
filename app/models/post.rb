class Post < ActiveRecord::Base
	
	acts_as_votable
	belongs_to :user
	belongs_to :category
	belongs_to :type
	has_many :comments

	has_many :approval_votes, dependent: :destroy
	has_many :approval_downvotes, dependent: :destroy
	has_many :agreed_users, through: :approval_votes, source: :user
	
	validates :title, presence: true
	validates :content, presence: true
	has_attached_file :image, styles: { medium: "550x300#", small: "350x250#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    default_scope -> { order(created_at: :desc) }

    def approved?
    	!approved_at.blank?
    end
    
end
