// ============= AJAX FOR GET REQUESTS =================

$(function(){
  var pathName = window.location.pathname;

  $('#create-memorial').one('click', function(event){
    event.preventDefault();
    $.get('/admin/memorials/new', function(data){
       //create jquery object from the response html
       var $response=$(data);
       //query the jq object for the values
       var form = $response.find('.new-memorial-form');
      $('.center-links').append(form);
    });
  });

  $('#new-memorial-post').one('click', function(event){
    event.preventDefault();
    var postUrl = pathName + '/posts/new';
    $.get(postUrl, function(data){
      var $response=$(data);
      var form = $response.find('.new-post-form');
      $('.memorial-posts').prepend(form);
    });
  });

  $('#new-memorial-comment').one('click', function(event){
    event.preventDefault();
    var postUrl = $(this).attr('href');
    console.log(postUrl);
    $.get(postUrl, function(data){
        console.log(data);
       var $response=$(data);
       var form = $response.find('.new-comment');
      $('.memorial-post').prepend(form);
    });
  });



  // $('#new-memorial-comment').on('click', function(event){
  //   event.preventDefault();
  //   // var postUrl = $(this).attr('href');
  //   // console.log(postUrl);
  //   $.get('memorials/1/posts/1/comments/new', function(data){
  //       console.log(data);
  //      var $response=$(data);
  //      var form = $response.find('.new-photo-comment');
  //     $('.comment').prepend(form);
  //   });
  // });


// ============= AJAX FOR POST REQUESTS =================


  // $(".new-post-form").on("submit", function(event){
  //   event.preventDefault();
  //   var postUrl = pathName + '/posts/';
  //   $.post(postUrl, function(data){
  //     var $response=$(data);
  //     var form = $response.find('.new-memorial-post');
  //     $('.new-memorial-post').append(form);
  //       console.log(response);
  //   });
  // });

// ============= AJAX FOR DROP DOWN MENUS =================


  $('.created-right-links').one('click', function(event){
    event.preventDefault();
    $.ajax({
      type: 'GET',
      url: '/memorials/created',
      dataType: 'JSON',
      success: function(createdMemorials) {
        var list = [];
        for (var memorial in createdMemorials) {
          if(createdMemorials.hasOwnProperty(memorial)){
            var obj = createdMemorials[memorial];
            var url = "/memorials/" + obj["id"];
            var name = obj["deceased_name"];
            var render = "<li><a href='" + url + "'>" + name + "</a></li>";
            list.push(render); 
          }
        }
        for (var i=0; i < list.length; i++) {
          console.log(list[i])
          $('.created-right-links').append(list[i]);
          $("#created-memorials").attr("disabled", "disabled");
        }
        
      }
    });
  });




  $('.attended-right-links').one('click', function(event){
    event.preventDefault();
    $.ajax({
      type: 'GET',
      url: '/memorials/attended',
      dataType: 'JSON',
      success: function(attendedMemorials) {
        var list = [];
        for (var memorial in attendedMemorials) {
          if(attendedMemorials.hasOwnProperty(memorial)){
            var obj = attendedMemorials[memorial];
            var url = "/memorials/" + obj["id"];
            var name = obj["deceased_name"];
            var render = "<li><a href='" + url + "'>" + name + "</a></li>";
            list.push(render);
          }
        }
        for (var i=0; i < list.length; i++) {
          $('.attended-right-links').append(list[i]);
          $("#attended-memorials").attr("disabled", "disabled");
        }
        
      }
    });
  });
});
// ============= AJAX FOR MODERATION =================


  // $('#flagged-post').on('click', function(event){
  //   event.preventDefault();
  //   $.ajax({
  //     type: 'GET',
  //     url: '/admin' + pathName + '/spam',
  //     dataType: 'JSON',
  //     success: function(flaggedPosts){
  //       console.log(flaggedPosts);
  //       if(flaggedPosts === "no_posts"){
  //         alert("No Flagged Posts");
  //       }
  //       else{
  //         alert("Some posts have been flagged");
  //       }
  //       $("#flagged-post").attr("disabled", "disabled");
  //     }
  //   });
  // });

// ================== LOADING PAGE =====================
$( document ).ready(function() {
  $(".new_photo").on('submit', function(event) {
      $("body :not(#loading)").css("opacity", "0.6");
      $('#loading').css("opacity", "1");
      $('#loading').css("visibility", "visible");
  });
});

// });