import 'package:flutter/material.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    // Dummy data untuk produk/user
    final List<Map<String, String>> dummyProducts = [
      {'id': '1', 'name': 'Laptop Dell', 'price': 'Rp 10.000.000'},
      {'id': '2', 'name': 'Mouse Logitech', 'price': 'Rp 500.000'},
      {'id': '3', 'name': 'Keyboard Mechanical', 'price': 'Rp 1.500.000'},
      {'id': '4', 'name': 'Monitor LG 24"', 'price': 'Rp 2.000.000'},
      {'id': '5', 'name': 'Webcam HD', 'price': 'Rp 800.000'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card sambutan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang, $username',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Anda telah berhasil login ke aplikasi ini.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Judul daftar produk
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Produk',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // ListView untuk daftar produk
            Expanded(
              child: ListView.builder(
                itemCount: dummyProducts.length,
                itemBuilder: (context, index) {
                  final product = dummyProducts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(
                          product['id']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(product['name']!),
                      subtitle: Text(product['price']!),
                      trailing: const Icon(Icons.shopping_cart),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product['name']} ditambahkan ke keranjang'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Tombol ke Profile
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(username: username),
                  ),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('Lihat Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}