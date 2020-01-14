3.times { |i| User.create(name: 'Tester', email: "user#{i}@gmail.com", password: '123456') }
