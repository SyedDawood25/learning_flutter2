import 'package:flutter/material.dart';
import 'package:learningflutter2/widgets/message_dialog.dart';

class NewProfile extends StatefulWidget {

  final Function onCreate;
  const NewProfile({Key? key, required this.onCreate}) : super(key: key);

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  late final TextEditingController _name, _description;
  DateTime? _dob;
  String? _date;
  Icon? _icon;

  @override
  void initState() {
    _name = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text(
          'Add a New Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NAME',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.amberAccent[400],
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey[800],
                    filled: true,
                  ),
                  cursorColor: Colors.amberAccent[400],
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  'DATE OF BIRTH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.amberAccent[400],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[800],
                          hintText: _date,
                          icon: _icon,
                          filled: true,
                          enabled: false,
                        ),
                      )
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async{
                          _dob = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
            
                          if(_dob == null && _date == null) {
                            setState(() {  
                              _icon = Icon(
                                Icons.cancel_rounded,
                                color: Colors.red[800],
                              );
                              _date = null;
                            });
                          } 
                          else if(_dob == null) {
                            return;
                          } else {
                            setState(() {
                              _date = '${_dob?.day}/${_dob?.month}/${_dob?.year}';
                              _icon = const Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.green,
                              );
                            });
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                        ),
                        icon: Icon(
                          Icons.calendar_month,
                          color: Colors.amberAccent[400],
                        ),
                        label: Text(
                          'Select Date',
                          style: TextStyle(
                            color: Colors.amberAccent[400],
                          ),
                        ),
                      )
                    )
                  ],
                ),
                const SizedBox(height: 30.0),
                Text(
                  'DESCRIPTION',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.amberAccent[400],
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _description,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey[800],
                    filled: true,
                  ),
                  keyboardType: TextInputType.multiline,
                  cursorColor: Colors.amberAccent[400],
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60.0),
                ElevatedButton.icon(
                  onPressed: () {
                    if(_name.text.isEmpty || _description.text.isEmpty || _dob == null) {
                      showDialog(context: context, builder: (context) {
                        return const MessageDialog(text: 'Please fill out all the fields!', color: Colors.red);
                      });
                    } else {
                      widget.onCreate(_name.text, _dob!, _description.text);
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => MessageDialog(text: 'Successfully added a new Profile!', color: Colors.green[800]!),
                      );
                    }
                  }, 
                  icon: Icon(
                    Icons.add,
                    color: Colors.amberAccent[400],
                    size: 30.0,
                  ),
                  label: Text(
                    'Add Profile',
                    style: TextStyle(
                      color: Colors.amberAccent[400],
                      fontSize: 20.0,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}