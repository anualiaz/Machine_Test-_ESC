import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_esc/post/bloc/post_bloc.dart';
import 'package:machine_test_esc/post/screens/post_list.dart';


class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xdffCBC3E3),
      body: BlocProvider(
        create: (context) => PostBloc()..add(PostFetched()),
        child:  SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              const Center(
                child:  Text("Data Lists",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: MediaQuery.of(context).size.height/1.1615,
                child: const PostBody()
              ),
              // const PostBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class PostBody extends StatefulWidget {
  const PostBody({Key? key}) : super(key: key);

  @override
  _PostBodyState createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  ScrollController _scrollController = ScrollController();
  late PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = context.read<PostBloc>();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        // post is initialize
        if (state is PostInitial) {
          return Center(child: CircularProgressIndicator());
        }

        // post is loaded
        if (state is PostLoaded) {
          if (state.posts.isEmpty)
            return Center(
              child: Text("No Post"),
            );

          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: PostList(
              scrollController: _scrollController,
              state: state,
            ),
          );
        }

        // post is error
        return Center(child: Text("Error Fetched Posts"));
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    _postBloc..add(PostRefresh());
  }

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) _postBloc..add(PostFetched());
  }
}