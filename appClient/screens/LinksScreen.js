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
  SafeAreaView,
    RefreshControl,
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
        id: '',
        create_date: '',
        article:{
            id: '',
            images:[{
                url:''
            }],
            title: ''
        }
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
        console.log(res.data.results)
      that.setState({bookMarkData: res.data.results,refreshing: false, loading: false})
    }).catch(error=>{
      that.setState({refreshing: true, loading: false});

    })
  }
    _goToLocationTagDetail(id) {
        console.log(id)
        this.props.navigation.push('ArticleDetail', {
            itemId: id,
        });
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
          </View>
          <View style={[styles.container]}>

              <FlatList
                  data={this.state.bookMarkData}
                  refreshControl={
                      <RefreshControl
                          refreshing={this.state.refreshing}
                          onRefresh={this._onRefresh}
                      />
                  }
                  keyExtractor={this._keyExtractor}
                  renderItem={({item})=>
                      <View style={styles.recommendPart}>
                          <Text style={styles.label}>{new Date(item.create_date).toLocaleDateString()}</Text>

                          <TouchableOpacity style={[styles.touchrp, styles.shadow]} onPress={() => this._goToLocationTagDetail(item.article.id)}>

                          <ImageBackground source={{uri: api.apis.MAIN_URL+ item.article.images[0].url}}
                                           imageStyle={{ borderRadius: 9 }}
                                           style={styles.rp}>
                              <LinearGradient
                                  colors={['transparent', 'rgba(0,0,0,0.8)']}
                                  style={styles.rpb}>
                                  <Text style={styles.article_title_sub}>{item.article.title}</Text>
                              </LinearGradient>
                          </ImageBackground>
                      </TouchableOpacity>
                      </View>
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
        width: '100%',
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
    }
});
