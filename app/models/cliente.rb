class Cliente < ApplicationRecord
  before_save :set_nombre_completo
  after_create :set_codigo

  # after_save :reindex_movements
  # before_destroy :reindex_movements

  belongs_to :casino

  has_many :movimientos_como_emisor, as: :emisor, class_name: "Movimiento"
  has_many :movimientos_como_receptor, as: :receptor, class_name: "Movimiento"

  # validates :nombre, :apellido, :codigo, presence: true
  # validates :codigo, uniqueness: true

  searchable do
    text :nombre_completo
    string :nombre_completo
    string :codigo
    string :documento
    boolean :esta_presente
    # text :emitidos do
    #   movimientos_como_emisor.map { |movimiento| movimiento.hora }
    # end
    # text :recibidos do
    #   movimientos_como_receptor.map { |movimiento| movimiento.hora }
    # end
    # join(:movimientos_como_emisor, target: Movimiento, type: :time, join: { from: :cliente_id, to: :id }, as: 'hora_e')
    # date :movimientos, multiple: true do
    #   movimientos_como_emisor.map(&:hora) + movimientos_como_receptor.map(&:hora)
    # end
  end

  # def reindex_movements
  #   Sunspot.index(movimientos)
  # end

  # protected

  def set_nombre_completo
    self.nombre_completo = [nombre, apellido].join(" ")
  end

  def set_codigo
    self.codigo = id.to_s.rjust(6, '0')
  end

end
