class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  #Get all users
  get "/users" do
    users = User.all.order(:name)
    users.to_json
  end

  #Get current's user's object with trips and hotels
  get "/currentuser/:id" do
    user = User.find(params[:id])
    user.to_json(include: {trips: {include: :hotel}})
  end

  #Search for user
  get "/user/search/:name" do
    user = User.find_by(name: params[:name])
    user.to_json(include: {trips: {include: :hotel}})
  end

  #Get hotels, limit 5
  get "/hotels" do
    hotels = Hotel.all.order(:name).limit(5)
    hotels.to_json
  end


  #Get trips for specific user ID
  get "/users/:id" do
    user = User.find(params[:id])
    userTrips = user.trips.order(:check_in)
    userTrips.to_json(include: :hotel)
  end

  #New user create
  post "/users" do
    response = {message: "Username exists!"}
    user = User.find_by(username: params[:username])
    if user.is_a?(User)
      return response.to_json
    else
      new_user = User.create(
      username: params[:username]
    )
    return new_user.to_json(include: {trips: {include: :hotel}})
    end
  end

  #New trip create
  post "/trips" do
    user = User.find_by(id: params[:user_id])
    trip = user.trips.create(
      destination: params[:destination],
      cost: params[:cost],
      check_in: params[:check_in],
      check_out: params[:check_out],
      #user_id: params[:user_id],
      hotel_id: params[:hotel_id]
    )

    trip.to_json
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
