class PdfUploader < CarrierWave::Uploader::Base
  def filename
    File.basename(path)
  end
end
