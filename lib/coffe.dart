import 'dart:math';

class Coffee {
  final String title;
  final String image;
  final String description;
  final String shortDesc;
  final double price;
  final double rating;

  Coffee({
    required this.title,
    required this.image,
    required this.description,
    required this.shortDesc,
    required this.price,
    required this.rating,
  });
}

List<Coffee> coffeeList = [
  Coffee(
    title: "Cappuccino",
    image: "assets/1.png",
    description:
        "Cappuccino is an espresso-based coffee drink that originated in Italy. It consists of espresso, steamed milk, and milk foam. This creamy and frothy beverage is loved for its balanced flavors.",
    price: 4.50,
    rating: Random().nextDouble() * 5,
    shortDesc: 'Drizzled with Caramel',
  ),
  Coffee(
      title: "Latte",
      image: "assets/2.jpg",
      description:
          "A latte is a coffee drink made with espresso and steamed milk. It has a higher proportion of milk to espresso compared to a cappuccino. Often served with a small amount of foam, it offers a smooth and mild taste.",
      price: 3.99,
      rating: Random().nextDouble() * 5, // Random rating between 0 and 5
      shortDesc: 'Drizzled with Caramel'),
  Coffee(
    title: "Mocha",
    image: "assets/3.jpeg",
    description:
        "Mocha coffee is a combination of espresso, hot milk, and chocolate. It's a delightful blend of coffee and sweetness, appealing to those who enjoy the richness of chocolate alongside their coffee.",
    price: 4.75,
    rating: Random().nextDouble() * 5, // Random rating between 0 and 5
    shortDesc: 'Drizzled with Caramel',
  ),
  Coffee(
    title: "Americano",
    image: "assets/4.webp",
    description:
        "An Americano is a coffee drink prepared by diluting espresso with hot water, giving it a similar strength to brewed coffee. It provides a bold and rich flavor profile, making it a favorite among coffee enthusiasts.",
    price: 3.25,
    rating: Random().nextDouble() * 5, // Random rating between 0 and 5
    shortDesc: 'Drizzled with Caramel',
  ),
];
