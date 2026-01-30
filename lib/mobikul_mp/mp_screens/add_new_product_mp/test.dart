import 'package:flutter/material.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_another_link/add_another_link_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List myList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: myList.length,
              itemBuilder: (context, index) {
                return MyCard(model: myList[index]);
              },
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  addModelToList();
                  print(myList);
                });
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void addModelToList() {
    Map<String, dynamic> newModel = {
      "linkId": "",
      "sortOrder": 1,
      "isDelete": "",
      "title": "",
      "price": "",
      "type": "",
      "file": "",
      "linkUrl": "",
      "sampleType": "",
      "sampleFile": "",
      "sampleLinkUrl": "",
      "shareableTypes": [],
      "isUnlimited": 0,
      "isVisible": false,
    };
    myList.add(newModel);
  }
}

class MyCard extends StatefulWidget {
  final model;

  MyCard({required this.model});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  // Add controllers for other fields as needed

  @override
  void initState() {
    super.initState();
    // Set initial values for the controllers based on the widget's model
    _titleController.text = widget.model["title"] ?? '';
    _priceController.text = widget.model["price"] ?? '';
    // Initialize other controllers with the corresponding model values
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    // Dispose other controllers as needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            onChanged: (value) {
              setState(() {
                widget.model["title"] = value;
              });
            },
            // Add other properties for the TextField
          ),
          TextField(
            controller: _priceController,
            onChanged: (value) {
              setState(() {
                widget.model["price"] = value;
              });
            },
            // Add other properties for the TextField
          ),
          // Add other widgets for the remaining fields
        ],
      ),
    );
  }
}

class MyModel {
  String linkId;
  int sortOrder;
  String isDelete;
  String title;
  String price;
  String type;
  String file;
  String linkUrl;
  String sampleType;
  String sampleFile;
  String sampleLinkUrl;
  List<String> shareableTypes;
  int isUnlimited;
  bool isVisible;

  MyModel({
    this.linkId = "0",
    this.sortOrder = 1,
    this.isDelete = "",
    this.title = "",
    this.price = "",
    this.type = "",
    this.file = "[]",
    this.linkUrl = "",
    this.sampleType = "",
    this.sampleFile = "[]",
    this.sampleLinkUrl = "",
    this.shareableTypes = const [],
    this.isUnlimited = 0,
    this.isVisible = false,
  });

  @override
  String toString() {
    return 'MyModel(linkId: $linkId, title: $title, price: $price, type: $type)';
  }
}
