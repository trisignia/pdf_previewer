require 'spec_helper'

describe Page do
  it { should have_db_column(:page_number).of_type(:integer) }
  it { should have_db_column(:pdf_file_id).of_type(:integer) }
  it { should have_db_column(:image).of_type(:string) }

  it { should belong_to(:pdf_file) }

  it { should validate_presence_of(:pdf_file) }
end
