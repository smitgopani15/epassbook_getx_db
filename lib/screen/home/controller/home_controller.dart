import 'package:get/get.dart';
import 'package:incomeexpense_getx_db/utils/db_helper.dart';

class HomeController extends GetxController {
  RxList<String> iCategoryList = <String>[
    "Commission",
    "Salary",
    "Cash",
    "Bonus",
    "Pension",
    "Other",
  ].obs;
  var selectedICategory = "Other".obs;
  RxList<String> iPaymentMethodList = <String>[
    "Paytm",
    "GPay",
    "Cash",
    "Phone Pe",
    "Net Banking",
    "Other",
  ].obs;
  var selectedIPaymentMethod = "Other".obs;
  RxList<String> eCategoryList = <String>[
    "Grocery",
    "Medicine",
    "Vagetable",
    "Food",
    "Education",
    "Other",
  ].obs;
  var selectedECategory = "Other".obs;
  RxList<String> ePaymentMethodList = <String>[
    "Paytm",
    "GPay",
    "Cash",
    "Phone Pe",
    "Net Banking",
    "Other",
  ].obs;
  var selectedEPaymentMethod = "Other".obs;

  RxList<Map> dataList = <Map>[].obs;

  Future<void> readData() async {
    DbHelper dbHelper = DbHelper();
    dataList.value = await dbHelper.readData();
  }
}
