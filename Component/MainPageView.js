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
  View
} from 'react-native';
import { Banner } from 'react-native-zkbanner';
import ZKShareBt from './ZKShareButton';
import HeartView from './HeartView';
import ZKBannerView from './ZKBanner';
import BannerDetail from './BannerDetailView';
import NewBannerView from './NewBanner';

export default class MainPage extends Component {
  constructor(props){
    super(props);
    this.state = {
      btText:'cain1',
      value:0.3,
      color:'black',
      pageUrlArray:[
        'https://www.baidu.com',
        'http://www.jianshu.com/',
        'http://reactnative.cn/',
        'https://www.baidu.com',
        'http://www.jianshu.com/',
        'http://reactnative.cn/',
        'https://www.baidu.com',
        'http://www.jianshu.com/',
        'http://reactnative.cn/'
      ]
    };
  }
  componentDidMount() {
    //进行网络请求，然后加载数据，重新渲染组件
    // this.setState({
    //   btText:'cain',
    //   value:0.5,
    //   color:'red',
    // });
  }
  bannerClicked(index){
    const navigator = this.props.navigator;
    if(navigator) {
       navigator.push({
         name: 'BannerDetail',
         component: BannerDetail,
         passProps: {
           uri: this.state.pageUrlArray[index-1]
         }
       })
     }
  }
  render() {
    var bannerImgs = [
    'https://www.umeng.com/img/index/demo/0901-2.c1df5ebf79f4c2b31f5ded9b13970826.png',
    'https://www.umeng.com/img/index/demo/0912.97aa0956cef2b613001d28d394eb4bd0.png',
    'https://www.umeng.com/img/index/demo/8.a0a7379becc230ef38295a74956ec8f2.png',
    'https://www.umeng.com/img/index/demo/825-1.58787216c12fb39bb6d384ad4d278037.jpg'
  ];
    return (
        <Image source = {{uri:'bg_d'}} style={styles.map0} >
          <ZKBannerView
            style = {styles.map3}
            onClickBanner = {(event) =>
              this.bannerClicked(event.nativeEvent.value)
            }
          />
          <Banner
            style = {styles.map3}
            autoScrollTimeInterval = {2}
          imageURLStringsGroup = {bannerImgs}
          //localizationImageNamesGroup = {['1.png','2.png','3.png','4.png','5.png']}
          //pageControlAliment = {TestScrollViewConsts.SDCycleScrollViewPageContolAliment.right}
          onClickBanner={(event) => {
            console.log('test' + event.nativeEvent.value);
          }}
          />
          <ZKShareBt
            style = {styles.map}
            appKey = {'57355f3e67e58ed0a50030a1'}
            shareText = {'啦啦啦！ http://bbs.reactnative.cn/topic/2452/react-native%E5%8E%9F%E7%94%9Fui%E5%B0%81%E8%A3%85%E4%BB%A5%E5%8F%8A%E4%BA%8B%E4%BB%B6%E5%A4%84%E7%90%86'}
            imageName = {'logo'}
            //myTitle = {this.state.btText}//设置分享按钮标题
            //color={this.state.color}//设置分享按钮标题字体颜色
            btImageName = {'share_icon'} //设置分享按钮图片
            //backgroundColor = {'blue'}
            onButtonClicked = {(event) => {
              console.log('React 分享按钮点击' + event.nativeEvent.randomValue);
            }}
          />
          <Image source = {{uri:'circle_d'}} style={styles.map2} >
            <HeartView
              style = {styles.map1}
              myValue = {this.state.value}//设置流量value值
            />
          </Image>
        </Image>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    //alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  map: {
    width:40,
    height:40,
    color:'black',
    alignItems:'center',
    justifyContent:'center',
    marginTop: 40,
  },
  titleText: {
    fontSize:20,
    color:'white',
    textAlign:'center',
  },
  map0: {
    width:Dimensions.get('window').width,
    height:Dimensions.get('window').height,
    alignItems:'center',
    //justifyContent:'center',
  },
  map1: {
    width:Dimensions.get('window').width/2+10,
    height:Dimensions.get('window').width/2+10,
  },
  map2: {
    width:Dimensions.get('window').width/2+55,
    height:Dimensions.get('window').width/2+55,
    alignItems:'center',
    justifyContent:'center',
    marginTop: 40,
  },
  map3: {
    width:Dimensions.get('window').width,
    height:200,
  },
});
