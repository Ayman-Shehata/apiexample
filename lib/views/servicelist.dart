import 'package:apiexample/controllers/apiController.dart';
import 'package:apiexample/models/WorkrsList.dart';
import 'package:flutter/material.dart';
import '../models/MainServices.dart';
import '../widgets/main_service_item.dart';
import 'workerView.dart';

class ServicesListView extends StatefulWidget {
  MainServices mainServices;
    ServicesListView({required this.mainServices});

  @override
  State<ServicesListView> createState() => _ServicesListViewState();
}

class _ServicesListViewState extends State<ServicesListView> {
  //
  // empty list of services
  late Future<List<Workrs>> futureData;

  @override
  void initState() {
    super.initState();
    print('Ayman say:    ${widget.mainServices.id}');
    futureData = fetchWorkrsData(catID:widget.mainServices.id );
  }

//
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mainServices.name),
      ),
      body: _buildBody(),
    );
  }
  //

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<Workrs>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Workrs>? data = snapshot.data;
            return SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      //WorkerView
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkerView(
                              workers:  data[index],
                            )),
                      );
                    },
                    child: SubServiceItem(
                      person: data[index],
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
