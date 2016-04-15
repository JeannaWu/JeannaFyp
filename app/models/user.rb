class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Paperclip::Glue
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :omniauthable

  has_many :posts, :dependent => :destroy
  has_many :comments, :through => :posts, :dependent => :destroy

  has_many :identities

  devise :omniauthable, :omniauth_providers => [:facebook,:twitter,:tumblr,:instagram]

  acts_as_follower
  acts_as_followable
  
  has_attached_file :avatar,  styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  
  


  
  def twitter
    identities.where( :provider => "twitter" ).first
  end

  def twitter_client
    @twitter_client ||= Twitter.client( access_token: twitter.accesstoken )
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def instagram
    identities.where( :provider => "instagram" ).first
  end

  def instagram_client
    @instagram_client ||= Instagram.client( access_token: instagram.accesstoken )
  end

  def tumblr
    identities.where( :provider => "tumblr" ).first
  end

  def tumblr_client
    @tumblr_client ||= Tumblr.client( access_token: tumblr.accesstoken )
  end


end


