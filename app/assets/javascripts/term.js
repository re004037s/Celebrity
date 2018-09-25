$(document).on('turbolinks:load', function(){
    $(document).on('keyup', '#form', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: '/terms/search',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    //ここから追記
    .done(function(data){ //データを受け取ることに成功したら、dataを引数に取って以下のことする(dataには@usersが入っている状態ですね)
      $('#result').find('li').remove();  //idがresultの子要素のliを削除する
      $(data).each(function(i, term){ //dataをuserという変数に代入して、以下のことを繰り返し行う(単純なeach文ですね)
        $('#result').append('<li>' + term.name + '</li>') //resultというidの要素に対して、<li>ユーザーの名前</li>を追加する。
      });
    })
  });
});