ActiveAdmin.register Insemination do
  menu priority: 3

  config.create_another = true

  permit_params :inseminated_at, :animal_id

  filter :inseminated_at

  index do
    column :inseminated_at
    column :animal
    actions
  end

  show do
    attributes_table do
      row :inseminated_at
      row :animal
    end

    active_admin_comments
  end
end

