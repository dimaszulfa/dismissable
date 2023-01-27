import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Faker faker = Faker();
  void main() {
    log(faker.person.name.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dismissable")),
      body: ListView.builder(
        itemCount: 100,
        padding: EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                log("Endto start");
              } else {
                log("start to end");
              }
            },
            confirmDismiss: (direction) => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Confirm"),
                      content: Text("Are you sure to delete this item"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              log("sURE");
                              Navigator.of(context, rootNavigator: true)
                                  .pop(true);
                            },
                            child: Text("Sure")),
                        OutlinedButton(
                            onPressed: () {
                              log("No");
                              Navigator.pop(context);
                            },
                            child: Text("No, I'm not sure"))
                      ],
                    )),
            key: Key(index.toString()),
            background: Container(
              padding: EdgeInsets.only(right: 10),
              color: Colors.red,
              child: Icon(Icons.delete),
              alignment: Alignment.centerRight,
            ),
            // direction: DismissDirection.endToStart,
            child: ListTile(
              leading: CircleAvatar(
                child: Center(child: Text("${index + 1}")),
              ),
              title: Text(faker.person.name()),
              subtitle: Text(faker.lorem.sentence()),
            ),
          );
        },
      ),
    );
  }
}
