class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #Search for user
  get "/user/search/:username" do
    user = User.find_by(username: params[:username])
    user.to_json(include: {trips: {include: :hotel}})
  end

  #Get hotels, limit 5
  get "/hotels" do
    hotels = Hotel.all.order(:name).take(5)
    hotels.to_json
  end

  #New user create
  post "/users" do
    user = User.find_by(username: params[:username])
    if user.is_a?(User)
      response = user.username.to_json
    else
      new_user = User.create(
      username: params[:username]
    )
    response = new_user.to_json(include: {trips: {include: :hotel}})
    end
    response
  end

  #New trip create
  post "/trips" do
    user = User.find_by(id: params[:user_id])
    trip = user.trips.create(
      destination: params[:destination],
      cost: params[:cost],
      check_in: params[:check_in],
      check_out: params[:check_out],
      hotel_id: params[:hotel_id]
    )

    trip.to_json(include: :hotel)
  end

  #New hotel create
  post "/hotels" do
    hotel = Hotel.create(
      name: params[:name],
      location: params[:location]
    )
    hotel.to_json
  end

  #Update trip hotel
  patch "/trips/:id" do
    trip = Trip.find(params[:id])
    trip.update(
      hotel_id: params[:hotel_id]
    )
    trip.to_json(include: :hotel)
  end

  #Delete trip
  delete "/trips/:id" do
  trip = Trip.find(params[:id])
  trip.destroy
  trip.to_json
  end

end
