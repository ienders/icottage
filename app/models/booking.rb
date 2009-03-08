class Booking < ActiveRecord::Base
  
  has_and_belongs_to_many :users
  
  def self.find_bookings_for_month(year, month)
    self.find(:all,
      :conditions => [ 
        "(start_date BETWEEN :start and :end) OR (end_date BETWEEN :start and :end) OR (start_date < :start AND end_date > :end)",
        { :start => Date.civil(year, month, 1),
          :end   => Date.civil(year, month, -1)
        }
      ],
      :order => "start_date ASC"
    )
  end
  
end
