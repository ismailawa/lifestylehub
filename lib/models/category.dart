class Category{
  final String name;
  final int trainers;
  final int lessons;
  final String imageUrl;

  Category({this.trainers, this.lessons, this.imageUrl, this.name});

}

List<Category> categories = [
  Category(
    name:"Learship",
    trainers: 10,
    lessons: 30,
    imageUrl: "assets/images/cat1.jpg"
  ),
  Category(
      name:"Business",
      trainers: 25,
      lessons: 60,
      imageUrl: "assets/images/cat2.jpg"
  ),
  Category(
      name:"Investment",
      trainers: 50,
      lessons: 150,
      imageUrl: "assets/images/cat3.jpeg"
  ),
  Category(
      name:"Learship",
      trainers: 10,
      lessons: 30,
      imageUrl: "assets/images/cat1.jpg"
  ),
  Category(
      name:"Business",
      trainers: 25,
      lessons: 60,
      imageUrl: "assets/images/cat2.jpg"
  ),
  Category(
      name:"Investment",
      trainers: 50,
      lessons: 150,
      imageUrl: "assets/images/cat3.jpeg"
  ),

];