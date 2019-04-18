import React from 'react';
import {
  Image,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
  StatusBar,
  SafeAreaView,
  FlatList
} from 'react-native';
import api from '../constants/APIs';
import { WebBrowser } from 'expo';
import axios from "axios";
import { MonoText } from '../components/StyledText';

export default class HomeScreen extends React.Component {
  static navigationOptions = {
    header: null,
  };
  state = {
    recommendResults: []
  }

  componentDidMount() {
    this._loadHomeResults()
  }
  _keyExtractor = (item, index) => item.id.toString();
  
  render() {
    return (
      <SafeAreaView style={[styles.container,{marginTop: Platform.OS == 'ios'?0: StatusBar.currentHeight}]}>
        <View style={styles.navbar}>
          <Text style={styles.title}>Location</Text>
          <Text>C</Text>
        </View>
        <ScrollView nestedScrollEnabled={true} style={styles.container} contentContainerStyle={styles.contentContainer}>
          <View style={styles.container}>
            <FlatList
            data={this.state.recommendResults}
            keyExtractor={this._keyExtractor}
            renderItem={this._ifGetRecommendResults}>


            </FlatList>
          </View>
          <View style={styles.recommendPart}>
              <Text style={styles.label}>Top 10 in sg</Text>
              <ScrollView showsHorizontalScrollIndicator={false} style={styles.recommendScroll} contentContainerStyle={styles.contentContainer}>
                <View style={styles.recommendA}>
                <Text>Top 6</Text>
                </View>
              </ScrollView>
            </View>
        </ScrollView>
      </SafeAreaView>
    );
  }

  _ifGetRecommendResults=({item})=> {
    return (
      <View style={styles.recommendPart} key={item.id}>
      <Text style={styles.label}>Top 10 in {item.tag.tag}</Text>
      <View style={styles.recommendA}>
        <Text>{item.articles[0].title}</Text>
        <Text>{item.articles[0].content}</Text>
      </View>
      <ScrollView 
      showsHorizontalScrollIndicator={false} 
      horizontal={true} 
      style={styles.recommendScroll}>
        <View style={styles.rp}>
        <Text>Top 2</Text>
        </View>
        <View style={styles.rp}>
        <Text>Top 3</Text>
        </View>
        <View style={styles.rp}>
        <Text>Top 4</Text>
        </View>
        <View style={styles.rp}>
        <Text>Top 5</Text>
        </View>
        <View style={styles.rp}>
        <Text>Top 6</Text>
        </View>
      </ScrollView>
    </View>
    )
  }

  _loadHomeResults() {
    const that = this;
    axios.get(api.apis.HOME_RECOMMEND).then(res=>{
      //console.log(res.data)
      that.setState({recommendResults: res.data.results})
    })
  }
}
const BLACK = '#2a2b2d'
const WHITE = '#f5f4f9'
const MARGIN = 9
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
