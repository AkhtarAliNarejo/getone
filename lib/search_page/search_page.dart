import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _location = "Sukkur";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        //title: Text('Home'), // Simple title in AppBar
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                // ToggleButtons aligned to the left
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                    child: Container(
                      child: ToggleButtons(
                        isSelected: [
                          _tabController.index == 0,
                          _tabController.index == 1
                        ],
                        onPressed: (int index) {
                          setState(() {
                            _tabController.animateTo(
                                index); // Change the tab when toggled
                          });
                        },
                        borderRadius: BorderRadius.circular(
                            20.0), // Rounded corners for individual buttons
                        fillColor: Colors.blue,
                        selectedColor: Colors.white,
                        color: Colors.black,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('Buy'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('Sell'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 2, // Adjust flex to fit the buttons horizontally
                ),
                // Location icon and text aligned to the right
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(_location, style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          // Content Section
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 3, // Adjust based on the number of items
              itemBuilder: (context, index) {
                return buildItemCard();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget buildItemCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.symmetric(
          vertical: 8.0), // Adds spacing between cards
      elevation: 2.0, // Adds shadow to the card
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Slightly reduces padding
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns text to the start
          children: [
            // Product Image
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(8.0), // Rounded corners for the image
              child: SizedBox(
                height: 120, // Adjust the height as needed
                width: double
                    .infinity, // Makes the image take up the full width of the card
                child: Image.asset(
                  'assets/login.png', // Replace with your image asset
                  fit: BoxFit
                      .cover, // Ensures the image fits within the container
                ),
              ),
            ),
            SizedBox(height: 8), // Space between image and text
            // Product Title
            Text(
              'Product Title',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow:
                    TextOverflow.ellipsis, // Ensures long titles are truncated
              ),
              maxLines: 1, // Limits title to one line
            ),
            SizedBox(height: 4), // Space between title and description
            // Product Description
            Text(
              'Product description goes here. It might be a little longer so we use multiple lines.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                overflow: TextOverflow.ellipsis, // Truncates long descriptions
              ),
              maxLines: 2, // Limits description to two lines
            ),
            SizedBox(height: 8),
            // Product Price
            Text(
              'Price: \$20.0',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
