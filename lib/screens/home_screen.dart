import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../bloc/home_bloc/home_event.dart';
import '../bloc/home_bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadHomeData()),
      child: Scaffold(
        backgroundColor: Color(0xffF5F6FA),

        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(Icons.home, "Home", true),
              navItem(Icons.bar_chart, "Campaigns", false),
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xff7B61FF), Color(0xff5A4FFF)],
                  ),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
              navItem(Icons.auto_awesome, "Studio", false),
              navItem(Icons.settings, "Settings", false),
            ],
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔻 TOP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.business, color: Colors.purple),
                        SizedBox(width: 8),
                        Text("abc ent.",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff7B61FF), Color(0xff5A4FFF)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.call, color: Colors.white, size: 18),
                          SizedBox(width: 6),
                          Text("Schedule a Call",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 20),

                /// 🔻 TITLE
                Text("Welcome back! 👋",
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                SizedBox(height: 5),

                Text("Start creating amazing ads today",
                    style: TextStyle(color: Colors.grey)),

                SizedBox(height: 20),

                /// 🔻 TUTORIAL CARD
                tutorialCard(),

                SizedBox(height: 20),

                /// 🔻 QUICK ACTIONS
                Text("Quick Actions",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                SizedBox(height: 15),

                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                  children: [
                    actionCard(Icons.image, "Image Ad", "Create visuals",
                        Colors.purple),
                    actionCard(Icons.videocam, "Video/Reel",
                        "Engaging content", Colors.blue),
                    actionCard(Icons.link, "From Link", "Promote URL",
                        Colors.green),
                    actionCard(Icons.edit, "AI Copy", "Generate text",
                        Colors.orange),
                  ],
                ),

                SizedBox(height: 20),

                /// 🔻 SAMPLE TEMPLATES
                sectionHeader("Sample Ad Templates", "Explore"),

                SizedBox(height: 10),

                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      templateCard("Product"),
                      templateCard("Property"),
                      templateCard("Travel"),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                /// 🔻 TRENDING (BLoC)
                sectionHeader("Trending Video Ads", "See All"),

                SizedBox(height: 15),

                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trending.length,
                        itemBuilder: (context, index) {
                          final item = state.trending[index];
                          return trendingCard(
                              item.category, item.views, item.title);
                        },
                      ),
                    );
                  },
                ),

                SizedBox(height: 20),

                /// 🔻 CAMPAIGNS (BLoC)
                sectionHeader("Active Campaigns", "View all"),

                SizedBox(height: 15),

                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Column(
                      children: state.campaigns.map((item) {
                        return campaignCard(
                          item.title,
                          item.spend,
                          item.impressions,
                          item.clicks,
                          item.ctr,
                          item.isMeta,
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// COMMON WIDGETS (UNCHANGED UI)
////////////////////////////////////////////////////////////

Widget sectionHeader(String title, String action) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(action, style: TextStyle(color: Colors.purple)),
    ],
  );
}

Widget tutorialCard() {
  return Container(
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff7B61FF), Color(0xff5A4FFF)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.play_arrow, color: Colors.white),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("How to Use This App",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text("Watch our 2 min tutorial",
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("New",
              style: TextStyle(color: Colors.white, fontSize: 10)),
        )
      ],
    ),
  );
}

Widget navItem(IconData icon, String label, bool active) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: active ? Colors.purple : Colors.grey),
      Text(label,
          style: TextStyle(
              color: active ? Colors.purple : Colors.grey, fontSize: 12))
    ],
  );
}

Widget actionCard(
    IconData icon, String title, String sub, Color color) {
  return Container(
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        Spacer(),
        Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        Text(sub, style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    ),
  );
}

Widget templateCard(String title) {
  return Container(
    width: 140,
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    ),
    child: Stack(
      children: [
        Positioned.fill(
          child: Container(color: Colors.grey.shade300),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(title,
                style: TextStyle(color: Colors.white, fontSize: 10)),
          ),
        )
      ],
    ),
  );
}

Widget trendingCard(String category, String views, String title) {
  return Container(
    width: 140,
    margin: EdgeInsets.only(right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  left: 8,
                  child: chip(category, Colors.blue),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow, size: 14),
                      Text(views, style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
                Center(
                  child: Icon(Icons.volume_off, color: Colors.white),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
      ],
    ),
  );
}

Widget campaignCard(String title, String spend, String impr,
    String clicks, String ctr, bool isMeta) {
  return Container(
    padding: EdgeInsets.all(14),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    chip(isMeta ? "Meta" : "Google",
                        isMeta ? Colors.blue : Colors.orange),
                    SizedBox(width: 6),
                    chip("Active", Colors.green),
                  ],
                ),
                SizedBox(height: 4),
                Text(title,
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            Spacer(),
            Icon(Icons.more_vert)
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            statItem("Spend", spend),
            statItem("Impr.", impr),
            statItem("Clicks", clicks),
            statItem("CTR", ctr),
          ],
        )
      ],
    ),
  );
}

Widget statItem(String label, String value) {
  return Column(
    children: [
      Text(label, style: TextStyle(color: Colors.grey, fontSize: 12)),
      SizedBox(height: 4),
      Text(value,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
    ],
  );
}

Widget chip(String text, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: color.withOpacity(0.15),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(text, style: TextStyle(fontSize: 10)),
  );
}