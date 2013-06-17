class  urls 
	constructor: (domain, link, title)->
		instance ; 
		switch domain 
			when "imgur.com" then  instance = new imageurl(link,title)
			when "i.imgur.com" then  instance = new imageurl(link, title)
			when "quickmeme.com" then  instance = new imageurl(link,title);
			when "qkme.me" then  instance = new imageurl(link,title);
			when "youtube.com" then instance = new video(link, title, 'yt')
			when "vimeo.com" then instance = new video(link, title, "vi") 
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
		return data = [@buildview(), @title] 
	buildview :() =>  
		" <iframe src=\"#{@link}\" seamless></iframe>"

class imageurl  
	constructor : (link,title) -> 
		@link = link
		@title = title 
		data = [@buildview(@link), @title]
		return data  
	buildview :(link) ->
		"<img class=\"onlyImg\" src='#{link}'  > "

class video 
	constructor : (link, title , provider) -> 
		@link = link
		@width = $("#modalBody").width()
		@height = @calHeight(@width)
		@provider = provider
		return data = [@buildview(), @title]
	
	calHeight : () -> 
		@height * 9/16

	buildview : () ->
		data = ""
		switch @provider
			when 'vi' then data = "''
			<iframe 
			src=\"http://player.vimeo.com/video/#{@getId()}\" 
			width=\"#{@width}\" 
			height=\"#{@height}\" 
			frameborder=\"0\" 
			webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>''"
		return data

	getId : () ->
		arr = @link.split("/")
		return arr[arr.length - 1]

