class Breed < ApplicationRecord
  ANIMAL_TYPES = { cow: "Cow" }

  enum animal_type: ANIMAL_TYPES
end
