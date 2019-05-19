class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  belongs_to :user
  validates :content, length: { minimum: 1 }
  validates :content, presence: true
end
