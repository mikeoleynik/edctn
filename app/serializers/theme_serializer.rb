# frozen_string_literal: true

# == Schema Information
#
# Table name: themes
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ThemeSerializer < BaseSerializer
  attributes :title
end
