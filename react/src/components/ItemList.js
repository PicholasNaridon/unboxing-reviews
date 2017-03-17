import React, { Component } from 'react';
import ItemListItem from './ItemItem';

class ItemList extends Component {
  constructor(props) {
  super(props);
    this.state = {
      items: [],
      currentPage: 1,
      itemsPerPage: 6
    };
    this.getData = this.getData.bind(this);
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(event) {
    this.setState({
      currentPage: Number(event.target.id)
    });
  }

  getData() {
    fetch('https://un-boxed.herokuapp.com/api/v1/items.json')
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
  };

  render() {
    let indexOfLastItem = this.state.currentPage * this.state.itemsPerPage
    let indexOfFirstItem = indexOfLastItem - this.state.itemsPerPage
    let currentItems = this.state.items.slice(indexOfFirstItem, indexOfLastItem)

    let newItems = currentItems.map((item, index) =>{
      return (
        <ItemListItem
          id={item.id}
          key={index}
          name={item.name}
          picture={item.image_url}
        />
      )
    });

    let pageNumbers = [];
    for (let i = 1; i <= Math.ceil(this.state.items.length / this.state.itemsPerPage); i++){
      pageNumbers.push(i);
    }

    let renderPageNumbers = pageNumbers.map(number => {
      return (
        <a className="tiny button"
          key={number}
          id={number}
          onClick={this.handleClick}
        >
          {number}
        </a>
      );
    });

    return(
      <div>
        <div>
          {newItems}
        </div>
        <ul>
          <div className="small-4 small-push-4 columns">
            {renderPageNumbers}
          </div>
        </ul>
      </div>

    )
  }
};

export default ItemList;
