import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CategoryItem extends StatefulWidget {
  CategoryItem(
      {Key? key, required this.data, required this.onTap, required this.img})
      : super(key: key);
  String data;
  String img;
  Callback onTap;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      offset: Offset(.5, 1),
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1)
                ]),
                child: const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/bg_1.jpg'),
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    errorBuilder: (context, error, stackTraces) {
                      return const Center(
                        child: Text(
                          'Image not loading',
                          style: TextStyle(fontSize: 10, color: Colors.black45),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress.hashCode == null) {
                        return Center(
                            child: Container(
                          width: 20,
                          height: 20,
                          child: const CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ));
                      } else if (loadingProgress.hashCode != null &&
                          loadingProgress != null) {
                        return Center(
                            child: Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ));
                      } else if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                            child: Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ));
                      }
                    },
                  ),
                ),
              ),
            ]),
            Text(
              widget.data,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.transparent),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white54.withOpacity(.4),
              highlightColor: Colors.white54.withOpacity(.1),
              borderRadius: BorderRadius.circular(10),
              onTap: widget.onTap,
            ),
          ),
        )
      ]),
    );
  }
}
