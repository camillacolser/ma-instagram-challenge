class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :likes, dependent: :destroy
  belongs_to :user

  def username
    User.find(self.user_id).username
  end
end