import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';

class CredentialStorage {
    static final _key = UTF8.encode("limacitypass");

    static final String _defaultFilename = "crendentials.lcp";

    static Future<String> _getCrendentialPath() async {
        var dir = await getApplicationDocumentsDirectory();
        String path = "";
        if (dir.path.endsWith("/")) {
            path = dir.path + _defaultFilename;
        } else {
            path = dir.path + "/" + _defaultFilename; 
        }
        return path;
    }

    static Future<bool> existLocalCredential() async {
        String path = await _getCrendentialPath();

        File fileCredential = new File(path);
        return await fileCredential.exists();
    }

    static Future<String> loadAuthTokenFromCredential() async {
        String path = await _getCrendentialPath();

        File tokenFile = new File(path);
        String data = tokenFile.readAsStringSync();
        return data;        
    }

    static createNewCredential(String token) async {
        String path = await _getCrendentialPath();
        assert(!(await existLocalCredential()), "Credentials already exist");

        File cFile = new File(path);
        cFile.createSync();
        cFile.writeAsStringSync(token);
    }

    static modifyCrendential(String newToken) async {
        String path = await _getCrendentialPath();
        File cFile = new File(path);
        
        assert(await existLocalCredential(), "Credentials not exist");
        
        cFile.writeAsStringSync(newToken);
    }

}