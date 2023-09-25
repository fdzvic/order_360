// import 'package:flutter/material.dart';
// import 'package:order_360/core/presentation/design/atoms/custom_text.dart';
// import 'package:order_360/core/presentation/design/tokens/colors.dart';

// class CustomTextFormField extends StatefulWidget {
//   /// Titulo input.
//   final String label;

//   /// Titulo que acompaña al titulo principal
//   final String? secondLabel;

//   /// Text controller.
//   final TextEditingController? controller;

//   /// Whether the form is able to receive user input.
//   final bool? enabled;

//   /// Tipo de dato que se ingresará en el formulario.
//   final InputValueType? inputValueType;

//   /// Si es repetición de valor se debe validar.
//   final String? matchValue;

//   /// HintText del textFormField.
//   final String? hintText;

//   /// Ubicación icono de suffix;
//   final String? suffixIconPath;
//   //Funcion para detectar los cambios en los inputs
//   final Function(String)? onChanged;
//   // Boleano para detectar errores del back que afecten el input
//   final bool? errorBack;

//   final String? timeToCompare;

//   const CustomTextFormField({
//     Key? key,
//     required this.label,
//     this.suffixIconPath,
//     this.controller,
//     this.enabled = true,
//     this.inputValueType = InputValueType.text,
//     this.matchValue,
//     this.hintText,
//     this.onChanged,
//     this.errorBack = false,
//     this.secondLabel,
//     this.timeToCompare,
//   }) : super(key: key);

//   @override
//   CustomTextFormFieldState createState() => CustomTextFormFieldState();
// }

// class CustomTextFormFieldState extends State<CustomTextFormField> {
//   FocusNode focusNode = FocusNode();
//   bool obscureText = false;
//   bool? showError;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();

//     focusNode.addListener(() {
//       setState(() {});
//     });

//     Future.delayed(
//       Duration.zero,
//       () => {
//         _defineObscureTextValue(),
//         _addTextControllerListener(),
//       },
//     );
//   }

//   @override
//   void dispose() {
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             CustomText(
//               widget.label,
//               isTitle: false,
//               fontWeight: FontWeight.w500,
//               fontSize: 16,
//               textColor: colors.blackNormal,
//             ),
//             if (widget.secondLabel != null) ...[
//               const SizedBox(width: 4),
//               CustomText(
//                 widget.secondLabel,
//                 isTitle: false,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16,
//                 textColor: colors.blackLightActive,
//               ),
//             ]
//           ],
//         ),
//         const SizedBox(height: 4),
//         Container(
//           height: 48,
//           padding: const EdgeInsets.only(left: 16, right: 18),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: colors.cardColor,
//             borderRadius: const BorderRadius.all(Radius.circular(12)),
//             border: Border.fromBorderSide(BorderSide(color: _accentColor())),
//           ),
//           child: TextFormField(
//             focusNode: focusNode,
//             controller: widget.controller,
//             validator: (x) => _validateInput(x ?? ''),
//             onChanged: widget.onChanged,
//             enabled: widget.enabled,
//             textInputAction: TextInputAction.next,

//             style: TextStyle(
//                 fontFamily: "Roboto", color: colors.blackNormal, fontSize: 16),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: widget.hintText,
//                 errorStyle:
//                     const TextStyle(fontSize: 0.1, color: Colors.transparent),
//                 hintStyle: TextStyle(
//                   color: colors.blackLightHover,
//                   fontFamily: "Roboto",
//                   fontSize: 16,
//                 ),
//                 // suffixIcon: widget.suffixIconPath != null
//                 //     ? InkWell(
//                 //         onTap: () => onTapSuffixIcon(),
//                 //         child: SvgPicture.asset(
//                 //           obscureText
//                 //               ? 'assets/icons/closed_eye_icon.svg'
//                 //               : 'assets/icons/open_eye_icon.svg',
//                 //         ),
//                 //       )
//                 //     : null,
//                 suffixIconConstraints:
//                     const BoxConstraints(maxHeight: 20, maxWidth: 20)),
//             keyboardType: _keyboardType(),
//             obscureText: obscureText,
//             cursorHeight: 20,
//             cursorWidth: 1,
//             cursorColor: Colors.black,
//           ),
//         ),
//         Container(
//           height: 20,
//           alignment: Alignment.centerLeft,
//           child: Column(
//             children: [
//               /// Mensaje error
//               if (showError ?? false) ...[
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(Icons.info_outline, color: colors.redNormal, size: 14),
//                     const SizedBox(width: 5),
//                     CustomText(
//                       errorMessage,
//                       textColor: colors.redNormal,
//                       fontSize: 12,
//                     ),
//                   ],
//                 )
//               ]
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   void onTapSuffixIcon() {
//     obscureText = !obscureText;
//     setState(() {});
//   }

//   Color _accentColor() {
//     if (showError ?? false) {
//       return colors.redNormal;
//     }
//     return focusNode.hasFocus ? colors.blackNormal : colors.blackLightHover;
//   }

//   _defineObscureTextValue() {
//     setState(() {
//       obscureText = (widget.inputValueType == InputValueType.password);
//     });
//   }

//   _validate(String text) {
//     switch (widget.inputValueType) {
//       case InputValueType.email:
//         errorMessage = validateEmail(text, matchValue: widget.matchValue);
//         break;
//       case InputValueType.password:
//         errorMessage = validatePassword(text,
//             matchValue: widget.matchValue, errorBack: widget.errorBack);
//         break;

//       case InputValueType.user:
//         errorMessage = validateUser(text, errorBack: widget.errorBack);
//         break;
//       case InputValueType.phone:
//         errorMessage = validatePhone(text, matchValue: widget.matchValue);
//         break;
//       case InputValueType.document:
//         errorMessage = validateDocument(text);
//         break;

//       case InputValueType.name:
//         errorMessage = validateName(text);
//         break;
//       case InputValueType.number:
//         errorMessage = validateNumber(text);
//         break;
//       case InputValueType.time:
//         errorMessage = validateTime(text, widget.timeToCompare!);
//         break;
//       case InputValueType.currency:
//       case InputValueType.text:
//       default:
//         errorMessage = validateText(text, matchValue: widget.matchValue);
//         break;
//     }
//     showError = errorMessage != null;
//     return errorMessage;
//   }

//   _addTextControllerListener() {
//     if (widget.controller != null) {
//       widget.controller!.addListener(() {});
//     }
//   }

//   String? _validateInput(String x) {
//     _validate(x);
//     setState(() {});
//     return errorMessage;
//   }

//   _keyboardType() {
//     switch (widget.inputValueType) {
//       case InputValueType.email:
//         return TextInputType.emailAddress;

//       ///
//       case InputValueType.password:
//         return TextInputType.visiblePassword;

//       ///
//       case InputValueType.phone:
//       case InputValueType.number:
//       case InputValueType.document:
//         return TextInputType.number;

//       ///
//       case InputValueType.text:
//       case InputValueType.name:
//       default:
//         return TextInputType.text;
//     }
//   }
// }

// enum InputValueType {
//   text,
//   number,
//   phone,
//   email,
//   password,
//   document,
//   currency,
//   name,
//   user,
//   time,
// }
