class Trip < ActiveRecord::Base
    belongs_to :user
    belongs_to :hotel

    def list_user
        self.user.name
    end

    def list_hotel
        self.hotel.name
    end

    


end