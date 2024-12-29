import 'package:get/get.dart';

class HomeAdminController extends GetxController {
  // Track the current index of the bottom navigation bar
  var selectedIndex = 0.obs;

  // Handle bottom navigation tap
  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0: // Home
        break;
      case 1: // Mutasi
        Get.offNamed('/mutasi');
        break;
      case 2: // QR
        Get.offNamed('/qrscan');
        break;
      case 3: // Info
        Get.offNamed('/info_admin');
        break;
      case 4: // Profile
        Get.offNamed('/profil_admin');
        break;
    }
  }
}
