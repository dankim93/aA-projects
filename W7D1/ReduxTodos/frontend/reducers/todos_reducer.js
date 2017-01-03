import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from '../actions/todo_actions.js';
import merge from 'lodash/merge';
const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};
const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState = merge({}, state);
  switch(action.type) {
    case RECEIVE_TODOS:
      newState = {};
      // debugger;
      Object.keys(action.todos).forEach((key) => {
        // debugger
        newState[key] = action.todos[key];
      });
      return newState;
    case RECEIVE_TODO:
      const newTodo = {[action.todo.id]: action.todo};
      newState = merge(newState, newTodo);
      return newState;

    default:
      return state;
  }
};

export default todosReducer;
