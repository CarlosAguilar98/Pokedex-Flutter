import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/models/getDataModel.dart';

class GetDataController extends GetxController {
  var isLoading = false.obs;
  var getDataModel = GetDataModel(results: []).obs;

  getDataFromApi() async {
    isLoading.value = true;
    try {
      var response = await Dio().get(
          'http://192.168.1.42:90/PERSONAL_api/controller/pokemon.php?op=listar');
      final datax = json.decode(response.data);
      getDataModel.value = GetDataModel.fromJson(datax);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
