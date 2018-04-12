class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_attached_file :avatar,
    styles: {
      medium: "300x300>",
      thumb: "100x100>" },
    default_url: "/images/medium/lion-avatar.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  serialize :stats, Hash

end
