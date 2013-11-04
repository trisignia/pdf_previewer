class PdfFileSerializer
  include Rails.application.routes.url_helpers

  def initialize(pdf_file)
    @pdf_file = pdf_file
  end

  def to_jq_upload
    {
      "id"         => @pdf_file.id,
      "name"       => @pdf_file.pdf.identifier,
      "size"       => @pdf_file.pdf.size,
      "url"        => @pdf_file.pdf.url,
      "pages"      => @pdf_file.pages.map{|p| p.image_url},
      "deleteUrl"  => pdf_file_path(@pdf_file),
      "deleteType" => "DELETE"
    }
  end
end
