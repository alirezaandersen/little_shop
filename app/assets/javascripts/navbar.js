$( document ).ready(function(){
  $('#navbar').sideNav({
    menuWidth: 240,
    edge: 'right',
    closeOnClick: true
  });

  $('#sidebar').sideNav({
    menuWidth: 240,
    edge: 'left',
    closeOnClick: true
  });
});
