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
//= require cocoon
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require moment
//= require fullcalendar
//= require_tree .

// サイドメニューを開く時の動作
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

// ヘッダーメニューを押した時の動作
$(document).on('turbolinks:load', function() {
  $(".l-menu-open").click(function () {
    $(".l-app_navigation").toggleClass('menu-active-complete');//ナビゲーションにmenu-active-completeクラスを付与
    $(".l-menu-title").toggleClass('menu-active-complete');
    $(".l-menu-contents").toggleClass('menu-active-complete');
    $(".l-app_contents").toggleClass('menu-active-complete');
    $(".l-app_header").toggleClass('menu-active-complete');
  });
});

// 画像登録時にプレビュー表示する
$(document).on('turbolinks:load', function() {
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

// 投稿ページのタブの切り替え
// turbolinksの無効化
$(document).on('turbolinks:load', function() {
  $(function() {
    // .tabがクリックされたときを指定
    $('.tab').click(function(){
      // 今ある.tab-activeを削除
      $('.tab-active').removeClass('tab-active');
      // クリックされた.tabに.tab-activeを追加
      $(this).addClass('tab-active');
      // 今ある.box-showを削除
      $('.box-show').removeClass('box-show');
      // indexに.tabのindex番号を代入
      const index = $(this).index();
      // .tabboxとindexの番号が同じ要素に.box-showを追加
      $('.tabbox').eq(index).addClass('box-show');
    });
  });
});

// 投稿ページのタブの切り替え
// turbolinksの無効化
$(document).on('turbolinks:load', function() {
  $(function() {
    // .tabがクリックされたときを指定
    $('.sub-tab').click(function(){
      // 今ある.tab-activeを削除
      $('.sub-tab-active').removeClass('sub-tab-active');
      // クリックされた.tabに.tab-activeを追加
      $(this).addClass('sub-tab-active');
      // 今ある.box-showを削除
      $('.sub-box-show').removeClass('sub-box-show');
      // indexに.tabのindex番号を代入
      const index = $(this).index();
      // .tabboxとindexの番号が同じ要素に.box-showを追加
      $('.sub-tabbox').eq(index).addClass('sub-box-show');
    });
  });
});

// $(document).on('turbolinks:load', function() {
//   $('.css-control').on('focusin', function() {
//     $(this).parent().find('label').addClass('active');
//   });
// });

// $(document).on('turbolinks:load', function() {
//   $('.css-control').on('focusout', function() {
//     if (!this.value) {
//       $(this).parent().find('label').removeClass('active');
//     }
//   });
// });

// $(document).on('turbolinks:load', function() {
//   $('.js-input').keyup(function() {
//     if( $(this).val() ) {
//       $(this).addClass('not-empty');
//     } else {
//       $(this).removeClass('not-empty');
//     }
//   });
// });
