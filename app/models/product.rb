class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews
  	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	validates :name, :description, :price, presence: true
  	validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0}

  	validates_attachment_presence :image




def self.search(search)
    #tire.search(load.true)  do
    # query{string params[:query],default_operator:"AND"} if params[:query].present?
    # filter :range,published_at:{lte: Time.zone.now}
    where("lower(name) LIKE? ", "%#{search}%")
  end
  
end
