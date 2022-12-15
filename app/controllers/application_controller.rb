class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/users" do
    users = User.all.order(:name)
    users.to_json
  end

  get "/trips" do
    trips = Trip.all
    trips.to_json
  end

  get "/hotels" do
    hotels = Hotel.all.order(:name)
    hotels.to_json
  end

  get "/users/:id" do
    user = User.find(params[:id])
    userTrips = user.trips
    userTrips.to_json(include: :hotel)
  end

  post "/users" do
    user = User.create(
      name: params[:name]
    )
    user.to_json
  end
  
  post "/trips" do
    trip = Trip.create(
      destination: params[:destination],
      cost: params[:cost],
      check_in: params[:check_in],
      check_out: params[:check_out],
      user_id: params[:user_id],
      hotel_id: params[:hotel_id]
    )

    trip.to_json
  end

  post "/hotels" do
    hotel = Hotel.create(
      name: params[:name],
      location: params[:location]
    )
    hotel.to_json
  end

  patch "/trips/:id" do
    trip = Trip.find(params[:id])
    trip.update(
      hotel_id: params[:hotel_id]
    )
    trip.to_json
  end

  delete '/trips/:id' do
  trip = Trip.find(params[:id])
  trip.destroy
  trip.to_json
  end


end
