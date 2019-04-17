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
import { WebBrowser } from 'expo';

import { MonoText } from '../components/StyledText';

export default class HomeScreen extends React.Component {
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
            <Text style={styles.label}>Main Title</Text>
            <View style={styles.recommendA}>
              <Text>Top 1 Title</Text>
              <Text>Development mode is enabled, your app will be slower but yo</Text>
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

  _maybeRenderDevelopmentModeWarning() {
    if (__DEV__) {
      const learnMoreButton = (
        <Text onPress={this._handleLearnMorePress} style={styles.helpLinkText}>
          Learn more
        </Text>
      );

      return (
        <Text style={styles.developmentModeText}>
          Development mode is enabled, your app will be slower but you can use useful development
          tools. {learnMoreButton}
        </Text>
      );
    } else {
      return (
        <Text style={styles.developmentModeText}>
          You are not in development mode, your app will run at full speed.
        </Text>
      );
    }
  }

  _handleLearnMorePress = () => {
    WebBrowser.openBrowserAsync('https://docs.expo.io/versions/latest/guides/development-mode');
  };

  _handleHelpPress = () => {
    WebBrowser.openBrowserAsync(
      'https://docs.expo.io/versions/latest/guides/up-and-running.html#can-t-see-your-changes'
    );
  };
}

const BLACK = '#2a2b2d'
const WHITE = '#f5f4f9'
const MARGIN = 9
_colorCheck = (label) =>{
  const hour = new Date().getHours()
  if (hour >=8 && hour <= 19){
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
