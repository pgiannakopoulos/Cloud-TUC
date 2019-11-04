<div class="footer">
	Designed by <a href="mailto:pgiannakopoulos397@gmail.com">Panagiotis Giannakopoulos</a> &copy; 
	<?php 
		$copyYear = 2019;
		date_default_timezone_set('UTC'); 
		$curYear = date('Y'); 
		echo $copyYear . (($copyYear != $curYear) ? '-' . $curYear : '');
	?>
</strong>.
</div>