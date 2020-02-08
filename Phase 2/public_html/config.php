<?php

$db_service = "db_service";

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
      default:
         if ($data)
            $url = sprintf("%s?%s", $url, http_build_query($data));
   }

   curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
   // EXECUTE:
   $result = curl_exec($curl);
   curl_close($curl);

   return $result;
}

?>