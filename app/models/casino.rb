class Casino < ApplicationRecord
  has_many :clientes, dependent: :destroy
end
