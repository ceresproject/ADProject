import React from 'react';
import {
  Image,
  Platform,
  TextInput,
  StyleSheet,
  Text,
  AsyncStorage,
  ActivityIndicator,
  TouchableOpacity,
  KeyboardAvoidingView,
  ImageBackground,
  TouchableHighlight,
  View,
  Alert,
  StatusBar,
  SafeAreaView
} from 'react-native';
import api from '../constants/APIs';
import axios from "axios";
import { ExpoLinksView } from '@expo/samples';

export default class AppLoading extends React.Component {
    static navigationOptions = {
    header: null,
    };
    state = {username: '', password: ''};
    componentWillMount () {
      this._authToken()
    }
    async _authToken () {
    const that = this;
    const token = await AsyncStorage.getItem('token');
    console.log(token)
    axios({url: api.apis.AUTH, method:'post' ,data: {
        token: token
    }}).then(res=>{
      if (res.data.detail){
        that.props.navigation.navigate('Main');
      } else {
        that.props.navigation.navigate('Auth');
      }
    }).catch(error=>{
        console.log(error)

    })
  }
  render() {    
    return (
      <View style={styles.container} behavior="padding" enabled>
        <ImageBackground source={require('../assets/images/login.png')} style={styles.body}>
            <Image style={{width:120, height:120}} source={require('../assets/images/icon.png')}/>
            <ActivityIndicator style={{marginTop: 80}} size="large" color="#0000ff" />
        </ImageBackground>
    </View>
    );
  }
}
const BLACK = '#2a2b2d'
const WHITE = '#f5f4f9'
const MARGIN = 9
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: _colorCheck('bg'),
  },
  contentContainer: {
  },
  body: {
    width:'100%', height: '100%',
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center'
  },
  button:{
    width: 230,
    padding: 13,
    margin: 9,
    backgroundColor: '#f9915e',
    borderRadius: 24,
    justifyContent: 'center',
    alignItems:'center'
  },
  buttonText: {color: 'white', fontWeight: '500'},
  navbar: {
    justifyContent: "space-between",
    paddingHorizontal: MARGIN,
    alignItems: 'center',
    height: 44,
    flexDirection: 'row'
  },
  input: {
    width: 230,
    margin: 9,
    padding: 13,
    borderColor: '#888888',
    borderWidth: 1,
    borderRadius: 24
  },
  label: {
    fontSize: 20,
    fontWeight: '600',
    marginVertical: MARGIN*2,
    color: _colorCheck('text')
  },
  title: {
    fontSize: 26,
    fontWeight: '800',
    color: _colorCheck('text')
  },
  recommendPart: {
    alignItems: 'flex-start',
    flex:1,
    margin:MARGIN
  },
  rp: {
    backgroundColor: 'blue',
    height: 80,
    width: 100,
    alignItems: 'flex-start',
    borderRadius: 4,
    marginTop:10,
    marginRight:10,
  },
  recommendA: {
    flex:1,
    marginTop: 10,
    width: '100%',
    minHeight: 120,
    backgroundColor: 'blue',
    borderRadius: 4
  }, 
  recommendScroll: {
    width: '100%'
  }
});
