import React from 'react';
import {
  Image,
  Platform,
  TextInput,
  StyleSheet,
  Text,
  AsyncStorage,
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

export class SigninScreen extends React.Component {
    static navigationOptions = {
    header: null,
    };
    state = {username: '', password: ''};
    async _authSignin () {
    if (this.state.username.trim()=='' || this.state.password.trim()==''){
        Alert.alert(
            'Error',
            'Please fill up the information!',
            [
              {text: 'OK', onPress: () => console.log('OK Pressed')},
            ],
            {cancelable: false},
          );
        return
    }
    const that = this;
    axios({url: api.apis.LOGIN, method:'post' ,data: {
        username: that.state.username,
        password: that.state.password
    }}).then(res=>{
        AsyncStorage.setItem('token', res.data.token);
        that.props.navigation.navigate('Main');
        console.log(res.data)
    }).catch(error=>{
        console.log(error)

        Alert.alert(
            'Error',
            'Login failed! Your username or password incorrect!',
            [
              {text: 'OK', onPress: () => console.log('OK Pressed')},
            ],
            {cancelable: false},
          );
    })
  }
  _goRegister() {
    this.props.navigation.navigate('AuthRegister');
  }
  render() {    
    return (
      <KeyboardAvoidingView style={styles.container} behavior="padding" enabled>
        <ImageBackground source={require('../assets/images/login.png')} style={styles.body}>
            <Text style={[styles.title,{marginBottom:40}]}>Login</Text>
            <TextInput
                style={Platform.OS == 'ios'? styles.inputIOS: styles.inputAndroid}
                placeholder="Username"
                onChangeText={(text) => this.setState({username: text})}
            />
            <TextInput
                secureTextEntry={true}
                password={true}
                style={Platform.OS == 'ios'? styles.inputIOS: styles.inputAndroid}
                placeholder="Password"
                onChangeText={(text) => this.setState({password: text})}
            />
            <TouchableOpacity style={[Platform.OS == 'ios'? styles.buttonIOS: styles.buttonAndroid,{backgroundColor: 'orange'}]} onPress={()=>this._authSignin()}>
                    <Text style={Platform.OS == 'ios'? styles.buttonTextIOS: styles.buttonTextAndroid}>Sign In</Text>
            </TouchableOpacity>
            <TouchableOpacity style={[Platform.OS == 'ios'? styles.buttonIOS: styles.buttonAndroid,{backgroundColor: 'green'}]} onPress={()=>this._goRegister()}>
                    <Text style={Platform.OS == 'ios'? styles.buttonTextIOS: styles.buttonTextAndroid}>Register</Text>
            </TouchableOpacity>
        </ImageBackground>
    </KeyboardAvoidingView>
    );
  }
}
export class RegisterScreen extends React.Component {
  static navigationOptions = {
  header: null,
  };
  state = {username: '', password: ''};
  async _authRegister () {
  if (this.state.username.trim()=='' || this.state.password.trim()==''){
      Alert.alert(
          'Error',
          'Please fill up the information!',
          [
            {text: 'OK', onPress: () => console.log('OK Pressed')},
          ],
          {cancelable: false},
        );
      return
  }
  const that = this;
  axios({url: api.apis.REGISTER, method:'post' ,data: {
      username: that.state.username,
      password: that.state.password
  }}).then(res=>{
      if (res.data.detail){
        that.props.navigation.navigate('Auth');
      } else {
        Alert.alert(
          'Error',
          'Register failed!',
          [
            {text: 'OK', onPress: () => console.log('OK Pressed')},
          ],
          {cancelable: false},
        );
      }
      console.log(res.data)
  }).catch(error=>{
      console.log(error)

      Alert.alert(
          'Error',
          'Login failed! Your username or password incorrect!',
          [
            {text: 'OK', onPress: () => console.log('OK Pressed')},
          ],
          {cancelable: false},
        );
  })
}
_goLogin() {
  this.props.navigation.navigate('Auth');
}
render() {    
  return (
    <KeyboardAvoidingView style={styles.container} behavior="padding" enabled>
      <ImageBackground source={require('../assets/images/login.png')} style={styles.body}>
          <Text style={[styles.title,{marginBottom:40}]}>Register</Text>
          <TextInput
              style={Platform.OS == 'ios'? styles.inputIOS: styles.inputAndroid}
              placeholder="Username"
              onChangeText={(text) => this.setState({username: text})}
          />
          <TextInput
              secureTextEntry={true}
              password={true}
              style={Platform.OS == 'ios'? styles.inputIOS: styles.inputAndroid}
              placeholder="Password"
              onChangeText={(text) => this.setState({password: text})}
          />
          <TouchableOpacity style={[Platform.OS == 'ios'? styles.buttonIOS: styles.buttonAndroid,{backgroundColor: 'orange'}]} onPress={()=>this._authRegister()}>
                  <Text style={Platform.OS == 'ios'? styles.buttonTextIOS: styles.buttonTextAndroid}>Register</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[Platform.OS == 'ios'? styles.buttonIOS: styles.buttonAndroid,{backgroundColor: 'green'}]} onPress={()=>this._goLogin()}>
                  <Text style={Platform.OS == 'ios'? styles.buttonTextIOS: styles.buttonTextAndroid}>Go to login</Text>
          </TouchableOpacity>
      </ImageBackground>
  </KeyboardAvoidingView>
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
  buttonIOS:{
    width: 230,
    paddingHorizontal: MARGIN*2,
    paddingTop: MARGIN+5,
    paddingBottom: MARGIN+5,
    margin: MARGIN,
    backgroundColor: '#f9915e',
    borderRadius: 24,
    justifyContent: 'center',
    alignItems:'center'
  },
  buttonAndroid:{
    width: 230,
    paddingHorizontal: MARGIN*2,
    paddingTop: MARGIN,
    paddingBottom: MARGIN,
    margin: MARGIN,
    backgroundColor: '#f9915e',
    borderRadius: 24,
    justifyContent: 'center',
    alignItems:'center'
  },
  buttonTextIOS: {color: 'white', fontWeight: '400',    fontSize: 18},
  buttonTextAndroid: {color: 'white', fontWeight: '400',    fontSize: 14},
  navbar: {
    justifyContent: "space-between",
    paddingHorizontal: MARGIN,
    alignItems: 'center',
    height: 44,
    flexDirection: 'row'
  },
  inputIOS: {
    width: 230,
    fontWeight: '400',
    fontSize: 18,

    borderRadius: 24,
    marginBottom: MARGIN,
    paddingHorizontal: MARGIN*2,
    paddingTop: MARGIN+5,
    paddingBottom: MARGIN+5,
    borderRadius: MARGIN,
    backgroundColor: WHITE
  },
  inputAndroid: {
    width: 230,
    fontWeight: '400',
    fontSize: 14,

    borderRadius: 24,
    marginBottom: MARGIN,
    paddingHorizontal: MARGIN*2,
    paddingTop: MARGIN,
    paddingBottom: MARGIN,
    borderRadius: MARGIN,
    backgroundColor: WHITE
  },
  label: {
    fontSize: 20,
    fontWeight: '400',
    marginVertical: MARGIN,
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
