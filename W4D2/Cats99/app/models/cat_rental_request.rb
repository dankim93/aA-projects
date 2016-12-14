class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING) }
  validate  :overlapping_approved_requests

  belongs_to :cat

  def overlapping_requests
    # debugger
    CatRentalRequest.find_by_sql([<<-SQL, self.start_date, self.end_date, self.cat_id])
      SELECT
        *
      FROM
        cat_rental_requests
      WHERE
        NOT (? > end_date OR ? < start_date) AND (cat_id = ?)
    SQL
  end

  def overlapping_approved_requests
    conflicts = overlapping_requests
# byebug
    if conflicts.first
      self.errors[:overlapping] << "requests are forbidden"
    end
  end
end
