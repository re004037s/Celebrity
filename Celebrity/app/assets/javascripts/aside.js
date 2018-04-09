$(function() {
  $('.accordion-item').click(function(){
    //出隠れする部分を変数に格納しておく
    var $answer = $(this).children('.answer');
    //hasClassメソッドで出隠れする部分にopenが存在するか確認
    
    if ($answer.hasClass('open')) {
      //出隠れ部分が出ている場合の処理

      //&ltdiv class="answer open"&gtからopenを消す
      $answer.removeClass('open');
      //出ている部分をスライドアップして隠す
      $answer.slideUp();
      //横っちょにある開閉ボタンを↓に変える
      $(this).children('span').text('↓');
    }
    else {
      //出隠れ部分が隠れている場合の処理
      
      //&ltdiv class="answer"&gtにopenを追加する
      $answer.addClass('open');
      //出す部分をスライドダウンして表示させる
      $answer.slideDown();
      //横っちょにある開閉ボタンを↑に変える
      $(this).children('span').text('↑');
    }
  });
});
