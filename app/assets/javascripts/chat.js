$(function(){
  function buildHTML(message){
    let html = `<div class="messages" data-message-id=${message.id}>
                  <div class="message__upper__info">
                    <p class="name">${message.user_name}</p>
                    <p class="date">${message.date}</p>
                  </div>
                  <p class="message">${message.content}</p>
                </div>`
    return html;
  }

  let reloadMessages = function() {
    let last_message_id = $('.messages:last').data('message-id');
    $.ajax({
      url: "api/chats",
      type: 'GET',
      dataType: 'json',
      data: {id: last_message_id}
    })
    .done(function(messages){
      let insertHTML = '';
      $.each(messages, function(i, message) {
        insertHTML += buildHTML(message);
      });
      $('.main__chat__box__space').append(insertHTML);
      $('.main__chat__box__space').animate({ scrollTop: $('.main__chat__box__space')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    });
  };

  $('#new__message').on('submit', function(e) {
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.main__chat__box__space').append(html);
      $('#new__message')[0].reset();
      $('.main__chat__box__space').animate({ scrollTop: $('.main__chat__box__space')[0].scrollHeight});
    })
    .fail(function(){
      alert('メッセージを入力してください');
    })
    .always(function(){
      $('#btn').prop('disabled', false);
    })
  });
  if (document.location.href.match(/\/chats/)){
    setInterval(reloadMessages, 7000);
    console.log("success");
  }
});