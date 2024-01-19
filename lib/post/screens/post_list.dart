import 'package:flutter/material.dart';
import 'package:machine_test_esc/post/bloc/post_bloc.dart';
import 'package:machine_test_esc/post/bottom_loader.dart';
import 'package:machine_test_esc/post/screens/post_detail.dart';

class PostList extends StatelessWidget {
  const PostList({
    Key? key,
    required this.scrollController,
    required this.state,
  }) : super(key: key);

  final ScrollController scrollController;
  final PostLoaded state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration:  const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
            color: Color(0xdffcbc3e3),
          ),
          child: ListView.separated(
            clipBehavior: Clip.hardEdge,
            itemCount:
            state.hasReachedMax ? state.posts.length : state.posts.length + 1,
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index >= state.posts.length) return BottomLoader();

              return ListTile(
                leading:  CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: ClipOval(
                    child: Image.network(state.posts[index].profilePicture,),
                  ),
                ),
                title: Text(
                  "${state.posts[index].firstName} ${state.posts[index].lastName}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  state.posts[index].city,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetail(post: state.posts[index]),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) => const SizedBox(
              // thickness: 1,
              height: 10,
            ),
          ),
        ),
      ),
    );
  }
}