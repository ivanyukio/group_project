User.create(name: :Ivan,email: "ivan@gmail.com", password: "123", password_confirmation: "123")
User.create(name: :Rayan,email: "rayan@gmail.com", password: "123", password_confirmation: "123")
User.create(name: :James,email: "james@gmail.com", password: "123", password_confirmation: "123")
User.create(name: :Lucas,email: "lucas@gmail.com", password: "123", password_confirmation: "123")

Category.create(name: :Furniture)
Category.create(name: :Pets)
Category.create(name: :Gadgets)
Category.create(name: :Housing)

Item.create(name: :Bed, description: "Very comfy", price: "Free", user_id: 1, category_id: 1)
Item.create(name: :Salsa, description: "Has fur", price: "Free", user_id: 2, category_id: 2)
Item.create(name: :MacBook, description: "Very power", price: "99999", user_id: 3, category_id: 3)
Item.create(name: :Room, description: "Very roomy", price: "A million dollars", user_id: 4, category_id: 4)

Comment.create(content: "This bed has bedbugs", user_id: 3, item_id: 1)