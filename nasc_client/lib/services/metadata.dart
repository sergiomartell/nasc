import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:nasc_client/services/services.dart';

class Metadata {
  final String name;
  final String description;
  final String image;
  final String externalUrl;
  final String attributes;

  Metadata({
    required this.name,
    required this.description,
    required this.image,
    required this.externalUrl,
    required this.attributes,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'external_url': externalUrl,
      'attributes': attributes,
    };
  }
}

// Method to upload metadata using uploadFile endpoint
Future<String> uploadMetadata(Metadata metadata) async {
  final response = await http.post(
    Uri.parse(Endpoints.uploadFile),
    body: jsonEncode(metadata.toJson()),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': "6d0322b3.1915e4d7265f40ab8a362c69ac4a8f70"
    },
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to upload metadata');
  }
}

class LighthouseUploader {
  final String apiEndpoint = 'https://node.lighthouse.storage/api/v0/add';
  final String apiKey = '6d0322b3.1915e4d7265f40ab8a362c69ac4a8f70';

  // ignore: body_might_complete_normally_nullable
  Future<void> uploadFile(XFile file) async {
    try {
      var uri = Uri.parse(apiEndpoint);
      var request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = 'Bearer $apiKey';

      var reader = FileReader();
      reader.readAsArrayBuffer(
          Blob([await file.readAsBytes()], 'application/octet-stream'));

      reader.onLoadEnd.listen((event) async {
        var fileBytes = reader.result as List<int>;
        var multipartFile = http.MultipartFile.fromBytes(
          'file',
          fileBytes,
          filename: file.name,
        );

        request.files.add(multipartFile);

        var response = await request.send();

        if (response.statusCode == 200) {
          var responseBody = await response.stream.bytesToString();
          var jsonResponse = json.decode(responseBody);

          debugPrint('File uploaded successfully');
          debugPrint(jsonResponse.toString());
          Metadata metadata = Metadata(
            name: file.name,
            description: "El Mexicano Baseline Data",
            image:
                "ipfs://bafybeibe3kdp34mphsssnrrq2ti2ftcfgpmbahab6wnlrsdr62g5hqkfs4",
            externalUrl: "ipfs://${jsonResponse['Hash']}",
            attributes: '{}',
          );
          uploadJson(metadata.toJson());
          return jsonResponse['Hash'];
        } else {
          debugPrint(
              'Failed to upload file. Status code: ${response.statusCode}');
          return Future.error('Failed to upload file');
        }
      });
    } catch (e) {
      debugPrint('Error uploading file: $e');
      throw Exception('Failed to upload file');
    }
  }

  Future<String?> uploadJson(Map<String, dynamic> jsonObject) async {
    Web3 web3 = Web3();
    try {
      var uri = Uri.parse(apiEndpoint);
      var request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = 'Bearer $apiKey';

      // Convert JSON object to bytes
      var jsonBytes = utf8.encode(json.encode(jsonObject));

      // Add bytes as a multipart file
      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        jsonBytes,
        filename: 'data.json',
      );

      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseBody);
        // Assuming the response contains a 'uri' field with the file URI
        var fileUri = jsonResponse['Hash'];
        debugPrint('JSON uploaded successfully: $fileUri');
        web3.setBaselineDataURI(20, fileUri);
        return fileUri;
      } else {
        debugPrint(
            'Failed to upload JSON. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error uploading JSON: $e');
      return null;
    }
  }
}
