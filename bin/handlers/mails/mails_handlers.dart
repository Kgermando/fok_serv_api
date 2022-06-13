import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/mail/mail_model.dart';
import '../../repository/repository.dart';

class MailsHandlers {
  final Repository repos;

  MailsHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<MailModel> data = await repos.mails.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late MailModel data;
      try {
        data = await repos.mails.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-mail', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      MailModel data = MailModel(
          fullName: input['fullName'],
          email: input['email'],
          cc: input['cc'],
          objet: input['objet'],
          message: input['message'],
          pieceJointe: input['pieceJointe'],
          read: input['read'],
          fullNameDest: input['fullNameDest'],
          emailDest: input['emailDest'],
          dateSend: DateTime.parse(input['dateSend']),
          dateRead: DateTime.parse(input['dateRead']));
      try {
        await repos.mails.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-mail/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = MailModel.fromJson(input);
      MailModel? data =
          await repos.mails.getFromId(editH.id!); 

      if (input['fullName'] != null) {
        data.fullName = input['fullName'];
      }
      if (input['email'] != null) {
        data.email = input['email'];
      }
      if (input['cc'] != null) {
        data.cc = input['cc'];
      }
      if (input['objet'] != null) {
        data.objet = input['objet'];
      }
      if (input['message'] != null) {
        data.message = input['message'];
      }
      if (input['pieceJointe'] != null) {
        data.pieceJointe = input['pieceJointe'];
      }
      if (input['read'] != null) {
        data.read = input['read'];
      }
      if (input['fullNameDest'] != null) {
        data.fullNameDest = input['fullNameDest'];
      }
      if (input['emailDest'] != null) {
        data.emailDest = input['emailDest'];
      }
      if (input['dateSend'] != null) {
        data.dateSend = DateTime.parse(input['dateSend']);
      }
      if (input['dateRead'] != null) {
        data.dateRead = DateTime.parse(input['dateRead']);
      }

      repos.mails.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-mail/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.mails.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page mail n\'est pas trouvé'),
    );

    return router;
  }
}
