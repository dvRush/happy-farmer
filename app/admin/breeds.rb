ActiveAdmin.register Breed do
  I18n.with_options(scope: "admin_menu") do |i18n_menu|
    menu label: i18n_menu.t("manage_breeds"), parent: i18n_menu.t("settings"), priority: 1000
  end

  config.create_another = true

  permit_params :animal_type, :name

  form do |f|
    inputs do
      f.input :animal_type, collection: Breed.animal_types_as_options
      f.input :name
    end

    actions
  end

  index do
    column :name
    column(:animal_type) { |breed| breed.animal_type_text }
    column :updated_at
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row(:animal_type) { |breed| breed.animal_type_text }
      row :updated_at
      row :created_at
    end

    active_admin_comments
  end
end
