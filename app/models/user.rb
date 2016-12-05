class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy

  has_many :contacts_received,
    class_name: :ContactShare,
    dependent: :destroy

  has_many :shared_contacts,
    through: :contacts_received,
    source: :contacts
end
