import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HotelUI(), debugShowCheckedModeBanner: false));
}

class HotelUI extends StatelessWidget {
  const HotelUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue[100],
        child: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.update_outlined),
              title: Text("Update"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
            ),
            ListTile(
              leading: Icon(Icons.reviews_outlined),
              title: Text("Review"),
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title: Text("Feedback"),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180.0),
        child: AppBar(
          title: const Text(""),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "Search your locations...",
                    style: TextStyle(fontSize: 20, color: Colors.redAccent),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for something",
                        hintStyle: TextStyle(color: Colors.grey[200]),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.grey),
                          onPressed: () {},
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.cyan[700],
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    color: Colors.red,
                    child: const Icon(Icons.hotel, color: Colors.white, size: 30),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    color: Colors.blue,
                    child: const Icon(Icons.restaurant,
                        color: Colors.white, size: 30),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    color: Colors.orange,
                    child: const Icon(Icons.local_cafe,
                        color: Colors.white, size: 30),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Column(
                children: [
                  _buildHotelCard(),
                  const SizedBox(height: 20),
                  _buildHotelCard(),
                  const SizedBox(height: 20),
                  _buildHotelCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              'assets/images/hotelroom.jpg',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Awesome Room near Boddha",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Boddha, Kathmandu",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.green),
                        Icon(Icons.star, color: Colors.green),
                        Icon(Icons.star, color: Colors.green),
                        Icon(Icons.star, color: Colors.green),
                        Icon(Icons.star_half, color: Colors.green),
                      ],
                    ),
                    const SizedBox(width: 5),
                    const Text("(220 reviews)"),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text(
                "\$40",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}