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
