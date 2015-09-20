class Product < ActiveRecord::Base
  #require 'aws-sdk-v1'
  #require 'aws-sdk'

  belongs_to :order
  belongs_to :user
  has_many :wishes
  has_many :groupies, through: :wishes, source: :user

  before_save :strip_currency_symbol

  validates_presence_of :name, :description, :price
  validates_numericality_of :price




  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  scope :unclaimed, -> { where(order_id: nil).order("created_at DESC")}


  def hosted_by?(current_user)
    user_id == current_user.id
  end

  private
    def strip_currency_symbol

    end

end
