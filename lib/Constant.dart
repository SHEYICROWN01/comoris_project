
import 'package:comoris_app/widgets/generallocalgovernment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'generalpage.dart';
import 'models/dashboardModel.dart';

 List<DashboardModel> DASHBOARDMODELLIST =[
  DashboardModel("Abeokuta North", "Riders", Colors.indigo, onclick:() => Get.to(() =>  GeneralPage(baseUrl: 'abeokuta_north'))),
  DashboardModel("Abeokuta South", "Riders", Colors.orange, onclick:() => Get.to(()=>  GeneralPage(baseUrl: 'abeokuta_south',))),
  DashboardModel("Ewekoro ", "Riders", Colors.green, onclick:()=> Get.to(()=>  GeneralPage(baseUrl: 'ewekoro'))),
  DashboardModel("Ifo", "Riders", Colors.pink, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'ifo'))),
  DashboardModel("Ijebu  East", "Riders", Colors.indigo, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'ijebu_east'))),
  DashboardModel("Ijebu North", "Riders", Colors.tealAccent, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'ijebu_north'))),
  DashboardModel("Ijebu North-East", "Riders", Colors.green, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'ijebu_north_east',))),
  DashboardModel("Ijebu Ode", "Riders", Colors.blue, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'ijebu_ode'))),
  DashboardModel("Ikenne", "Riders", Colors.brown, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'ikenne',))),
  DashboardModel("Imeko Afon", "Riders", Colors.deepOrangeAccent,onclick:() => Get.to(()=> GeneralPage(baseUrl: 'imeko_afon',))),
  DashboardModel("Ipokia", "Riders", Colors.red, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'ipokia',))),
  DashboardModel("Odeda", "Riders", Colors.teal, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'odeda'))),
  DashboardModel("Odogbolu", "Riders", Colors.lightGreen, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'odogbolu',))),
  DashboardModel("Ota", "Riders", Colors.pinkAccent, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'ota',))),
  DashboardModel("Owode", "Riders", Colors.cyan, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'owode'))),
  DashboardModel("Remo North", "Riders", Colors.yellow, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'remo_north',))),
  DashboardModel("Sagumu", "Riders", Colors.grey, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'sagamu'))),
  DashboardModel("Water Side", "Riders", Colors.pinkAccent, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'water_side',))),
  DashboardModel("Yewa South", "Riders", Colors.orange, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'yewa_south',))),
  DashboardModel("Yewa North", "Riders", Colors.indigoAccent, onclick:() => Get.to(()=> GeneralPage(baseUrl: 'yewa_north',)))




];