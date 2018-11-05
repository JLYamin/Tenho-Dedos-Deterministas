require "company"
require "employee"

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

  it "should be able to hire a employee" do 
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Eng. da Computação")
    expect(company.sectors[3].size).to eq (1)
  end
end

describe Sector do

	before(:each) do
    @sector = Sector.new("Technology", 3)
  end

	it "should have a name associated with it" do
		expect(@sector.name).to eq ("Technology")
	end

	it "should be able to hire a employee" do
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Eng. da Computação")
    expect(@sector.size).to eq (1)
	end

end