import React, { Component, PropTypes } from 'react';
import { requireNativeComponent} from 'react-native';

var Banner = requireNativeComponent('ZKBanner', ZKBannerView);

export default class ZKBannerView extends Component {
   static propTypes = {
    /**
    *
    * 定义组件需要传到原生端的属性
    * 使用React.PropTypes来进行校验
    */

     //点击事件
     onClickBanner:PropTypes.func,
  };
  render() {
    return (
      <Banner {...this.props} />
    );
  }
}
