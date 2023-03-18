class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  mount_uploader :image, ImagesUploader
  
  validates :title, presence: true
  validates :content, presence: true
  validates :fee, presence: true
  validates :address, presence: true
  
  def self.search(search)
    if search != ""
      Room.where('title LIKE(?) OR content LIKE(?)', "%#{params[:title]}%", "%#{params[:content]}%")
    else
      Room.all
    end
  end
end

