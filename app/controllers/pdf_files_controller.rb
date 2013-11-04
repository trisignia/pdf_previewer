class PdfFilesController < ApplicationController

  def create
    @pdf_file = PdfFile.new
    @pdf_file.pdf = pdf_attributes[:files].first

    respond_to do |format|
      if @pdf_file.save
        PagesFactory.new(@pdf_file).create_pages

        format.html {
          render(:json => [PdfFileSerializer.new(@pdf-file).to_jq_upload].to_json,
                 :content_type => "text/html",
                 :layout => false)
        }
        format.json { render :json => { :files => [PdfFileSerializer.new(@pdf_file).to_jq_upload]}, :status => :created, :location => contract_path(@contract) }
      else
        format.html { render :action => :new }
        format.json { render :json => @pdf_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

    def pdf_attributes
      params.permit(:files => [])
    end
end
