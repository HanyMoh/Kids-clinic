User.delete_all
User.create(id: 1, password:'123456', password_confirmation:'123456', is_admin: true, email: 'hanymoh@msn.com', is_active: true)
