require 'spec_helper'

describe PdfFile do
  it { should have_db_column(:pdf).of_type(:string) }
  it { should have_db_column(:account_id).of_type(:integer) }
  it { should have_db_column(:contract_id).of_type(:integer) }

  it { should belong_to(:contract) }
  it { should belong_to(:account) }

  it { should have_many(:pages).dependent(:destroy) }
end
