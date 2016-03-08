class Accesorio < ActiveRecord::Base
	attr_accessible  :art_cod, :art_tipo_cod, :art_nom, :art_stock, :art_precio

	validates :art_cod, :presence => true, :uniqueness => true
	validates :art_tipo_cod, :presence => true, numericality: { only_integer: true, greater_than: 0 }
	validates :art_stock, :presence => true, numericality: { only_integer: true, greater_than: 0 }
	validates :art_precio, :presence => true, numericality: { only_integer: true, greater_than: 0 }
end
