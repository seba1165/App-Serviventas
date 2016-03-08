class OrdenDeDespacho < ActiveRecord::Base
  belongs_to :estado_od, foreign_key: "od_est_cod"
end
