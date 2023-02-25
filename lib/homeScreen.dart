import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}
class _homeScreenState extends State<homeScreen> {
  File? _image;
  Future getImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null){
      return ;
    }
    final imageTemp = File(image.path);
    setState(() {
      this._image = imageTemp ;
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add image / Icon'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: (){
        //
        //       },
        //       // icon: Icon(Icons.home)),
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10 , 5 , 0),
            child: Container(
              width: size.width,
              height: size.height/7,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black45,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Upload Image',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1,
                    wordSpacing: 3,
                    color: Colors.grey[800],
                  ),
                  ),
                  ElevatedButton(onPressed: (){
                    getImage();
                  },
                      child: Text('Choose from Device',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1
                      ),
                      ),)
                ],
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            width: size.width/1.4,
            height: size.height/2.7,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
            child: _image != null ? Image.file( _image! ,
              width: size.width/1.5,
              height: size.height/3,
              fit: BoxFit.cover,
            ): Text('No image selected',
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
    );
  }
}

