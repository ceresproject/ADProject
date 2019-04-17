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
  SafeAreaView
} from 'react-native';
import { ExpoLinksView } from '@expo/samples';

export default class LinksScreen extends React.Component {
  static navigationOptions = {
    header: null,
  };

  render() {
    return (
      <SafeAreaView style={[styles.container,{marginTop: Platform.OS == 'ios'?0: StatusBar.currentHeight}]}>
        <View style={styles.navbar}>
          <Text style={styles.title}>Location</Text>
          <Text>C</Text>
        </View>
        <ScrollView nestedScrollEnabled={true} style={styles.container} contentContainerStyle={styles.contentContainer}>   
          <View style={styles.recommendPart}>
            <Text style={styles.label}>Top 10 in sg</Text>
            <ScrollView showsHorizontalScrollIndicator={false} style={styles.recommendScroll}>
              <View style={styles.recommendA}>
              <Text>Top 6</Text>
              </View>
            </ScrollView>
          </View>
        </ScrollView>
      </SafeAreaView>
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
