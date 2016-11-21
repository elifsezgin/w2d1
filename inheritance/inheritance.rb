require "byebug"

class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def boss=(boss)
    @boss = boss
    @boss.employees << self
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total = 0
    employees.each do |employee|
      if employee.class == Employee
        total += employee.salary * multiplier
      else
        total += employee.bonus(multiplier) + employee.salary * multiplier
      end
    end

    total
  end
end
