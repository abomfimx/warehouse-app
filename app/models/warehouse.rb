class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :cep, :description, presence: true
end
