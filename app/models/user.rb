# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :invitable,
         :recoverable, :rememberable, :validatable

  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks

  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 8..20 }
end
