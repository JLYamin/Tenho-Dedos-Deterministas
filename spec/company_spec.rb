require "company"

describe Company do

	it "should create a not nil instance" do
		company = Company.new
    expect(company).not_to be_nil
  end

  it "should have 6 sector" do
  	company = Company.new
  	expect(company.sectors.size).to eq (6)
  end

  xit "should " do
  	
  end
end

describe Sector do
	
end