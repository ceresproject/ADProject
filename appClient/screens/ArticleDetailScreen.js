import React from 'react';
import {
  Image,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  ImageBackground,
  ActivityIndicator,
  View,
  StatusBar,
  FlatList,
  AsyncStorage,
  SafeAreaView
} from 'react-native';
import { Icon } from 'expo';

import Colors from '../constants/Colors';
import axios from "axios";
import api from '../constants/APIs';
import { ExpoLinksView } from '@expo/samples';
import {LinearGradient} from 'expo'
export default class ArticleDetailScreen extends React.Component {
  static navigationOptions = {
    header: null,
  };
  state = {
    loadding: false,
    header_images: [],
    article: {
      id: '',
      title: '',
      type: [],
      images: [],
      content: '',
      create_date: ''
    },
    read_times: 0
  }

  componentWillMount () {
    this.setState({loadding: true})

    this._getTagDetail()
  }
  itemId = this.props.navigation.getParam('itemId', 'NO-ID');
  async _getTagDetail() {
    const token = await AsyncStorage.getItem('token')
    let that = this;
    axios({url: api.apis.ARTICLE + JSON.stringify(this.itemId) + '/', method:'get', headers: {'Authorization': 'Token ' + token}}).then(res=>{
      that.setState({header_images: res.data.article.images})
      that.setState({article: res.data.article})
      that.setState({read_times: res.data.read_times})
      that.setState({loadding: false})

    }).catch(error=>{
      console.error(error)
      this.setState({loadding: false})
      this.props.navigation.goBack()
    })
  }
  _keyExtractor = (item, index) => item.name;
  _header (navigation) {
    return (
      <View
      style={{flex:1, width: '100%', margin: MARGIN*2}}>
      <TouchableOpacity
      onPress={() => navigation.goBack()}>
      <Icon.Ionicons
        name={Platform.OS === 'ios' ? 'ios-backspace' : 'md-backspace'}
        size={26}
        color={'white'}
      />
      </TouchableOpacity>
      </View>
      )
  }
  render() {
    if (!this.state.loadding){
      return (
        <SafeAreaView style={styles.container}>
        <ScrollView >
          <ImageBackground
          source={{uri: api.apis.MAIN_URL + this.state.header_images[0].url}}
          imageStyle={{resizeMode: 'cover', width: '100%', height:380}}
          style={{width: '100%', height:380}}>
          <LinearGradient
          style={{flex:1, width: '100%', height:380, justifyContent:'space-between'}}
          colors={['transparent', BLACK]}>
            {this._header(this.props.navigation)}
            <View style={{flex:1, margin:MARGIN*2, justifyContent:'flex-end'}}>
            <Text style={[styles.title,{flex:1}]}>{this.state.article.title}</Text>
            <View style={{flex:1, flexDirection:'row', justifyContent:'flex-start',alignItems:'center'}}>
              <View style={{flexDirection:'row', justifyContent:'flex-start',alignItems:'center',marginRight:MARGIN}}>
                <Icon.Ionicons
                  name={Platform.OS === 'ios' ? 'ios-timer' : 'md-timer'}
                  size={18}
                  color={'white'}
                />
                <Text style={[styles.label,{marginLeft:MARGIN}]}>{new Date(this.state.article.create_date).toLocaleDateString()}</Text>
              </View>
              <View style={{flexDirection:'row', justifyContent:'flex-start',alignItems:'center',marginRight:MARGIN}}>
                <Icon.Ionicons
                  name={Platform.OS === 'ios' ? 'ios-eye' : 'md-eye'}
                  size={18}
                  color={'white'}
                />
                <Text style={[styles.label,{marginLeft:MARGIN}]}>{this.state.read_times}</Text>
              </View>
            </View>
            <FlatList
              horizontal={true} 
              style={{flex: 1}}
              scrollEnabled={false}
              keyExtractor={this._keyExtractor}
              data={this.state.article.type}
              renderItem={({item}) => 
                <View style={styles.tag}><Text style={styles.tagText}># {item.name}</Text></View>
            }>
            </FlatList>
            </View>
            </LinearGradient>
          </ImageBackground>
  
            <View style={{margin:MARGIN}}>
            <Text style={styles.label}>{this.state.article.content}</Text>
            </View>
          
          </ScrollView>
        </SafeAreaView>
      );
    } else {
      return (
        <View style={{justifyContent:'center',alignItems:'center',flex:1}}>
        <ActivityIndicator size="large" color="#0000ff" />
        </View>
      )
    }
    
  }
}
const BLACK = '#2a2b2d'
const WHITE = '#f5f4f9'
const MARGIN = 9
const styles = StyleSheet.create({
  container: {
    flex:1,
    backgroundColor: BLACK,
    paddingTop: Platform.OS == 'ios'?0: StatusBar.currentHeight
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
    fontSize: 18,
    fontWeight: '400',
    color: WHITE,
  },
  title: {
    fontSize: 26,
    fontWeight: '800',
    color: WHITE
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
  },
  tag: {
    borderRadius: 24,
    backgroundColor: 'red',
    padding: 9,
    marginTop:9,
    marginRight:9,
    height: 32
  },
  tagText: {
    color: 'white',
    fontSize: 14,
    fontWeight: '600'
  },
});
