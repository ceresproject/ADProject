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

export class AppLoading extends React.Component {
    static navigationOptions = {
    header: null,
    };
    state = {username: '', password: ''};
    componentWillMount () {
        if (AsyncStorage.getItem('token')!='') {
            this.props.navigation.navigate('Main');
        }
    }
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
  render() {    
    return (
      <KeyboardAvoidingView style={styles.container} behavior="padding" enabled>
        <ImageBackground source={require('../assets/images/login.png')} style={styles.body}>
            <Text style={[styles.title,{marginBottom:40}]}>Login</Text>
            <TextInput
                style={styles.input}
                placeholder="Username"
                onChangeText={(text) => this.setState({username: text})}
            />
            <TextInput
                secureTextEntry={true}
                password={true}
                style={styles.input}
                placeholder="Password"
                onChangeText={(text) => this.setState({password: text})}
            />
            <TouchableHighlight style={[styles.button,{backgroundColor: 'orange'}]} onPress={()=>this._authSignin()}>
                    <Text style={styles.buttonText}>Sign In</Text>
            </TouchableHighlight>
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
