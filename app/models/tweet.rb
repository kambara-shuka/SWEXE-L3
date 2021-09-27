class Tweet < ApplicationRecord
    validates :message, presence: true, length: { in:0..140 }
end
