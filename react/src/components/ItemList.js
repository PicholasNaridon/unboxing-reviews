import React, { Component } from 'react';
import ItemListItem from './ItemItem';

class ItemList extends Component {
  constructor(props) {
  super(props)
    this.state = {
      items: [],
    
    }
    this.getData = this.getData.bind(this);
  }

  getData() {
    fetch('http://localhost:3000/api/v1/items.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({items: body});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getData();
  }

  render() {

    let newItems = this.state.items.map((item, index) => {
      return (
        <ItemListItem
          id={item.id}
          key={item.id}
          name={item.name}
        />
      )
    });

    return(
      <div>
        {newItems}
      </div>
    )
  }
};

export default ItemList;
