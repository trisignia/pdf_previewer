class PagesFactory
  def initialize(pdf_file)
    @pdf_file = pdf_file
  end

  def create_pages
    pdf = Grim.reap(@pdf_file.pdf.current_path)
    pdf.each_with_index do |image, index|
      create_page(image, index)
    end
  end

  private

  def create_page(image, index)
    image.save(image_path(index))
    page = @pdf_file.pages.build
    page.image = File.open(image_path(index))
    page.page_number = index + 1
    page.save!
  end

  def image_path(index)
    File.join(Rails.root, "/tmp/images/#{@pdf_file.id}-#{index}.png")
  end
end
