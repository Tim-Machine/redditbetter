
class ui

	constructor: () ->
		@$navlink = $('#mainContent .listing')
		@$viewArea = $('#viewContentWrapper')
		@$mainArea = $('#mainContent')
		@Transdur = 400
		@largeClass = 'span12'
		@smallClass = 'span6'
		@hidden = 'hidden'
		@resizeWindows();
		@detectResize();
		@urls = new urls;

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
				link = $(this).attr('href')
				title = $(this).val()
				domain = $(this).data('domain')
				url = urls(domain, link, title )
				console.log url['title']+"title"
				new modal(url["title"], url.data)
				#_this.interfaceOpen();

	newWindow : (link) ->
		window.open(link)

	resizeWindows : () ->
		height = $(window).height();
		resizeheight = height - 120;
		$("#mainContent , #viewContentWrapper").css('height', resizeheight+"px")
	detectResize : ()->
		$(window).resize(@resizeWindows);


class listings
	constructor: () ->
		@ui = new ui
		@listingTemplate = """{{#data}} <li>
			<div class="listing {{clicked}}" data-fullname="{{name}}">
				<div class="articleTitle"><a href="{{url}}" data-domain="{{domain}}">{{title}}</a> <span class="domain">({{domain}})</span></div>
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


class modal 
	constructor: (title, data) ->
		console.log "tests"
		console.log title
		@selector = $("#modal");
		@selector.find(' #ModalLabel').html(title)
		@selector.find('#modalBody').html(data)
		@show()
	show: () ->
		console.log "fire"
		console.log @selector.modal('show')