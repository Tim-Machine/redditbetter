<?php

class HomeController extends BaseController {

	/*
	|--------------------------------------------------------------------------
	| Default Home Controller
	|--------------------------------------------------------------------------
	|
	| You may wish to use controllers instead of, or in addition to, Closure
	| based routes. That's great! Here is an example controller method to
	| get you started. To route to this controller, just add the route:
	|
	|	Route::get('/', 'HomeController@showWelcome');
	|
	*/

	public $reddit; 

	protected $layout = "rbetter.index";

	function __construct()
	{
		$this->reddit = new Reddit;
	}

	public function showWelcome()
	{
		// return View::make('hello');
	}


	public function subreddit($subreddit = "", $limit = 20, $after = null)
	{

		$response = $this->reddit->getsubreddit($subreddit, $limit, $after);
		$responseData = json_decode($response);

		$data = array(); 
		$i = 0; 

		foreach($responseData->data->children as $listing)
		{
			$data[$i] = $listing->data; 
			$i++;
		}

		echo "<pre>";
		print_r($data);
		echo '</pre>';

	}

}