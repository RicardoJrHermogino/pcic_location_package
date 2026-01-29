import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'location.dart';

class LocationService {
  // Changed: Remove 'packages/pcic_location_package/' prefix
  static const String _provincePath = 'packages/pcic_location_package/data/province.json';
  static const String _municipalityPath = 'packages/pcic_location_package/data/municipality.json';
  static const String _barangayPath = 'packages/pcic_location_package/data/barangay.json';

  /// Load all provinces
  Future<List<Province>> loadProvinces() async {
    try {
      final String jsonString = await rootBundle.loadString(_provincePath);
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Province.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load province data: $e');
    }
  }

  /// Load all municipalities
  Future<List<Municipality>> loadMunicipalities() async {
    try {
      final String jsonString = await rootBundle.loadString(_municipalityPath);
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Municipality.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load municipality data: $e');
    }
  }

  /// Load all barangays
  Future<List<Barangay>> loadBarangays() async {
    try {
      final String jsonString = await rootBundle.loadString(_barangayPath);
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Barangay.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load barangay data: $e');
    }
  }

  /// Get municipalities by province code
  Future<List<Municipality>> getMunicipalitiesByProvince(String provinceCode) async {
    final municipalities = await loadMunicipalities();
    return municipalities.where((m) => m.provinceCode == provinceCode).toList();
  }

  /// Get barangays by municipality code
  Future<List<Barangay>> getBarangaysByMunicipality(int municipalityCode) async {
    final barangays = await loadBarangays();
    return barangays.where((b) => b.municipalityCode == municipalityCode).toList();
  }

  /// Get province by code
  Future<Province?> getProvinceByCode(String provinceCode) async {
    final provinces = await loadProvinces();
    try {
      return provinces.firstWhere((p) => p.provinceCode == provinceCode);
    } catch (e) {
      return null;
    }
  }
}