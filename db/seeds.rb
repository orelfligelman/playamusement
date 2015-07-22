Eventpackage.create! id: 1, name: "birthday", price: 349, active: true
Eventpackage.create! id: 2, name: "birthday", price: 249.00, active: true
Eventpackage.create! id: 3, name: "birthday", price: 249.00, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"