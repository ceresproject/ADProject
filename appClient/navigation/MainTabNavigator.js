import React from 'react';
import { Platform } from 'react-native';
import { createStackNavigator, createBottomTabNavigator } from 'react-navigation';

import TabBarIcon from '../components/TabBarIcon';
import HomeScreen from '../screens/HomeScreen';
import LinksScreen from '../screens/LinksScreen';
import SearchScreen from '../screens/SearchScreen';
import SettingsScreen from '../screens/SettingsScreen';
import LocationScreen from '../screens/LocationScreen';
import ArticleDetailScreen from "../screens/ArticleDetailScreen";
const HomeStack = createStackNavigator({
  Home: HomeScreen,
  ArticleDetail: ArticleDetailScreen
});

HomeStack.navigationOptions = ({ navigation }) => {
  let tabBarLabel = 'Explore';
  let tabBarIcon = ({ focused }) => (
    <TabBarIcon
      focused={focused}
      name={Platform.OS === 'ios' ? 'ios-compass' : 'md-compass'}

    />
  )
  let tabBarVisible = true;
  if (navigation.state.index > 0) {
    tabBarVisible = false;
  }

  return {
    tabBarVisible,
    tabBarLabel,
    tabBarIcon,
  };
};


const SearchStack = createStackNavigator({
  Search: SearchScreen,
});

SearchStack.navigationOptions = ({ navigation }) => {
  let tabBarLabel = 'Search';
  let tabBarIcon = ({ focused }) => (
    <TabBarIcon
      focused={focused}
      name={Platform.OS === 'ios' ? 'ios-search' : 'md-search'}

    />
  )
  let tabBarVisible = true;
  if (navigation.state.index > 0) {
    tabBarVisible = false;
  }

  return {
    tabBarVisible,
    tabBarLabel,
    tabBarIcon,
  };
};

const LinksStack = createStackNavigator({
  Links: LinksScreen,
});

LinksStack.navigationOptions = {
  tabBarLabel: 'Concern',
  tabBarIcon: ({ focused }) => (
    <TabBarIcon
      focused={focused}
      name={Platform.OS === 'ios' ? 'ios-bookmark' : 'md-bookmark'}
    />
  ),
};

const SettingsStack = createStackNavigator({
  Settings: SettingsScreen,
});

SettingsStack.navigationOptions = {
  tabBarLabel: 'Profile',
  tabBarIcon: ({ focused }) => (
    <TabBarIcon
      focused={focused}
      name={Platform.OS === 'ios' ? 'ios-contact' : 'md-contact'}
    />
  ),
};

export default createBottomTabNavigator({
  HomeStack,
  SearchStack,
  LinksStack,
  SettingsStack,
},{
  tabBarOptions: {
    showLabel: false
  }
});
