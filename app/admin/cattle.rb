ActiveAdmin.register Cow do
  menu priority: 2

  config.create_another = true

  permit_params :tag, :genre, :birth_date, :breed_id

  filter :tag
  filter :breed, as: :select, collection: proc { Breed.cow.order(name: :asc) }
  filter :genre, as: :select, collection: proc { Cow.genre_as_options }
  filter :birth_date

  index do
    column :tag
    column :breed
    column :genre
    column :birth_date
    actions
  end

  form do |f|
    inputs do
      f.input :tag
      f.input :breed
      f.input :genre, collection: Cow.genre_as_options
      f.input :birth_date
    end

    actions
  end

  show do
    attributes_table do
      row :tag
      row :breed
      row(:genre) { |cow| cow.genre_text }
      row :birth_date
    end

    active_admin_comments
  end
end
