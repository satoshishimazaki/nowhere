// Hello.
//
// This is The Scripts used for Sailor Theme
//
//



function main() {

(function () {
   'use strict';

  //Page Loader Script
  //<![CDATA[
  //==========================================
     $(window).load(function() { // makes sure the whole site is loaded
        $('#status').fadeOut(); // will first fade out the loading animation
        $('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
        $('body').delay(350).css({'overflow':'visible'});
    });
    //]]>

    // meanmenu
      // $(document).ready(function() {
      //   $('nav').meanmenu({
      //       meanMenuClose: "x", // クローズボタン
      //       meanMenuCloseSize: "18px", // クローズボタンのフォントサイズ
      //       meanMenuOpen: "<span /><span /><span />", // 通常ボタン
      //       meanRevealPosition: "right", // 表示位置
      //       meanRevealColour: "", // 背景色
      //       meanScreenWidth: "480", // 表示させるウィンドウサイズ(ブレイクポイント)
      //   });

    // Smooth Scrolling
    //==========================================
    $(function() {
      $('a.page-scroll').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top
            }, 1000);
            return false;
          }
        }
      });
    });
    // About Slider / Tabs
    //==========================================
    $('#about-slider').carousel({
      interval: false
    });

    // Menu Active Scrolling Scrollspy
    //==========================================
    $('body').scrollspy({ target: '.navmenu' });

    // Active Tabs for About Section
    //==========================================
    $(".tab").click(function(){
      // If this isn't already active
      if (!$(this).hasClass("active")) {
        // Remove the class from anything that is active
        $(".tab.active").removeClass("active");
        // And make this active
        $(this).addClass("active");
      }
    });

    // Active Quote Control 
    //==========================================
    $("ul.qcontrols li").click(function(){
      // If this isn't already active
      if (!$(this).hasClass("active")) {
        // Remove the class from anything that is active
        $("ul.qcontrols li.active").removeClass("active");
        // And make this active
        $(this).addClass("active");
      }
    });

    // Portfolio Album LightBox Pop
    //==========================================
    $(document).ready(function(){
      $('.hover-bg a').nivoLightbox({
        effect: 'fade',                              // The effect to use when showing the lightbox
        theme: 'default'
      });
    });

    // $(document).ready(function() {
    //   $("nav").naver({
    //     labels: {
    //       closed: "めにゅーだよ",
    //       open: "閉じるよ"
    //     },
    //     maxWidth: "980px"
    //   });
    // });

}());


}
main();

