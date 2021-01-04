# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  remark     :text
#  status     :integer
#  title      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Contact < ApplicationRecord
  enum title: %i( service relationship job other )
  enum status: %i( yet done )

  after_initialize :set_default, if: :new_record?

  def set_default
    self.status ||= :yet
  end
end
