
import 'services/TareaService.dart';
import 'ui/appUI.dart';

void main(List<String> arguments) {
  var path = 'data/myData.json';

  var myService = new Tareaservice(path);

  myService.initFile();

  var myAppManager = new AppManager(myService);
  myAppManager.initUI();
}
