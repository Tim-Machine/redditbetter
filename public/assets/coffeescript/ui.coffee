
class ui

	constructor: () ->
		@$navlink = $('#mainContent ul li')
		@$viewArea = $('#viewContentWrapper')
		@$mainArea = $('#mainContent')
		@Transdur = 400
		@largeClass = 'span12'
		@smallClass = 'span6'
		@hidden = 'hidden'

	interface : =>		
		@$navlink.on 'click', =>
			@$mainArea.switchClass(@largeClass,@smallClass,@Transdur)
			@$viewArea.switchClass(@hidden,@smallClass,@Transdur)
			null
		null

ui = new ui;


class listings

	constructor: () ->
		 @listingTemplate = """<li>
			<div class="listing clicked" data-fullname="{{name}}">
				<div class="title">{{title}}<span class="domain">{{domain}}</span></div>
				<div class="details">
				[<span class='upvotes'>{{ups}}</span>|<span class="downvotes">{{downs}}</span>] posted x hrs ago by user
				</div>
	      	</div> 
      	</li>"""

      	@getListings(null, null , null);

	getListings: (sub , limit, after) ->
		url = "/get/subreddit"
		if sub != ""
			url = url+"/"+sub
		if limit != ""
			url = url+"/"+limit
		if after != ""
			url = url+"/"+after

		$.getJSON url, (data)->
			html = Mustache.to_html(@listingTemplate, data)
			$('#mainContent ul').append(html);





ui.interface();