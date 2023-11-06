import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/example_list.dart';
import 'package:flutter_application_1/pages/favorite/bloc/favorite_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteBloc favoriteBloc;
  List<ExampleList> exampleList = [];

  @override
  void initState() {
    favoriteBloc = FavoriteBloc();
    favoriteBloc.add(FetchedListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "News",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(700, 50),
              bottomLeft: Radius.elliptical(700, 50)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder(
        bloc: favoriteBloc,
        builder: (context, state) {
          if (state is LoadingListState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (state is LoadedListState) {
            exampleList = state.exampleList;
            return buildBody();
          }
          if (state is FailureProfileState) {
            return Center(
              child: Text("Error"),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget buildBody() {
    List<Widget> children = [];
    for (var item in exampleList) {
      children.add(
        Stack(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  item.title.toString(),
                  textAlign: TextAlign.start,
                ),
                trailing: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 50,
                    maxHeight: 64,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Center(
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
