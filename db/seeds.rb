3.times { |i| User.create(name: 'Tester', email: "user#{i}@gmail.com", password: '123456') }

Unity.create(name: 'Unidade')

3.times do
  Product.create(
    name: 'teste',
    description: 'testando',
    unity_id: 1
  )
end
