class Reservation < ApplicationRecord
 belongs_to :user
 belongs_to :room
 
 validates :start_date, presence: true
 validates :end_date, presence: true
 validates :total_people, presence: true
 validate :valid_eligiblity_range?
 validate :pretend_ago

def pretend_ago
    today = Date.today
    
    return unless start_date? && today
    
    if !start_date.after?(today)
    errors.add(:start_date, 'must be after Today')
    end
end

def valid_eligiblity_range?
    return unless end_date? && start_date?

    if !end_date.after?(start_date)
      errors.add(:start_date, "must be before Expiration Date")
      errors.add(:end_date, "must be after Start Date")
    end
end
    
 def sum_of_days
  (end_date.to_date - start_date.to_date).to_i
 end

 def sum_of_price
  (room.fee * total_people * sum_of_days).to_i
 end
end
