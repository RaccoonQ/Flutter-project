import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slider/list_rtl_language.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:yao_app/components/sizeConfig.dart';

import '../appFirebase.dart';

class CustomedIntroSlider extends StatefulWidget {
  CustomedIntroSlider();
  @override
  _CustomedIntroSliderState createState() => _CustomedIntroSliderState();
}

class _CustomedIntroSliderState extends State<CustomedIntroSlider>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> tabs = new List();
  List<Widget> _dots = new List();
  List<double> _sizeDots = new List(); // store the size data of dots
  List<double> _opacityDots = new List(); // store the opacity data of dots

  Color _colorDot = Color(0xFF48547B);
  Color _colorActiveDot = Color(0xFFA1ADD5);
  double _sizeDot = 8.0;
  double _marginLeftDotFocused = 0;
  double _marginRightDotFocused = 0;

  _CustomedIntroSliderState();

  @override
  void initState() {
    super.initState();
    renderListCustomTabs();
    _tabController = new TabController(length: this.tabs.length, vsync: this);
    // init the animation about dots
    double initValueMarginRight = (_sizeDot * 2) * (this.tabs.length - 1);
    for (int i = 0; i < this.tabs.length; i++) {
      _sizeDots.add(_sizeDot);
      _opacityDots.add(1.0);
    }
    _marginRightDotFocused = initValueMarginRight;
    _tabController.animation.addListener(() {
      this.setState(() {
        _marginLeftDotFocused = _tabController.animation.value * _sizeDot * 2;
        _marginRightDotFocused = initValueMarginRight -
            _tabController.animation.value * _sizeDot * 2;
      });
    });
  }

  /// skip to login page
  void onSkipPress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AppFirebase()),
    );
  }

  /// work as next button while clicking the center
  void onCenterPress() {
    if (!this.isAnimating(_tabController.animation.value)) {
      if (_tabController.index == tabs.length - 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppFirebase()),
        );
      } else {
        _tabController.animateTo(_tabController.index + 1);
      }
    }
  }

  /// check if the slider is swiped and in process of animating
  bool isAnimating(value) {
    return _tabController.animation.value -
            _tabController.animation.value.truncate() !=
        0;
  }

  /// render the dots in dot indicator
  List<Widget> renderListDots() {
    _dots.clear();
    for (int i = 0; i < this.tabs.length; i++) {
      _dots.add(renderDot(_sizeDots[i], _colorDot, _opacityDots[i]));
    }
    return _dots;
  }

  /// render single dot
  Widget renderDot(double radius, Color color, double opacity) {
    return Opacity(
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius / 2)),
        width: radius,
        height: radius,
        margin: EdgeInsets.only(left: radius / 2, right: radius / 2),
      ),
      opacity: opacity,
    );
  }

  /// Check if current language is one of the right-to-left languages
  bool isRTLLanguage(language) {
    return rtlLanguages.contains(language);
  }

  /// render the dot indicator
  Widget renderDotIndicator() {
    return // Dot indicator
        Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: this.renderListDots(),
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: _colorActiveDot,
                  borderRadius: BorderRadius.circular(_sizeDot / 2)),
              width: _sizeDot,
              height: _sizeDot,
              margin: EdgeInsets.only(
                  left: this.isRTLLanguage(
                          Localizations.localeOf(context).languageCode)
                      ? _marginRightDotFocused
                      : _marginLeftDotFocused,
                  right: this.isRTLLanguage(
                          Localizations.localeOf(context).languageCode)
                      ? _marginLeftDotFocused
                      : _marginRightDotFocused),
            ),
          )
        ],
      ),
    );
  }

  /// render the skip button
  Widget renderSkipButton() {
    return FlatButton(
      onPressed: this.onSkipPress,
      child: Text(
        'Skip',
        style: TextStyle(
          fontFamily: 'MontSerrat',
          fontSize: 18.0 * SizeConfig.tRatio,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      color: Colors.transparent,
    );
  }

  /// render the customed get started pages
  void renderListCustomTabs() {
    List<Slide> slides = new List();
    slides.add(
      new Slide(
        pathImage: 'assets/images/get_started_2.png',
        widthImage: 375 * SizeConfig.hRatio,
        heightImage: 389 * SizeConfig.vRatio,
        backgroundColor: Color(0xff27335A),
        title: 'Receive real-time alert',
        styleTitle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 18.0 * SizeConfig.tRatio,
            color: Colors.white),
      ),
    );
    slides.add(
      new Slide(
        pathImage: 'assets/images/get_started_3.png',
        widthImage: 375 * SizeConfig.hRatio,
        heightImage: 365 * SizeConfig.vRatio,
        backgroundColor: Color(0xff27335A),
        title: 'Explore new knowledge',
        styleTitle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 18.0 * SizeConfig.tRatio,
            color: Colors.white),
      ),
    );
    slides.add(
      new Slide(
        pathImage: 'assets/images/get_started_4.png',
        widthImage: 375 * SizeConfig.hRatio,
        heightImage: 274 * SizeConfig.vRatio,
        backgroundColor: Color(0xff27335A),
        title: 'Earn more with Yaonology',
        styleTitle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 18.0 * SizeConfig.tRatio,
            color: Colors.white),
      ),
    );

    tabs.add(
      Container(
        margin: EdgeInsets.only(bottom: 60.0, top: 82.8 * SizeConfig.vRatio),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            GestureDetector(
              child: Image.asset(
                slides[0].pathImage,
                width: slides[0].widthImage,
                height: slides[0].heightImage,
                fit: BoxFit.contain,
              ),
              onTap: onCenterPress,
            ),
            Container(
              child: Text(
                slides[0].title,
                style: slides[0].styleTitle,
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(top: 12.3 * SizeConfig.vRatio),
            ),
          ],
        ),
      ),
    );

    tabs.add(
      Container(
        margin: EdgeInsets.only(bottom: 60.0, top: 108.1 * SizeConfig.vRatio),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            GestureDetector(
              child: Image.asset(
                slides[1].pathImage,
                width: slides[1].widthImage,
                height: slides[1].heightImage,
                fit: BoxFit.contain,
              ),
              onTap: onCenterPress,
            ),
            Container(
              child: Text(
                slides[1].title,
                style: slides[1].styleTitle,
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(top: 11.7 * SizeConfig.vRatio),
            ),
          ],
        ),
      ),
    );

    tabs.add(
      Container(
        margin: EdgeInsets.only(bottom: 60.0, top: 147.6 * SizeConfig.vRatio),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            GestureDetector(
              child: Image.asset(
                slides[2].pathImage,
                width: slides[2].widthImage,
                height: slides[2].heightImage,
                fit: BoxFit.contain,
              ),
              onTap: onCenterPress,
            ),
            Container(
              child: Text(
                slides[2].title,
                style: slides[2].styleTitle,
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(top: 59.5 * SizeConfig.vRatio),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // set the top status bar icons to be white
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SizeConfig().init(context);
    return Scaffold(
      body: DefaultTabController(
        length: this.tabs.length,
        child: Stack(
          children: <Widget>[
            TabBarView(
              children: this.tabs,
              controller: _tabController,
            ),
            Positioned(
              child: Column(children: [
                renderDotIndicator(),
                Container(
                    padding: EdgeInsets.only(
                      top: 100 * SizeConfig.vRatio,
                    ),
                    child: renderSkipButton()),
              ]),
              top: 631 * SizeConfig.vRatio,
              left: 10,
              right: 10,
            )
          ],
        ),
      ),
    );
  }
}
