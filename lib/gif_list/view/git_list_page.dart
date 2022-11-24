import 'package:example_giphy/gif_list/bloc/gif_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GifListPage extends StatelessWidget {
  const GifListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GifListBloc(),
      child: const _GifListView(),
    );
  }
}

class _GifListView extends StatelessWidget {
  const _GifListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gifs',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CupertinoSearchTextField(
              onSubmitted: (value) => context.read<GifListBloc>().add(GifListSearched(value)),
            ),
          ),
        ),
      ),
      body: const _GifListBody(),
    );
  }
}

class _GifListBody extends StatelessWidget {
  const _GifListBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GifListBloc, GifListState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: Text('No gifs')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: () => const Center(child: Text('Error')),
        loaded: (gifs) => GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: List.generate(
            gifs.length,
            (index) => Image.network(gifs[index].image),
          ),
        ),
      ),
    );
  }
}
