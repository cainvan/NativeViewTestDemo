import React, { Component } from 'react';
import{
	AppRegistry,
	StyleSheet,
	Text,
	WebView,
	Image,
	TouchableOpacity,
	DeviceEventEmitter,
	Dimensions,
	View
} from 'react-native';

export default class BannerDetail extends Component {
	constructor(props){
		super(props);
		this.state = {uri: null};
	}

	pressButton(){
		const { navigator } = this.props;
		if(navigator) {
			navigator.pop();
		}
	}

	render() {
    const { uri } = this.props;
		return (
			<View style={{flex:1,backgroundColor:'#D4D2D4'}}>
			<View style={styles.titleLable}>
			<TouchableOpacity onPress={this.pressButton.bind(this)}>
				<Image style={{marginLeft:10,marginTop:28,justifyContent:'center',width:25,height:25}} source={{uri:'backImage'}}/>
			</TouchableOpacity>
				<Text style={{width:100,marginLeft:Dimensions.get('window').width/2-50-35,textAlign:'center',fontSize:20,color:'white',marginTop:30}}>Banner</Text>
			</View>
			<WebView
          style={{
						flex:1,
          }}
          source={{uri: uri}}
          scalesPageToFit={this.state.scalingEnabled}
        />
			</View>
		);
	}
}

var styles = StyleSheet.create({
	titleLable: {
		height:64,
		flexDirection:'row',
		backgroundColor:'#63B8FF',
		//justifyContent:'center',
	},
});
