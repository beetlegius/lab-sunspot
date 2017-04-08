class Movimiento < ApplicationRecord
  # after_save :reindex_cliente
  # after_destroy :reindex_cliente

  belongs_to :emisor, polymorphic: true, counter_cache: :movimientos_como_emisor_count
  belongs_to :receptor, polymorphic: true, counter_cache: :movimientos_como_receptor_count

  # searchable do
  #   text :name
  #   text :cliente do
  #     cliente.fullname
  #   end
  #
  #   float :ammount
  # end
  #
  # def reindex_cliente
  #   Sunspot.index(cliente)
  # end
end
