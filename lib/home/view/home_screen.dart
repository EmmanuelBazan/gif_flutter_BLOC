import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_flutter_bloc/home/cubit/home_cubit.dart';
import 'package:gif_repository/gif_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context.read<GifRepository>())..getData(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A cool title"),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return Center(child: CircularProgressIndicator());
              break;
            case RequestStatus.succes:
              return GridView.count(
                crossAxisCount: 2,
                children: state.gifs
                    .map((gif) => Image.network(gif.url, fit: BoxFit.cover))
                    .toList(),
              );
              break;
            case RequestStatus.error:
              return const Center(child: Text("Error"));
              break;
          }
        },
      ),
    );
  }
}
