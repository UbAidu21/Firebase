import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/utils/widgets/show_my_dialog.dart';
import 'package:firebase_2/view/home/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final auth = FirebaseAuth.instance;
  final searchController = TextEditingController();
  final editController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    var user = auth.currentUser!.uid;
    final ref = FirebaseDatabase.instance.ref(user);    
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Home Screen'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                }).onError(
                  (error, stackTrace) {
                    Utilities().toastMessage(error.toString());
                  },
                );
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              controller: searchController,
              hint: 'Search',
              label: 'Search',
              prefixIcon: Icon(Icons.search),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              defaultChild: Center(
                child: AppText(
                  text: 'No Posts available',
                ),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('post').value.toString();

                if (searchController.text.isEmpty) {
                  return ListTile(
                    title: AppText(text: '${title}'),
                    subtitle: AppText(text: '${snapshot.child('id').value}'),
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            leading: Icon(Icons.edit),
                            title: AppText(text: 'Edit'),
                            onTap: () {
                              Navigator.pop(context);
                              showMyDialog(
                                  title, snapshot.child('id').value.toString(),context);
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: AppText(text: 'Delete'),
                            onTap: () {
                              ref.child(snapshot.child('id').value.toString()).remove();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (title
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase().toString())) {
                  return ListTile(
                    title: AppText(text: '${title}'),
                    subtitle: AppText(text: '${snapshot.child('id').value}'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostView(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

}

  //TODO: implement with StreamBuilder
//  Expanded(
//             child: StreamBuilder(
//               stream: ref.onValue,
//               builder: (context,AsyncSnapshot<DatabaseEvent> snapshot) {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.snapshot.children.length,
//                   itemBuilder: (context, index) {
                    
                    
//                     if(!snapshot.hasData){
                      
//                       return CircularProgressIndicator();
                    
//                     }else{
//                       Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
//                       List<dynamic> list = [];
//                       list.clear();
//                       list = map.values.toList();

//                         return ListTile(
//                       title: AppText(text: list[index]['post']),
//                       subtitle: AppText(text: list[index]['id'].toString()),
//                     );
//                     }
//                   },
//                 );
//               },
//             ),
//           ),


