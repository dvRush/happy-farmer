module HasGenreAsEnum
  extend ActiveSupport::Concern

  GENRE_OPTIONS = { male: "M", female: "F" }

  included do
    enum genre: GENRE_OPTIONS

    def self.genre_as_options
      GENRE_OPTIONS.map do |key, _|
        [
          I18n.t("#{genre_enum_i18n_key}.#{key}"),
          key
        ]
      end
    end

    def genre_text
      return "" if self.genre.blank?
      I18n.t("#{self.class.genre_enum_i18n_key}.#{self.genre}")
    end

    private

    def self.genre_enum_i18n_key
      "activerecord.enums.#{self.to_s.tableize.singularize}.genre"
    end
  end
end
