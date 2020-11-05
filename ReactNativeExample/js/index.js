import React, { useEffect } from "react";
import {
  AppRegistry,
  SafeAreaView,
  Text,
  View,
  NativeModules,
} from "react-native";
// import {HestiaModule} from 'terra'
const { HestiaModule } = NativeModules;

export default RNMain = () => {
  useEffect(() => {
    HestiaModule.fetchApplicationList();
  }, []);

  return (
    <SafeAreaView>
      <Text>sddsddsd</Text>
    </SafeAreaView>
  );
};

// Module name
AppRegistry.registerComponent("RNMain", () => RNMain);
