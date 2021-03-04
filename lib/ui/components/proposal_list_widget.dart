import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';

import 'proposal_widget.dart';

class ProposalsListWidget extends StatelessWidget {
  final ScrollController scroll;

  const ProposalsListWidget(this.scroll);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scroll,
      padding: const EdgeInsets.only(bottom: 60, left: 16, right: 16, top: 108),
      itemCount: DemoData.namesOfProposal.length,
      itemBuilder: (BuildContext context, int index) {
        // todo move to model_views & display it using model
        return const ProposalsWidget('Text', 10, 1, 5);
      },
    );
  }
}
