import React from 'react';
import {
    Image,
    Platform,
    ScrollView,
    StyleSheet,
    Text,
    TouchableOpacity,
    ImageBackground,
    TextInput,
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
export default class FeedbackScreenScreen extends React.Component {
  static navigationOptions = {
    title: 'Feebback',
  };
  state = {
    loadding: false,
    header_images: [],
      star: 0,
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
  submit(){
    Alert.alert(
      'Success',
      'We will contact you soon!',
      [
          {text: 'OK', onPress: () => console.log('OK Pressed')},
      ],
      {cancelable: false},
  );
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

  render() {
    return (
      <SafeAreaView style={styles.container}>
      <StatusBar barStyle={'light-content'}/> 
        <ScrollView style={{padding:MARGIN}}>
          <View style={{flexDirection: 'column', width:'100%', justifyContent:'center', alignItems:'flex-start'}}>
          <Text style={styles.label}>*Title</Text>
          <TextInput
              style={styles.input}
              placeholder="Title about problem!"
              onChangeText={(Title) => this.setState({Title})}
            />
          </View>
          <View style={{flexDirection: 'column', width:'100%', justifyContent:'center', alignItems:'flex-start'}}>
          <Text style={styles.label}>*Email</Text>
          <TextInput
              style={styles.input}
              placeholder="You Email!"
              onChangeText={(Email) => this.setState({Email})}
            />
          </View>
          <View style={{flexDirection: 'column', width:'100%', marginTop:MARGIN, justifyContent:'center', alignItems:'flex-start'}}>
          <Text style={styles.label}>*Content</Text>
          <TextInput
              style={styles.inputText}
              placeholder="Content!"
              multiline={true}
              onChangeText={(Content) => this.setState({Content})}
            />
          </View>
          <TouchableOpacity
          onPress={()=>this.submit()}
          style={{flexDirection: 'column', width:'100%', marginTop:MARGIN, justifyContent:'center', alignItems:'center',
        backgroundColor:'orange',borderRadius:8,padding:10}}>
            <Text style={styles.label}>Submit</Text>

          </TouchableOpacity>
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
    flex:1,
    backgroundColor: WHITE,
    padding: MARGIN,
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
    color: BLACK,
    lineHeight:30,
    fontFamily: 'NotoSansSC-Medium',
  },
  title: {
    fontSize: 26,
    color: BLACK,
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
  input: {
    padding: MARGIN,
    fontSize:18,
    borderRadius: 8,
    borderWidth:1,
    borderColor: '#888888',
    marginTop:MARGIN,
    backgroundColor: 'white',
    width: '100%'
  },
  inputText: {
    padding: MARGIN,
    fontSize:18,
    height:200,
    borderRadius: 8,
    borderWidth:1,
    borderColor: '#888888',
    marginTop:MARGIN,
    width: '100%',
    backgroundColor: 'white',
    justifyContent:'flex-start',
    alignItems:'flex-start'
  }
});
