// import 'package:flutter/material.dart';
// import 'package:tucker/core/presentation/design/atoms/atoms.dart';
// import 'package:tucker/core/presentation/design/tokens/tokens.dart';
// import 'package:tucker/core/presentation/utils/dimens_extension.dart';
// import 'package:tucker/features/sign_in/presentation/widgets/card_container.dart';
// import '../../../features/dashboard/presentation/new_operation/widgets/form_add_new_value.dart';
// import '../../../features/dashboard/presentation/new_operation/new_operation_page.dart';

// ///
// /// Esta clase contiene todos los mensajes de dialogo que se mostrarán dentro de la aplicación
// ///

// extension CustomDialogs on BuildContext {
//   void showMenuDialog() => showDialog(
//         context: this,
//         barrierDismissible: false,
//         builder: (context) {
//           return Center(
//             child: Material(
//                 type: MaterialType.transparency,
//                 child: Container(
//                   width: context.width(.5),
//                   height: context.height(.8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: colors.cardColor),
//                   child: const NewOperationPage(),
//                 )),
//           );
//         },
//       );
//   void showAddElementDialog({
//     String? title,
//     String? subtatile,
//     String? labelInput,
//     String? hintText,
//     void Function(String? value)? onTap,
//   }) =>
//       showDialog(
//         context: this,
//         barrierDismissible: true,
//         builder: (context) {
//           return Center(
//             child: Material(
//                 type: MaterialType.transparency,
//                 child: Container(
//                   width: 720,
//                   height: 370,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: colors.cardColor),
//                   child: FormAddNewValue(
//                     title: title,
//                     subtatile: subtatile,
//                     labelInput: labelInput,
//                     onTap: onTap,
//                     hintText: hintText,
//                   ),
//                 )),
//           );
//         },
//       );

//   void showCardOptions({
//     required double? topHeight,
//     required double? leftWidth,
//     required List<ShowCardOptionsData> data,
//   }) =>
//       showDialog(
//         context: this,
//         barrierDismissible: true,
//         barrierColor: Colors.transparent,
//         anchorPoint: const Offset(0, 0),
//         builder: (context) {
//           double? top = topHeight! - 30;
//           double? left = leftWidth! - 125;
//           return Center(
//             child: Material(
//                 type: MaterialType.transparency,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                         top: top,
//                         left: left,
//                         child: CardContainer(
//                           width: 155,
//                           height: 100,
//                           padding: const EdgeInsets.all(5),
//                           child: ListView.builder(
//                             itemCount: data.length,
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                 title: InkWell(
//                                   onTap: () {
//                                     Navigator.pop(context);
//                                     data[index].onTap!();
//                                   },
//                                   child: CustomText(
//                                     data[index].title!,
//                                     fontSize: 16,
//                                     textColor: colors.blackNormal,
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         )),
//                   ],
//                 )),
//           );
//         },
//       );

//   void showMessageDialog(
//           {required List<Widget> actions,
//           String? title,
//           String? subtitle,
//           bool? dimisible}) =>
//       showDialog(
//         context: this,
//         barrierDismissible: dimisible ?? true,
//         builder: (context) {
//           return Center(
//             child: Material(
//               type: MaterialType.transparency,
//               child: Container(
//                   width: context.width(.55),
//                   padding: EdgeInsets.symmetric(
//                       vertical: context.height(.04),
//                       horizontal: context.width(.05)),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: colors.cardColor),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       CustomText(
//                         title,
//                         isTitle: true,
//                         fontSize: 34,
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 12),
//                       CustomText(
//                         subtitle,
//                         fontSize: 18,
//                         textColor: colors.blackText,
//                         textAlign: TextAlign.center,
//                         height: 1.5,
//                       ),
//                       const SizedBox(height: 48),
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: actions)
//                     ],
//                   )),
//             ),
//           );
//         },
//       );

//   void showToast(
//       {String? message,
//       double? witdh,
//       bool? diseabledButton = false,
//       void Function()? onTap}) {
//     final scaffold = ScaffoldMessenger.of(this);

//     scaffold.showSnackBar(
//       SnackBar(
//         elevation: 5.0,
//         backgroundColor: colors.blackNormal,
//         actionOverflowThreshold: 0.1,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         width: witdh ?? 450,
//         padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),

//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomText(
//               message,
//               textColor: colors.blackWhite,
//               fontSize: 18,
//             ),
//             if (diseabledButton!) ...[
//               const SizedBox(width: 28),
//               InkWell(
//                 onTap: () {
//                   onTap!();
//                   scaffold.hideCurrentSnackBar();
//                 },
//                 child: CustomText(
//                   "Deshacer",
//                   textColor: colors.blueLigth,
//                   fontWeight: FontWeight.w500,
//                   textDecoration: TextDecoration.underline,
//                   fontSize: 18,
//                 ),
//               ),
//             ]
//           ],
//         ),

//         behavior: SnackBarBehavior.floating,

//         // action: SnackBarAction(
//         //     label: 'UNDO',
//         //     textColor: Colors.red,
//         //     onPressed: scaffold.hideCurrentSnackBar),
//       ),
//     );
//   }
// }

// class ShowCardOptionsData {
//   final String? title;
//   final void Function()? onTap;

//   ShowCardOptionsData({
//     this.title,
//     this.onTap,
//   });
// }
