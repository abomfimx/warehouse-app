class Warehouse < ApplicationRecord
  validates :name, :code, :address, :cep, :city, :area, :description, presence: true
  validates :name, uniqueness: true
  validates :code, uniqueness: true
  validates :code, length: { is: 3 }
  validates :cep, format: { with: /\A[0-9]{5}-[0-9]{3}\z/, message: ' - formato inválido' }
end
