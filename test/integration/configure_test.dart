library integrationTestConfigure;

import 'package:test/test.dart';
import 'configure_user_setup.dart';


main(){

  group('Configuration Set explicitly Specified:', (){

    test('Should return values from the common set in develop runtime', (){
      Function use = defConfigs(ConfigLabel.common, RuntimeMode.Develop);
      expect(use(ConfigValue.intHeight), equals(323));
      expect(use(ConfigValue.intLength), equals(4827));
      expect(use(ConfigValue.intWidth), equals(39));
      expect(use(ConfigValue.boolFloat), equals(true));
      expect(use(ConfigValue.numVolume), equals(2938.1293));
      expect(use(ConfigValue.funClass), equals(new isInstanceOf<Function>()));
    });

    test("Should return the northern set in dianose runtime",(){
      Function use = defConfigs(ConfigLabel.northern, RuntimeMode.Diagnose);
      expect(use(ConfigValue.intHeight), equals(214));
      expect(use(ConfigValue.intLength), equals(651));
      expect(use(ConfigValue.intWidth), equals(40));
      expect(use(ConfigValue.boolFloat), equals(true));
      expect(use(ConfigValue.numVolume), equals(824.39));
      expect(use(ConfigValue.funClass), equals(new isInstanceOf<Function>()));
    });

  });

  group('Configuearion Set implicity Specified as fallback:', (){

    test('Should return the common set for deploy as a fallback.',(){
      Function use = defConfigs(ConfigLabel.common, RuntimeMode.Deploy);
      expect(use(ConfigValue.intHeight), equals(323));
      expect(use(ConfigValue.intLength), equals(4827));
      expect(use(ConfigValue.intWidth), equals(39));
      expect(use(ConfigValue.boolFloat), equals(true));
      expect(use(ConfigValue.numVolume), equals(2938.1293));
      expect(use(ConfigValue.funClass), equals(new isInstanceOf<Function>()));
    });

  });

}