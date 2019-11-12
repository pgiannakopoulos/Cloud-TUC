<div id="footer">
	<div class="footer_text">
	Designed by <a href="mailto:pgiannakopoulos397@gmail.com" target="_blank">Panagiotis Giannakopoulos</a> &copy; 
	<?php 
		$copyYear = 2019; 
		$curYear = date('Y'); 
		echo $copyYear . (($copyYear != $curYear) ? '-' . $curYear : '');
	?>
	</div>
</div>