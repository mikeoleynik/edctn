# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  difficulty :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskSerializer < BaseSerializer
  attributes :title, :body, :difficulty
end
