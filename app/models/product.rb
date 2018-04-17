class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews
  	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	validates :name, :description, :price, presence: true
  	validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0}

  	validates_attachment_presence :image


end
