import 'package:flutter/material.dart';
import 'package:netflix_clone/Src/Service/Provider/Provider.dart';
import 'package:netflix_clone/Src/Service/Data/Data.dart';
import 'package:provider/provider.dart';
import '../Widget/Widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _controller;
  double scrollOffset = 0.0;

  @override
  void initState(){
    super.initState();
    _controller = ScrollController()
    ..addListener((){
      setState((){
        Provider.of<ScrollOffset>(context,listen: false).updateOffset(_controller.offset);
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.cast),
        onPressed: (){
          print('cast');
        },
      ),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          50,
        ),
        child: CustomAppBar(
          scrollOffset: Provider.of<ScrollOffset>(context,listen: true).offsetValue
        ),
      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          const SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent,),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: const PageStorageKey('previews'),
                previewList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(contentList: myList,text: 'My List',),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('MyList'),
              contentList: originals,
              text: 'Netflix Originals',
              isOriginal: true,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('trending'),
              contentList: trending,
              text: 'Trending',
            ),
          )
        ],
      ),
    );
  }
}
