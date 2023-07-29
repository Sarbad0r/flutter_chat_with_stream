import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_with_stream/helpers/helpers.dart';
import 'package:flutter_chat_with_stream/models/message.dart';
import 'package:flutter_chat_with_stream/models/message_data.dart';
import 'package:flutter_chat_with_stream/theme.dart';
import 'package:flutter_chat_with_stream/widgets/avatart.dart';
import 'package:flutter_chat_with_stream/widgets/glowing_action_button.dart';
import 'package:flutter_chat_with_stream/widgets/icon_button.dart';
import 'package:jiffy/jiffy.dart';

class ChatScreen extends StatelessWidget {
  final MessageData messageData;

  const ChatScreen({Key? key, required this.messageData}) : super(key: key);

  static Route route(MessageData messageData) =>
      MaterialPageRoute(builder: (context) => ChatScreen(messageData: messageData));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 54,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
              icon: CupertinoIcons.back,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: _AppBarTitle(messageData: messageData),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: IconBorder(
                  icon: CupertinoIcons.video_camera_solid,
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: IconBorder(
                  icon: CupertinoIcons.phone_solid,
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [Expanded(child: _DemoListViewChats()), _ActionBar()],
        ));
  }
}

class _AppBarTitle extends StatelessWidget {
  final MessageData messageData;

  const _AppBarTitle({Key? key, required this.messageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final channel = StreamChannel.of(context).channel;
    return Row(
      children: [
        // Avatar.small(
        //   url: Helpers.getChannelImage(channel, context.currentUser!),
        // ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.senderName,
                // Helpers.getChannelName(channel, context.currentUser!),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 2),
              const Text(
                'Connecting',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )
              // BetterStreamBuilder<List<Member>>(
              //   stream: channel.state!.membersStream,
              //   initialData: channel.state!.members,
              //   builder: (context, data) => ConnectionStatusBuilder(
              //     statusBuilder: (context, status) {
              //       switch (status) {
              //         case ConnectionStatus.connected:
              //           return _buildConnectedTitleState(context, data);
              //         case ConnectionStatus.connecting:
              //           return const Text(
              //             'Connecting',
              //             style: TextStyle(
              //               fontSize: 10,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.green,
              //             ),
              //           );
              //         case ConnectionStatus.disconnected:
              //           return const Text(
              //             'Offline',
              //             style: TextStyle(
              //               fontSize: 10,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.red,
              //             ),
              //           );
              //         default:
              //           return const SizedBox.shrink();
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}

class _DemoListViewChats extends StatelessWidget {
  const _DemoListViewChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      _MessageOwnTile(message: Message(text: 'Hello world', createdAt: DateTime.now())),
      _MessageTile(message: Message(text: 'sdasdds', createdAt: DateTime.now())),
      _MessageTile(message: Message(text: 'daspodkas;okd;asldasd', createdAt: DateTime.now())),
      _MessageOwnTile(message: Message(text: 'asdasdasdasdasdsad', createdAt: DateTime.now())),
      _MessageTile(message: Message(text: 'asdasdasdasdasdads', createdAt: DateTime.now())),
    ]);
  }
}

class _DateLable extends StatefulWidget {
  const _DateLable({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  final DateTime dateTime;

  @override
  __DateLableState createState() => __DateLableState();
}

class __DateLableState extends State<_DateLable> {
  late String dayInfo;

  @override
  void initState() {
    final createdAt = Jiffy.parse("${widget.dateTime}");
    final now = DateTime.now();
    dayInfo = "1";
    // if (Jiffy.parse("${createdAt.date}").isSame(Jiffy.parse("$now"), Units.DAY)) {
    //   dayInfo = 'TODAY';
    // } else if (Jiffy.parse("${createdAt.date}")
    //     .isSame(Jiffy.parse("${now.subtract(const Duration(days: 1))}"), Units.DAY)) {
    //   dayInfo = 'YESTERDAY';
    // } else if (Jiffy.parse("${createdAt.date}").isAfter(
    //   Jiffy.parse("${now.subtract(const Duration(days: 7))}"),
    //   Units.DAY,
    // )) {
    //   dayInfo = createdAt.EEEE;
    // } else if (Jiffy.parse("${createdAt.date}").isAfter(
    //   Jiffy.parse("$now").subtract(years: 1),
    //   Units.DAY,
    // )) {
    //   dayInfo = createdAt.MMMd;
    // } else {
    //   dayInfo = createdAt.MMMd;
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: Text(
              dayInfo,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Text(message.text ?? ''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                Jiffy.parse("${message.createdAt.toLocal()}").jm,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Text(message.text ?? '', style: const TextStyle(color: AppColors.textLight)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                Jiffy.parse("${message.createdAt.toLocal()}").jm,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 2,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    CupertinoIcons.camera_fill,
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Type something...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 24.0),
                child: GlowingActionButton(
                  color: AppColors.accent,
                  icon: Icons.send_rounded,
                  onPressed: () {
                    print('TODO: send a message');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
