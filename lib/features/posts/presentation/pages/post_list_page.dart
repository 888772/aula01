import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aula01/features/posts/presentation/bloc/post_list_bloc.dart';
import 'package:aula01/features/posts/presentation/bloc/post_list_state.dart';
import 'package:aula01/features/posts/presentation/bloc/post_list_event.dart';
import 'package:aula01/features/posts/domain/entities/post.dart';
import 'package:aula01/features/posts/infra/data/post_repository.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PostListBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("TWITTER"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search)), IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))],
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          ),
        body: BlocBuilder<PostListBloc, PostListState>(
          builder: (context, state) {
            if (state is PostListSuccess) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PostListBloc>().add(PostListInitialize());
                },
                child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (BuildContext context, int i) {
                    Post post = state.posts[i];
                    return Card(
                      child: ListTile(
                        title: Text(post.title),
                      ),
                    );
                  }
                  ),
                );
            }
            if (state is PostListFailure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.cloud_off_rounded),
                  Center(child: Text(state.msg))
                ],
              );
            }

            if (state is PostListLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return SizedBox();
          },
          )
        ),
    );
  }
}