ActiveAdmin.register User do
  permit_params :email, :password, :user_name

  index do
    selectable_column
    id_column
    column :email
    column :user_name
    actions
  end

  filter :email
  filter :user_name

  form do |f|
    f.inputs do
      f.input :user_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
