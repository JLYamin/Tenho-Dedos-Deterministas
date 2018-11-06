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

  it "should be able to hire a employee" do 
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    expect(company.sectors[3].size).to eq (1)
  end

  it "should be able to find an employee" do 
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    expect(company.find(183000).name).to eq ("John")
  end

  it "should be able to fire an employee" do
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.fire(183000)
    expect(company.size).to eq (0)
  end

  it "should be able to increase salary of an employee" do
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.raiseSalary(183000, 350)
    emp = company.find(183000)
    expect(emp.salary).to eq(1500 + 350)
  end

  it "should be able to advance an employee in ranks #Common Case" do 
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.promote(183000)
    emp = company.find(183000)
    expect(emp.job).to eq("Technician")
  end

  it "should be able to advance an employee in ranks #Peculiar Case" do 
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "CEO", "Computer Engineering")
    company.promote(183000)
    emp = company.find(183000)
    expect(emp.job).to eq("CEO")
  end

  it "should be able to correctly grant benefits for directors only #Happy Path" do 
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Director", "Computer Engineering")
    company.grantBonus(183000)
    emp = company.find(183000)
    expect(emp.salary).to eq(9500 * 1.02)
  end 

  it "should be able to correctly grant benefits for directors only #Sad Path" do 
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.grantBonus(183000)
    emp = company.find(183000)
    expect(emp.salary).to_not eq(9500 * 1.02)
  end 

  it "should return the salary average" do 
    company = Company.new 
    company.hire("John", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.hire("Anna", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.hire("Elis", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.hire("Leia", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.hire("Tim", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")
    company.hire("Lola", Date.new(1998,1,18), "888.888.888-88", "Technology", "Assistant", "Computer Engineering")

  end

end

describe Sector do

	before(:each) do
    @sector = Sector.new("Technology", 3)
  end

	it "should have a name associated with it" do
		expect(@sector.name).to eq ("Technology")
	end

	it "should be able to hire an employee" do
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Computer Engineering")
    expect(@sector.size).to eq (1)
	end

  it "should be able to create correctly the IDs" do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Computer Engineering")
    @sector.hire("Joanne", Date.new(1998,2,18), "888.888.888-89", "Assistant", "Computer Engineering")
    @sector.fire(183000)
    @sector.hire("Jonathan", Date.new(1998,3,18), "888.888.888-90", "Technician", "Computer Engineering")
    expect(@sector.employees[1].id).to eq (183002)
  end

  it "should be able to find an employee" do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Computer Engineering")
    expect(@sector.find(183000).name).to eq ("John")
  end

  it "should be able to fire an employee" do
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Computer Engineering")
    @sector.fire(183000)
    expect(@sector.size).to eq (0)
  end

  it "should be able to increase salary of an employee" do
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Computer Engineering")
    emp = @sector.raiseSalary(183000, 350).pop
    expect(emp.salary).to eq(1500 + 350)
  end

  it "should be able to advance an employee in ranks #Common Case" do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Computer Engineering")
    emp = @sector.promote(183000).pop
    expect(emp.job).to eq("Technician")
  end

  it "should be able to advance an employee in ranks #Peculiar Case" do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "CEO", "Computer Engineering")
    emp = @sector.promote(183000).pop
    expect(emp.job).to eq("CEO")
  end

  it "should be able to correctly grant benefits for directors only #Happy Path"do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Director", "Computer Engineering")
    emp = @sector.grantBonus(183000).pop
    expect(emp.salary).to eq(9500 * 1.02)
  end 

  it "should be able to correctly grant benefits for directors only #Sad Path"do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Computer Engineering")
    emp = @sector.grantBonus(183000).pop
    expect(emp.salary).to_not eq(9500 * 1.02)
  end 

  it "should return the salary average of the sector" do 
    @sector.hire("John", Date.new(1998,1,18), "888.888.888-88", "Assistant", "Computer Engineering")
    @sector.hire("Jota", Date.new(1989,3,30), "888.888.888-78", "Technician", "Computer Engineering")
    @sector.hire("Josh", Date.new(1997,4,12), "888.888.888-58", "Director", "Computer Engineering")
    @sector.hire("Jana", Date.new(1986,6,28), "888.888.888-98", "COO", "Computer Engineering")

    expect(@sector.average).to eq ((1500+3000+9500+13000)/4.0)
  end

end