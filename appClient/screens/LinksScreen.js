import React from 'react';
import {
  Image,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  AsyncStorage,
  ActivityIndicator,
  View,
  ImageBackground,
  StatusBar,
  SafeAreaView
} from 'react-native';
import { LinearGradient, Icon } from 'expo';

import { ExpoLinksView } from '@expo/samples';
import { FlatList } from 'react-native-gesture-handler';
import api from '../constants/APIs';
import axios from "axios";
export default class LinksScreen extends React.Component {
  static navigationOptions = {
    header: null,
  };
  state = {
    bookMarkData: [{
      tag: {
        id: '',
        create_date: '',
        tag: '',
        images: [{
          url: ''
        }]
      },
      id:''
    }],
    refreshing: false
  }
  _onRefresh = () => {
    this.setState({refreshing: true});
    this._getBookMarkData()
  }
  componentDidMount() {
    this.setState({loading: true})
    this._getBookMarkData()
  }
  _keyExtractor = (item, index) => item.id.toString();
  
  async _getBookMarkData() {
    const that = this;
    const token = await AsyncStorage.getItem('token');
    axios({url: api.apis.BOOKMARK, method:'get', headers: {
      'Authorization': 'Token ' + token
    }}).then(res=>{
      that.setState({bookMarkData: res.data.results,refreshing: false, loading: false})
    }).catch(error=>{
      that.setState({refreshing: true, loading: false});

    })
  }
  render() {
    if (this.state.loading) {
      return (
        <View style={{justifyContent:'center',alignItems:'center',flex:1}}>
        <ActivityIndicator size="large" color="#0000ff" />
        </View>
      )  
    } else {
      return (
        <SafeAreaView style={[styles.container,{padding: MARGIN, paddingTop: Platform.OS == 'ios'?0: StatusBar.currentHeight}]}>
          <View style={styles.navbar}>
            <Text style={styles.title}>Concern</Text>
            <Text>C</Text>
          </View>
          <View style={styles.container}>
            <FlatList 
            data={this.state.bookMarkData}
            keyExtractor={this._keyExtractor}
            style={{padding: MARGIN}}
            renderItem={({item})=>
            <TouchableOpacity style={[styles.touchA,styles.shadow]} onPress={() => this._goToLocationTagDetail(item.articles[0].id)}>
            <ImageBackground source={{uri:api.apis.MAIN_URL+ item.tag.images[0].url}}
              imageStyle={{ flex:1, borderRadius: MARGIN }}
              style={styles.recommendA}>
              <LinearGradient 
              colors={['rgba(0,0,0,0.4)', 'transparent', 'rgba(0,0,0,0.8)']}
              style={{flex:1, width: '100%', borderRadius: MARGIN}}>
                <Text style={[styles.label,{color: 'white', fontWeight: '600', margin: MARGIN}]}># {item.tag.tag}</Text>

              </LinearGradient>
            </ImageBackground>
          </TouchableOpacity>
            }>   
    
            </FlatList>
          </View>
        </SafeAreaView>
      );
    }
  }
}

const BLACK = '#2a2b2d'
const WHITE = '#f5f4f9'
const MARGIN = 13
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: _colorCheck('bg'),
  },
  contentContainer: {
  },
  navbar: {
    justifyContent: "space-between",
    paddingHorizontal: MARGIN,
    alignItems: 'center',
    height: 44,
    flexDirection: 'row'
  },
  label: {
    fontSize: 20,
    fontWeight: '400',
    color: _colorCheck('text')
  },
  title: {
    fontSize: 26,
    fontWeight: '800',
    color: _colorCheck('text')
  },
  recommendAB: {
    flex:1,
    width: '100%',
    padding: 9,
    borderRadius: 9,
 
    justifyContent: 'flex-start',
    alignItems:'flex-start'
  }, 
  recommendPart: {
    alignItems: 'flex-start',
    flex:1,
    margin:MARGIN
  },
  rp: {
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
    borderRadius: 4
  }, 
  recommendScroll: {
    width: '100%'
  }
});
