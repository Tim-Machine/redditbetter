<?php namespace Tsmith86\Redditapi;


class RedditUsers extends  Reddit
{
	
	function __construct()
	{

	
	}

	public function showdetails()
	{

		return 'users woot';
	}


	public function userlogin($username , $password )
	{
		$url = $this->apiUrl."/login/$username";

		$postdata = "api_type=json&user=$username&passwd=$password";

		$response = $this->connector->request();
	}
}