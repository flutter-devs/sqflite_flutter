import 'package:flutter/material.dart';
import 'package:sqflite_flutter/dataBase.dart';
import 'package:sqflite_flutter/model.dart';

class ItemCard extends StatefulWidget {
  Model model;
  TextEditingController input1;
  TextEditingController input2;
  Function onDeletePress;
  Function onEditPress;

  ItemCard(
      {this.model,
      this.input1,
      this.input2,
      this.onDeletePress,
      this.onEditPress});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final DbManager dbManager = new DbManager();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name: ${widget.model.fruitName}',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Quantity: ${widget.model.quantity}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: widget.onEditPress,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: widget.onDeletePress,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogBox {
  Widget dialog(
      {BuildContext context,
      Function onPressed,
      TextEditingController textEditingController1,
      TextEditingController textEditingController2,
      FocusNode input1FocusNode,
      FocusNode input2FocusNode}) {
    return AlertDialog(
      title: Text("Enter Data"),
      content: Container(
        height: 100,
        child: Column(
          children: [
            TextFormField(
              controller: textEditingController1,
              keyboardType: TextInputType.text,
              focusNode: input1FocusNode,
              decoration: InputDecoration(hintText: "Fruit Name"),
              autofocus: true,
              onFieldSubmitted: (value) {
                input1FocusNode.unfocus();
                FocusScope.of(context).requestFocus(input2FocusNode);
              },
            ),
            TextFormField(
              controller: textEditingController2,
              keyboardType: TextInputType.number,
              focusNode: input2FocusNode,
              decoration: InputDecoration(hintText: "Quantity"),
              onFieldSubmitted: (value) {
                input2FocusNode.unfocus();
              },
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.blueGrey,
          child: Text(
            "Cancel",
          ),
        ),
        MaterialButton(
          onPressed: onPressed,
          child: Text("Submit"),
          color: Colors.blue,
        )
      ],
    );
  }
}
