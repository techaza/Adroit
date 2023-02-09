import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/img_bloc.dart';

main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('----------------------------------');
    return BlocProvider<ImgBloc>(
        create: (context) => ImgBloc()..add(FetchApi()),
        child: Scaffold(
          body: BlocBuilder<ImgBloc, ImgState>(
            builder: (context, state) {
              if(state is Loading)
              {
                return Center(child: CircularProgressIndicator());
              }
              if(state is Loaded)
                {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.vertical,itemBuilder: (BuildContext,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.blueAccent),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,children: [
                              Text('${state.data[index].id}'),
                              Text('${state.data1[index].email}'),
                              Text(state.data[index].title),
                              SizedBox(
                                height: 300,width: 400,
                                child: Image.network(state.data[index].url),
                              )
                            ],),
                          ),
                        ),
                      );

                    },itemCount: state.data.length,),
                  );
                }
              return Text('fdvf');

            },
          ),
        )
    );
  }
}
