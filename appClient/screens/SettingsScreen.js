import React from 'react';
import {
  Image,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  Button,
  AsyncStorage,
  TouchableOpacity,
  View,
  FlatList,
  TextInput,
  StatusBar,
  SafeAreaView
} from 'react-native';
import api from '../constants/APIs';
import { LinearGradient, Icon } from 'expo';
import axios from "axios";
import { ExpoConfigView } from '@expo/samples';

export default class SettingsScreen extends React.Component {
  static navigationOptions = {
    header: null
  };
  async _logout() {
    const that = this;
    const token = await AsyncStorage.getItem('token');
    console.log(token)
    axios({url: api.apis.LOGOUT, method:'post' ,data: {
        token: token
    }}).then(res=>{
      if (res.data.detail){
        that.props.navigation.navigate('Auth');
      }
    }).catch(error=>{
        console.log(error)

    })
  }
  render() {
    
    /* Go ahead and delete ExpoConfigView and replace it with your
     * content, we just wanted to give you a quick view of your config */
    return (
    <SafeAreaView style={[styles.container,{marginTop: Platform.OS == 'ios'?0: StatusBar.currentHeight}]}>
      <StatusBar barStyle={'dark-content'} translucent={true}  backgroundColor={WHITE}/> 

      <View style={styles.navbar}>
        <Text style={styles.title}>Profile</Text>

      </View>
      <Button onPress={()=> this._logout()} title="Logout"></Button>

    </SafeAreaView>);
  }
}
const BLACK = '#2a2b2d'
const WHITE = '#f5f4f9'
const MARGIN = 13
_colorCheck = (label) =>{
  const hour = new Date().getHours()
  //hour >=8 && hour <= 19
  if (true){
    if (label == 'text') {
      return BLACK
    } else {
      return WHITE
    }
  } else {
    if (label == 'text') {
      return WHITE
    } else {
      return BLACK
    }
  }
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: _colorCheck('bg'),
  },
  contentContainer: {
  },
  navbar: {
    justifyContent: "flex-start",
    paddingHorizontal: MARGIN,
    alignItems: 'center',
    height: 44,
    flexDirection: 'row'
  },
  label: {
    fontSize: 20,
    fontWeight: '600',
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
  touchrp: {
    flex:1,
    minWidth: 80,
    height: 80,
    width: 'auto',
    borderRadius: 9,
    marginTop:10,
    marginRight:10,
  },
  rp: {
    flex:1,
    minWidth: 80,
    height: 80,
    width: 'auto',
    borderRadius: 9,
  },
  rpb: {
    flex:1,
    height: 80,
    width: 'auto',
    minWidth: 80,
    padding: 9,
    borderRadius: 9,
    justifyContent: 'flex-end',
    alignItems:'flex-start'
  },
  recommendA: {
    flex:1,
    width: '100%',
    minHeight: 120,
    maxHeight: 150,
    borderRadius: 9,

  }, 
  touchA: {
    flex:1,
    marginTop: 10,
    width: '100%',
    minHeight: 120,
    maxHeight: 150,
    borderRadius: 9,

  }, 
  recommendAB: {
    flex:1,
    width: '100%',
    padding: 9,
    borderRadius: 9,
 
    justifyContent: 'flex-end',
    alignItems:'flex-start'
  }, 
  recommendScroll: {
    width: '100%'
  },
  article_title: {
    fontSize: 20,
    fontWeight: '600',
    color: 'white'
  },
  article_title_sub: {
    fontSize: 14,
    fontWeight: '400',
    color: 'white'
  },
  shadow: {

  }
});
