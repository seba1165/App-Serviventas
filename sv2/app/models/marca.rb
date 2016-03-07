class Marca < ActiveRecord::Base
  has_many :modelos, :foreign_key => :modelo_cod

  validates :marca_nombre, :presence => true, :uniqueness => true
end
