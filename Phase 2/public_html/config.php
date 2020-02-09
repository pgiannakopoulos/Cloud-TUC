<?php

$db_service = "db_service";
$httpcode = 0;

function callAPI($method, $url, $data){
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
   // curl_setopt($curl, CURLOPT_HEADER, true);    // we want headers
   curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
   // EXECUTE:
   $result = curl_exec($curl);
   $GLOBALS['httpcode'] = curl_getinfo($curl, CURLINFO_HTTP_CODE);
   curl_close($curl);

   return $result;
}

?>