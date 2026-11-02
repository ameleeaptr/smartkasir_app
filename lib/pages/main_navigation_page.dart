// Mengimpor pustaka antarmuka Material Design utama dari Flutter
import 'package:flutter/material.dart';

// Mengimpor halaman DashboardPage untuk ditampilkan pada tab menu pertama (Beranda)
import 'dashboard_page.dart';

// Komponen/Widget MainNavigationPage turunan StatefulWidget: Mengelola status tab menu yang aktif
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

// Kelas pengelola state dan logika navigasi bawah aplikasi SmartKasir
class _MainNavigationPageState extends State<MainNavigationPage> {
  // DEKLARASI VARIABEL STATE NAVIGASI
  int _currentIndex = 0; // Nilai awal: 0 = Tab Beranda

  // Koleksi layar halaman menu operasional kasir
  final List<Widget> _pages = [
    const DashboardPage(), // Indeks 0: Halaman Dashboard Katalog Kasir
    const Center(
      child: Text(
        'Menu 2: Transaksi Kasir POS (Modul M14)',
        style: TextStyle(fontSize: 16),
      ),
    ), // Indeks 1: POS Kasir
    const Center(
      child: Text(
        'Menu 3: Riwayat Penjualan & Laporan (Modul M12)',
        style: TextStyle(fontSize: 16),
      ),
    ), // Indeks 2: Riwayat
    const Center(
      child: Text(
        'Menu 4: Profil Toko & Pengaturan (Modul M12)',
        style: TextStyle(fontSize: 16),
      ),
    ), // Indeks 3: Pengaturan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan widget halaman secara dinamis dari list _pages sesuai nilai _currentIndex
      body: _pages[_currentIndex],

      // Pembungkus bilah navigasi bawah dengan efek bayangan
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, -2), // Bayangan mengarah ke atas
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex =
                  index; // Mengubah nilai _currentIndex sesuai tab yang diketuk
            });
          },
          type: BottomNavigationBarType
              .fixed, // Mengunci lebar ke-4 tab agar tidak bergeser
          backgroundColor: Colors.white,
          selectedItemColor: const Color(
            0xFF1E3A8A,
          ), // Warna tab aktif: Biru Navy Kasir
          unselectedItemColor:
              Colors.grey.shade500, // Warna tab pasif: Abu-abu netral
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 10),

          // DAFTAR ITEM NAVIGASI BAWAH (4 TAB MENU UTAMA)
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined),
              activeIcon: Icon(Icons.storefront),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Kasir',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              activeIcon: Icon(Icons.receipt_long),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              activeIcon: Icon(Icons.store),
              label: 'Toko',
            ),
          ],
        ),
      ),
    );
  }
}
