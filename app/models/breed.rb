class Breed < ApplicationRecord
  # FIXME: Move this to Animal class
  ANIMAL_TYPES = { cow: "Cow" }

  enum animal_type: ANIMAL_TYPES

  def self.animal_types_as_options
    ANIMAL_TYPES.to_a.map do |type, name|
      translated_name = name.constantize.model_name.human rescue name
      [translated_name, type]
    end
  end

  def animal_type_text
    return "" if animal_type.blank?
    ANIMAL_TYPES[animal_type.to_sym].constantize.model_name.human
  rescue NoMethodError
    ""
  end
end
