class Item {
  String name;
  double price;
  String desc;
  String imagePath;

  Item({this.name, this.price, this.desc, this.imagePath});
}

class Items {
  List fruits = [
    Item(
      name: 'Apple',
      price: 7.5,
      desc: '6 pieces',
      imagePath: 'images/apple.jpg',
    ),
    Item(
      name: 'Banana',
      price: 1.3,
      desc: '125g',
      imagePath: 'images/banana.jpg',
    ),
    Item(
      name: 'Cherry',
      price: 2.65,
      desc: '100g',
      imagePath: 'images/cherry.jpg',
    ),
    Item(
      name: 'Grapes',
      price: 1.2,
      desc: '125g',
      imagePath: 'images/grapes.jpg',
    ),
    Item(
      name: 'Kiwi',
      price: 9,
      desc: '6 pieces',
      imagePath: 'images/kiwi.jpg',
    ),
    Item(
      name: 'Lemon',
      price: 4.2,
      desc: '6 pieces',
      imagePath: 'images/lemon.jpg',
    ),
    Item(
      name: 'Orange',
      price: 5,
      desc: '6 pieces',
      imagePath: 'images/orange.jpg',
    ),
    Item(
      name: 'Papaya',
      price: 6.8,
      desc: '1 piece',
      imagePath: 'images/papaya.jpg',
    ),
    Item(
      name: 'Pineapple',
      price: 13.8,
      desc: '1 piece',
      imagePath: 'images/pineapple.jpg',
    ),
    Item(
      name: 'Strawberry',
      price: 3.2,
      desc: '150g',
      imagePath: 'images/strawberry.jpg',
    ),
  ];

  List veges = [
    Item(
      name: 'Asparagus',
      price: 1.8,
      desc: '150g',
      imagePath: 'images/asparagus.jpg',
    ),
    Item(
      name: 'Broccoli',
      price: 1.2,
      desc: '100g',
      imagePath: 'images/broccoli.jpg',
    ),
    Item(
      name: 'Carrot',
      price: 1.25,
      desc: '100g',
      imagePath: 'images/carrot.jpg',
    ),
    Item(
      name: 'Cauliflower',
      price: .9,
      desc: '125g',
      imagePath: 'images/cauliflower.jpg',
    ),
    Item(
      name: 'Corn',
      price: 3.2,
      desc: '150g',
      imagePath: 'images/corn.jpg',
    ),
    Item(
      name: 'Green Peas',
      price: .75,
      desc: '100g',
      imagePath: 'images/greenpeas.jpg',
    ),
    Item(
      name: 'Lettuce',
      price: .5,
      desc: '150g',
      imagePath: 'images/lettuce.jpg',
    ),
    Item(
      name: 'Mushroom',
      price: 1.85,
      desc: '125g',
      imagePath: 'images/mushroom.jpg',
    ),
    Item(
      name: 'Onion',
      price: .95,
      desc: '100g',
      imagePath: 'images/onion.jpg',
    ),
    Item(
      name: 'Spinach',
      price: .6,
      desc: '125g',
      imagePath: 'images/spinach.jpg',
    ),
  ];
}
