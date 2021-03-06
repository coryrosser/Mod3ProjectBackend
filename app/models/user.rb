class User < ApplicationRecord
    has_many :items 
    has_one :profile 
    has_many :line_items
    has_many :trades

    validates :email, presence: true, uniqueness: true 
    validates :location, :first_name, :last_name, presence: true

    after_create :build_profile

    def build_profile
        Profile.create(user: self)
    end
end
