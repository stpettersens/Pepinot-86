  window.fbAsyncInit = function() {
    FB.init({
      appId      : '214282278637686', // App ID
      channelUrl : '//stpettersens.github.com/Pepinot-86/__channel__.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Any additional initialization code here...
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_GB/all.js";
     d.getElementsByTagName('head')[0].appendChild(js);
   }(document))
