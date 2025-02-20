import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final int id;
  final String? name;
  final String? symbol;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? alpacaId;
  final String? exchange;
  final String? description;
  final String? assetType;
  final String? isin;
  final String? industry;
  final String? sector;
  final int? employees;
  final String? website;
  final String? address;
  final String? netZeroProgress;
  final num? carbonIntensityScope3;
  final num? carbonIntensityScope1And2;
  final num? carbonIntensityScope1And2And3;
  final String? tempAlignmentScopes1And2;
  final bool? dnshAssessmentPass;
  final bool? goodGovernanceAssessment;
  final bool? contributeToEnvironmentOrSocialObjective;
  final bool? sustainableInvestment;
  final num? scope1Emissions;
  final num? scope2Emissions;
  final num? scope3Emissions;
  final num? totalEmissions;
  final DateTime? listingDate;
  final String? marketCap;
  final int? ibkrConnectionId;
  final StockImage? image;

  const Stock({
    required this.id,
    required this.name,
    required this.symbol,
    required this.createdAt,
    required this.updatedAt,
    required this.alpacaId,
    required this.exchange,
    required this.description,
    required this.assetType,
    required this.isin,
    required this.industry,
    required this.sector,
    required this.employees,
    this.website,
    this.address,
    this.netZeroProgress,
    this.carbonIntensityScope3,
    this.carbonIntensityScope1And2,
    this.carbonIntensityScope1And2And3,
    this.tempAlignmentScopes1And2,
    this.dnshAssessmentPass,
    this.goodGovernanceAssessment,
    this.contributeToEnvironmentOrSocialObjective,
    this.sustainableInvestment,
    this.scope1Emissions,
    this.scope2Emissions,
    this.scope3Emissions,
    this.totalEmissions,
    required this.listingDate,
    this.marketCap,
    required this.ibkrConnectionId,
    required this.image,
  });

  @override
  List<Object?> get props => [id];
}

class StockImage extends Equatable {
  final int id;
  final String? name;
  final String? alternativeText;
  final String? caption;
  final int? width;
  final int? height;
  final Map<String, ImageFormat>? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final num? size;
  final String? url;
  final String? previewUrl;
  final String? provider;
  final String? providerMetadata;
  final String? folderPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const StockImage({
    required this.id,
    required this.name,
    this.alternativeText,
    this.caption,
    required this.width,
    required this.height,
    this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    required this.folderPath,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id];
}

class ImageFormat extends Equatable {
  final String? ext;
  final String? url;
  final String? hash;
  final String? mime;
  final String? name;
  final int? width;
  final int? height;
  final num? size;
  final int? sizeInBytes;

  const ImageFormat({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.width,
    this.height,
    this.size,
    this.sizeInBytes,
  });

  factory ImageFormat.fromMap(Map<String, dynamic> map) {
    return ImageFormat(
      ext: map['ext'],
      url: map['url'],
      hash: map['hash'],
      mime: map['mime'],
      name: map['name'],
      width: map['width'],
      height: map['height'],
      size: map['size'],
      sizeInBytes: map['sizeInBytes'],
    );
  }

  @override
  List<Object?> get props => [hash];
}
