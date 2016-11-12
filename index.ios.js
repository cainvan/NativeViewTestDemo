/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  Image,
  Dimensions,
  StatusBar,
  Navigator,
  View
} from 'react-native';
import MainPage from './Component/MainPageView';

class NativeView extends Component {
  render() {
    return (
      <View style={styles.container}>
        <StatusBar barStyle='light-content'/>
        <Navigator
            initialRoute={{name:'MainPageView',component:MainPage}}
            configureScene={() => {
                return Navigator.SceneConfigs.PushFromRight;
            }}
            renderScene={(route, navigator) => {
                let Component = route.component;
                return (
                    <Component navigator = {navigator} route = {route} {...route.passProps} />
                )
            }}
        />
    </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  container1: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'orange',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('NativeView', () => NativeView);
