// FUTURE TASK: rails にjs module環境整備した場合は要リファクタリング
var MYAPP = MYAPP || {};

// (2)モジュールの定義
MYAPP.BUTTON = (function(){
  
  // private member
  let _max_num;
  
  // private method
  set_max_num = function(max_num){
    this._max_num = max_num;
  },
  is_all_watched = function(){
    let comp_length = $('.btn-comp').length;
    if(comp_length === this._max_num){
      return true;
    }else{
      return false;
    }
  },
  show_next_button = function(){
    if(this.is_all_watched()){
      //全部完了の場合にNEXTボタンを非表示-> 表示にする処理
      showNextButton();
      //asideの活性化
      activateAsideLink();
     
    }else{
      //未完了がある場合にNEXTボタンを表示-> 非表示にする処理
      hideNextButton();
      //asideの非活性化
      inactivateAsideLink();
      
    }
  }
  // public API
  return {
    set_max_num: set_max_num,
    is_all_watched: is_all_watched,
    show_next_button: show_next_button
  };
  
}());

function showNextButton(){
  $("#link_portfolio_mv").show();
  $("#link_portfolio_mv").toggleClass('hide');
}
function hideNextButton(){
  $("#link_portfolio_mv").hide();
  $("#link_portfolio_mv").toggleClass('hide');
}
function activateAsideLink(){
  let next_button_text = $('#link_portfolio_mv').find('a').text();
  let aside_lists = $('.sidebar-list').find('li');
  for(let i = 0, len = aside_lists.length; i < len; i++){
    var listText = aside_lists[i].innerText;
    if(next_button_text.indexOf(listText) > -1){
      $(aside_lists[i]).find('a').removeClass('disabled');
      return;
    }
  }
}
function inactivateAsideLink(){
  let next_button_text = $('#link_portfolio_mv').find('a').text();
  let aside_lists = $('.sidebar-list').find('li');
  for(let i = 0, len = aside_lists.length; i < len; i++){
    var listText = aside_lists[i].innerText;
    if(next_button_text.indexOf(listText) > -1){
      $(aside_lists[i]).find('a').addClass('disabled');
      return;
    }
  }
}

