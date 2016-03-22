class PurchaseHistoric < ActiveRecord::Base
  attr_accessor :clienteAll,:productAll

  belongs_to :client
  belongs_to :product
  validates_associated :client
  validates_associated :product
end
