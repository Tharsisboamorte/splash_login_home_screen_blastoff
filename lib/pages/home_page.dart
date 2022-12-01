import 'package:flutter/material.dart';
import 'package:splash_login_screen/controllers/home_controller.dart';
import 'package:splash_login_screen/models/post_model.dart';
import 'package:splash_login_screen/repositories/home_repository_imp.dart';
import 'package:splash_login_screen/repositories/home_repository_mock.dart';
import 'package:splash_login_screen/services/prefs_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                PrefService.logout();
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => true);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (_, list, __) {
            return ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (_, idx) => ListTile(
                      leading: Text(list[idx].id.toString()),
                      trailing: Icon(Icons.arrow_forward),
                      title: Text(list[idx].title),
                      onTap: () => Navigator.of(context)
                          .pushNamed("/details", arguments: list[idx]),
                    ));
          }),
    );
  }
}
