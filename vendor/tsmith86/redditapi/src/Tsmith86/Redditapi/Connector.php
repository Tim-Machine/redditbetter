<?php namespace Tsmith86\Redditapi;


class Connector extends Reddit
{
	
	function __construct()
	{
	
	}

	public function request($url)
	{
		return  file_get_contents($url);
	}

	public function send()
	{

	}


	public function runCurl($url , $postVals = null)
	{

		$session = $this->getSession();

		$ch = curl_init($url);

		curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		curl_setopt($CH, CURLOPT_COOKIE, "reddit_session=$session");
	}

}