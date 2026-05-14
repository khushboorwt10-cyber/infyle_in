class CampaignModel {
  final String title;
  final String spend;
  final String impressions;
  final String clicks;
  final String ctr;
  final bool isMeta;

  CampaignModel({
    required this.title,
    required this.spend,
    required this.impressions,
    required this.clicks,
    required this.ctr,
    required this.isMeta,
  });
}