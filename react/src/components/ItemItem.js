import React from 'react';

const ItemListItem = (props) => {

  return(
    <div >
      <h4><a href={`https://un-boxed.herokuapp.com/items/` + props.id}>{props.name}</a></h4>
    </div>
  )
}

export default ItemListItem;
