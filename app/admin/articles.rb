# frozen_string_literal: true

ActiveAdmin.register Article do
  permit_params :title, :body, :user_id

  index do
    selectable_column
    id_column
    column :title, sortable: :title
    column :body, sortable: :body
    column :user
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :user
    end
    f.actions
  end
end
