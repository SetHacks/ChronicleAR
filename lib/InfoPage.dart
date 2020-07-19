
import 'package:flutter/material.dart';

import 'BookData.dart';

class InfoPage extends StatefulWidget {
  final BookData info;
  const InfoPage({
    Key key,
    @required this.info,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new InfoPageState();
  }
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.info.author),
        Text(widget.info.title),
        Text(widget.info.description)
      ],
    );
  }
}
