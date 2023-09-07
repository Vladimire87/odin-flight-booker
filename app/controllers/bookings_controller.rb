# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_tickets = params[:number_of_passengers].to_i
    @booking = Booking.new(flight_id: @flight.id)
    @num_tickets.times { @booking.passengers.build }
  end

  def create
    puts params.inspect
    puts booking_params.inspect
    @booking = Booking.new(booking_params)
    if @booking.save
      PassengerMailer.with(@booking).welcome_email.deliver_now
      redirect_to booking_path(@booking)
    else
      puts params[:flight_id]
      puts @booking.errors.full_messages # Output the error messages in the console
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
