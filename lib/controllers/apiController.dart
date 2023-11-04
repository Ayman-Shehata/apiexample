import 'dart:convert';
import 'package:apiexample/models/WorkrsList.dart';
import 'package:http/http.dart' as http;
import '../models/MainServices.dart';
//دالة عرض البيانات من الAPI

Future<List<MainServices>> fetchData() async {
  final response =
  await http.get(Uri.parse('https://academy.elfathsociety.com/api/mainservices?type=json'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => MainServices.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
//get list of sub services
Future<List<Workrs>> fetchWorkrsData({required int catID}) async {
  final response =
  await http.get(Uri.parse('https://academy.elfathsociety.com/api/workersbyservice?id=$catID&type=json'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Workrs.fromJson(data)).toList();
  } else {
    throw Exception( 'Unexpected error occured!');
  }
}
// //get worker with id
// Future<Workrs> getWorkerData(int id) async {
//   final response =
//   await http.get(Uri.parse("https://academy.elfathsociety.com/api/workers?type=json&serviceID=$id"));
//   if (response.statusCode == 200) {
//     final jsonresponse = json.decode(response.body);
//     return Workrs.fromJson(jsonresponse);
//   } else {
//     throw Exception('Error');
//   }
// }
