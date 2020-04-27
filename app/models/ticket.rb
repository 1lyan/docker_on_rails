class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  validates :request_number,
            :request_type,
            :primary_service_area_code,
            :additional_service_area_codes,
            :well_known_text,
            :response_due_date,
            presence: true

  validates :sequence_number, numericality: true

  validate :response_due_date_check

  def polygon
    well_known_text.gsub('POLYGON((', '').gsub('))', '').gsub('-', '')
  end

  private

  def response_due_date_check
    unless (DateTime.parse(self.response_due_date.to_s) rescue false)
      self.errors[:response_due_date] << 'must be a valid date'
    end
  end
end