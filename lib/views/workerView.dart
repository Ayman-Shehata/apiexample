import 'package:flutter/material.dart';

import '../models/WorkrsList.dart';

class WorkerView extends StatelessWidget {
  Workrs workers;
  WorkerView({super.key, required this.workers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              color: Colors.deepPurple,
              child: Center(
                child: CircleAvatar(
                  radius: 70,
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      workers.profile.toString(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            WorkerDataItem(
              title: workers.name.toString(),
              subTitle: workers.services.toString(),
              icon: Icon(Icons.person,color: Colors.green,),
            ),
            WorkerDataItem(
              title: 'تليفون',
              subTitle: "${workers.tel1}  -  ${workers.tel2}" ,
              icon: Icon(Icons.phone_android,color: Colors.deepPurple,),
            ),
            WorkerDataItem(
              title: 'أماكن الخدمة',
              subTitle: workers.places.toString(),
              icon: Icon(Icons.map,color: Colors.green,),
            ),
            WorkerDataItem(
              title: 'العنوان',
              subTitle: workers.address.toString(),
              icon: Icon(Icons.maps_home_work_outlined,color: Colors.deepPurple,),
            ),
            WorkerDataItem(
              title: 'التقييم',
              subTitle: workers.rate.toString(),
              icon: Icon(Icons.star,color: Colors.amber,),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkerDataItem extends StatelessWidget {
  String title;
  String subTitle;
  Icon icon;
  WorkerDataItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 9,
        child: ListTile(
          leading: icon,
          title: Text(title),
          subtitle: Text(subTitle),
        ),
      ),
    );
  }
}
