class ChatRoom < ApplicationRecord
  validates_presence_of :title
  belongs_to :user
  has_many :messages, dependent: :destroy
end
