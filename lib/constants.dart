import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color(0xFF3E4067);
const kTextColor = Color(0xFF3F4168);
const kIconColor = Color(0xFF5E5E5E);
const kWhiteIconColor = Color(0xFFFFFFFF);
const cityPassPrimaryColor = Color(0xFF59BB4A);
const cityPassDarkColor = Color(0xFF4C9F40);
const cityPassDarkBackgroundColor = Color(0xFF2B5525);
const lightGrayBackground = Color(0xFFFCFCFC);
const textBlack = Color(0xFF212121);

const kDefaultPadding = 20.0;

final kPopShadow = BoxShadow(
  offset: Offset(0, 0),
  blurRadius: 50,
  color: Color(0xFFB0B0B0).withOpacity(0.90),
);

final kDefaultShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 10,
  color: Color(0xFFB0B0B0).withOpacity(0.56),
);

final smallShadow = BoxShadow(
  offset: Offset(0, 2),
  blurRadius: 3,
  color: Color(0xFFA0A0A0).withOpacity(0.56),
);

final DateFormat simpleDateFormat = new DateFormat("d LLL y", "vi_VN");
