class OrdenDeTrabajo < ActiveRecord::Base
  belongs_to :estado_ot, foreign_key: "ot_est_cod"
  belongs_to :empleado, foreign_key: "emp_rut"
end
