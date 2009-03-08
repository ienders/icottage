class BookingsController < ApplicationController
  
  before_filter { page_title 'Calendar' }
  
  def index
    @users = User.all.sort
    @booking = Booking.new
    @year = params[:year] ? params[:year].to_i : Date.today.year
    @month = params[:month] ? params[:month].to_i : Date.today.month
    
    @previous = { :year => @month == 1  ? @year - 1 : @year, :month => @month == 1  ? 12 : @month - 1 }
    @next     = { :year => @month == 12 ? @year + 1 : @year, :month => @month == 12 ? 1  : @month + 1 }
    
    @booked_days_to_users_attending = {}
    Booking.find_bookings_for_month(@year, @month).each do |booking|
      booking.start_date.upto(booking.end_date) do |date|
        if !@booked_days_to_users_attending[date]
          @booked_days_to_users_attending[date] = []
        end
        @booked_days_to_users_attending[date] << booking.users
        @booked_days_to_users_attending[date] = @booked_days_to_users_attending[date].flatten.uniq.sort
      end
    end
  end
  
  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      flash[:message] = 'Booking was successfully made.'
    end
    redirect_to :action => 'index'
  end
  
end
