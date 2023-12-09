import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Dog> dogList = [
    Dog(
      0,
      "Hachiko",
      3.5,
      "Male",
      "Brown",
      12.9,
      "389m away",
      "ressources/drawable/blue_dog.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
      Owner(
        "John Doe",
        "Dog Trainer",
        "ressources/drawable-v24/owner.png",
      ),
    ),
    Dog(
      0,
      "Buddy",
      2.5,
      "Male",
      "White",
      10.5,
      "421m away",
      "ressources/drawable/white_dog.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
      Owner(
        "Jane Smith",
        "Dog Enthusiast",
        "ressources/drawable-v24/owner.png",
      ),
    ),
    Dog(
      0,
      "Max",
      4.0,
      "Male",
      "Orange",
      15.0,
      "300m away",
      "ressources/drawable/orange_dog.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
      Owner(
        "Alice Johnson",
        "Animal Lover",
        "ressources/drawable-v24/owner.png",
      ),
    ),
    Dog(
      0,
      "Ruby",
      2.0,
      "Female",
      "Red",
      8.5,
      "250m away",
      "ressources/drawable/red_dog.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
      Owner(
        "Bob Brown",
        "Pet Trainer",
        "ressources/drawable-v24/owner.png",
      ),
    ),
  ];

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Dog List")),
        body: ListView.builder(
          itemCount: dogList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the detail page when a list item is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DogDetailPage(dog: dogList[index]),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white, // Change card color here
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white, // Change circle avatar background color here
                    backgroundImage: AssetImage(dogList[index].imagePath),
                  ),
                  title: Text(
                    dogList[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black, // Change text color here
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${dogList[index].age} yrs | Playful",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54, // Change text color here
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: dogList[index].gender.toLowerCase() == 'male'
                                  ? Colors.blue
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              dogList[index].gender,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text(
                            dogList[index].distance,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DogDetailPage extends StatelessWidget {
  final Dog dog;

  DogDetailPage({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(dog.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildGenderTag(),
                      _buildQuickInfo(),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildAboutMe(),
                  SizedBox(height: 16),
                  _buildDescription(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderTag() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: dog.gender.toLowerCase() == 'male' ? Colors.blue : Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        dog.gender,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildQuickInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildQuickInfoItem(Icons.calendar_today, "${dog.age} years"),
        _buildQuickInfoItem(Icons.color_lens, dog.color),
        _buildQuickInfoItem(Icons.pets, "${dog.weight} kg"),
      ],
    );
  }

  Widget _buildQuickInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildAboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          dog.description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Info",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildQuickInfoItem(Icons.calendar_today, "${dog.age} years"),
            _buildQuickInfoItem(Icons.color_lens, dog.color),
            _buildQuickInfoItem(Icons.pets, "${dog.weight} kg"),
          ],
        ),
      ],
    );
  }
}

class Owner {
  final String name;
  final String occupation;
  final String imagePath;

  const Owner(this.name, this.occupation, this.imagePath);
}

class Dog {
  final int id;
  final String name;
  final double age;
  final String gender;
  final String color;
  final double weight;
  final String distance;
  final String imagePath;
  final String description;
  final Owner owner;

  const Dog(
    this.id,
    this.name,
    this.age,
    this.gender,
    this.color,
    this.weight,
    this.distance,
    this.imagePath,
    this.description,
    this.owner,
  );
}