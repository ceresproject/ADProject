import React from 'react';
import { createAppContainer, createSwitchNavigator } from 'react-navigation';

import MainTabNavigator from './MainTabNavigator';
import {SigninScreen, RegisterScreen} from './Auth'
import AppLoading from './AppLoading'
export default createAppContainer(createSwitchNavigator({
  // You could add another route here for authentication.
  // Read more at https://reactnavigation.org/docs/en/auth-flow.html
  Main: MainTabNavigator,
  Auth: SigninScreen,
  AuthRegister: RegisterScreen,
  AppLoading: AppLoading
},
{
  initialRouteName: 'AppLoading',
}));