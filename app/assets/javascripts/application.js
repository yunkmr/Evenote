// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// サイドメニューを開いた時の動作
$(document).on('turbolinks:load', function() {
  $(".l-app_navigation").click(function () {//ボタンがクリックされたら
    $(this).toggleClass('active');//ボタン自身に activeクラスを付与し
      $(".l-app_navigation").toggleClass('menu-active-complete');//ナビゲーションにmenu-active-completeクラスを付与
      $(".l-menu-title").toggleClass('menu-active-complete');
      $(".l-menu-contents").toggleClass('menu-active-complete');
      $(".l-app_contents").toggleClass('menu-active-complete');
      $(".l-app_header").toggleClass('menu-active-complete');
  });
});

//アコーディオンをクリックした時の動作
$(document).on('turbolinks:load', function() {
  $('.l-menu-index_page-title').on('click', function() {//タイトル要素をクリックしたら
    // $('.l-menu-index_section-list').slideUp(500);//クラス名.boxがついたすべてのアコーディオンを閉じる

    // var findElm = $(this).next(".l-menu-index_section-list");//タイトル直後のアコーディオンを行うエリアを取得

    // if($(this).hasClass('close')){//タイトル要素にクラス名closeがあれば
    //   $(this).removeClass('close');//クラス名を除去
    // }else{//それ以外は
    //   $('.close').removeClass('close'); //クラス名closeを全て除去した後
    //   $(this).addClass('close');//クリックしたタイトルにクラス名closeを付与し
    //   $(findElm).slideDown(500);//アコーディオンを開く
    // }

    $(this).next().slideToggle(500);
    $('.l-menu-index_page-title').not($(this)).next('.l-menu-index_section-list').slideUp(500);

    $(".l-app_navigation").toggleClass('menu-active-complete');
    $(".l-menu-title").toggleClass('menu-active-complete');
    $(".l-menu-contents").toggleClass('menu-active-complete');
    $(".l-app_contents").toggleClass('menu-active-complete');
    $(".l-app_header").toggleClass('menu-active-complete');

  });
});

// メニューの閉じるボタンを押した時の動作
$(document).on('turbolinks:load', function() {
  $(".l-menu-close").click(function () {
    $('.l-menu-index_section-list').slideUp(500);
  });
});


// 画像登録時にプレビュー表示する
$(function() {
    $('#image').on('change', function() {
        var selectedFile = this.files[0];
        var fileReader = new FileReader();

        fileReader.onload = function(event) {
            var loadedImageUri = event.target.result;
             $('.img-square').attr('src', loadedImageUri);
        };

        fileReader.readAsDataURL(selectedFile);
    });
});