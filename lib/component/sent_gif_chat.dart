import 'package:flutter/material.dart';

class SendGIF extends StatefulWidget {
  const SendGIF({super.key});

  @override
  _SendGIFState createState() => _SendGIFState();
}

class _SendGIFState extends State<SendGIF> {
  // Dummy list of GIFs (in a real app, you'd fetch these from an API)
  final List<String> gifUrls = [
    'https://i.pinimg.com/originals/1f/a2/2b/1fa22befc10e3cbacd58c5b407a97997.gif',
    'https://i.pinimg.com/originals/5b/1c/21/5b1c2125d45739c3a88a9f5eb03449da.gif',
    'https://i.pinimg.com/originals/c7/85/42/c7854274d51eeaeedda63283ce185f99.gif',
  ];

  // Search query
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search and Send GIF'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search GIFs...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query; // Update the search query
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: gifUrls.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                childAspectRatio: 1, // Make the grid items square
              ),
              itemBuilder: (context, index) {
                final gifUrl = gifUrls[index];
                return GestureDetector(
                  onTap: () {
                    // When a GIF is selected, return the GIF URL
                    Navigator.pop(context, gifUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(gifUrl), // Display GIF as an image
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
