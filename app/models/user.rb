class User < ApplicationRecord
    has_many :reviews
    has_many :recipes, through: :reviews
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
    validates :username, uniqueness: true, presence: true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(18)
        end
    end

end
