import React from 'react';
import ReactDOM from 'react-dom';

import App from './components/app.jsx';
import configureStore from './store/store.js';
import { allTodos } from './reducers/selectors.js';
import Root from './components/root.jsx';
import store from './store/store.js';

window.test = allTodos;
window.allTodos = allTodos;

document.addEventListener("DOMContentLoaded", () => {
  window.store = configureStore;
  ReactDOM.render(<Root store={store} />, document.getElementById('root'));

});
