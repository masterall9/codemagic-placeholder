import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:get/get.dart';

import '../Utlit/Serves/Api/ApiRequstPoll.dart';

class WidgetPoll extends StatefulWidget {
  WidgetPoll({Key? key, required this.polls, required this.id})
      : super(key: key);
  final polls;
  final id;

  @override
  State<WidgetPoll> createState() => _WidgetPollState();
}

class _WidgetPollState extends State<WidgetPoll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width * 0.80,
          child: FlutterPolls(
            onVoted:
                (PollOption pollOption, int pollOptionnewTotalVotes) async {
              print(pollOption.id);
              var ameen = ApiRequstPoll.req(
                  pold: pollOption.id.toString(), poso: widget.id.toString());
              print(ameen);
              return true;
            },
            pollId: widget.id.toString(),
            pollOptions: [
              for (var i = 0; i < widget.polls['options'].length; i++)
                if (widget.polls['options'][i] != null)
                  //redme.md go
                  PollOption(
                      id: i,
                      title: Text(
                        widget.polls['options'][i]['option'],
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                        ),
                      ),
                      votes: widget.polls['options'][i]['total']),
            ],
            pollTitle: SizedBox(),
            pollEnded: widget.polls['has_voted'] == 0 ? false : true,
            hasVoted: false,
            votedProgressColor: Get.isDarkMode
                ? const Color.fromARGB(255, 201, 200, 200)
                : ColorThame,
            votedBackgroundColor:
                Get.isDarkMode ? Color.fromARGB(255, 90, 90, 90) : null,
          ),
        ),
      ],
    );
  }
}
