import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildBuyPage(),
                Center(child: Text('Sell Page Content')),
              ],
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

  Widget buildBuyPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "See More" tap
                  },
                  child: Text(
                    'See More >',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                categoryItem('assets/google.png'),
                categoryItem('assets/google.png'),
                categoryItem('assets/google.png'),
                categoryItem('assets/google.png'),
                categoryItem('assets/google.png'),
                categoryItem('assets/google.png'),
                categoryItem('assets/google.png'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildProductGrid(),
          ),
        ],
      ),
    );
  }

  Widget categoryItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(imagePath, height: 50, width: 50),
          ),
        ],
      ),
    );
  }

  Widget buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6, // Replace with dynamic count
      itemBuilder: (context, index) {
        return buildProductItem();
      },
    );
  }

  Widget buildProductItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            'assets/product.png',
            fit: BoxFit.cover, // Ensure the image covers the space
            width: double.infinity, // Expand to full width of the column
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Product Title',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'Product description goes here. It might be a little longer so we use multiple lines.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
