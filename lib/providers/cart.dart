import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/list_food.dart';

class Cart extends ChangeNotifier {
  // List untuk menyimpan item-item dalam keranjang
  List<ListFood> _items = [];

  // Getter untuk mendapatkan item-item dalam keranjang
  List<ListFood> get items => _items;

  // Method untuk menambahkan item ke dalam keranjang
  void addItem(ListFood item) {
    _items.add(item);
    notifyListeners(); // Memberitahu Provider bahwa ada perubahan data
  }

  // Method untuk menghapus item dari keranjang
  void removeItem(ListFood item) {
    _items.remove(item);
    notifyListeners(); // Memberitahu Provider bahwa ada perubahan data
  }

  // Method untuk menghitung total harga semua item dalam keranjang
  double getTotalPrice() {
    double total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }
}
