import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notification/providers/user.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class EditProfile extends StatefulWidget {
  final Map<String, dynamic> user;
  const EditProfile({Key key, this.user}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Widget _buildBody(BuildContext context) {
    return Container(
      color: Colors.indigo,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(child: _buildStack(context)),
    );
  }

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildColumnProfile(context),
        _buildAvatar(context),
      ],
    );
  }

  Widget _buildColumnProfile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildProfileInfo(context),
      ],
    );
  }

  Widget _buildProfileInfo(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 1.3;
    double imageHeight = MediaQuery.of(context).size.width / 3;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(46),
            topRight: Radius.circular(46),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25), offset: Offset(0, -4))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: imageHeight / 2,
            width: double.infinity,
            color: Colors.transparent,
          ),
          _buildUserInfo(context),
          _buildUserBio(context),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    // final _userProvider = Provider.of<UserProvider>(context);
    // Map<String, dynamic> _user = _userProvider.user;
    if (snapshot != null) {
      widget.user["pNo"] = snapshot;
    }
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   '${widget.user["name"]}',
          //   style: GoogleFonts.ubuntu(fontSize: 20),
          // ),

          Text(
            '${widget.user["pNo"]} - ${widget.user["rNo"]}',
            style: GoogleFonts.ubuntu(
                fontSize: 16,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w600,
                height: 1.35),
          ),
        ],
      ),
    );
  }

  Widget _buildUserBio(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    Map<String, dynamic> _user = _userProvider.user;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: Center(
        child: Text("${_user["bio"]}",
            textAlign: TextAlign.justify,
            style: GoogleFonts.ubuntu(
                fontSize: 15,
                height: 1.35,
                color: Colors.black.withOpacity(0.8))),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    double _imageHeight = MediaQuery.of(context).size.width / 2.9;
    double _imageWidth = MediaQuery.of(context).size.width / 2.9;
    double _leftOffset =
        MediaQuery.of(context).size.width / 2 - (_imageWidth) / 2;
    double _bottomOffset =
        MediaQuery.of(context).size.height / 1.3 - (_imageHeight) / 2;

    return Positioned(
      bottom: _bottomOffset,
      left: _leftOffset,
      child: Container(
        height: _imageHeight,
        width: _imageWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/avatars/avatar.jpg'),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.55),
                  offset: Offset(0, -4),
                  blurRadius: 4),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: _buildBody(context),
    );
  }
}
