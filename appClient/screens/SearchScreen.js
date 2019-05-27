import React from 'react';
import {
  Image,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  ImageBackground,
  View,
  FlatList,
  TextInput,
  StatusBar,
  SafeAreaView
} from 'react-native';
import { ExpoLinksView } from '@expo/samples';
import api from '../constants/APIs';
import { Icon, LinearGradient } from 'expo';
import axios from "axios";
export default class LinksScreen extends React.Component {
  static navigationOptions = {
    header: null,
  };
  constructor(props) {
    super(props);
    this.state = {text: '',
    refreshing: false,
    items: {
      next: null,
      previous: null,
      count: 0,
      results: []
    }
  };
  }
  componentDidMount() {
    this.setState({loading: true})
  }
  _goToArticelDetail(id) {
    this.props.navigation.navigate('ArticleDetail', {
      itemId: id,
    });
  }
  _keyExtractor = (item, index) => item.id.toString();
  
  _search () {
    const that = this;
    that.setState({refreshing: false, loading: true});

    axios({url: api.apis.SEARCH, method:'post' ,data: {
      key: this.state.text
    }}).then(res=>{
      that.setState({refreshing: false, loading: false, items: res.data});
    }).catch(error=>{
      that.setState({refreshing: true, loading: false});

    })
  }
  render() {
    return (
      <SafeAreaView style={[styles.container,{marginTop: Platform.OS == 'ios'?0: StatusBar.currentHeight}]}>
        <View style={{padding: 9, flexDirection:'row', width:'100%'}}>
          <TextInput
            style={[styles.searchBar,{flex:1}]}
            placeholder="Search tag and location"
            onChangeText={(text) => this.setState({text})}
            onSubmitEditing={()=> this._search()}
          />
          <TouchableOpacity style={{width:40,marginHorizontal:9,justifyContent:'center',alignItems:'center'}} onPress={()=>this._search()}>
          <Icon.Ionicons
                  name={Platform.OS === 'ios' ? 'ios-search' : 'md-search'}
                  size={36}
                  color={'black'}
                />
          </TouchableOpacity>
        </View>
        <View style={styles.container}>
            <FlatList
              data={this.state.items.results}
              keyExtractor={this._keyExtractor}
              renderItem={({item})=>
                (              
                  <TouchableOpacity style={styles.recommendPart} onPress={()=>this._goToArticelDetail(item.id)}>
                  <ImageBackground source={{uri:api.apis.MAIN_URL+ item.images[0].url}}
                    imageStyle={{ borderRadius: 9 }}
                    style={styles.recommendA}>
                    <LinearGradient 
                    colors={['transparent', 'rgba(0,0,0,0.8)']}
                    style={styles.recommendAB}>
                    <View style={styles.tag}>
                    <Text style={styles.tagText}>{item.tag.tag}</Text>
                    </View>
                    <Text style={[styles.title,{color: 'white', fontSize: 18}]}>{item.title}</Text>
                    </LinearGradient>
                  </ImageBackground>
                </TouchableOpacity>
                )
              }>


            </FlatList>

          </View>
      </SafeAreaView>
    );
  }
}
const BLACK = '#535259'
const WHITE = '#f5f4f9'
const MARGIN = 9
const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 15,
    backgroundColor: '#fff',
  },
  searchBar: {
    height:40,
    lineHeight: 40,
    borderRadius: 24,
    borderWidth: 1,
    borderColor: '#66666666',
    paddingLeft: 13,
    paddingRight: 13,
  },
  tag: {
    borderRadius: 16,
    backgroundColor: '#666666',
    padding: 9,
    marginTop:9,
    marginRight:9
  },
  tagText: {
    color: 'white',
    fontWeight: '400'
  },
  label: {
    fontSize: 20,
    fontWeight: '400',
    color: _colorCheck('text')
  },
  title: {
    fontSize: 26,
    fontWeight: '500',
    color: _colorCheck('text')
  },
  recommendPart: {
    alignItems: 'flex-start',
    flex: 1,
    margin:MARGIN,
    marginBottom: 0
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
  recommendAB: {
    flex:1,
    width: '100%',
    padding: 9,
    borderRadius: 9,
 
    justifyContent: 'space-between',
    alignItems:'flex-start'
  },
  recommendScroll: {
    width: '100%'
  }
});
