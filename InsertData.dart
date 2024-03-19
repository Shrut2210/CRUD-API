import 'dart:math';

import 'package:crud_demo/api/my_api.dart';
import 'package:crud_demo/userModel.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  Map<String,dynamic>? map;

  InsertData({Map<String,dynamic>? map}){
    this.map=map;
  }

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData>{

  var nameController = TextEditingController();
  var expController = TextEditingController();
  var avatarController = TextEditingController();

  final _formKey =  GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.map!=null){
      nameController.text = widget.map!["name"].toString();
      expController.text = widget.map!['exp'].toString();
      avatarController.text = widget.map!['avatar'].toString();
    }
    else
      {
        nameController.text = '';
        expController.text = '';
        avatarController.text = '';
      }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Data', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                TextFormField(
                  controller: avatarController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter image url '
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter name '
                  ),
                ),
                TextFormField(
                  controller: expController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter exp '
                  ),
                ),
                ElevatedButton(onPressed: () async {
                    if(widget.map == null)
                      {
                        await insertData().then((value) {

                        });
                      }
                    else
                      {
                        await editData().then((value) {

                      });
                      }
                      Navigator.of(context).pop(true);
                    setState(() {

                    });

                }, child: Text('ADD', style: TextStyle(color: Colors.black, fontSize: 20),))
              ],
            ),
          ),
        ),

    );
    throw UnimplementedError();
  }

  Future<void> insertData() async {
    Map<String, dynamic> map = {};

    Model data = Model();

    data.exp = expController.text;
    data.name = nameController.text;
    data.avatar = avatarController.text;
    await MyAPI().insertData(data.toMap());
  }

  Future<void> editData() async {
    Map<String, dynamic> map = {};

    Model data = Model();

    data.exp = expController.text;
    data.name = nameController.text;
    data.avatar = avatarController.text;
    await MyAPI().updateData(data.toMap(),widget.map!['id']);
  }

}



