# fronzen_string_literal: true

class Cow < Animal
  include HasGenreAsEnum

  belongs_to :breed, -> { where(animal_type: "Cow") }, optional: true
end
