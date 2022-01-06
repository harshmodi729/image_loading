import 'dart:developer';

import 'package:flutter/material.dart';

const baseUrl = "https://imsea.herokuapp.com/api/1?q=google%20chrome";
const errorText = "Something went wrong.";

extension text on String {
  showLog() {
    log(this, name: "Image Loading");
  }

  noDataText() {
    return Text(
      this,
      style: const TextStyle(fontSize: 18),
    );
  }
}
