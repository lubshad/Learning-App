import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/domain/entities/variant_entity.dart';
import 'package:learning_app/domain/params/product_details_params.dart';
import 'package:learning_app/domain/usecases/add_to_cart.dart';
import 'package:learning_app/domain/usecases/add_to_wishlist.dart';
import 'package:learning_app/domain/usecases/get_product_details.dart';
import 'package:learning_app/domain/usecases/remove_from_wishlist.dart';
import 'package:learning_app/presentation/screens/cart_screen/cart_screen_controller.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class ProductDetailsController extends ChangeNotifier {
  AppError? appError;
  bool isLoading = true;
  late VariantProduct selectedVariant;
  List<String> images = [];
  bool isWishlistProduct = false;
  bool isCartProduct = false;
  late VariantEntity variantEntity;
  TextEditingController quantityController = TextEditingController(text: "1");

  ProductDetailsResponseModel? productDetailsResponseModel;

  Course course = Get.arguments;
  GetProductDetails getProductDetails = Get.find();

  AddToWishlist addToWishlist = Get.find();
  RemoveFromWishlist removeFromWishlist = Get.find();
  AddtoCart addtoCart = Get.find();

  CartScreenController cartScreenController = Get.find();

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  validateWishlist() {
    if (isWishlistProduct) {
      showMessage("Product is already on wishlist");
      return true;
    } else {
      return false;
    }
  }

  addProductToWishlist() async {
    // if (!validateWishlist()) {
    //   CartWishlistParams addToCartParams = CartWishlistParams(
    //       stockId: selectedVariant.course.stockId!,
    //       vendorID: selectedVariant.course.vendorId!,
    //       quantity: quantityController.text);
    //   final response = await addToWishlist(addToCartParams);
    //   response.fold((l) => l.handleError(), (r) {
    //     if (r["status"] == 1) {
    //       isWishlistProduct = true;
    //     }
    //     showMessage(r["message"]);
    //   });
    // }
    // notifyListeners();
  }

  // removeProductFromWishlist() async {
  //   CartWishlistParams addToCartParams = CartWishlistParams(
  //       stockId: selectedVariant.course.stockId!,
  //       vendorID: selectedVariant.course.vendorId!,
  //       quantity: quantityController.text);
  //   final response = await removeFromWishlist(addToCartParams);
  //   response.fold((l) => l.handleError(), (r) {
  //     if (r["status"] == 1) {
  //       isWishlistProduct = false;
  //     }
  //   });
  //   notifyListeners();
  // }

  // wishlistTougle() {
  //   isWishlistProduct ? removeProductFromWishlist() : addProductToWishlist();
  // }

  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  getData() async {
    appError = null;
    // makeLoading();
    ProductDetailsParams productDetailsParams =
        ProductDetailsParams(courseId: course.id.toString());
    final response = await getProductDetails(productDetailsParams);
    response.fold((l) => appError = l, (r) {
      setData(r);
    });
    makeNotLoading();
  }

  void setData(ProductDetailsResponseModel r) {
    productDetailsResponseModel = r;
    // String variantName = r.data!.variant1Name;
    // List<VariantProduct> variantProducts = r.data!.variant1S
    //     .map((e) => VariantProduct(
    //         value: e.variant1Name,
    //         course: e.vendors[0],
    //         priceRanges: e.vendors[0].priceRanges))
    //     .toList();
    // variantEntity =
    //     VariantEntity(name: variantName, variantProducts: variantProducts);
    // selectedVariant = variantEntity.variantProducts[0];
    // images = r.data!.productImages.map((e) => e.image).toList();
    // updateCartWishlistStatus();
  }

  void changeVariant(VariantProduct e) {
    selectedVariant = e;
    updateCartWishlistStatus();
    notifyListeners();
  }

  updateCartWishlistStatus() {
    // isWishlistProduct = selectedVariant.course.wishlistStatus != "0";
    // isCartProduct = selectedVariant.course.userQty != "0";
    // quantityController.text = selectedVariant.course.userQty! == "0"
    //     ? "1"
    //     : selectedVariant.course.userQty!;
  }

  void addProductToCart() async {
    // makeButtonLoading();
    // CartWishlistParams addToCartParams = CartWishlistParams(
    //     stockId: selectedVariant.course.stockId,
    //     vendorID: selectedVariant.course.vendorId,
    //     quantity: quantityController.text);
    // final response = await addtoCart(addToCartParams);
    // response.fold((l) => l.handleError(), (r) {
    //   if (r["status"] == 1) {
    //     isCartProduct = true;
    //     cartScreenController.getData();
    //   }
    //   showMessage(r["message"]);
    // });
    // makeButtonNotLoading();
  }

  void decreaseQuantity() {
    int newQty;
    try {
      newQty = int.parse(quantityController.text) - 1;
      newQty < 1 ? newQty = 1 : newQty;
    } catch (e) {
      newQty = 1;
    }
    if (newQty > 0) {
      quantityController.text = newQty.toString();
    }
  }

  void increaseQuantity() {
    int newQty;
    try {
      newQty = int.parse(quantityController.text) + 1;
      newQty < 1 ? newQty = 1 : newQty;
    } catch (e) {
      newQty = 1;
    }
    quantityController.text = newQty.toString();
  }

  bool showMore = false;
  void showMoreDetails() {
    showMore = true;
    notifyListeners();
  }
}

