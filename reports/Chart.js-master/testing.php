<!doctype html>
<html>
	<head>
		<title>Pie Chart</title>
		<script src="./Chart.js"></script>
	</head>
	<body>
		<div id="canvas-holder">
			<canvas id="chart-area" width="300" height="300"/>
		</div>

	<?php
		for($i = 0; $i < 5; $i++) {
			$random_var[] = array(rand(50,100),$i);
		}
		
		var_dump($random_var);
	
	?>
	<script>

		var pieData = [
				{
					value: 300,
					color:"#F7464A",
					label: "Red"
				},
				{
					value: 50,
					color: "#46BFBD",
					label: "Green"
				},
				{
					value: 100,
					color: "#FDB45C",
					label: "Yellow"
				},
				{
					value: 40,
					color: "#949FB1",
					label: "Grey"
				},
				{
					value: 120,
					color: "#4D5360",
					label: "Dark Grey"
				}

			];

			window.onload = function(){
				var ctx = document.getElementById("chart-area").getContext("2d");
				window.myPie = new Chart(ctx).Pie(pieData);
			};



	</script>
	</body>
</html>
