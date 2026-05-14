import 'package:equatable/equatable.dart';
import '../../model/campaign_model.dart';
import '../../model/trending_model.dart';


class HomeState extends Equatable {
  final List<CampaignModel> campaigns;
  final List<TrendingModel> trending;
  final bool isLoading;

  const HomeState({
    this.campaigns = const [],
    this.trending = const [],
    this.isLoading = false,
  });

  HomeState copyWith({
    List<CampaignModel>? campaigns,
    List<TrendingModel>? trending,
    bool? isLoading,
  }) {
    return HomeState(
      campaigns: campaigns ?? this.campaigns,
      trending: trending ?? this.trending,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [campaigns, trending, isLoading];
}