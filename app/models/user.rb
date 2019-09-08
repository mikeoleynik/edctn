# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :invitable

  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 8..20 }
end
