import 'package:ftpconnect/ftpconnect.dart';

void main(List<String> arguments) {
  _test();
}

Future<void> _test() async {
  FTPConnect ftpConnect = FTPConnect('192.168.0.139',
      port: 21, user: 'bigknife', pass: 'Ab1234567');
  bool res = false;
  res = await ftpConnect.connect();
  print('connect:$res');
  //String a = await ftpConnect.currentDirectory();
  DIR_LIST_COMMAND cmd = DIR_LIST_COMMAND.LIST;
  List<FTPEntry> dirContent =
      await ftpConnect.listDirectoryContent(cmd: DIR_LIST_COMMAND.NLST);
  await Future.forEach(dirContent, (FTPEntry entry) async {
    print(entry.name);
  });
  res = await ftpConnect.disconnect();
  print('disconnect:$res');
}
