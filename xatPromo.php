<?php
/*
 * Get all the promoted chats depending on the language.
 * @Author: xSlOom
 */

$lang = 'pt'; // can be fr, es, pt, etc...

$xatPromo = json_decode(
	file_get_contents(
		'https://xat.com/json/promo.php?Sloom=' . time()
	), true
);

if (!isset($xatPromo[$lang]) || sizeof($xatPromo[$lang]) == 0) {
	return print 'There is no promoted chats for this language.';
}

$chatsList = '[' . sizeof($xatPromo[$lang]) . '] promoted chats: ';

foreach ($xatPromo[$lang] as $key => $value) {
	$promotedTime = '';

	if (!isset($value['t'])) {
		$promotedTime = 'AutoPromoted';
	} else {
		if ($value['t'] < time()) {
			$promotedTime = 'Over';
		} else {
			$time = $value['t'] - time();
			$promotedTime = $time . ' seconds left';
		}
	}

	$chatsList .= $value['n'] . '[' . $promotedTime . '], ';
}

print substr($chatsList, 0, -2) . '.';