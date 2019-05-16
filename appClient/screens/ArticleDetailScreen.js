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
    SafeAreaView, Alert
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
        marked: false,
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
      that.setState({header_images: res.data.images})
      that.setState({article: res.data})
      that.setState({loadding: false})
    }).catch(error=>{
      console.error(error)
      this.setState({loadding: false})
      this.props.navigation.goBack()
    })
  }
  async _mark(id) {
      const token = await AsyncStorage.getItem('token')
      let that = this;
      axios({url: api.apis.MAKEMARK, method:'post',data:{'id': id}, headers: {'Authorization': 'Token ' + token}}).then(res=>{
          const newArticle = that.state.article
          newArticle.marked = !newArticle.marked
          that.setState({article: newArticle})

      }).catch(error=>{
          console.error(error)
          if (error) {
              Alert.alert(
                  'Error',
                  'Mark failed',
                  [
                      {text: 'OK', onPress: () => console.log('OK Pressed')},
                  ],
                  {cancelable: false},
              );
          }
      })
  }
  _keyExtractor = (item, index) => item.name;
  _header (navigation) {
    return (
      <View
      style={{width: '100%', padding: MARGIN*2, height: 'auto', position: 'relative', left: 0, right: 0,
      justifyContent:'flex-start'}}>
      <TouchableOpacity
      onPress={() => navigation.goBack()}>
      <Icon.Ionicons
        name={Platform.OS === 'ios' ? 'ios-arrow-dropleft-circle' : 'md-arrow-dropleft-circle'}
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
        <StatusBar barStyle={'light-content'}/> 
        {this._header(this.props.navigation)}

        <ScrollView >
          <ImageBackground
          source={{uri: api.apis.MAIN_URL + this.state.header_images[0].url}}
          imageStyle={{resizeMode: 'cover', width: '100%', height:380}}
          style={{width: '100%', height:380}}>
          <LinearGradient
          style={{width: '100%', height:380, justifyContent:'flex-end'}}
          colors={['transparent', BLACK]}>
            <View style={{margin:MARGIN*2, justifyContent:'flex-end'}}>
            <Text style={[styles.title,{marginTop:MARGIN*2}]}>{this.state.article.title}</Text>
            <TouchableOpacity onPress={()=>this._mark(this.state.article.id)} style={[styles.tag,{backgroundColor:this.state.article.marked? 'red':'orange',color:'black'}]}><Text style={styles.tagText}><Icon.Ionicons
                  name={Platform.OS === 'ios' ? 'ios-bookmark' : 'md-bookmark'}
                  size={14}
                  color={'white'}
                />{!this.state.article.marked? ' Make Mark':' Cancel Mark'}</Text>
            </TouchableOpacity>
            <View style={{flexDirection:'row', justifyContent:'flex-start',alignItems:'center', marginTop: MARGIN*2}}>
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
                <Text style={[styles.label,{marginLeft:MARGIN}]}>{this.state.article.read_times}</Text>
              </View>
            </View>
            <FlatList
              horizontal={true} 
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
  
            <View style={{margin:MARGIN*2}}>
            <Text style={[styles.label,{color:'rgba(255,255,255,0.8)'}]}>{this.state.article.content}</Text>
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
    color: WHITE,
    lineHeight:30,
    fontFamily: 'NotoSansSC-Medium',
  },
  title: {
    fontSize: 26,
    color: WHITE,
    fontFamily: 'NotoSansSC-Bold',
    
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
    borderRadius: 9,
    backgroundColor: 'red',
    marginTop:9,
    marginRight:9,
    justifyContent: 'center',
    alignItems:'center',
    height: 28,
    lineHeight: 28
  },
  tagText: {
    color: 'white',
    fontSize: 14,
    marginLeft: MARGIN,
    marginRight: MARGIN,
    textAlign:'center',
    fontFamily: 'NotoSansSC-Medium',
  },
});
