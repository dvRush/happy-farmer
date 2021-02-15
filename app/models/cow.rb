# fronzen_string_literal: true

class Cow < Animal
  include HasGenreAsEnum

  belongs_to :breed, -> { where(animal_type: "Cow") }, optional: true

  has_many :inseminations, foreign_key: :animal_id

  def to_s
    [self.class.model_name.human, self.tag].reject(&:blank?).join(" ")
  end
end
