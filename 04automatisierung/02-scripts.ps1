param (
  $param1
)
$date = (get-date).dayofyear
get-service | out-file "$date.log"
$param1