# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  birthday        :date
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  validates :name,
    presence: true,
    uniqueness: true,
    length: {maximum: 16},
    #\Aはファイルの戦闘にマッチ、\zはファイルの末尾にマッチ、[a-z0-9]は任意の小文字英数字、+は直前の文字の1回以上の繰り返し
    format: {
      with: /\A[a-z0-9]+\z/,
      message: "は小文字英数字で入力してください"
    }
  validates :password,
    length: { minimum: 8 }
  
  def age
    now = Time.zone.now
    (now.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000
  end
end
