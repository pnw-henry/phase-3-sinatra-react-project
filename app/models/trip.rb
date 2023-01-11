class Trip < ActiveRecord::Base
    belongs_to :user
    belongs_to :hotel

    def list_user
        self.user.name
    end

    def list_hotel
        self.hotel.name
    end

    def self.trip_count
        Trip.count
    end

    def self.cheapest_trip
        Trip.all.minimum(:cost)
    end

    def self.most_expensive_trip
        Trip.all.maximum(:cost)
    end

    def self.list_first_trip
        Trip.first
    end

    def self.list_last_trip
        Trip.last
    end

    def self.destroy_by_destination(destination)
        destination = Trip.find_by(destination: destination)
        destination.destroy
    end

    def self.find_all_trips_by_hotel(hotel)
        hotel = Hotel.find_by(name: hotel)
        hotel_id = hotel.id
        Trip.all.where(hotel_id: hotel_id)
    end

end