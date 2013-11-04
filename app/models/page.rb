class Page < ActiveRecord::Base
  belongs_to :pdf_file

  validates :pdf_file, :presence => true

  mount_uploader :image, ImageUploader
end
