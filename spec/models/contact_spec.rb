# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  content    :text
#  email      :string           not null
#  name       :string           not null
#  status     :integer          default("yet")
#  title      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
