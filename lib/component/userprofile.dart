class UserProfile {
  final String name;
  final int age;
  final String description;
  final List<String> imageUrls; // Change from String to List<String>

  UserProfile({
    required this.name,
    required this.age,
    required this.description,
    required this.imageUrls,
  });
}

// Create a list of UserProfile instances
List<UserProfile> userProfiles = [
  UserProfile(
    name: "Mark Lee",
    age: 25,
    description: "You can mark me in your heart.",
    imageUrls: [
      "assets/images/mark-1.jpg",
      "assets/images/mark-2.jpg",
    ],
  ),
  UserProfile(
      name: "real__pcy",
      age: 28,
      description: "แอ๋วจ๋าพี่มาแล้ว",
      imageUrls: [
        "assets/images/cy1.jpg",
        "assets/images/cy2.jpg",
        "assets/images/cy3.jpg",
        "assets/images/cy4.jpg"
      ]),
  UserProfile(
      name: "beakhyunee_",
      age: 28,
      description: "แอ๋วจ๋าพี่มาแล้ว",
      imageUrls: [
        "assets/images/baek4.jpg",
        "assets/images/baek2.jpg",
        "assets/images/baek1.jpg"
      ]),
  UserProfile(
      name: "Anton Lee",
      age: 20,
      description: "make the impossible possible",
      imageUrls: [
        "assets/images/anton1.jpg",
      ]),
  UserProfile(
      name: "Park Wonbin",
      age: 22,
      description: "Chrome Heart lover",
      imageUrls: [
        "assets/images/wonbin1.jpg",
      ]),
  UserProfile(
      name: "jung Sungchan",
      age: 28,
      description: "bog bog",
      imageUrls: [
        "assets/images/jss1.jpg",
      ]),
  UserProfile(
      name: "mille",
      age: 28,
      description: "Action = Rection ส่วนผมแอ็กจัด",
      imageUrls: [
        "assets/images/hj1.jpg",
      ]),
  UserProfile(
    name: "JUJU", 
    age: 28, 
    description: "#ผู้บ่าวไทบ้าน", 
    imageUrls: [
    "assets/images/juyeon1.jpg",
  ]),
];

// Global list to store liked profiles
List<UserProfile> likedUsers = [];
