import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snel_app/controller/controllerMessage.dart';
import 'package:snel_app/mod%C3%A8le/messageModel.dart';
import "package:timeago/timeago.dart" as timeago;
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:flutter_html/flutter_html.dart';

import '../pages/viewCommunique.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initChat();
    });
  }

  initChat() async {
    await context.read<ControllerMessage>().getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    var data = context.watch<ControllerMessage>().messageAll;

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        MessageModel message = data[index];
        List<Author> image = data[index].links!.wpFeaturedmedia!;
        print(image);
        dom.Document document = htmlparser.parse(message.excerpt!.rendered!);

        String? imageCommunuique = "http://192.168.51.177/wordpress/wp-content/uploads/2023/03/SplashScreen.png";
        /// sanitize or query document here
        Widget html = Html(
          shrinkWrap: false,
          data: message.excerpt!.rendered!,
        );
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(193, 217, 237, 1),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewCommunique(commmunique: data[index],
                  image: imageCommunuique,),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  imageCommunuique),
              radius: 35,
              //child: Image.network(image!, fit: BoxFit.contain,),
            ),
            title: Text(
              message.title!.rendered!,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Container(
              margin: EdgeInsets.only(
                bottom: 0.0,
              ),
              child: html,
            ),
            trailing: Text(" ${timeago.format(message.date!)}"),
          ),
        ) /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                   " ${timeago.format(DateTime.now())}",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right:16.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(image!),
                          radius: 20.0,
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 100,
                                margin: EdgeInsets.only(
                                  bottom: 10.0,
                                ),
                                child: html),
                            SizedBox(height: 2.0),
                            Container(
                              margin : EdgeInsets.only(top : 5.0),
                              child: Text(
                                " ${timeago.format(message.date!)}",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )*/
            ;
      },
    );
  }
}
