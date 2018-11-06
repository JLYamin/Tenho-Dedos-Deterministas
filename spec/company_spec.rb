require "company"
require "employee"
require "date"

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

  it "should be able to calculate avarage salary by sector" 

end

describe Sector do

	before(:each) do
    @sector = Sector.new("Technology", 3)
  end

	it "should have a name associated with it" do
		expect(@sector.name).to eq ("Technology")
	end

	it "should be able to hire an employee" do
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Eng. da Computação")
    expect(@sector.size).to eq (1)
	end

  it "should be able to fire an employee" do
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Eng. da Computação")
    @sector.fire(183000)
    expect(@sector.size).to eq (0)
  end

  it "should be able to increase salary of an employee" do
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Eng. da Computação")
    emp = @sector.raiseSalary(183000, 350).pop
    expect(emp.salary).to eq(1500 + 350)
  end

  it "should be able to advance an employee in ranks #Common Case" do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Eng. da Computação")
    emp = @sector.promote(183000).pop
    expect(emp.job).to eq("Technician")
  end

  it "should be able to advance an employee in ranks #Peculiar Case" do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "CEO", "Eng. da Computação")
    emp = @sector.promote(183000).pop
    expect(emp.job).to eq("CEO")
  end

  it "should be able to correctly grant benefits for directors only #Happy Path"do 
      @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Director", "Eng. da Computação")
      emp = @sector.grantBonus(183000).pop
      expect(emp.salary).to eq(9500 * 1.02)
  end 

  it "should be able to correctly grant benefits for directors only #Sad Path"do 
      @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Eng. da Computação")
      emp = @sector.grantBonus(183000).pop
      expect(emp.salary).to_not eq(9500 * 1.02)
  end 

end