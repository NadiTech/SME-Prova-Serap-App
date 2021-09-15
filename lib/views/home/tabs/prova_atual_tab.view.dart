import 'package:appserap/widgets/cards/prova_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:appserap/models/prova.model.dart';
import 'package:appserap/controllers/prova.controller.dart';
import 'package:get_it/get_it.dart';
import 'package:appserap/stores/prova.store.dart';

class ProvaAtualTabView extends StatefulWidget {
  const ProvaAtualTabView({Key? key}) : super(key: key);

  @override
  _ProvaAtualTabViewState createState() => _ProvaAtualTabViewState();
}

class _ProvaAtualTabViewState extends State<ProvaAtualTabView> with AutomaticKeepAliveClientMixin<ProvaAtualTabView> {
  @override
  bool get wantKeepAlive => false;

  final _provaController = GetIt.I.get<ProvaController>();
  List<ProvaModel> provas = <ProvaModel>[];
  final _provaStore = GetIt.I.get<ProvaStore>();

  @override
  void initState() {
    super.initState();

    _provaStore.limparProvas();
    obterProvas();
  }

  obterProvas() async {
    var retorno = await _provaController.obterProvas();

    setState(() {
      provas = retorno;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            provas.length > 0
                ? Container(
                    height: 800,
                    child: ListView.builder(
                      itemCount: provas.length,
                      itemBuilder: (_, index) {
                        var prova = provas[index];
                        return ProvaCardWidget(
                          prova: prova,
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/sem_prova.svg'),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
