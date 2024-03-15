class SharedVideo < ApplicationRecord
  belongs_to :user

  delegate :email, to: :user, prefix: true
end
