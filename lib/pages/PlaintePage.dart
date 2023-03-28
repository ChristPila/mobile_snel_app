

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:snel_app/models/MessageModel.dart';

class PlaintePage extends StatefulWidget {
  @override
  State<PlaintePage> createState() => _PlaintePageState();
}

class _PlaintePageState extends State<PlaintePage> {
  List<MessageModel> messages=[
    MessageModel(
        text: 'Cher abonné, pour tout vos préocupation prière de nous faire parvenir en nous envoyant un message ',
        date:  DateTime.now().subtract(Duration(minutes:1)),
        isSentByMe: false),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar:AppBar(
        title: const Text ('Plainte', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
      ),
    body: Column(
      children: [
        Expanded(
            child: GroupedListView<MessageModel,DateTime>(
              padding: const EdgeInsets.all(8),
              elements:messages,
              groupBy:(message)=>DateTime(
                message.date.day,
                message.date.month,
                message.date.year,
              ),
              groupHeaderBuilder:(MessageModel message)=>SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                      style: const TextStyle(color:Colors.black38),),
                    ),
                  ),
                ),
              ),
              itemBuilder:(context,MessageModel message)=>Align(
                alignment: message.isSentByMe?Alignment.centerRight:Alignment.centerLeft,
                child: Container(
                  //height:20,
                  width: 300,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(


                  ),
                  child: Card(
                    color: message.isSentByMe?Colors.blueAccent: Colors.white70,
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(message.text),
                    ),
                  ),
                ),
              ),
            )
        ),
        Container(
          padding: const EdgeInsets.all(7.0),
          color: Colors.transparent,
          child:
              TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue.shade200,
                contentPadding: EdgeInsets.all(12),
                hintText: 'taper votre message ici...',
                suffixIcon: Icon(Icons.telegram_rounded, color: Colors.blueAccent,size: 25,),
                icon: Icon(Icons.join_inner_rounded, color: Colors.blueAccent,size: 25,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 5.0,
                    ),


                ),


              ),


              onSubmitted: (text){
                final message=MessageModel(text: text, date: DateTime.now(), isSentByMe: true);
                setState(() => messages.add(message));
              },
            ),

          ),

      ],
    ),
  );
}