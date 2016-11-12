import React, { Component, PropTypes } from 'react';
import { requireNativeComponent} from 'react-native';

var ShareBt = requireNativeComponent('shareBt', ZKShareBt);

export default class ZKShareBt extends Component {
  static propTypes = {
    /**
    *
    * 定义组件需要传到原生端的属性
    * 使用React.PropTypes来进行校验
    */
    //使用第三方分享时设置的appKey
    appKey:PropTypes.string,

    //要分享的内容
    shareText:PropTypes.string,

    //需要分享的图片名字（需要事先放在xcode工程中，只需要名字，不需要路径）
    imageName:PropTypes.string,

    //分享按钮标题
    myTitle:PropTypes.string,

    //分享按钮标题颜色
    color:PropTypes.string,

    //分享按钮图片
    btImageName:PropTypes.string,

    //按钮点击事件
    onButtonClicked:PropTypes.func,

    //按钮背景色
    backgroundColor:PropTypes.string,
  };
  render() {
    return (
      <ShareBt {...this.props} />
    );
  }
}
