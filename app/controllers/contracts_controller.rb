class ContractsController < ApplicationController

  def index
    @files = PdfFile.all
  end

end
