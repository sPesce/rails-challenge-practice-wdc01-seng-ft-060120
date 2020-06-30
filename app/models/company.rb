class Company < ApplicationRecord
  has_many :employees
  has_many :offices
  has_many :buildings, through: :offices
end
