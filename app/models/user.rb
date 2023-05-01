class User < ApplicationRecord
    has_secure_password
    has_many :questions
    has_many :answers

    def full_name
        "#{first_name} #{last_name}"
    end

    validates :email, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true


end
