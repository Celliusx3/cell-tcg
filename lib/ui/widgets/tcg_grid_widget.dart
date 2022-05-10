import 'package:celltcg/data/base/models/responses/tcg_title_value_response.dart';
import 'package:flutter/material.dart';

class TCGGridWidget extends StatelessWidget {
  final List<TCGTitleValueResponse> _data;

  const TCGGridWidget (List<TCGTitleValueResponse> data, {Key? key}) :
    _data = data,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.75
      ),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        final d = _data[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child:  Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      d.getTitle(),
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      d.getValue(),
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}