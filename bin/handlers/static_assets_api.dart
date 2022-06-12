// import 'package:path/path.dart' as p;
// import 'package:shelf/shelf.dart';
// import 'package:shelf_router/shelf_router.dart';


// class StaticAssetsApi {
//   final folderPath;

//   StaticAssetsApi(this.folderPath);

//   Router get router {
//     final router = Router();

//     router.get('/<file|.*>', (Request req) async {
//       final assetPath = p.join(folderPath, req.requestedUri.path.substring(1));
//       print('assetPath  : ' + assetPath);
//       return await createFileHandler(assetPath)(req);
//     });

//     return router;
//   }
// }
