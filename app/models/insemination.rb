class Insemination < ApplicationRecord
  belongs_to :animal, required: true
end
