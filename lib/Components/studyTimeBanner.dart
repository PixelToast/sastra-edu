import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sastra_ebooks/Books/pdf.dart';

// Todo: - decide if shadow or not

class StudyTimeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: <Widget>[
              SubjectCard(),
              SubjectCard(),
              SubjectCard(),
              SubjectCard(),
              SubjectCard(),
              SubjectCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 3.0, //extend the shadow
              offset: Offset(
                3.0, // Move to right 10  horizontally
                3.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
      ),
    );
  }
}

class All extends StatefulWidget {
  final data;
  All(this.data);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          return _buildListItems(
              widget.data[index]["Name"],
              widget.data[index]["Images"],
              widget.data[index]["Author"],
              widget.data[index]['Edition'].toString(),
              widget.data[index]["Link"],
              widget.data[index]["Type"]);
        },
        itemCount: (widget.data).length,
      ),
    );
  }

  _buildListItems(String itemName, String imgPath, String author, edition,
      String url, String type) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () async {
            print(url);
            var fetchedFile = await DefaultCacheManager().getSingleFile(url);
            print(fetchedFile);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PdfViewerPage(itemName, fetchedFile),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Center(
                          child:
                              Image.network(imgPath, height: 50.0, width: 50.0),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            itemName,
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                author + " , ",
                                style: GoogleFonts.poppins(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                "Edition - " + edition,
                                style: GoogleFonts.poppins(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            type,
                            style: GoogleFonts.poppins(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
