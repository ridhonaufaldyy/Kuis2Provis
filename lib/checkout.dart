import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/list_food.dart';

class CheckoutPage extends StatelessWidget {
  final List<ListFood> cartItems;

  const CheckoutPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final ListFood food = cartItems[index];
          return ListTile(
            title: Text(food.nama),
            subtitle: Text('\$${food.price}'),
            leading: Image.asset(food.image),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              // Logika untuk menyelesaikan pembayaran
            },
            child: Text('Checkout'),
          ),
        ),
      ),
    );
  }
}
