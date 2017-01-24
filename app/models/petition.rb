class Petition < ApplicationRecord
  searchkick
  belongs_to :user
  belongs_to :catagory
  has_attached_file :image, styles: { medium: "300x300#" }
  validates_attachment :image,
     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
