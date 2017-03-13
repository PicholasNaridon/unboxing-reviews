import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import ItemList from './components/ItemList';

$(function() {
  if (document.getElementById('main-app')) {
    ReactDOM.render(
      <ItemList />,
      document.getElementById('main-app')
    );
  };
});
