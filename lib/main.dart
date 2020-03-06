import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_bloc/bloc.dart';
import 'package:posts_bloc/posts_repo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) {
          return PostsBloc(postsRepository: PostsRepo());
        },
        child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
          if (state is PostsLoading){
            Text('Loading');
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$state',
                ),
                MaterialButton(
                  child: Text('Load Posts'),
                  onPressed: () async{
                    BlocProvider.of<PostsBloc>(context).add(LoadPosts());
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
