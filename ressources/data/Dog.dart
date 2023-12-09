import 'owner.dart';

class Dog {
  int id;
  String name;
  double age;
  String gender;
  String color;
  double weight;
  String distance;
  String imagePath;
  String description;
  Owner owner;

  Dog(this.id, this.name, this.age, this.gender, this.color, this.weight,
      this.distance, this.imagePath, this.description, this.owner);
}
