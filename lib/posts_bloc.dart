import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posts_bloc/posts_event.dart';
import 'package:posts_bloc/posts_repo.dart';
import 'package:posts_bloc/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepo postsRepository;

  PostsBloc({@required this.postsRepository});

  @override
  PostsState get initialState => PostsInitial();

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is LoadPosts) {
      yield* _mapLoadPostsToState();
    }
  }

  Stream<PostsState> _mapLoadPostsToState() async* {
    try {
      yield PostsLoading();
      final posts = await this.postsRepository.loadPosts();
      yield PostsLoaded(posts);
    } catch (_) {
      yield PostsNotLoaded();
    }
  }
}
