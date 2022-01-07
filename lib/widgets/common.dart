import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quantified_citizen/packages/config_packages.dart';

/// Common widget which is mostly used in project

/// returns SizedBox with width which pass in [value] parameter
Widget sizeWidth(double width) {
  return SizedBox(width: width);
}

/// returns SizedBox with height which pass in [value] parameter
Widget sizeHeight(double value) {
  return SizedBox(height: value);
}

/// load images from assets
Image squareImageFromAsset(String image, {Color? color, double size = 24, BoxFit? fit}) => Image.asset(image, color: color, width: size, height: size, fit: fit);

/// ActionButton common designed button as per app theme
actionButton(text, onTap, {leftPadding, rightPadding, bgColor, textColor, borderColor}) {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.only(
        left: leftPadding ?? 0,
        right: rightPadding ?? 0,
      ),
      child: FlatButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17), side: BorderSide(color: borderColor ?? primaryColor)),
        color: bgColor ?? primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Text(text, style: textSemiBold(18).copyWith(color: textColor ?? whiteColor)),
        ),
      ),
    ),
  );
}

Widget textField(
  TextEditingController? controller,
  String hintText,
  String labelText,
  var keyboardType, {
  bool obscure = false,
  action: TextInputAction.next,
  var validator,
  var key,
  FocusNode? focus,
  var fieldSubmitted,
  var textCapitalization = TextCapitalization.none,
  var autoValidateMode = AutovalidateMode.disabled,
  Function? onChanged,
  VoidCallback? onEditingCompleted,
  String? initialValue,
  Widget? suffixIcon,
  TextStyle? style,
  Color backgroundColor = Colors.transparent,
  Color? labelColor,
  bool enabled = true,
  Widget? prefixIcon,
  VoidCallback? onTap,
  Iterable<String>? autoFillHints,
  List<TextInputFormatter>? inputFormatters,
  bool showOutlines = true,
  bool autoFocus = false,
  int? errorLines,
}) {
  return TextFormField(
    key: key,
    validator: validator,
    readOnly: !enabled,
    textInputAction: action,
    onFieldSubmitted: fieldSubmitted,
    autovalidateMode: autoValidateMode,
    controller: controller,
    autofillHints: autoFillHints,
    textCapitalization: textCapitalization,
    onSaved: (value) {
      // print("Saved $value");
    },
    focusNode: focus,
    obscureText: obscure,
    onChanged: onChanged as void Function(String)?,
    onEditingComplete: onEditingCompleted,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    onTap: onTap,
    style: style ?? textRegular(18, color: blackColor).copyWith(fontFamily: GoogleFonts.jetBrainsMono().fontFamily),
    autofocus: autoFocus,
    cursorColor: primaryColor,
    textDirection: TextDirection.rtl,
    decoration: InputDecoration(
      fillColor: backgroundColor,
      filled: true,
      contentPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
      errorMaxLines: errorLines ?? 1,
      disabledBorder:
          showOutlines ? OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: darkGreyColor)) : InputBorder.none,
      enabledBorder:
          showOutlines ? OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: darkGreyColor)) : InputBorder.none,
      focusedBorder:
          showOutlines ? OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: darkGreyColor)) : InputBorder.none,
      errorBorder:
          showOutlines ? OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: darkGreyColor)) : InputBorder.none,
      focusedErrorBorder:
          showOutlines ? OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: darkGreyColor)) : InputBorder.none,
      hintText: hintText,
      hintStyle: textRegular(15, color: darkGreyColor),
      suffixIcon: suffixIcon,
      labelText: labelText,
      labelStyle: textRegular(15, color: labelColor ?? blackColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: prefixIcon,
    ),
  );
}
