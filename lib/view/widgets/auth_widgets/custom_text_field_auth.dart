import 'package:flutter/material.dart';

Widget buildTextFormField(
    IconData icon,

  String hinttext,
  String labeltext,
  IconData ?iconData,
  TextEditingController? mycontroller,
  bool? obscureText,
  void Function()? onTapIcon,
  String? Function(String?)? valid,
) {
  return Column(
    children: [
      TextFormField(
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(
                fontSize: 12,
                // color:AppColor.TextColor()
              ),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              labeltext,
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
                color:Colors.grey
              ),
            ),
          ),
      
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
      
              //  color: AppColor.IconColor()
            ),
          ),
          prefixIcon: Icon(icon),
        ),
      ),


      SizedBox(height: 20,),
    ],
  );
}




















// import 'package:flutter/material.dart';
// import 'package:jobs/core/constants/color.dart';

// class CustomTextFormAuth extends StatelessWidget {
  
//   const CustomTextFormAuth(
//       {super.key,
//       this.obscureText,
//       this.onTapIcon,
//       required this.hinttext,
//       required this.labeltext,
//       required this.iconData,
//       this.mycontroller,
//       required this.valid});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: TextFormField(
//         style: TextStyle(color: AppColor.TextColor(), fontSize: 14, fontWeight: FontWeight.w700),
//         validator: valid,
//         controller: mycontroller,
//         obscureText: obscureText == null || obscureText == false ? false : true,
//         decoration: InputDecoration(
//             hintText: hinttext,
//             hintStyle: Theme.of(context)
//                 .textTheme
//                 .bodyText1!
//                 .copyWith(color: AppColor.grey),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//             label: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 9),
//               child: Text(
//                 labeltext,
//                 style: TextStyle(
//                   color:AppColor.TextColor()
//                 ),
//               ),
//             ),
//             suffixIcon: InkWell(
//               onTap: onTapIcon,
//               child: Icon(iconData, color: AppColor.IconColor()),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide:  BorderSide(
//                 color: AppColor.Grey()
//               ),
              
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide:  BorderSide(
//                 color: AppColor.PraimaryColor()
//               ),
              
//             ),
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
//       ),
//     );
//   }
// }
