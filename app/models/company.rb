class Company < ApplicationRecord
  has_many :employees
  has_many :offices
  has_many :buildings, through: :offices
  accepts_nested_attributes_for :offices
  def rent_expense
    rent = 0
    self.buildings.pluck(:rent_per_floor).each do |per_floor|
      rent += per_floor
    end
    rent
  end
end
