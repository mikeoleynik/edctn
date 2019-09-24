# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  fullname               :string           not null
#  mentor                 :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_type        :string
#  invited_by_id          :bigint
#  invitations_count      :integer          default(0)
#

class User < ApplicationRecord
  devise :database_authenticatable, :invitable,
         :recoverable, :rememberable, :validatable

  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks

  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 8..20 }
end
