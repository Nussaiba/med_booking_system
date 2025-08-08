import 'dart:convert';
// import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/checkinternet.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'dart:io';
import 'package:path/path.dart';

class Crud {
  MyServices myServices = Get.find();
  Map<String, String> headers = {
    "Accept": "application/json",
    // "Accept-Language": MyServices().box.read("lang") ?? Locale(Get.deviceLocale!.languageCode).toString(),
  };
  Token() {
    // String? token = myServices.box.read("token");
    // print("$token qqqqqqqqqqq");

    // print(
    //     "${MyServices().box.read("lang")}llllllllaaaaaaaaaaannnnnnnggggggggg");
    // if (token != null && token.isNotEmpty) {
    //   headers['Authorization'] = 'Bearer $token';
    // }

    String doctorToken = '629|PSY1fErcVYD5rVcymrw7fSKAnnX2KjuA5NcJ0nASf9c5db1f';
// 650|xFOPwztcOopnFLsqkemWoXgjKQUIpG2mC1Dvb3nZ48273a2e
    String patientToken =
        '594|z6kTluKau9a4htxI4VMeayBS6Zj4vkLLo6ZFN0Syccbebcb0';
    headers['Authorization'] = 'Bearer $doctorToken';
  }

  Future<Either<StatusRequest, Map>> postData(String linkurl, data) async {
    try {
      if (await checkInternet()) {
        print("sssssssssss");
        Token();
        var response = await http.post(
          Uri.parse(linkurl),
          headers: headers,
          body: data,
        );
        print("response $response");

        print(response.statusCode);

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 401 ||
            response.statusCode == 404 ||
            response.statusCode == 403 ||
            response.statusCode == 400 ||
            response.statusCode == 422 ||
            response.statusCode == 500) {
          Map responsebody = jsonDecode(response.body);
          print("CRUUUUUUUUUUUUUUUUuuuuuuD $responsebody .....");

          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        print("StatusRequest.offlinefailure");
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    Token();
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl), headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 404) {
        Map responsebody = jsonDecode(response.body);

        //print(responsebody);
        print('=======${response}');
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> postFileAndData(
    String linkUrl,
    Map data,
    String? filename,
    File? file,
  ) async {
    Token();

    var request = http.MultipartRequest('Post', Uri.parse(linkUrl));
    request.headers.addAll(headers);
    if (file != null) {
      int fileLength = await file.length();
      var streamData = http.ByteStream(file.openRead());
      var multiFile = http.MultipartFile(
        filename!,
        streamData,
        fileLength,
        filename: basename(file.path),
      );
      request.files.add(multiFile);
    }

    data.forEach((key, value) {
      if (value is List<String>) {
        request.fields[key] = jsonEncode(value);
      } else {
        request.fields[key] = value.toString();
      }
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 401 ||
        response.statusCode == 400 ||
        response.statusCode == 422 ||
        response.statusCode == 500) {
      Map responsebody = jsonDecode(response.body);

      print("postMultiData1============ $responsebody");

      return Right(responsebody);
    } else {
      print("postMultiData1============ ${response.body}");

      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> postTowFileAndData(
    String linkUrl,
    Map data,

    String? filename,
    File? file,

    File? file2,

    String? filename2,
  ) async {
    Token();

    var request = http.MultipartRequest('Post', Uri.parse(linkUrl));
    request.headers.addAll(headers);
    if (file != null) {
      int fileLength = await file.length();
      var streamData = http.ByteStream(file.openRead());
      var multiFile = http.MultipartFile(
        filename!,
        streamData,
        fileLength,
        filename: basename(file.path),
      );
      request.files.add(multiFile);
    }

    if (file2 != null) {
      int file2Length = await file2.length();
      var stream2Data = http.ByteStream(file2.openRead());
      var multi2File = http.MultipartFile(
        filename2!,
        stream2Data,
        file2Length,
        filename: basename(file2.path),
      );

      request.files.add(multi2File);
    }

    data.forEach((key, value) {
      if (value is List<String>) {
        request.fields[key] = jsonEncode(value);
      } else {
        request.fields[key] = value.toString();
      }
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 401 ||
        response.statusCode == 400 ||
        response.statusCode == 422 ||
        response.statusCode == 500) {
      Map responsebody = jsonDecode(response.body);

      print("postMultiData1============ $responsebody");

      return Right(responsebody);
    } else {
      print("postMultiData1============ ${response.body}");

      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> postMutipleImagesAndData(
    String linkurl,
    Map data,
    String name,
    images,
    String? fileName,
    files,
  ) async {
    Token();
    var request = http.MultipartRequest('POST', Uri.parse(linkurl));

    request.headers.addAll(headers);
    for (int i = 0; i < files.length; i++) {
      request.files.add(
        http.MultipartFile(
          '$fileName[$i]',
          http.ByteStream(files[i].openRead()),
          await files[i].length(),
          filename: basename(files[i].path),
        ),
      );
    }

    for (int i = 0; i < images.length; i++) {
      request.files.add(
        http.MultipartFile(
          '$name[$i]',
          http.ByteStream(images[i].openRead()),
          await images[i].length(),
          filename: basename(images[i].path),
        ),
      );
    }

    data.forEach((key, value) {
      if (value is List<String>) {
        request.fields[key] = jsonEncode(value);
      } else {
        request.fields[key] = value.toString();
      }
    });

    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);

    if (myRequest.statusCode == 200 ||
        myRequest.statusCode == 201 ||
        myRequest.statusCode == 422) {
      return Right(jsonDecode(response.body));
    } else {
      print(response.body);
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, dynamic>> create(String linkurl, data) async {
    try {
      //if (await checkInternet()) {
      Token();
      headers['Content-Type'] = 'application/json';
      headers['Accept'] = 'application/pdf';
      var response = await http.post(
        Uri.parse(linkurl),
        headers: headers,
        body: data,
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("CRUUUUUUUUUUUUUUUUuuuuuuD $response.....");

        return Right(response);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
      // } else {
      //   print("StatusRequest.offlinefailure");
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(String linkUrl) async {
    //  try {
    Token();
    var response = await http.delete(Uri.parse(linkUrl), headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 401 ||
        response.statusCode == 400 ||
        response.statusCode == 422 ||
        response.statusCode == 500) {
      Map responsebody = jsonDecode(response.body);
      print("CRUD DELETE $responsebody .....");

      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
    // } catch (_) {
    //   return const Left(StatusRequest.serverfailure);
    // }
  }
}
