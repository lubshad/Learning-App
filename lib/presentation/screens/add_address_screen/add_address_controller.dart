import 'package:learning_app/domain/params/add_address_params.dart';
import 'package:learning_app/domain/usecases/add_address.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_controller.dart';
import 'package:learning_app/utils/location_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class AddAddressController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>(debugLabel: 'add_address_form_key');

  AuthController authController = Get.find();
  AddAddress addAddress = Get.find();
  AddAddressArguments addAddressArguments = Get.arguments;

  final addressController = TextEditingController();
  final streetController = TextEditingController();
  final phoneController = TextEditingController();

  PickResult? selectedAddress;
  LatLng? geoLocation;

  setCurrentLocation() async {
    final currentLocation = await Geolocator.getCurrentPosition();
    final lat = currentLocation.latitude;
    final lng = currentLocation.longitude;
    refreshMapLocation(LatLng(lat, lng));
  }

  refreshMapLocation(LatLng newLocation) async {
    geoLocation = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    geoLocation = newLocation;
    notifyListeners();
  }

  changeLocation(BuildContext context) async {
    final pickedLocation = await pickLocationFromMap(context);
    if (pickedLocation != null) {
      selectedAddress = pickedLocation;
      addressController.text = pickedLocation.formattedAddress!;
      streetController.text = pickedLocation.addressComponents![1].longName;
      final lat = pickedLocation.geometry!.location.lat;
      final lng = pickedLocation.geometry!.location.lng;
      refreshMapLocation(LatLng(lat, lng));
    }
  }

  setData() {
    phoneController.text = addAddressArguments.user.phone;
    setCurrentLocation();
  }

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  bool validate() {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }

  addUserAddress() async {
    if (validate()) {
      makeButtonLoading();
      AddAddressParams addressParams = AddAddressParams(
        sessionId: addAddressArguments.user.sessionId,
        userId: addAddressArguments.user.userId,
        address: addressController.text,
        street: streetController.text,
        phoneNumber: phoneController.text,
        latitude: geoLocation!.latitude,
        longitude: geoLocation!.longitude,
      );
      final response = await addAddress(addressParams);
      response.fold((l) => l.handleError(), (r) {
        if (r["status"] == 1) {
          switch (addAddressArguments.addAddressType) {
            case AddAddressType.registration:
              Get.toNamed(RouteList.registrationSuccessScreen);
              break;
            case AddAddressType.changeAddress:
              Get.until(
                  (route) => Get.currentRoute == RouteList.myAddressScreen);
              Get.find<MyAddressController>().getData();
              break;
          }
        }
      });
    }
    makeButtonNotLoading();
  }
}
