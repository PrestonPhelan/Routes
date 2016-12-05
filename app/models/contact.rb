class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id }

  belongs_to :owner,
    foreign_key: :user_id,
    class_name: :User

  has_many :shares,
    class_name: :ContactShare

  has_many :shared_users,
    through: :shares,
    source: :users
end
