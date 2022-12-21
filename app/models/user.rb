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

    def self.find_upcoming_trip_by_user(id)
        user_trips = User.find(id).trips
        current_date = Time.new.to_i

        check_in_to_int = user_trips.map do |trip|
            trip_date = trip.check_in.to_time.to_i;
            if (trip_date > current_date)
                trip.check_in = trip_date
                trip
            end
        end

        first_trip = check_in_to_int.sort_by(&:check_in).first
        first_trip.check_in = Time.at(first_trip.check_in)
        first_trip
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
end