// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// Loads all Bootstrap javascripts
//= require bootstrap

function displayBookInfo(identifier) {
  book = {id: identifier};
  $('.book_information').load('/books/mini_info/' + identifier, book);
  $('.book_information').css('visibility', 'visible');
  // $('.book_information').append('<p>Test_' + identifier + '</p>');
}

function hideBookInfo() {
  $('.book_information').css('visibility', 'hidden');
}

$(document).ready(function() {
  $('.index.books img').tooltip();

  $('.book_information').css('visibility', 'hidden');

  // $('.index.books img').hover(
  //   function() {
  //     displayBookInfo($(this).attr('name'));
  //   },
  //   hideBookInfo);

  $('.index.books img').click(function() {
    $(location).attr('href', 'books/' + $(this).attr('name'));
    // $('.container').load('books/' + $(this).attr('name'));
  });

  // $('.index.books img').dblclick(function() {
  //   $(location).attr('href', 'books/' + $(this).attr('name') + '/edit');
  // });

});