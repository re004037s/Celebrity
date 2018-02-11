var MYAPP = MYAPP || {};
// (2)モジュールの定義
MYAPP.POPUP = (function(){
  
  // private member
  let _message;
  let _modal_bg_id = "modal-bg";
  let _alert_content_id = "alert_content";
  
  // private method
  init = function(){
    this.remove_modal_DOM();
    this.remove_modal_bg_DOM();
    this.append_modal_DOM();
    this.append_modal_bg_DOM();
  },
  
  set_message = function(message){
    _message = message;
  },
  get_alert_content_id = function(){
    return _alert_content_id;
  },
  get_modal_bg_id = function(){
    return _modal_bg_id;
  },
  get_message = function(){
    return _message;
  },
  
  append_modal_DOM = function(){
    let _html = '<div class="alert alert-info">';
    _html += '<strong id="' + this.get_alert_content_id() + '">';
    _html += this.get_message();
    _html += '</strong>';
    _html +='</div>';
    $('body').append(_html);
  },
  append_modal_bg_DOM = function(){
    let _html = '<div id="' + this.get_modal_bg_id() + '"></div>';
    $('body').append(_html);
  },
  remove_modal_DOM = function(){
    if($('.alert')){
      $('.alert').remove();
    }
  },
  remove_modal_bg_DOM = function(){
    if($('#' + this.get_modal_bg_id())){
      $('#' + this.get_modal_bg_id()).remove();
    }
  },
  
  addCSS = function(){
    $('.alert-info').css({
      'text-align': 'center',
      'display': 'none',
      'width': '500px',
      'position': 'absolute',
      'margin-bottom': '0',
      'z-index': '9999',
    });
    
    $('#modal-bg').css({
      'display':'none',
      'width':'100%',
      'height':'100%',
      'background-color': 'black',
      'position':'fixed',
      'opacity': '0.8',
      'top':'0',
      'left':'0',
      'z-index': '9998',
    });
  },
  offsetToCenter = function(){
    var wH = $(window).height();
    var wW = $(window).width();
    var cH = $(".alert-info").outerHeight();
    var cW = $(".alert-info").outerWidth();
    var centerH = ( wH ) / 2 ;
    var centerW = ( wW - cW ) / 2 ;
    var sc = $(window).scrollTop();
    $(".alert-info").css({
      "top" : centerH + sc + "px",
      "left" : centerW + "px"
    });
  },
  show_popup = function(msg){
    this.set_message(msg)
    this.init();
    this.addCSS();
    this.offsetToCenter();
    $('#' + this.get_modal_bg_id()).show().delay(3000).fadeOut(500);
    $('.alert').show().delay(3000).fadeOut(500); //3秒表示させる
  }
  // public API
  return {
    init: init,
    append_modal_DOM: append_modal_DOM,
    append_modal_bg_DOM: append_modal_bg_DOM,
    remove_modal_DOM: remove_modal_DOM,
    remove_modal_bg_DOM: remove_modal_bg_DOM,
    set_message: set_message,
    get_message: get_message,
    get_alert_content_id: get_alert_content_id,
    get_modal_bg_id: get_modal_bg_id,
    show_popup: show_popup,
    addCSS: addCSS,
    offsetToCenter: offsetToCenter,
  };
  
}());