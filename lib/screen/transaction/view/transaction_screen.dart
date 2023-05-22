import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controller/home_controller.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  void initState() {
    super.initState();
    homeController.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Transaction Report",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 18),
              child: InkWell(
                onTap: () {
                  homeController.resetFilterStartingDate();
                  homeController.resetFilterEndingDate();
                  homeController.resetCategory();
                  homeController.resetPaymentMethod();
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Icon(
                                Icons.filter_alt,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Income / Expense Wise",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      homeController.readData();
                                    },
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "All",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      homeController.filterIncomeExpense(
                                        status: 0,
                                      );
                                    },
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Income",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      homeController.filterIncomeExpense(
                                        status: 1,
                                      );
                                    },
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Expense",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Date Wise",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      homeController
                                              .filterStartingDateFind!.value =
                                          await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(3000),
                                                builder: (context, child) {
                                                  return Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                      colorScheme:
                                                          ColorScheme.light(
                                                        primary: Colors.black,
                                                        onPrimary: Colors.white,
                                                        onSurface: Colors.black,
                                                      ),
                                                      textButtonTheme:
                                                          TextButtonThemeData(
                                                        style: TextButton
                                                            .styleFrom(
                                                          foregroundColor: Colors
                                                              .black, // button text color
                                                        ),
                                                      ),
                                                    ),
                                                    child: child!,
                                                  );
                                                },
                                              ) ??
                                              homeController
                                                  .filterStartingDateFind!
                                                  .value;
                                    },
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Obx(
                                        () => Text(
                                          "${homeController.filterStartingDateFind!.value.day}/0${homeController.filterStartingDateFind!.value.month}/${homeController.filterStartingDateFind!.value.year}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      homeController
                                              .filterEndingDateFind!.value =
                                          await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(3000),
                                                builder: (context, child) {
                                                  return Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                      colorScheme:
                                                          ColorScheme.light(
                                                        primary: Colors.black,
                                                        onPrimary: Colors.white,
                                                        onSurface: Colors.black,
                                                      ),
                                                      textButtonTheme:
                                                          TextButtonThemeData(
                                                        style: TextButton
                                                            .styleFrom(
                                                          foregroundColor: Colors
                                                              .black, // button text color
                                                        ),
                                                      ),
                                                    ),
                                                    child: child!,
                                                  );
                                                },
                                              ) ??
                                              homeController
                                                  .filterEndingDateFind!.value;
                                    },
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Obx(
                                        () => Text(
                                          "${homeController.filterEndingDateFind!.value.day}/0${homeController.filterEndingDateFind!.value.month}/${homeController.filterEndingDateFind!.value.year}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    var sd =
                                        "${homeController.filterStartingDateFind!.value.day}/0${homeController.filterStartingDateFind!.value.month}/${homeController.filterStartingDateFind!.value.year}";
                                    var ed =
                                        "${homeController.filterEndingDateFind!.value.day}/0${homeController.filterEndingDateFind!.value.month}/${homeController.filterEndingDateFind!.value.year}";
                                    homeController.filterDate(
                                      startingDate: sd,
                                      endingDate: ed,
                                    );
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Category Wise",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => DropdownButtonFormField(
                                      value:
                                          homeController.selectedCategory.value,
                                      items: homeController.allCategoryList
                                          .map(
                                            (element) => DropdownMenuItem(
                                              child: Text(element),
                                              value: element,
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        homeController.selectedCategory.value =
                                            value!;
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.white,
                                      ),
                                      dropdownColor: Colors.black,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    homeController.filterCategory(
                                      homeController.selectedCategory.value,
                                    );
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "PaymentMethod Wise",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => DropdownButtonFormField(
                                      value: homeController
                                          .selectedPaymentMethod.value,
                                      items: homeController.allPaymentMethodList
                                          .map(
                                            (element) => DropdownMenuItem(
                                              child: Text(element),
                                              value: element,
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        homeController.selectedPaymentMethod
                                            .value = value!;
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.white,
                                      ),
                                      dropdownColor: Colors.black,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    homeController.filterPaymentMethod(
                                      homeController
                                          .selectedPaymentMethod.value,
                                    );
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 5,
                        bottom: 5,
                      ),
                      child: InkWell(
                        onTap: () {
                          homeController.udId.value =
                              homeController.dataList[index]['id'];
                          homeController.changeUDIndex(
                              homeController.dataList[index]['status']);
                          homeController.oldData(
                            id: homeController.udId.value,
                          );
                          Get.toNamed(
                            'udtabbar_screen',
                            arguments: index,
                          );
                        },
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: homeController.dataList[index]
                                              ['status'] ==
                                          1
                                      ? Icon(
                                          Icons.file_upload_outlined,
                                          color: Colors.red,
                                          size: 35,
                                        )
                                      : Icon(
                                          Icons.file_download_outlined,
                                          color: Colors.green,
                                          size: 35,
                                        ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${homeController.dataList.value[index]['category']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${homeController.dataList.value[index]['paymentmethod']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.fiber_manual_record,
                                          color: Colors.black54,
                                          size: 10,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${homeController.dataList.value[index]['date']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      alignment: Alignment.topRight,
                                      child: homeController.dataList[index]
                                                  ['status'] ==
                                              1
                                          ? Text(
                                              "₹ ${homeController.dataList.value[index]['amount']} INR",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            )
                                          : Text(
                                              "₹ ${homeController.dataList.value[index]['amount']} INR",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: homeController.dataList.length,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
