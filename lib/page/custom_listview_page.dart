import 'package:flutter/material.dart';

class CustomListviewPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          CustomListItemTwo(
            thumbnail: new Container(
              width: 80,
              height: 80,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=139670673,2550279246&fm=26&gp=0.jpg")),
            ),
            title: 'Flutter 1.0 launch',
            subtitle: 'Flutter continues` to improve and expand its horizons'
                'This text should max out at two lines and clip',
            author: 'Dash',
            publishDate: 'Dec 28',
            readDuration: '5 min',
          ),
          CustomListItemTwo(
            thumbnail: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1239701112,3641928982&fm=26&gp=0.jpg")),
            title: 'Flutter 1.0 launch',
            subtitle: 'Flutter continues to improve and expand its horizons'
                'This text should max out at two lines and clip',
            author: 'Dash',
            publishDate: 'Dec 28',
            readDuration: '5 min',
          ),
        ],
      ));
  }

}



class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                Text(
                  '$subtitle',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            )),
        Divider(
          color: Colors.black12,
          height: 1.0,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$author',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate . $readDuration ★',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final publishDate;
  final readDuration;

  CustomListItemTwo({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
              child: _ArticleDescription(
                title: title,
                subtitle: subtitle,
                author: author,
                publishDate: publishDate,
                readDuration: readDuration,
              ),
            ))
          ],
        ),
      ),
    );
  }
}