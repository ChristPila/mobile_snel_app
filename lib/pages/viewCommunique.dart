import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:snel_app/mod%C3%A8le/messageModel.dart';
import "package:timeago/timeago.dart" as timeago;
import '../utiitaires/Espace.dart';

class ViewCommunique extends StatefulWidget {
  final MessageModel commmunique;
  final String image;
  const ViewCommunique({Key? key, required this.commmunique, required this.image, }) : super(key: key);

  @override
  State<ViewCommunique> createState() => _ViewCommuniqueState();
}

class _ViewCommuniqueState extends State<ViewCommunique> {
  @override
  Widget build(BuildContext context) {

    Widget html = Html(
      shrinkWrap: false,
      data: widget.commmunique.content!.rendered!,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.commmunique.title!.rendered!}"),
      ),
      body: Scrollbar(thickness: 10, thumbVisibility: true,
          child: ListView(

            padding: const EdgeInsets.all(8.0),
            children: [
              InkWell(
                child: Image.network(
                  widget.image,
                  width: 200,
                  height: 200,
                ),
              /*  onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImagePage(image: image),
                  ),
                )*/
              ),
              Espace(
                hauteur: 5,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  widget.commmunique.title!.rendered!,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Espace(
                hauteur: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey,
                    size: 15,
                  ),
                  Espace(
                    largeur: 5,
                  ),
                  Text(
                    "${timeago.format(widget.commmunique.date!)}",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Container(color: Colors.white, child: html),
              Divider(
                thickness: 1,
              ),

            ],
          )),
    );
  }
}
