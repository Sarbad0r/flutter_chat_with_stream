import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_with_stream/helpers/helpers.dart';
import 'package:flutter_chat_with_stream/models/message_data.dart';
import 'package:flutter_chat_with_stream/models/story_data.dart';
import 'package:flutter_chat_with_stream/screens/chat_screen.dart';
import 'package:flutter_chat_with_stream/theme.dart';
import 'package:flutter_chat_with_stream/widgets/avatart.dart';
import 'package:jiffy/jiffy.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(8.0), child: _Stories())),
        SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
          final faker = Faker();
          final date = Helpers.randomDatetime();
          return MessageTile(
              messageData: MessageData(
                  senderName: faker.person.name(),
                  message: faker.lorem.sentence(),
                  messageData: date.toString(),
                  dateMessage: Jiffy.parse(date.toString()).fromNow(),
                  profilePicture: Helpers.randomPictureUrl()));
        }))
      ],
    );
  }
}

class MessageTile extends StatelessWidget {
  final MessageData messageData;

  const MessageTile({Key? key, required this.messageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, ChatScreen.route(messageData)),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Avatar.medium(url: messageData.profilePicture),
              const SizedBox(width: 15),
              Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  messageData.senderName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      letterSpacing: 0.2, wordSpacing: 1.5, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                    height: 20, child: Text(messageData.message, overflow: TextOverflow.ellipsis)),
              ])),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(messageData.dateMessage.toUpperCase(),
                    style: const TextStyle(fontSize: 11, letterSpacing: -0.2)),
                const SizedBox(height: 5),
                Container(
                    padding: const EdgeInsets.only(right: 8, left: 8, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        color: AppColors.secondary, borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                        child: Text(
                      '1',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    )))
              ])
            ]),
          ),
        ),
      ),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Stories",
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontSize: 20, color: AppColors.textFaded)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(width: 20),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final fakeObject = Faker();
                    return _StoryCard(
                        storyData: StoryData(
                            name: fakeObject.person.name(), url: Helpers.randomPictureUrl()));
                  }),
            )
          ]),
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Avatar.medium(url: storyData.url),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                storyData.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
