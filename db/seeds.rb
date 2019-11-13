Item.destroy_all
Transaction.destroy_all




item_nike = Item.create({ brand: 'Nike', item_name: 'Jacket', quanity: '12', cost: '100.99',})
item_nike = Item.create({ brand: 'Nike', item_name: 'Shirt', quanity: '14', cost: '45.80',})
item_nike = Item.create({ brand: 'Nike', item_name: 'Joggers', quanity: '30', cost: '55.33',})
item_adidas = Item.create({ brand: 'Adidas', item_name: 'Wind-Breaker', quanity: '120', cost: '50.99',})
item_adidas = Item.create({ brand: 'Adidas', item_name: 'Joggers', quanity: '40', cost: '55.99',})
item_adidas = Item.create({ brand: 'Adidas', item_name: 'Shirt', quanity: '99', cost: '45.99',})
item_adidas = Item.create({ brand: 'Adidas', item_name: 'Shoes', quanity: '140', cost: '50.99',})
item_supreme = Item.create({ brand: 'Supreme', item_name: 'Shirt', quanity: '30', cost: '85.19',})
item_supreme = Item.create({ brand: 'Supreme', item_name: 'Jacket', quanity: '33', cost: '185.99',})
item_supreme = Item.create({ brand: 'Supreme', item_name: 'Shirt x Fear of G0d', quanity: '1', cost: '9999.99',})
item_supreme = Item.create({ brand: 'Supreme', item_name: 'Shoes', quanity: '83', cost: '350.99',})
item_supreme = Item.create({ brand: 'Supreme', item_name: 'Pants', quanity: '99', cost: '77.99',})
item_gucci = Item.create({ brand: 'Gucci', item_name: 'Belt', quanity: '80', cost: '450.70',})
item_gucci = Item.create({ brand: 'Gucci', item_name: 'Shoes', quanity: '1', cost: '500.00',})
item_gucci = Item.create({ brand: 'Gucci', item_name: 'Wallet', quanity: '30', cost: '430.70',})
item_gucci = Item.create({ brand: 'Gucci', item_name: 'Jacket', quanity: '99', cost: '800.70',})
item_fendi = Item.create({ brand: 'Fendi', item_name: 'Jacket', quanity: '99', cost: '200.50',})
item_fendi = Item.create({ brand: 'Fendi', item_name: 'Shirt', quanity: '99', cost: '700.50',})
item_fendi = Item.create({ brand: 'Fendi', item_name: 'Pants', quanity: '99', cost: '100.50',})
item_off_white = Item.create({ brand: 'Off-White', item_name: 'Shoes', quanity: '30', cost: '1000.99',})
item_off_white = Item.create({ brand: 'Off-White', item_name: 'Shirt VLONE', quanity: '30', cost: '10.99',})
item_off_white = Item.create({ brand: 'Off-White', item_name: 'Pants', quanity: '30', cost: '10000.99',})
item_off_white = Item.create({ brand: 'Off-White', item_name: 'Belt', quanity: '30', cost: '10000.99',})


transaction = Transaction.create({shipping_location: 'Texas', order_number: 193234, item: item_adidas })
transaction = Transaction.create({shipping_location: 'Oklahoma', order_number: 195214, item: item_nike})
transaction = Transaction.create({shipping_location: 'New-York', order_number: 196694, item: item_gucci})
transaction = Transaction.create({shipping_location: 'Flordia', order_number: 192284, item: item_off_white})
transaction = Transaction.create({shipping_location: 'Brooklyn', order_number: 197834, item: item_supreme})
transaction = Transaction.create({shipping_location: 'IDK', order_number: 193442, item: item_fendi})