import 'dart:collection';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notification/main.dart';
import 'package:notification/pages/editProfile.dart';
import 'package:notification/providers/user.dart';
import 'package:notification/widgets/channel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String uid;
  User user;
  List<Widget> dataList = [];
  bool name=false;
  bool roll=false;
  bool bio=false;
  Map<String, dynamic> _user;
  TextEditingController uname,uroll,ubio;
  final _firebaseFirestore=FirebaseFirestore.instance;
  getData(BuildContext context) async {
    print("Function called automatically !");
    user = await FirebaseAuth.instance.currentUser;
    uid = user.uid;
    final _userProvider = Provider.of<UserProvider>(context, listen: false);
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').document(uid);
    documentReference
        .get()
        .then((snapshot) => {_userProvider.setUser(snapshot.data())});
  }

  @override
  void initState() {
    getData(context);
    list();
    super.initState();
  }
  @override
  void dispose() {
    uname.dispose();
    uroll.dispose();
    ubio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: _buildAppBar(context), body: _buildBody(context)),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    _user = _userProvider.user;
    uname=TextEditingController(text: _user['name']);
    uroll=TextEditingController(text: _user['rNo']);
    ubio=TextEditingController(text: _user['bio']);
    _user['pNo']=snapshot;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.indigo,
      automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: () {
          // Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              _firebaseFirestore.collection("users").doc(uid).set(_user);
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile(user: _user,)));
            },
          ),
        )
      ],
      centerTitle: true,
      title: Text(
        "Profile",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

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
          _buildChannelsList(context),
        ],
      ),
    );
  }

  Widget userName(){
    // Text(
    //   '${_user["name"]}',
    //   style: GoogleFonts.ubuntu(fontSize: 20),
    // )
    if(name) return Center(
      child: TextField(
        onSubmitted: (newValue){
          setState(() {
            _user["name"]=newValue;
            name=false;
          });
        },
        controller: uname,
        autofocus: true,
      ),
    );
    return InkWell(
      onTap: (){
        setState(() {
          name=true;
          roll=false;
          bio=false;
        });
      },
      child: Text(
        _user["name"],
        style: GoogleFonts.ubuntu(fontSize: 20),
      ),
    );
  }

  Widget userBio(){
    if(bio) return Center(
      child: TextField(
        onSubmitted: (newValue){
          setState(() {
            _user["bio"]=newValue;
            bio=false;
          });
        },
        controller: ubio,
        autofocus: true,
      ),
    );
    return InkWell(
      onTap: (){
        setState(() {
          bio=true;
          name=false;
          roll=false;
        });
      },
      child: Center(
        child: Text(
          _user["bio"],
          textAlign: TextAlign.justify,
          style:  GoogleFonts.ubuntu(
              fontSize: 15,
              height: 1.35,
              color: Colors.black.withOpacity(0.8)),
        ),
      ),
    );
  }
  Widget userRoll(){
    if(roll) return Center(
      child: TextField(
        onSubmitted: (newValue){
          setState(() {
            _user["rNo"]=newValue;
            roll=false;
          });
        },
        controller: uroll,
        autofocus: true,
      ),
    );
    return InkWell(
      onTap: (){
        setState(() {
          roll=true;
          name=false;
          bio=false;
        });
      },
      child: Text(
        _user["rNo"],
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    );
  }
  Widget _buildUserInfo(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    Map<String, dynamic> _user = _userProvider.user;
    if (snapshot != null) {
      _user["pNo"] = snapshot;
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
          userName(),
          Text('${_user["pNo"]}'),
          userRoll(),
          // Text(
          //   '${_user["rNo"]}',
          //   style: GoogleFonts.ubuntu(
          //       fontSize: 16,
          //       color: Colors.black.withOpacity(0.5),
          //       fontWeight: FontWeight.w600,
          //       height: 1.35),
          // ),
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
      child: userBio(),
    );
  }

  Widget _buildChannelsList(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Subscriptions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        dataList.length.toString(),
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: dataList,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> list() async {
    // if(dataList.length!=0)return;
    CollectionReference ref = Firestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).collection('channels');
    CollectionReference reference=Firestore.instance.collection('channels');
    QuerySnapshot querySnapshot=await reference.getDocuments();
    QuerySnapshot eventsQuery = await ref
        .getDocuments();

    eventsQuery.documents.forEach((document) {
      querySnapshot.documents.forEach((element) {
        if(element.id.toString().trim()==document['id'].toString().trim()){
          // print("ok");
          setState(() {
            dataList.add(
              GestureDetector(
                child: ChannelWidget(
                  img: element['img'],
                  uid: element.id,
                  name: element['name'],
                  description: element["description"],
                ),
              ),
            );
          });
        }
      });
      // Firestore.instance.collection("channels").doc(document[''])
    });
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
}
