import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/mov_model.dart';
import '../Provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(onPressed: () {
              Navigator.pushNamed(context, 'search');
            }, child: Text("Search"),),

          ],
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future:
          homeProviderFalse!.GetApiCall("${homeProviderTrue!.MovieName}"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text(
                "${snapshot.error}",
              );
            } else if (snapshot.hasData) {
              HomeModel? homeModel = snapshot.data;
              print(snapshot.data);
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: homeModel!.d!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 400,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "${homeModel.d![index].i!.imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name :- ${homeModel.d![index].l}",
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Text(
                                    "Description :- ${homeModel.d![index].s}",

                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}