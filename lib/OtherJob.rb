=begin
Class Job defines the different positions an employee can hold  in the company.
Every Job has an associated salary, which is the base salary for an employee with that Job. 
=end 
class OtherJob
    # Keeps track of how many different Jobs have been created so far.
    @@curr_id = 0

    # The number of Jobs created so far
    def self.get_quantity_Jobs()
        return @@curr_id
    end

    # Initializes a new Job. Name is the Job's description and salary is the base salary.
    def initialize(name, salary)
        @@curr_id += 1
        @id = @@curr_id
        @name = name
        @salary = salary.to_i
    end

    # Updates salary
    def set_salary(new_salary)
        @salary = new_salary
    end

    # Returns salary value
    def get_salary()
        return @salary
    end

    # Returns Job's description
    def get_name()
        return @name
    end

    # Alter Job's description
    def set_name( new_name)
        @name = new_name
    end

end