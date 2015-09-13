class Product < ActiveRecord::Base
  belongs_to :order
  belongs_to :user


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  scope :unclaimed, -> { where(order_id: nil) }


  def hosted_by?(current_user)
    user_id == current_user.id
  end

end
