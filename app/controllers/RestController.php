<?php 

class RestController extends Controller {


	private $reddit ;

	function __construct()
	{
		$this->reddit = new Reddit;
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

		return json_encode(array('data'=>$data));
	}

}