// List<PriceRangeEntity> priceRangeSmallList = [
//   const PriceRangeEntity(range: "1-10", price: "30.00"),
//   const PriceRangeEntity(range: "10-20", price: "25.00"),
//   const PriceRangeEntity(range: "20-100", price: "20.00"),
//   const PriceRangeEntity(range: "100+", price: "18.00"),
// ];

// List<PriceRangeEntity> priceRangeMediumList = [
//   const PriceRangeEntity(range: "1-10", price: "40.00"),
//   const PriceRangeEntity(range: "10-20", price: "35.00"),
//   const PriceRangeEntity(range: "20-100", price: "30.00"),
//   const PriceRangeEntity(range: "100+", price: "28.00"),
// ];

// List<PriceRangeEntity> priceRangeLargeList = [
//   const PriceRangeEntity(range: "1-10", price: "50.00"),
//   const PriceRangeEntity(range: "10-20", price: "45.00"),
//   const PriceRangeEntity(range: "20-100", price: "40.00"),
//   const PriceRangeEntity(range: "100+", price: "38.00"),
// ];

// List<String> imageList = [
//   "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//   "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//   "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
// ];

// VariantEntity variantItem = VariantEntity(name: "Size", variantProducts: [
//   VariantProduct(
//       priceRanges: priceRangeSmallList,
//       course: const ProductEntity(
//           imageUrl:
//               "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//           name: 'Amul Chocolate Box small',
//           price: "22.00"),
//       value: 'Small'),
//   VariantProduct(
//       priceRanges: priceRangeMediumList,
//       course: const ProductEntity(
//           imageUrl:
//               "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//           name: 'Amul Chocolate Box medium',
//           price: "30.00"),
//       value: 'Medium'),
//   VariantProduct(
//       priceRanges: priceRangeLargeList,
//       course: const ProductEntity(
//           imageUrl:
//               "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
//           name: 'Amul Chocolate Box large',
//           price: "35.00"),
//       value: 'large'),
  // VariantProduct(
  //     course: ProductEntity(
  //         imageUrl:
  //             "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  //         name: 'Amul Chocolate Box small',
  //         price: '22'),
  //     value: 'Small'),
  // VariantProduct(
  //     course: ProductEntity(
  //         imageUrl:
  //             "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  //         name: 'Amul Chocolate Box medium',
  //         price: '30'),
  //     value: 'Medium'),
  // VariantProduct(
  //     course: ProductEntity(
  //         imageUrl:
  //             "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  //         name: 'Amul Chocolate Box large',
  //         price: '35'),
  //     value: 'large'),
  // VariantProduct(
  //     course: ProductEntity(
  //         imageUrl:
  //             "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  //         name: 'Amul Chocolate Box small',
  //         price: '22'),
  //     value: 'Small'),
  // VariantProduct(
  //     course: ProductEntity(
  //         imageUrl:
  //             "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  //         name: 'Amul Chocolate Box medium',
  //         price: '30'),
  //     value: 'Medium'),
  // VariantProduct(
  //     course: ProductEntity(
  //         imageUrl:
  //             "https://s3-alpha-sig.figma.com/img/9ac9/c757/db51fc6098f44701d03d4178fcbdde72?Expires=1635120000&Signature=dmJrne0DE5UtXGwbgPZ6PaFanEA4dLNWAVdTvdrIbo58lh4WwOMkHS8uxtm5~u0tcaU6swdLu4WtP5NJVPGHxDjbAF0d6i6BVjs44X3IunLYKTDJhwmENq~Q6goQYhz2rxyb5KLRSHoChY2WvohdU0DJ69g1KfCgis~sWed5CZmkjAPOS3~kcHI5Ea2Vmy4-FQirRKDV-4U~ae9FNmmwermDTkkE9NJ~ERVaiTXt6s1t8ZgHm48Uxh4W7AV53of-yFCxBTr5FfSRR2m9nef2GEUMWWYROLKnqKjFK8epfkquRcw76~Bpry2cyop3EB3IwbqGW7g2PVA-jAVHOsOZOQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  //         name: 'Amul Chocolate Box large',
  //         price: '35'),
  //     value: 'large'),
// ]);
