import React from 'react';

const ItemListItem = (props) => {

  return(
    <div className="row small-12 medium-12 large-12 columns">
      <div className="card">
      <img src={props.picture}
      className="image"/>
        <div className="card-section">
          <h4><a href={`http://localhost:3000/items/` + props.id}>{props.name}</a></h4>
        </div>
      </div>
    </div>

  )
}

export default ItemListItem;
