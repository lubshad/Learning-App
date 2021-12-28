import 'package:learning_app/data/models/my_address_response_model.dart';
import 'package:learning_app/domain/entities/address_entity.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/params/no_params.dart';
import 'package:learning_app/domain/usecases/get_all_addresss.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyAddressController extends ChangeNotifier {
  List<AddressEntity> addressList = [];

  AppError? appError;

  GetAllAddress getAllAddress = Get.find();

  retry() {
    appError = null;
    makeLoading();
    getData();
  }

  getData() async {
    final response = await getAllAddress(NoParams());
    response.fold((l) => appError = l, (r) {
      setData(r);
    });
    makeNotLoading();
  }

  bool isLoading = true;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setData(MyAddressResponseModel r) {
    addressList = [
      r.data!.address!.firstWhere((element) => element.isDefault == "1")
    ];
    notifyListeners();
  }
}
