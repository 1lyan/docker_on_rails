class Excavator < ApplicationRecord
   belongs_to :ticket

   validates :company_name, :address, presence: true
end