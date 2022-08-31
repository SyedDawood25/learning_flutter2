import 'package:flutter/material.dart';
import 'package:learningflutter2/classes/user.dart';
import 'package:learningflutter2/views/new_profile.dart';
import 'package:learningflutter2/widgets/message_dialog.dart';
import 'package:learningflutter2/widgets/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _index = 0;

  List<Profile> _profiles = <Profile>[
    Profile(index: 0, user: User(name: 'Syed Dawood', age: 19, description: 'The best possible programmer that ever existed!')),
    Profile(index: 1, user: User(name: 'Abdul Sami', age: 20, description: 'The fun person in the group, a personal entertainer!')),
    Profile(index: 2, user: User(name: 'Moiz Habib', age: 19, description: 'The person who gets the day going in SHU!  ;P'))
  ];

  List<Widget> getNavs(index) {
    return _profiles.map((profile) {
      return Container(
        margin: const EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
        child: Icon(
          Icons.circle,
          size: 10.0,
          color: (profile.index == index) ? Colors.grey : Colors.grey[800]!,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SHU Profiles',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProfile,
        backgroundColor: Colors.grey[800],
        child: Icon(
          Icons.add_card_rounded,
          color: Colors.amberAccent[400],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView.builder(
              itemCount: _profiles.length,
              itemBuilder: (context, index) => _profiles[index],
              onPageChanged: (value) => setState(() {
                _index = value;
              }),
            )
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getNavs(_index),
            ),
          )
        ],
      ),
    );
  }

  void addProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return NewProfile(onCreate: createProfile);
        },
      )
    );
  }

  void createProfile(String name, DateTime dob, String description) {
    int age = DateTime.now().year - dob.year;
    setState(() {
      _profiles.add(Profile(
        index: _profiles.length,
        user: User(name: name, age: age, description: description),
      ));
    });
  }
}