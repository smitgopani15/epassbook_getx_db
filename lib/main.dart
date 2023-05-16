import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomeexpense_getx_db/screen/add/view/expense_screen.dart';
import 'package:incomeexpense_getx_db/screen/add/view/income_screen.dart';
import 'package:incomeexpense_getx_db/screen/add/view/tabbar_screen.dart';
import 'package:incomeexpense_getx_db/screen/home/view/home_screen.dart';
import 'package:incomeexpense_getx_db/screen/splash/view/splash_screen.dart';
import 'package:incomeexpense_getx_db/screen/transaction/view/transaction_screen.dart';

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
          name: '/tabbar_screen',
          page: () => TabbarScreen(),
        ),
        GetPage(
          name: '/income_screen',
          page: () => IncomeScreen(),
        ),
        GetPage(
          name: '/expense_screen',
          page: () => ExpenseScreen(),
        ),
        GetPage(
          name: '/transaction_screen',
          page: () => TransactionScreen(),
        ),
      ],
    ),
  );
}
