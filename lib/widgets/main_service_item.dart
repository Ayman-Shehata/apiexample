import 'package:apiexample/models/WorkrsList.dart';
import 'package:flutter/material.dart';

import '../models/MainServices.dart';
import '../views/servicelist.dart';

class MainServiceItem extends StatelessWidget {
  MainServices service;
  MainServiceItem({required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // get model with service id

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ServicesListView(
                    mainServices: service,
                  )),
        );
      },
      child: Card(
        elevation: 8,
        child: Image(
          image: NetworkImage(service.notes),
        ),
      ),
    );
  }
}

class SubServiceItem extends StatelessWidget {
  Workrs person;
  SubServiceItem({required this.person});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 8,
      child: ListTile(
        title: Text(person.name.toString()),
        subtitle: Text(person.services.toString()),
        leading: CircleAvatar(
          radius: 20,
          child: Image(
         image: NetworkImage(person.profile.toString())


          ),
        ),
      ),
    );
  }
}
