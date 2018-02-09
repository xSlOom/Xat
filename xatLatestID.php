<?php
/*
 * Get the last ID, k1 and k2 through the auser3.php page.
 * @Author: xSlOom
 */

$auser3 = file_get_contents(
	'https://xat.com/web_gear/chat/auser3.php?Sloom=' . time()
);

if ($auser3 == false) {
	return print 'Failed to get contents, please try again later.';
}

$pageData = explode('&', $auser3);
$xatID = explode('=', $pageData[1])[1];
$xatK1 = explode('=', $pageData[2])[1];
$xatK2 = explode('=', $pageData[3])[1];

print 'The last ID is: ' . $xatID . ' with k1: ' . $xatK1 . ' and K2: ' . $xatK2 . '.';