import 'package:first_draft/models/post.dart';

final List<Post> postlist = [
  Post(
      title: 'Blouse',
      description: 'Elegant Blouse for Women',
      price: 19.99,
      tags: ['Women', 'Top'],
      userId: 'userdummy1',
      image: 'assets/images/blouse.png'),

  Post(
      title: 'Shirt',
      description: 'Casual and Stylish Shirt for Men',
      price: 26.99,
      tags: ['Men', 'Top'],
      userId: 'userexample1',
      image: 'assets/images/shirt.png'),
  Post(
      title: 'Running Shoes',
      description: 'Comfortable and lightweight',
      price: 32.00,
      tags: ['Sportswear', 'Shoes'],
      userId: 'userexample1',
      image: 'assets/images/shoes.png'),
  Post(
      title: 'Yoga Pants',
      description: 'Stretchable and Breathable Pants',
      price: 25.99,
      tags: ['Women', 'Sportswear'],
      userId: 'userdummy1',
      image: 'assets/images/yoga.png')
];
