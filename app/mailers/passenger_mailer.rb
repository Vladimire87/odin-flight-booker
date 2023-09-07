class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @booking = Booking.find(params[:id])
    @passengers = Passenger.find @booking.passenger_ids
    mail(to: @passengers.first.email, subject: 'Welcome to My Awesome Site')
  end
end
