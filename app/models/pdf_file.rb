class PdfFile < ActiveRecord::Base
  has_many :pages, :dependent => :destroy

  mount_uploader :pdf, PdfUploader
end
