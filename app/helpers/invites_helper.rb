module InvitesHelper

  def site_name
    "Viral Landing Page"
  end

  def site_title
    "Viral Landing Page :: Create one today!"
  end

  def twitter_id
    # Twitter account name, without the @
    "alanpca"
  end

  def fb_share(user_info)
    '<fb:like href="' +  user_info['url'] + '" layout="box_count" show_faces="false" width="65" font=""></fb:like>'
  end

  def fb_js
    'var script = document.createElement("script");' +
    'script.type = "text/javascript";' +
    'script.src = "http://connect.facebook.net/en_US/all.js#xfbml=1";' +
    'document.getElementsByTagName("head")[0].appendChild(script);' +
    'FB.XFBML.parse();'
  end

  def twitter_share(user_info)
    '<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>' +
    '<a href="http://twitter.com/share" class="twitter-share-button" data-count="vertical" ' +
    'data-via="' + twitter_id + '" data-url="' + user_info['url'] + '">Tweet</a>'
  end
end
