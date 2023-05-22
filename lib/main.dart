import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomeexpense_getx_db/screen/home/view/home_screen.dart';
import 'package:incomeexpense_getx_db/screen/insert/view/iexpense_screen.dart';
import 'package:incomeexpense_getx_db/screen/insert/view/iincome_screen.dart';
import 'package:incomeexpense_getx_db/screen/insert/view/itabbar_screen.dart';
import 'package:incomeexpense_getx_db/screen/splash/view/splash_screen.dart';
import 'package:incomeexpense_getx_db/screen/transaction/view/transaction_screen.dart';
import 'package:incomeexpense_getx_db/screen/updatedelete/view/udexpense_screen.dart';
import 'package:incomeexpense_getx_db/screen/updatedelete/view/udincome_screen.dart';
import 'package:incomeexpense_getx_db/screen/updatedelete/view/udtabbar_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home_screen',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/itabbar_screen',
          page: () => ITabbarScreen(),
        ),
        GetPage(
          name: '/iincome_screen',
          page: () => IIncomeScreen(),
        ),
        GetPage(
          name: '/iexpense_screen',
          page: () => IExpenseScreen(),
        ),
        GetPage(
          name: '/transaction_screen',
          page: () => TransactionScreen(),
        ),
        GetPage(
          name: '/udtabbar_screen',
          page: () => UDTabbarScreen(),
        ),
        GetPage(
          name: '/udincome_screen',
          page: () => UDIncomeScreen(),
        ),
        GetPage(
          name: '/udexpense_screen',
          page: () => UDExpenseScreen(),
        ),
      ],
    ),
  );
}

// user account
// validation
// add value of dropdown item
// master filter

// null
// total balance
// filter date reset
// insert date reset
// update date not update
// old data text in dropdown button
// home screen refresh after pop the transaction screen
