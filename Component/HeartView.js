import React, { Component, PropTypes } from 'react';
import { requireNativeComponent} from 'react-native';

var HView = requireNativeComponent('myhView', HeartView);

export default class HeartView extends Component {
   static propTypes = {
    /**
    *
    * 定义组件需要传到原生端的属性
    * 使用React.PropTypes来进行校验
    */
     //原生组件myValue值
     myValue:PropTypes.number,
  };

  render() {
    return (
      <HView {...this.props} />
    );
  }
}
