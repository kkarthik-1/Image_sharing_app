class Photo < ApplicationRecord

  belongs_to :user
  belongs_to :album
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :created_date,:owner, presence: true
  validates :tagline,length: { in: 10..50}

  before_create :check_size


  private

  def check_size
    if Album.find(self.album_id).photos.size >= 25
    errors.add(:base,message: "This album is already full")
    throw :abort
    end
  end

end
