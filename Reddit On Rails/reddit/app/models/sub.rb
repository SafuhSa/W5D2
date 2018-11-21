# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord


  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :User
end
