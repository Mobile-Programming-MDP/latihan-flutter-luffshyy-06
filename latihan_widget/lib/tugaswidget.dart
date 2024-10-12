import 'package:flutter/material.dart';

class GaleriFoto extends StatelessWidget {
  const GaleriFoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeri Foto"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://picsum.photos/id/88/300/200',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              "Jalan di Barcelona",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 2,
              height: 32,
            ),
          ),
          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Icon(Icons.place, color: Colors.red),
              SizedBox(width: 8),
              Text("Lokasi: Barcelona, Spanyol"),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Icon(Icons.calendar_month, color: Colors.blue),
              SizedBox(width: 8),
              Text("Publikasi: 13 Agustus 2013"),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 2,
              height: 32,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "Deskripsi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              "Sebuah persimpangan jalan di Barcelona, Spanyol. Foto ini menampilkan berbagai kendaraan yang bergerak dalam arah yang berbeda, menciptakan pemandangan yang sibuk dan energik.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
