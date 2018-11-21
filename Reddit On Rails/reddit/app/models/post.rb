# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  url        :string
#  content    :string
#  sub_id     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  
  validates :title, presence: true
  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
end
