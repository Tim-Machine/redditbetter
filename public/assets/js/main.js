var $listings, listings, modal, ui,
  _this = this;

ui = (function() {

  function ui() {
    var _this = this;
    this.linkclick = function() {
      return ui.prototype.linkclick.apply(_this, arguments);
    };
    this.interfaceClose = function() {
      return ui.prototype.interfaceClose.apply(_this, arguments);
    };
    this.interfaceOpen = function() {
      return ui.prototype.interfaceOpen.apply(_this, arguments);
    };
    this.$navlink = $('#mainContent .listing');
    this.$viewArea = $('#viewContentWrapper');
    this.$mainArea = $('#mainContent');
    this.Transdur = 400;
    this.largeClass = 'span12';
    this.smallClass = 'span6';
    this.hidden = 'hidden';
    this.resizeWindows();
    this.detectResize();
    this.urls = new urls;
  }

  ui.prototype.interfaceOpen = function() {
    this.$mainArea.switchClass(this.largeClass, this.smallClass, this.Transdur);
    this.$viewArea.switchClass(this.hidden, this.smallClass, this.Transdur);
    return null;
  };

  ui.prototype.interfaceClose = function() {
    this.$mainArea.switchClass(this.smallClass, this.largeClass, this.Transdur);
    this.$viewArea.switchClass(this.smallClass, this.hidden, this.Transdur);
    return null;
  };

  ui.prototype.linkclick = function() {
    var selector;
    selector = $('#mainContent a');
    _this = this;
    return selector.on('click', function(e) {
      var domain, link, title, url;
      e.preventDefault();
      if (e.which === 2) {
        return _this.newWindow($(this).attr('href'));
      } else {
        link = $(this).attr('href');
        title = $(this).text();
        domain = $(this).data('domain');
        url = urls(domain, link, title);
        console.log(url);
        return new modal(url[1], url[0]);
      }
    });
  };

  ui.prototype.newWindow = function(link) {
    return window.open(link);
  };

  ui.prototype.resizeWindows = function() {
    var height, resizeheight;
    height = $(window).height();
    resizeheight = height - 120;
    return $("#mainContent , #viewContentWrapper").css('height', resizeheight + "px");
  };

  ui.prototype.detectResize = function() {
    return $(window).resize(this.resizeWindows);
  };

  return ui;

})();

listings = (function() {

  function listings() {
    this.ui = new ui;
    this.listingTemplate = "{{#data}} <li>\n<div class=\"listing {{clicked}}\" data-fullname=\"{{name}}\">\n	<div class=\"articleTitle\"><a href=\"{{url}}\" data-domain=\"{{domain}}\">{{title}}</a> <span class=\"domain\">({{domain}})</span></div>\n	<div class=\"details\">[<span class='upvotes'>{{ups}}</span>|<span class=\"downvotes\">{{downs}}</span>] posted x hrs ago by {{author}}\n	</div>\n</div> \n</li>{{/data}}";
    this.getListings("", "", "");
  }

  listings.prototype.getListings = function(sub, limit, after) {
    var url,
      _this = this;
    url = "/get/subreddit";
    if (sub !== "") {
      url = url + "/" + sub;
    }
    if (limit !== "") {
      url = url + "/" + limit;
    }
    if (after !== "") {
      url = url + "/" + after;
    }
    return $.getJSON(url, function(data) {
      var html;
      html = Mustache.to_html(_this.listingTemplate, data);
      $('#mainContent ul').append(html);
      return _this.ui.linkclick();
    });
  };

  return listings;

})();

$listings = new listings;

modal = (function() {

  function modal(title, data) {
    this.selector = $("#myModal");
    $("#myModal #myModalLabel").html(title);
    $("#myModal #modalBody").html(data);
    this.show();
  }

  modal.prototype.show = function() {
    return this.selector.modal('show');
  };

  return modal;

})();

var externalUrl, imageurl, redditurl, urls, video,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

urls = (function() {

  function urls(domain, link, title) {
    instance;
    var instance;
    switch (domain) {
      case "imgur.com":
        instance = new imageurl(link, title);
        break;
      case "i.imgur.com":
        instance = new imageurl(link, title);
        break;
      case "quickmeme.com":
        instance = new imageurl(link, title);
        break;
      case "qkme.me":
        instance = new imageurl(link, title);
        break;
      case "youtube.com":
        instance = new video(link, title);
        break;
      case "vemo.com":
        instance = new video(link, title);
        break;
      case "self.AskReddit":
        instance = new redditurl(link, title);
        break;
      default:
        instance = new externalUrl(link, title);
    }
    return instance;
  }

  return urls;

})();

redditurl = (function() {

  function redditurl(link) {
    this.link = link;
  }

  return redditurl;

})();

externalUrl = (function() {

  function externalUrl(link, title) {
    this.show = __bind(this.show, this);    this.link = link;
    this.title = title;
  }

  externalUrl.prototype.show = function() {
    return alert(" external link sir " + this.link);
  };

  return externalUrl;

})();

imageurl = (function() {

  function imageurl(link, title) {
    var data;
    this.link = link;
    this.title = title;
    data = [this.buildview(this.link), this.title];
    return data;
  }

  imageurl.prototype.buildview = function(link) {
    return "<img class=\"onlyImg\" src='" + link + "'  > ";
  };

  return imageurl;

})();

video = (function() {

  function video(link) {
    this.link = link;
  }

  return video;

})();