class TreatmentArea < ActiveRecord::Base
  has_many :procedure_treatment_area_mappings
  has_many :procedures, :through => :procedure_treatment_area_mappings
  has_many :patients, :foreign_key => "assigned_treatment_area_id"
  
  accepts_nested_attributes_for :procedure_treatment_area_mappings, :allow_destroy => true,
                                :reject_if => proc { |attributes| attributes['assigned'] == "0" }
end