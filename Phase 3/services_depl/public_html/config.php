<?php
/* Set REST API variables */
$db_service = "db_service";

/*Oauth2 credentials*/
$auth_service = "http://172.18.1.5:3000";
$auth_basic = "ODVmMDdjMDYtZDhiMy00ZjcyLTgzZWUtNjBiMWRiOGYwZThjOmViMWRhNzA1LTdiNWMtNGFkYi04MjBhLWIxZjk1MjYwNDJjNg=="; //echo -n id:secret | base64

$httpcode = 0;

/*Set timezone */
date_default_timezone_set("Europe/Athens");

function callAPI($method, $url, $data, $header){
   $curl = curl_init($url);
   switch ($method){
      case "POST":
         curl_setopt($curl, CURLOPT_POST, 1);
         if ($data)
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
         break;
      case "PUT":
         curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
         if ($data)
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);		
         break;
      case "DELETE":
         curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "DELETE");
         break;
      default:
         if ($data)
            $url = sprintf("%s?%s", $url, http_build_query($data));
   }
   curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
   curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
   
   if($header){
      curl_setopt($curl,CURLOPT_HTTPHEADER,$header);
   }
   // EXECUTE:
   $result = curl_exec($curl);
   $GLOBALS['httpcode'] = curl_getinfo($curl, CURLINFO_HTTP_CODE);
   
   curl_close($curl);

   return $result;
}

?>