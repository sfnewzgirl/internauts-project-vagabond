class User < ApplicationRecord
  has_merit

  has_secure_password
  has_many :posts, dependent: :destroy
  validates_uniqueness_of :email

  has_attached_file :avatar, styles: { thumb: "150x150>" }, default_url: "/images/:style/red-creature-icon.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.confirm(params)
    @user = User.find_by email: params[:email]
    @user ? @user.authenticate(params[:password]) : false
  end
end
