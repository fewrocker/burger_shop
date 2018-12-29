class Pedido < ApplicationRecord
  belongs_to :user

  has_many :pedidobebidas, dependent: :destroy
  has_many :pedidoburgers, dependent: :destroy
end
