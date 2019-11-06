class Student < ApplicationRecord
    has_many :appointments
    has_many :schedules
end
