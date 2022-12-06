import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_sum_model.dart';
import '../../../repository/repository.dart'; 

class AdminDepartementHandlers {
  final Repository repos;

  AdminDepartementHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/get-count-admin-departement-budget/', (Request request) async {
      NotifySumModel data = await repos.adminDepartementRepository.getCountBudget();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/get-count-admin-departement-comm/', (Request request) async {
      NotifySumModel data = await repos.adminDepartementRepository.getCountComm();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-admin-departement-marketing/',
        (Request request) async {
      NotifySumModel data =
          await repos.adminDepartementRepository.getCountMarketing();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/get-count-admin-departement-comptabilite/', (Request request) async {
      NotifySumModel data = await repos.adminDepartementRepository.getCountComptabilite();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/get-count-admin-departement-exploitation/', (Request request) async {
      NotifySumModel data = await repos.adminDepartementRepository.getCountExploitation();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/get-count-admin-departement-finance/', (Request request) async {
      NotifySumModel data = await repos.adminDepartementRepository.getCountFinance();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/get-count-admin-departement-logistique/', (Request request) async {
      NotifySumModel data = await repos.adminDepartementRepository.getCountLogistique();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/get-count-admin-departement-rh/', (Request request) async {
      NotifySumModel data = await repos.adminDepartementRepository.getCountRH();
      return Response.ok(jsonEncode(data));
    }); 

    // Est ajouté à logistique 
    // router.get('/get-count-admin-departement-devis/', (Request request) async {
    //   NotifySumModel data = await repos.adminDepartementRepository.getCountDevis();
    //   return Response.ok(jsonEncode(data));
    // }); 

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Admin Departement count n\'est pas trouvé'),
    );

    return router;
  }
}
