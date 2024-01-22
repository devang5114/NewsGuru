import 'package:flutter/material.dart';

// height spacer
const tinyHeightSpcer = SizedBox(height: 5);
const tinySmallHeightSpacer = SizedBox(height: 10);
const smallHeightSpcer = SizedBox(height: 15);
const mediumHeightSpcer = SizedBox(height: 25);
const largeHeightSpcer = SizedBox(height: 35);
const extraLargeHeightSpcer = SizedBox(height: 45);

heightSpacer(double height) => SizedBox(height: height);

// width spacer

const tinySmallWidthSpcer = SizedBox(width: 5);
const tinyWidthSpcer = SizedBox(width: 10);
const smallWidthSpcer = SizedBox(width: 15);
const mediumWidthSpcer = SizedBox(width: 25);
const largeWidthSpcer = SizedBox(width: 35);
const extraLargeWidthSpcer = SizedBox(width: 45);

widthSpacer(double width) => SizedBox(width: width);
