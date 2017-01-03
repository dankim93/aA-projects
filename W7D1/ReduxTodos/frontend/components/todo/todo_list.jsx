import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  render () {
    // console.log(this.props);
    return(
      <div>

        <ul>
          {this.props.todos.map(todo =>(
            // <li key={todo.id}>{todo.title}</li>
            <TodoListItem todo={todo} key={todo.id}/>
          ))}
        </ul>

        <TodoForm />
      </div>
    );

  }
}

export default TodoList;
