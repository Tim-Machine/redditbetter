
class ui

	constructor: () ->
		@$navlink = $('#mainContent .listing')
		@$viewArea = $('#viewContentWrapper')
		@$mainArea = $('#mainContent')
		@Transdur = 400
		@largeClass = 'span12'
		@smallClass = 'span6'
		@hidden = 'hidden'

	interfaceOpen : ()=>	
		@$mainArea.switchClass(@largeClass,@smallClass,@Transdur)
		@$viewArea.switchClass(@hidden,@smallClass,@Transdur)
		null

	interfaceClose: ()=>
		@$mainArea.switchClass(@smallClass,@largeClass,@Transdur)
		@$viewArea.switchClass(@smallClass,@hidden,@Transdur)
		null

	linkclick : () =>
		selector = $('#mainContent a')
		_this = @
		selector.on 'click', (e)->
			e.preventDefault();
			if e.which == 2
				_this.newWindow($(this).attr('href'))
			else
				alert " normal load"
				_this.interfaceOpen();

	newWindow : (link) ->
		window.open(link)



class listings
	constructor: () ->
		@ui = new ui
		@listingTemplate = """{{#data}} <li>
			<div class="listing {{clicked}}" data-fullname="{{name}}">
				<div class="articleTitle"><a href="{{url}}">{{title}}</a> <span class="domain">({{domain}})</span></div>
				<div class="details">[<span class='upvotes'>{{ups}}</span>|<span class="downvotes">{{downs}}</span>] posted x hrs ago by {{author}}
				</div>
			</div> 
			</li>{{/data}}""" 
		@getListings( "" , "" , "")


	getListings: (sub , limit, after) ->

		url = "/get/subreddit"
		if sub != ""
			url = url+"/"+sub
		if limit != ""
			url = url+"/"+limit
		if after != ""
			url = url+"/"+after

		$.getJSON url, (data) =>
			html = Mustache.to_html(@listingTemplate, data)
			$('#mainContent ul').append(html);
			@ui.linkclick()

$listings = new listings; 
