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

  it "should create each one of the sectors when instanciated" do
  	company = Company.new
  	company.sectors.each do |sector|
  		expect(sector.name).not_to be_nil
  	end
  end

  it "should be inoperative when just instanciated" do
  	company = Company.new
  	expect(company.isOperant?).to eq (false)
	end
end

describe Sector do
	
	it "should have a name associated with it" do
		sector = Sector.new("Executive")
		expect(sector.name).to eq ("Executive")
	end

end