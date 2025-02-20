import 'package:stocks/stock/domain/entity/stock_entity.dart';

class StockModel extends Stock {
  const StockModel({
    required super.id,
    required super.name,
    required super.symbol,
    required super.createdAt,
    required super.updatedAt,
    required super.alpacaId,
    required super.exchange,
    required super.description,
    required super.assetType,
    required super.isin,
    required super.industry,
    required super.sector,
    required super.employees,
    required super.listingDate,
    required super.ibkrConnectionId,
    required super.image,
    super.address,
    super.carbonIntensityScope1And2,
    super.carbonIntensityScope1And2And3,
    super.carbonIntensityScope3,
    super.contributeToEnvironmentOrSocialObjective,
    super.dnshAssessmentPass,
    super.goodGovernanceAssessment,
    super.marketCap,
    super.netZeroProgress,
    super.scope1Emissions,
    super.scope2Emissions,
    super.scope3Emissions,
    super.sustainableInvestment,
    super.tempAlignmentScopes1And2,
    super.totalEmissions,
    super.website,
  });

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      id: map['id'],
      name: map['name'],
      symbol: map['symbol'],
      createdAt:
          (map['createdAt'] != null) ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          (map['updatedAt'] != null) ? DateTime.parse(map['updatedAt']) : null,
      alpacaId: map['alpaca_id'],
      exchange: map['exchange'],
      description: map['description'],
      assetType: map['asset_type'],
      isin: map['isin'],
      industry: map['industry'],
      sector: map['sector'],
      employees: map['employees'],
      website: map['website'],
      address: map['address'],
      netZeroProgress: map['net_zero_progress'],
      carbonIntensityScope3: map['carbon_intensity_scope_3'],
      carbonIntensityScope1And2: map['carbon_intensity_scope_1_and_2'],
      carbonIntensityScope1And2And3:
          map['carbon_intensity_scope_1_and_2_and_3'],
      tempAlignmentScopes1And2: map['temp_alignment_scopes_1_and_2'],
      dnshAssessmentPass: map['dnsh_assessment_pass'],
      goodGovernanceAssessment: map['good_governance_assessment'],
      contributeToEnvironmentOrSocialObjective:
          map['contribute_to_environment_or_social_objective'],
      sustainableInvestment: map['sustainable_investment'],
      scope1Emissions: map['scope_1_emissions'],
      scope2Emissions: map['scope_2_emissions'],
      scope3Emissions: map['scope_3_emissions'],
      totalEmissions: map['total_emissions'],
      listingDate:
          (map['listing_date'] != null)
              ? DateTime.parse(map['listing_date'] as String)
              : null,
      marketCap: map['market_cap'] != null ? (map['market_cap']) : null,
      ibkrConnectionId: map['ibkr_connection_id'],
      image:
          map['image'] != null
              ? StockImageModel.fromMap(map['image'] as Map<String, dynamic>)
              : null,
    );
  }
}

class StockImageModel extends StockImage {
  const StockImageModel({
    required super.id,
    required super.name,
    super.alternativeText,
    super.caption,
    super.formats,
    required super.width,
    required super.height,
    required super.hash,
    required super.ext,
    required super.mime,
    required super.size,
    required super.url,
    required super.provider,
    required super.folderPath,
    required super.createdAt,
    required super.updatedAt,
    super.previewUrl,
    super.providerMetadata,
  });

  factory StockImageModel.fromMap(Map<String, dynamic> map) {
    return StockImageModel(
      id: map['id'],
      name: map['name'],
      alternativeText: map['alternativeText'],
      caption: map['caption'],
      width: map['width'],
      height: map['height'],
      formats:
          map['formats'] != null
              ? (map['formats'] as Map<String, dynamic>).map(
                (key, value) => MapEntry(key, ImageFormat.fromMap(value)),
              )
              : null,
      hash: map['hash'],
      ext: map['ext'],
      mime: map['mime'],
      size: map['size'],
      url: map['url'],
      previewUrl: map['previewUrl'],
      provider: map['provider'],
      providerMetadata: map['provider_metadata']?.toString(),
      folderPath: map['folderPath'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}
