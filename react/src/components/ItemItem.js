import React from 'react';

const ItemListItem = (props) => {

  return(
    <div >
      <h4><a href={`http://localhost:3000/items/` + props.id}>{props.name}</a></h4>
    </div>
  )
}

export default ItemListItem;
