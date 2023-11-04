import 'package:apiexample/models/MainServices.dart';
import 'package:flutter/material.dart';
import '../controllers/apiController.dart';
import '../widgets/main_service_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // empty list of services
  late Future<List<MainServices>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

//
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الخدمات المتاحة'),
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<MainServices>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MainServices>? data = snapshot.data;
            return SingleChildScrollView(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.9,
                  mainAxisExtent: 90.0,
                ),
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return MainServiceItem(
                    service: data[index],
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
