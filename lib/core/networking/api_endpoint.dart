// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static final baseUrl = "https://illuminate-production.up.railway.app/api";

  //------------------------>  AUTHENTICATION  <-------------------------------

  static String auth(AuthEndpoint endpoint) {
    const path = '/auth';
    switch (endpoint) {
      case AuthEndpoint.REFRESH_TOKEN:
        return "$path/refresh_token";
      case AuthEndpoint.LOGIN:
        return "$path/local/";
    }
  }

  //------------------------>  STOCKS  <-------------------------------

  static String stocks(StockEndpoint endpoint) {
    const path = '/stocks';
    switch (endpoint) {
      case StockEndpoint.BASE:
        return "$path/";
      case StockEndpoint.SEARCH_STOCK:
        return "$path/search";
    }
  }
}

//------------------------>  AUTHENTICATION  <-------------------------------

enum AuthEndpoint { LOGIN, REFRESH_TOKEN }

enum StockEndpoint { BASE, SEARCH_STOCK }
