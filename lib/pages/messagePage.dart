import 'package:flutter/material.dart';
import 'package:snel_app/widget/chatPage.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
/*  List<SmsMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _getMessages();
  }

  void _getMessages() async {
    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage message) {
      setState(() {
        _messages.insert(0, message);
      });
    });
  }
*/

  final List<String> items = <String>[
    'Tout marquer comme lu',
    'Archivé',
    'Spam'
  ];

  List<PopupMenuItem<String>> _buildItems() {
    return items
        .map((String item) => PopupMenuItem<String>(
              value: item,
              child: Text(item),
            ))
        .toList();
  }

  void _handleItemSelected(String selectedItem){
    print(selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(27, 101, 160, 1),
        title: Text("Communiqué"),
        actions: [
          PopupMenuButton<String>(itemBuilder: (BuildContext context)=> _buildItems(),
          onSelected: _handleItemSelected,)
        ],
      ),
      body: ChatPage(),
    );
  }
}
