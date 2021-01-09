import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ), //BackgroundImage does not take widgets
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
