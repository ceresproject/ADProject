import React from 'react';
import {
  Image,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  AsyncStorage,
  TouchableOpacity,
  View,
  StatusBar,
  SafeAreaView,
  RefreshControl,
  ActivityIndicator,
  ImageBackground,
  FlatList
} from 'react-native';
import { LinearGradient, Icon } from 'expo';

import api from '../constants/APIs';
import { WebBrowser } from 'expo';
import axios from "axios";
import { MonoText } from '../components/StyledText';

export default class HomeScreen extends React.Component {
  static navigationOptions = {
    header: null,
  };
  state = {
    recommendResults: [],
    refreshing: false
  }

  componentDidMount() {
    this.setState({loading: true})
    this._loadHomeResults()
  }
  _keyExtractor = (item, index) => item.id.toString();
  
  render() {
    if (this.state.loading){
      return (
        <View style={{justifyContent:'center',alignItems:'center',flex:1}}>
        <ActivityIndicator size="large" color="#0000ff" />
        </View>
      )    
    } else {
      return (
        <SafeAreaView style={[styles.container,{marginTop: Platform.OS == 'ios'?0: StatusBar.currentHeight}]}>
          <StatusBar barStyle={'dark-content'} translucent={true}  backgroundColor={WHITE}/> 

          <View style={styles.navbar}>
            <Text style={styles.title}>Explore</Text>

          </View>
          <ScrollView 
          refreshControl={
            <RefreshControl
              refreshing={this.state.refreshing}
              onRefresh={this._onRefresh}
            />
          }
          nestedScrollEnabled={true} style={styles.container} contentContainerStyle={styles.contentContainer}>
            <View style={styles.container}>
              <FlatList
              data={this.state.recommendResults}
              keyExtractor={this._keyExtractor}
              renderItem={this._ifGetRecommendResults}>


              </FlatList>
            </View>
            <View style={styles.recommendPart}>
            </View>
          </ScrollView>
        </SafeAreaView>
      );
    }
  }

  _ifGetRecommendResults=({item})=> {
    return (
      <View style={styles.recommendPart} key={item.id}>
      <Text style={styles.label}>{item.tag.tag}</Text>
      <TouchableOpacity style={[styles.touchA,styles.shadow]} onPress={() => this._goToLocationTagDetail(item.articles[0].id)}>
        <ImageBackground source={{uri:api.apis.MAIN_URL+ item.articles[0].images[0].url}}
          imageStyle={{ borderRadius: 9 }}
          style={styles.recommendA}>
          <LinearGradient 
          colors={['transparent', 'rgba(0,0,0,0.8)']}
          style={styles.recommendAB}>
          <Text style={styles.article_title}>{item.articles[0].title}</Text>
          </LinearGradient>
        </ImageBackground>
      </TouchableOpacity>

      <FlatList 
      showsHorizontalScrollIndicator={false} 
      horizontal={true} 
      keyExtractor={this._keyExtractor}
      data={item.articles.slice(1,10)}
      renderItem={({item}) =>
      <TouchableOpacity style={[styles.touchrp, styles.shadow]} onPress={() => this._goToLocationTagDetail(item.id)}>

        <ImageBackground source={{uri: api.apis.MAIN_URL+ item.images[0].url}}
          imageStyle={{ borderRadius: 9 }}
          style={styles.rp}>
          <LinearGradient 
          colors={['transparent', 'rgba(0,0,0,0.8)']}
          style={styles.rpb}>
          <Text style={styles.article_title_sub}>{item.title}</Text>
          </LinearGradient>
        </ImageBackground>  
      </TouchableOpacity>
      }
      style={styles.recommendScroll}>
      </FlatList>
    </View>
    )
  }

  _goToLocationTagDetail(id) {
    console.log(id)
    this.props.navigation.push('ArticleDetail', {
      itemId: id,
    });
  }

  _loadHomeResults() {
    const that = this;
    axios({url: api.apis.HOME_RECOMMEND, method:'get'}).then(res=>{
      //console.log(res.data)
      that.setState({recommendResults: res.data.results,refreshing: false, loading: false})
    }).catch(error=>{
      that.setState({refreshing: true, loading: false});

    })
  }
  _onRefresh = () => {
    this.setState({refreshing: true});
    this._loadHomeResults()
  }
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
    justifyContent: "center",
    paddingHorizontal: MARGIN,
    alignItems: 'center',
    height: 44,
    flexDirection: 'row'
  },
  label: {
    fontSize: 20,
    fontWeight: '600',
    color: _colorCheck('text'),
    fontFamily: 'NotoSansSC-Medium',
  },
  title: {
    fontSize: 26,
    fontWeight: '800',
    fontFamily: 'NotoSansSC-Bold',
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
    color: 'white',
    fontFamily: 'NotoSansSC-Medium',
  },
  article_title_sub: {
    fontSize: 14,
    color: 'white',
    fontFamily: 'NotoSansSC-Medium',
  },
  shadow: {

  }
});
