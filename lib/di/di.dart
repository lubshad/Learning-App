import 'package:learning_app/data/data_sources/remote_data_source.dart';
import 'package:learning_app/data/data_sources/user_preference_local_data_source.dart';
import 'package:learning_app/data/repository/data_repository_impl.dart';
import 'package:learning_app/data/repository/user_preference_repository_imp.dart';
import 'package:learning_app/domain/repository/data_repository.dart';
import 'package:learning_app/domain/repository/user_preference_repository.dart';
import 'package:learning_app/domain/usecases/add_address.dart';
import 'package:learning_app/domain/usecases/add_to_cart.dart';
import 'package:learning_app/domain/usecases/add_to_wishlist.dart';
import 'package:learning_app/domain/usecases/cancel_order.dart';
import 'package:learning_app/domain/usecases/change_locale.dart';
import 'package:learning_app/domain/usecases/checkout_cart.dart';
import 'package:learning_app/domain/usecases/create_account.dart';
import 'package:learning_app/domain/usecases/edit_address.dart';
import 'package:learning_app/domain/usecases/get_all_addresss.dart';
import 'package:learning_app/domain/usecases/get_all_products.dart';
import 'package:learning_app/domain/usecases/get_cart_data.dart';
import 'package:learning_app/domain/usecases/get_home_data.dart';
import 'package:learning_app/domain/usecases/get_kyc_details.dart';
import 'package:learning_app/domain/usecases/get_link_type.dart';
import 'package:learning_app/domain/usecases/get_product_details.dart';
import 'package:learning_app/domain/usecases/get_regions.dart';
import 'package:learning_app/domain/usecases/get_sub_categories.dart';
import 'package:learning_app/domain/usecases/get_wishlist_data.dart';
import 'package:learning_app/domain/usecases/my_orders.dart';
import 'package:learning_app/domain/usecases/order_details.dart';
import 'package:learning_app/domain/usecases/place_order.dart';
import 'package:learning_app/domain/usecases/re_order.dart';
import 'package:learning_app/domain/usecases/remove_cart.dart';
import 'package:learning_app/domain/usecases/remove_from_wishlist.dart';
import 'package:learning_app/domain/usecases/resend_otp.dart';
import 'package:learning_app/domain/usecases/update_cart.dart';
import 'package:learning_app/domain/usecases/upload_kyc.dart';
import 'package:learning_app/domain/usecases/verify_otp_login.dart';
import 'package:learning_app/domain/usecases/version_check.dart';
import 'package:learning_app/presentation/screens/add_address_screen/add_address_controller.dart';
import 'package:learning_app/presentation/screens/cart_screen/cart_screen_controller.dart';
import 'package:learning_app/presentation/screens/category_details_screen/category_details_controller.dart';
import 'package:learning_app/presentation/screens/checkout_screen/checkout_controller.dart';
import 'package:learning_app/presentation/screens/edit_address_screen/edit_address_controller.dart';
import 'package:learning_app/presentation/screens/filter_screen/filter_controller.dart';
import 'package:learning_app/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:learning_app/presentation/screens/kyc_details_screen/kyc_details_controller.dart';
import 'package:learning_app/presentation/screens/login_screen/login_screen_controller.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_controller.dart';
import 'package:learning_app/presentation/screens/my_order_details/my_order_details_controller.dart';
import 'package:learning_app/presentation/screens/my_orders/my_orders_controller.dart';
import 'package:learning_app/presentation/screens/offers_products/offers_products_controller.dart';
import 'package:learning_app/presentation/screens/product_details_screen/product_details_controller.dart';
import 'package:learning_app/presentation/screens/register_screen/register_screen_controller.dart';
import 'package:learning_app/presentation/screens/search_screen/search_controller.dart';
import 'package:learning_app/presentation/screens/upload_kyc_screen/upload_kyc_controller.dart';
import 'package:learning_app/presentation/screens/verify_otp_screen/verify_otp_controller.dart';
import 'package:learning_app/presentation/screens/wishlist_screen/wishlist_controller.dart';
import 'package:learning_app/presentation/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:learning_app/data/core/api_client.dart';
import 'package:learning_app/data/data_sources/auth_local_data_source.dart';
import 'package:learning_app/data/data_sources/auth_remote_data_source.dart';
import 'package:learning_app/data/repository/auth_repository_impl.dart';
import 'package:learning_app/domain/repository/auth_repository.dart';
import 'package:learning_app/domain/usecases/login_user.dart';
import 'package:learning_app/domain/usecases/logout_user.dart';
import 'package:learning_app/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:learning_app/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:learning_app/presentation/screens/change_password_screen/change_password_controller.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => ApiClient(Client()), fenix: true);
    Get.lazyPut<AuthenticationLocalDataSource>(
        () => AuthenticationLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(Get.find()),
        fenix: true);
    Get.lazyPut<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImpl(Get.find()),
        fenix: true);
    Get.lazyPut<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(Get.find(), Get.find()),
        fenix: true);
    Get.lazyPut<UserPreferencesRepository>(
        () => UserPreferenceRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<UserPreferenceLocalDataSource>(
        () => UserPreferenceLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut(() => LoginUser(Get.find()), fenix: true);
    Get.lazyPut(() => GetLinkType(Get.find()), fenix: true);
    Get.lazyPut(() => LogoutUser(Get.find()), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => VersionCheck(Get.find()), fenix: true);
    Get.lazyPut(() => ChangeLocale(Get.find()), fenix: true);
    Get.lazyPut(() => VerifyOtpLogin(Get.find()), fenix: true);
    Get.lazyPut(() => GetHomeData(Get.find()), fenix: true);
    Get.lazyPut(() => ResendOtp(Get.find()), fenix: true);
    Get.lazyPut(() => UploadKyc(Get.find()), fenix: true);
    Get.lazyPut(() => GetKYCDetails(Get.find()), fenix: true);
    Get.lazyPut(() => GetSubCategories(Get.find()), fenix: true);
    Get.lazyPut(() => GetCartData(Get.find()), fenix: true);
    Get.lazyPut(() => AddAddress(Get.find()), fenix: true);
    Get.lazyPut(() => CreateAccount(Get.find()), fenix: true);
    Get.lazyPut(() => GetAllAddress(Get.find()), fenix: true);
    Get.lazyPut(() => GetWishListData(Get.find()), fenix: true);
    Get.lazyPut(() => UpdateCart(Get.find()), fenix: true);
    Get.lazyPut(() => RemoveCart(Get.find()), fenix: true);
    Get.lazyPut(() => RemoveFromWishlist(Get.find()), fenix: true);
    Get.lazyPut(() => AddtoCart(Get.find()), fenix: true);
    Get.lazyPut(() => MyOrders(Get.find()), fenix: true);
    Get.lazyPut(() => OrderDetails(Get.find()), fenix: true);
    Get.lazyPut(() => GetProductDetails(Get.find()), fenix: true);
    Get.lazyPut(() => GetAllProducts(Get.find()), fenix: true);
    Get.lazyPut(() => CancelOrder(Get.find()), fenix: true);
    Get.lazyPut(() => ReOrder(Get.find()), fenix: true);
    Get.lazyPut(() => CheckoutCart(Get.find()), fenix: true);
    Get.lazyPut(() => AddToWishlist(Get.find()), fenix: true);
    Get.lazyPut(() => EditAddress(Get.find()), fenix: true);
    Get.lazyPut(() => PlaceOrder(Get.find()), fenix: true);
    Get.lazyPut(() => GetRegions(Get.find()), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => KycDetailsController(), fenix: true);
    Get.lazyPut(() => LoginScreenController(), fenix: true);
    Get.lazyPut(() => CategoryDetailsController(), fenix: true);
    Get.lazyPut(() => NavigationScreenController(), fenix: true);
    Get.lazyPut(() => UploadKycController(), fenix: true);
    Get.lazyPut(() => RegisterScreenController(), fenix: true);
    Get.lazyPut(() => VerifyOtpController(), fenix: true);
    Get.lazyPut(() => AddAddressController(), fenix: true);
    Get.lazyPut(() => EditAddressController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => WishListController(), fenix: true);
    Get.lazyPut(() => ProductDetailsController(), fenix: true);
    Get.lazyPut(() => OffersProductsController(), fenix: true);
    Get.lazyPut(() => MyOrdersController(), fenix: true);
    Get.lazyPut(() => MyOrderDetailsController(), fenix: true);
    Get.lazyPut(() => CheckoutController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);
    Get.lazyPut(() => FilterController(), fenix: true);
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.put(MyAddressController());
    Get.put(CartScreenController());
  }
}
