class User < ActiveRecord::Base
    has_many :trips
    has_many :hotels, through: :trips

    def self.find_user_by_id(id)
        user = User.find(id)
    end

    def self.list_user_trips_by_id(id)
        user = self.find_user_by_id(id)
        user.trips
    end

    def self.list_user_trips_by_name(name)
        user = User.find_by(name: name)
        user.trips
    end

    def self.delete_user_by_id(id)
        user = self.find_user_by_id(id)
        user.destroy
    end

    def self.list_users_by_alpha_order
        User.all.order(:name)
    end

    def self.find_upcoming_trip_by_user(id)
        user_trips = self.list_user_trips_by_id(id)
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

    def self.get_total_cost_by_user_id(id)
        user_trips = self.list_user_trips_by_id(id)
        sum = 0
        user_trips.map { |trip| sum = trip.cost + sum}
        sum
    end

    def update_username(username)
        self.update(username: username)
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
end