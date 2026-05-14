import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/campaign_model.dart';
import '../../model/trending_model.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeData>(_loadData);
  }

  Future<void> _loadData(
      LoadHomeData event, Emitter<HomeState> emit) async {

    emit(state.copyWith(isLoading: true));

    await Future.delayed(Duration(seconds: 1));

    final trendingData = [
      TrendingModel(
          category: "Fashion", views: "12.5K", title: "Fashion Brand Promo"),
      TrendingModel(
          category: "Food", views: "8.2K", title: "Food Delivery Ad"),
      TrendingModel(
          category: "Tech", views: "15K", title: "Tech Product Launch"),
    ];

    final campaignData = [
      CampaignModel(
        title: "Summer Sale Promo",
        spend: "₹4,250",
        impressions: "45.2K",
        clicks: "1,234",
        ctr: "2.73%",
        isMeta: true,
      ),
      CampaignModel(
        title: "Product Launch",
        spend: "₹3,100",
        impressions: "30K",
        clicks: "980",
        ctr: "2.1%",
        isMeta: false,
      ),
    ];

    emit(state.copyWith(
      trending: trendingData,
      campaigns: campaignData,
      isLoading: false,
    ));
  }
}