class Pedidoburger < ApplicationRecord
  belongs_to :pedido

  has_many :ingredientepedidos
end
