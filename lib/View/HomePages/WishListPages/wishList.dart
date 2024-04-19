import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView(
        children: [
          ProductItem(
            name: 'IPhone',
            rating: 3.0,
            image: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
            price: 200,
          ),
          ProductItem(
            name: 'IPhone X 2',
            rating: 3.0,
            image: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
            price: 400,
          ),
          // Add more ProductItem widgets for other products
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final double rating;
  final String image;
  final double price;

  const ProductItem({
    required this.name,
    required this.rating,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(
          image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text(rating.toString()),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Remove the product from the wishlist
            // Implement your logic here
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WishList(),
  ));
}
