class User < ActiveRecord::Base
    has_many :trips
    has_many :hotels, through: :trips

    def self.list_user_trips_by_id(id)
        user = User.find(id)
        user.trips
    end

    def self.list_user_trips_by_name(name)
        user = User.find_by(name: name)
        user.trips
    end

    def self.delete_user_by_id(id)
        user = User.find(id)
        user.destroy
    end

    def trip_count
        self.trips.count
    end

    def find_expensive_trips
        self.trips.where("cost > 1000")
    end

    def list_destinations
        self.trips.map do |trip|
            "#{trip.destination}"
        end
    end

    def delete_all_trips
        self.trips.destroy_all
    end

    def find_last_trip_added_by_user(id)
         user = User.find(id)
         user.trips.last
    end

    def find_upcoming_trip_by_user(id)
        userTrips = User.find(id).trips.order(:check_in)
        currentDate = Time.new.to_i
    end


end