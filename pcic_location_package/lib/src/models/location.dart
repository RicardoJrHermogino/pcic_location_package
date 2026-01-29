// TODO: Put public facing types in this file.

/// Model for Province data
class Province {
  final String provinceID;
  final String regionNo;
  final String provinceCode;
  final String provinceName;

  Province({
    required this.provinceID,
    required this.regionNo,
    required this.provinceCode,
    required this.provinceName,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      provinceID: json['ProvinceID'].toString(),
      regionNo: json['RegionNo'].toString(),
      provinceCode: json['provinceCode'].toString(),
      provinceName: json['provinceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProvinceID': provinceID,
      'RegionNo': regionNo,
      'provinceCode': provinceCode,
      'provinceName': provinceName,
    };
  }
}

/// Model for Municipality data
class Municipality {
  final String municipalityID;
  final String regionNo;
  final String provinceCode;
  final String municipalityCode;
  final String municipalityName;

  Municipality({
    required this.municipalityID,
    required this.regionNo,
    required this.provinceCode,
    required this.municipalityCode,
    required this.municipalityName,
  });

  factory Municipality.fromJson(Map<String, dynamic> json) {
    return Municipality(
      municipalityID: json['MunicipalityID'].toString(),
      regionNo: json['RegionNo'].toString(),
      provinceCode: json['provinceCode'].toString(),
      municipalityCode: json['municipalityCode'].toString(),
      municipalityName: json['municipalityName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MunicipalityID': municipalityID,
      'RegionNo': regionNo,
      'provinceCode': provinceCode,
      'municipalityCode': municipalityCode,
      'municipalityName': municipalityName,
    };
  }
}

/// Model for Barangay data
class Barangay {
  final int barangayID;
  final int barangayCode;
  final String barangayName;
  final int municipalityCode;

  Barangay({
    required this.barangayID,
    required this.barangayCode,
    required this.barangayName,
    required this.municipalityCode,
  });

  factory Barangay.fromJson(Map<String, dynamic> json) {
    return Barangay(
      barangayID: json['barangayID'] as int,
      barangayCode: json['barangayCode'] as int,
      barangayName: json['barangayName'] as String,
      municipalityCode: json['municipalityCode'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'barangayID': barangayID,
      'barangayCode': barangayCode,
      'barangayName': barangayName,
      'municipalityCode': municipalityCode,
    };
  }
}