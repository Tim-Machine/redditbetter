class  urls 
	constructor: (domain, link, title)->
		instance ; 
		switch domain 
			when "imgur.com" then  instance = new imageurl(link,title)
			when "i.imgur.com" then  instance = new imageurl(link, title)
			when "quickmeme.com" then  instance = new imageurl(link,title);
			when "qkme.me" then  instance = new imageurl(link,title);
			when "youtube.com" then instance = new video(link, title)
			when "vemo.com" then instance = new video(link, title) 
			when "self.AskReddit" then  instance = new redditurl(link, title);
			else instance = new  externalUrl(link, title)
		return instance 

class redditurl
	constructor: (link) ->
		@link = link 
class externalUrl
	constructor : (link, title) ->
		@link = link 
		@title = title
	show :() =>
		alert " external link sir " + @link

class imageurl
	constructor : (link,title) -> 
		@link = link
		@title = title 
		data = [@buildview(@link), @title]
		return data  
	buildview :(link) ->
		"<img class=\"onlyImg\" src='#{link}'  > "

class video 
	constructor : (link) -> 
		@link = link

