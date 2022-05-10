import 'package:cached_network_image/cached_network_image.dart';
import 'package:celltcg/data/base/models/responses/tcg_set_response.dart';
import 'package:flutter/material.dart';

class TCGSetWidget extends StatelessWidget {
  final TCGSetResponse _tcgSet;
  final VoidCallback? _onTap;

  const TCGSetWidget (TCGSetResponse tcgSet, {VoidCallback? onTap, Key? key}) :
        _tcgSet = tcgSet,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: _tcgSet.getImage(),
                  fit: BoxFit.contain,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin:Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x00ffffff),
                          Color(0xaa000000)
                        ]
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _tcgSet.getName(),
                        style: const TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _onTap,
                    ),
                  ),
                ),
              ],
            )
        );
      },
    );



  }
}