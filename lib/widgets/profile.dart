import 'package:flutter/material.dart';
import 'package:learningflutter2/classes/user.dart';

class Profile extends StatelessWidget {

  final User user;
  final int index;
  const Profile({Key? key, required this.user, required this.index}) : super(key: key);

  CircleAvatar getAvatar() {
    return CircleAvatar(
      radius: 58.0,
      backgroundImage: AssetImage(
        user.backgroundImage ?? 'assets/space.jpg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(50, 0, 0, 0),
      margin: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[600],
                  radius: 62.0,
                  child: getAvatar(),
                ),
              ),
            ),
            Divider(
              height: 50.0,
              color: Colors.grey[600],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NAME',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent[400],
                          ),
                        ),
                        const SizedBox(height: 1.0),
                        Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent[400],
                          ),
                        ),
                        const SizedBox(height: 1.0),
                        Text(
                          '${user.age}',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DESCRIPTION',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent[400],
                          ),
                        ),
                        const SizedBox(height: 1.0),
                        Text(
                          user.description,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}