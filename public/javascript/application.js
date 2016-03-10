$(document).ready(function() {

  $.getJSON('/contact_list', function (allContacts) {
    allContacts.forEach(function(contact){
      var tr = $('<tr>');
      var td_name = $('<td>').text(contact.name);
      var td_email = $('<td>').text(contact.email).addClass('email-column');
      
      tr.appendTo('tbody');
      td_name.appendTo(tr);
      td_email.appendTo(tr);
    });
  });

  $('#form_submit').on('click', function(event){
    event.preventDefault();
    var name = $('#new_name').val();
    var email = $('#new_email').val();
    var postData = {
      name: name,
      email: email
    };

    $.post('/contact_list', postData, function(results) {
      if (results.success){
        var tr = $('<tr>');
        var td_name = $('<td>').text(name);
        var td_email = $('<td>').text(email).addClass('email-column');
        
        $('tbody').append(tr);
        td_name.appendTo(tr);
        td_email.appendTo(tr);
      } else {
        alert("Fail");
      }
    }, 'json');
  });

  $('#search_submit').on('click', function(){
    $('td').removeClass('highlight');
    var search_input = $('#search_input').val();
    $('td:contains('+search_input+')').addClass('highlight');
  });

  $('.button2').on('click', function(){
    $('td').removeClass('highlight');
  });

});


    // $.ajax({
    //   url: '/contact_list',
    //   method: 'GET',
    //   dataType: 'json',
    //   success: 

    // $('.contact-table').find('td').empty();

        // $.getJSON('/contact_list', function (allContacts) {
    //   allContacts.forEach(function(contact){
    //     var tr = $('<tr>');
    //     var td_name = $('<td>').text(contact.name);
    //     var td_email = $('<td>').text(contact.email);
        
    //     $('.contact-table').append(tr);
    //     td_name.appendTo(tr);
    //     td_email.appendTo(tr);
    //   });
    //   $('.contact-table').removeClass('hide');






