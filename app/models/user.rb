class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts

  has_many :contacts_received,
    class_name: :ContactShare

  has_many :shared_contacts,
    through: :contacts_received,
    source: :contacts
end
