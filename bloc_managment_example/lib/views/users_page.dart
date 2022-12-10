
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/user_bloc.dart';
import '../core/extensions/app_ext.dart';
import '../widgets/fetch_button.dart';

class Userspage extends StatelessWidget {
  const Userspage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (_) => UserBloc(),
      child: const UserView(),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Page'),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
          child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FetchUserButton(
                  text: 'List User #2',
                  url: UserUrl.user2,
                ),
                FetchUserButton(
                  text: 'List User #1',
                  url: UserUrl.user1,
                ),
                
              ],
            ),
          ),
          const SizedBox(height: 30,),
          BlocBuilder<UserBloc,FetchResult?>(
            builder:(context,FetchResult? fetchResult) { 
              return fetchResult!= null
              ?fetchResult.users.itemToWidget()
              :const Center(child: Text('null '));
              
            },)
        ],
      )),
    );
  }
}

