class Hotel < ActiveRecord::Base
    has_many :trips
    has_many :users, through: :trips

    def self.hotel_count
        Hotel.count
    end

    def self.list_all_hotels
        hotels = Hotel.all
    end

    def self.find_first
        first = Hotel.first
    end

    def self.find_last
        last = Hotel.last
    end

    def self.list_users_by_hotel_name(name)
        hotel = Hotel.find_by(name: name)
        hotel.users
    end

    def self.list_trips_by_hotel_name(name)
        hotel = Hotel.find_by(name: name)
        hotel.trips
    end

    def user_count
        self.users.count
    end

    def trips_count
        self.trips.count
    end
end