import React from 'react';
import {
  Image,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
  FlatList,
  TextInput,
  StatusBar,
  SafeAreaView
} from 'react-native';
import { ExpoLinksView } from '@expo/samples';

export default class LinksScreen extends React.Component {
  static navigationOptions = {
    header: null,
  };
  constructor(props) {
    super(props);
    this.state = {text: ''};
  }
  render() {
    return (
      <SafeAreaView style={[styles.container,{marginTop: Platform.OS == 'ios'?0: StatusBar.currentHeight}]}>
        <View style={styles.navbar}>
          <Text style={styles.title}>Location</Text>
          <Text>C</Text>
        </View>
        <View style={{padding: 9}}>
          <TextInput
            style={styles.searchBar}
            placeholder="Type here to translate!"
            onChangeText={(text) => this.setState({text})}
          />
        </View>
        <View style={styles.recommendPart}>
            <ScrollView showsHorizontalScrollIndicator={false} style={styles.recommendScroll}>
              <View style={{flexDirection:'row'}}>
                <View style={styles.tag}><Text style={styles.tagText}>#bugis</Text></View>
              </View>
              <View style={styles.recommendA}>

              </View>
            </ScrollView>
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
    backgroundColor: 'red',
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
