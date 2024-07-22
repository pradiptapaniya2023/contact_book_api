import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api_class/2_get_viewcontact.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdataAPI();
  }

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController monumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nikname = TextEditingController();
  GetContactdata? gc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add contact",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bgimg.jpg"),
                fit: BoxFit.cover)),
        child: ListView.builder(
          itemCount: gc!.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 205,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Firstname : ${gc!.data![index].firstName}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Lastname : ${gc!.data![index].lastName}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Mo-number : ${gc!.data![index].mobileNo}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Email : ${gc!.data![index].email}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Nik name : ${gc!.data![index].nickName}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            addContact();
          },
        ),
      ),
    );
  }

  void addContact() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add contact"),
          content: SizedBox(
            height: 400,
            width: 250,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: firstname,
                        decoration: InputDecoration(
                            labelText: "First name",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(7)),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: lastname,
                        decoration: InputDecoration(
                            labelText: "Last name",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(7)),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: monumber,
                        decoration: InputDecoration(
                            labelText: "Mobile no.",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(7)),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(7)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: nikname,
                        decoration: InputDecoration(
                            labelText: "Nikname",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(7)),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        postdataAPI(
                            firstname, lastname, monumber, email, nikname);
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Add",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  postdataAPI(
      TextEditingController firstname,
      TextEditingController lastname,
      TextEditingController monumber,
      TextEditingController email,
      TextEditingController nikname) async {
    var url = Uri.parse('https://service.apikeeda.com/api/v1/contact-book');
    var response = await http.post(url, headers: {
      "x-apikeeda-key": "m1721392764176tua795749308ul"
    }, body: {
      'firstName': firstname.text,
      'lastName': lastname.text,
      'mobileNo': monumber.text,
      'email': email.text,
      'nickName': nikname.text
    });
    print('Response status: ${response.statusCode}');
    print('Response body POST: ${response.body}');

    setState(() {
      firstname.text = "";
      lastname.text = "";
      monumber.text = "";
      email.text = "";
      nikname.text = "";

      Navigator.pop(context);
    });

    getdataAPI();
  }

  getdataAPI() async {
    var url = Uri.parse('https://service.apikeeda.com/api/v1/contact-book');
    var response = await http
        .get(url, headers: {"x-apikeeda-key": "m1721392764176tua795749308ul"});
    print('Response status: ${response.statusCode}');
    print('Response body GET: ${response.body}');

    Map<String, dynamic> cp = json.decode(response.body);
    setState(() {
      gc = GetContactdata.fromJson(cp);
    });

    print("==> gc ${gc}");
  }
}
