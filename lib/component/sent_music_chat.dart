import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SentMusic extends StatelessWidget {
  final List<Map<String, String>> popularSongs = [
    {
      'title': 'sticky',
      'artist': 'KISS OF LIFE',
      'image': 'assets/images/sticky.jpg',
      'url': 'https://open.spotify.com/track/4e1aewX6ATPcdfQIqr7gqO?si=28adbc43c9a54850'
    },
    {
      'title': 'Boom Boom Bass',
      'artist': 'RIIZE',
      'image': 'assets/images/bbb.jpg',
      'url': 'https://open.spotify.com/track/6Ixrp3yXfzv5brZXmZuXXN?si=7fcaf07dce644d74'
    },
    {
      'title': 'รอเป็นคนถัดไป',
      'artist': 'ตั๊กแตน ชลดา',
      'image': 'assets/images/luktung1.jpg',
      'url': 'https://open.spotify.com/track/7Br99RD0DuS3Tku9iyExXp?si=a14ffa5bf97e4ee3'
    },
    {
      'title': 'ชีวิตเมียเช่า',
      'artist': 'พราว ภัทราวดี',
      'image': 'assets/images/luktung2.jpg',
      'url': 'https://open.spotify.com/track/34ETKzdZ3WSh2an7hhLrF0?si=41f0e5d0e7184d6a'
    },
  ];

  SentMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Send Music"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "เพลงยอดนิยม", // "Popular Songs"
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularSongs.length,
                itemBuilder: (context, index) {
                  final song = popularSongs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context, song); // Return selected song
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              song['image']!,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            song['title']!,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            song['artist']!,
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar for Spotify (not changed)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.white),
                    onPressed: () {
                      // Clear action
                    },
                  ),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'ค้นหาจาก Spotify', // "Search from Spotify"
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  // Function to launch URL (can be kept for future use)
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
