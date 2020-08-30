import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phuoc_nguyen_covid/constants.dart';
import 'package:phuoc_nguyen_covid/screens/details_screen.dart';
import 'package:phuoc_nguyen_covid/widgets/info_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  InfoCard(
                    title: 'Confirmed Cases',
                    iconColor: Color(0xffff9c00),
                    effectedNum: 24993226,
                    press: () {
                      Navigator.pushNamed(context, DetailsScreen.routeNamed);
                    },
                  ),
                  InfoCard(
                    title: 'Total Deaths',
                    iconColor: Color(0xffff2d55),
                    effectedNum: 842455,
                    press: () {
                      Navigator.pushNamed(context, DetailsScreen.routeNamed);
                    },
                  ),
                  InfoCard(
                    title: 'Total Recovered',
                    iconColor: Color(0xff50e3c2),
                    effectedNum: 16408120,
                    press: () {
                      Navigator.pushNamed(context, DetailsScreen.routeNamed);
                    },
                  ),
                  InfoCard(
                    title: 'New Cases',
                    iconColor: Color(0xff583412),
                    effectedNum: 261938,
                    press: () {
                      Navigator.pushNamed(context, DetailsScreen.routeNamed);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Preventions",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    buildPreventation(),
                    SizedBox(height: 40),
                    buildHelpCard(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildPreventation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionCard(
          svgSrc: 'assets/icons/hand_wash.svg',
          title: 'Wash Hands',
        ),
        PreventionCard(
          svgSrc: 'assets/icons/use_mask.svg',
          title: 'Use Mask',
        ),
        PreventionCard(
          svgSrc: 'assets/icons/Clean_Disinfect.svg',
          title: 'Clean Disinfect',
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.4,
                top: 20,
                right: 20),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff60be93),
                    Color(0xff1b8d59),
                  ],
                ),
                borderRadius: BorderRadius.circular(20)),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Deal 999 for \nMedical Help!\n',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white)),
                  TextSpan(
                      text: 'If any symptoms appear',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16, color: Colors.white.withOpacity(0.7))),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset('assets/icons/virus.svg'),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventionCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
