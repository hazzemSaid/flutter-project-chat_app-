import 'package:chatapp/model/mass.dart';
import 'package:chatapp/services/auth_regsister.dart';
import 'package:flutter/material.dart';
import '../model/mass.dart';
import '/constrain.dart';
import '/wieght/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  final String? email;
  final String? password;
  ChatScreen({required this.email, required this.password});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();
  final controller = ScrollController();
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance
      .collection('massages')
      .orderBy(
        'time',
        descending: true,
      )
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('chat app'),
                    Image.asset(
                      klog,
                      height: 50,
                    )
                  ],
                ),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            // print(snapshot.data!.docs[2].data());
            List<massages> massag = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              print(snapshot.data!.docs[i]['time']);
              massag.add(massages.fromJson(snapshot.data!.docs[i]));
            }

            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('chat app'),
                    Image.asset(
                      klog,
                      height: 50,
                    )
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      controller: controller,
                      itemCount: snapshot.data!.docs.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return cahtbuble(
                          text: massag[index].text,
                          lol: massag[index].email == widget.email,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: textEditingController,
                        onSubmitted: (value) {
                          if (value.isEmpty) {
                            return;
                          }
                          FirebaseFirestore.instance
                              .collection('massages')
                              .add({
                            'text': value,
                            'time': DateTime.now(),
                            'email': widget.email,
                            'password': widget.password
                          });
                          controller.animateTo(
                            controller.position.maxScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn,
                          );
                          textEditingController.clear();
                        },
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              String value = textEditingController.text;
                              if (value.isEmpty) {
                                return;
                              }
                              FirebaseFirestore.instance
                                  .collection('massages')
                                  .add({
                                'text': value,
                                'time': DateTime.now(),
                                'email': widget.email,
                                'password': widget.password
                              });
                              controller.animateTo(
                                controller.position.minScrollExtent,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn,
                              );
                              textEditingController.clear();
                            },
                            child: Icon(Icons.send),
                          ),
                          hintText: 'Enter your message',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
/**/