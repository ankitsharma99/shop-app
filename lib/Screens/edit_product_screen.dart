import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  //FocusNode is a class built into flutter and we instantiate it here!
  final _priceFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                "Edit ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.teal,
                ),
              ),
            ),
            Text(
              "Products",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      //Form gets submitted and validated together
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          child: ListView(
            children: [
              //TextFormFields are automatically connected to Form widgets
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  //When he next button is presswd on the soft key board, this helps in passing the control to focusNode at line number 64
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
              // Spacer(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  //When he next button is presswd on the soft key board, this helps in passing the control to focusNode at line number 64
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
