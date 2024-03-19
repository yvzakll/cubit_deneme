import 'dart:js';

import 'package:cubit_deneme/bloc/cats_cubit.dart';
import 'package:cubit_deneme/bloc/cats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsView extends StatelessWidget {
  const CatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatsCubit(),
      child: buildScaffold(),
    );
  }

  Scaffold buildScaffold() => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        appBar: AppBar(
          title: const Text("CUBİT DENEME"),
        ),
        body: BlocConsumer<CatsCubit, CatsState>(
          listener: (context, state) {
            if (state is CatsError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("HATA VARR")));
            }
          },
          builder: (context, state) {
            if (state is CatsInitial) {
              return const Center(
                child: Text("INITIAL"),
              );
            } else if (state is CatsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CatsCompleted) {
              return ListView.builder(
                itemCount: state.response.length,
                itemBuilder: (context, index) {
                  return Text(state.response[index]);
                },
              );
            } else {
              final error = state as CatsError;
              return Text(error.message);
            }
          },
        ),
      );
}
