# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @airport_code = Airport.all.map { |airport| [airport.code, airport.id] }
    @flight_dates = Flight.pluck(:start_datetime).map(&:to_date).uniq

    # Get the search parameters from the query string
    @departure_code = params[:departure_airport_id]
    @arrival_code = params[:arrival_airport_id]
    @date = Date.parse(params[:start_datetime]) if params[:start_datetime].present?
    @num_tickets = params[:number_of_passengers].to_i

    # Retrieve the matching flights based on the search criteria
    if @date.present?
      @flights = Flight.where(departure_airport_id: @departure_code, arrival_airport_id: @arrival_code)
                       .where(start_datetime: @date.beginning_of_day..@date.end_of_day)
    end

    # Render the index template
    render 'index'
  end
end
