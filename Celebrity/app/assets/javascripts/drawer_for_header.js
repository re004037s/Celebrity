(function() {
      
  var phone_width = 767;
  var window_width;
  
  // 画面幅でクラスを操作
  $(window).on("load resize", function() {
    
    // 画面幅を取得
    window_width = $(window).width();
    
    if(window_width > phone_width) {
      // PCの場合
      // $(".menu-button-for-sp").css("display", "none");
      $("nav.menu-nav").removeClass("drawer-nav");
      $("ul.menu-ul").removeClass("drawer-menu");
      $("li.menu-li > a").removeClass("drawer-menu-item");
      $(".menu-li").css("display", "").css("display", "inline-block");
      
    } else {
      // スマホの場合
      // $(".menu-button-for-sp").css("display", "block");
      $("nav.menu-nav").addClass("drawer-nav");
      $("ul.menu-ul").addClass("drawer-menu");
      $("li.menu-li > a").addClass("drawer-menu-item");
      $(".menu-li").css("display", "block");
      
      // ドロワーの制御
      $('.drawer').drawer();
    }
    
  });
  
}());