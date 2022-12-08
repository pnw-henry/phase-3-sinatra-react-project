class User < ActiveRecord::Base
    has_many :trips
    has_many :hotels, through: :trips
end