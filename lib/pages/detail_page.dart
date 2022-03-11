import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pardemo/pages/model/emp_create.dart';
import 'package:pardemo/pages/model/emp_model.dart';
import 'package:pardemo/pages/model/empone_model.dart';
import 'package:pardemo/pages/services/http_service.dart';

import 'model/user_model.dart';
class DetailPage extends StatefulWidget {
static const String id = 'detail_page';

  const DetailPage({Key? key}) : super(key: key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
   Employee? empi;

   @override
   void initState() {
     // TODO: implement initState
     //var user = User(id: 25, salary: "10000", age: "26",  name: 'Michael');
     _apiPostDelete(25);
     super.initState();
   }
  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
      print(response),
      _showResponse(response!),
    });
  }
   void _apiPostCreate(User user){
     Network.POST(Network.API_EMP_CREATE, Network.paramsCreate(user)).then((response) => {
       print(response),
       _showResponse(response!),
     });
   }
   void _apiPostUpdate(User user, int id){
     Network.PUT(Network.API_EMP_UPDATE + id.toString(), Network.paramsUpdate(user)).then((response) => {
       print(response),
     });
   }
   void _apiPostDelete(int id){
     Network.DEL(Network.API_EMP_DELETE + id.toString(), Network.paramsEmpty()).then((response) => {
       print(response),
     });
   }
  void _showResponse(String response) {
    // EmpOne empOne = Network.parseEmpOne(response);
    EmpCreate empCreate = Network.parseCreate(response);
    setState(() {
        empi = empCreate.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: empi != null ?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(empi!.employee_name +"("+   empi!.employee_age.toString() +")",style: const TextStyle(color: Colors.black,fontSize: 20),),
            const SizedBox(height: 10,),
            Text(empi!.employee_salary.toString()+"\$",style: const TextStyle(color: Colors.black,fontSize: 18),),
          ],
        ) :
        Text("No data")
      ),
    );
  }
}
