// Update to Waisky2’s addon-all-fixed-auto-install-v2
// V3.0 - Initial
// V3.2 - Removed temperatures that did not work right,
//        added trip fuel economy which is based on cmu trip which does not correspond to speedometer trip <yet>,
//        changed so all data is rounded which fixed smdb-read speed mismatch to cruse control
//        enlarged direction text,
//        cleaned up code
// V3.21 - Changed metric display to L per 100km
// V3.3 - Changes done by diginix:
//        added unit under speedometer for mph or km/h
//        replace dot with comma for L per 100km
//        optimized speed indicator angles in css
//        new graphics for rings, needle pointer, dial image with different layout for steps 5,10,20
//        html and css cleanup
//        some more layout tuning (e.g. text shadow)
// V3.4   rotating compass added
// V3.5   Heading deleted, Latitude & Longitude added

//
// isEnglish is used for metric/US english conversion flag (C/F, KPH/MPH, Meter/Feet, L per 100km/MPG)
// Default is "US English" units
// Set isEnglish = true for F/MPH/Feet/MPG
// Set isEnglish = false for C/KPH/Meter/L per 100km
var isEnglish = false;
//

// try not to make changes to the lines below

var speedCurrent = 0;
var speedSumTotal = 0;
var speedTop = 0;
var speedAvg = 0;
var speedValue = 0;
var lastSpeed = 0;
var lastGPSspeedValue = 0;
var lastGPSaltValue = 0;
var lastGPSlatValue = 0;
var lastGPSlonValue = 0;
var lastGPSheadingValue = 999;
var lastDrv1AvlFuelE = 0;
var speedometerFlotData = [];
var speedometerFlotPlot = '';
var totalTripSeconds = 0;
var totalIdleSeconds = 0;
var totalMoveSeconds = 0;
var direction = "---";

$(document).ready(function(){
	$("#myMainBtnDiv").append('<img src="addon-speedometer/speedometerBtn.png" id="speedometerBtnDiv">');

	if(isEnglish){
		$('#speedBarKphContainer').css({'display' : 'none'});
		$('#speedUnit').text("mph");
	} else {
		$('#speedBarMphContainer').css({'display' : 'none'});
		$('#speedUnit').text("km/h");
	}

	$('#speedometerBtnDiv').click(function(){
		$('#speedometerContainer').fadeIn();
	});
	$('#speedometerContainer').click(function(){
		$('#speedometerContainer').fadeOut();
	});

	function updateSpeedIndicator(speed){
		$('#speedCurrentIndicator').removeClass("speed"+lastSpeed).addClass("speed"+speed);
		lastSpeed = speed;
	}

	function updateSpeedAvg(speed){
		totalMoveSeconds++;
		speedSumTotal += speed;
		var avgSpeed = Math.round(speedSumTotal / totalMoveSeconds);
		if(speedAvg != avgSpeed){
			$('#speedAvgValue').html(avgSpeed);
		}
	}
	function updateSpeedTop(speed){
		if(speed > speedTop){
			speedTop = speed;
			$('#speedTopValue').html(speedTop);
		}
	}
	function updateTripTime(){
		totalTripSeconds++;
		var hours   = Math.floor(totalTripSeconds / 3600);
		var minutes = Math.floor((totalTripSeconds - (hours * 3600)) / 60);
		var seconds = totalTripSeconds - (hours * 3600) - (minutes * 60);

		if (hours > 0 && minutes < 10) {minutes = "0"+minutes;}
		if (seconds < 10) {seconds = "0"+seconds;}
		if(hours > 0){
			$('#tripTimeValue').text(hours+':'+minutes+':'+seconds);
		} else {
			$('#tripTimeValue').text(minutes+':'+seconds);
		}
	}
	function updateIdleTime(){
		if(speedCurrent == 0){
			totalIdleSeconds++;
			var hours   = Math.floor(totalIdleSeconds / 3600);
			var minutes = Math.floor((totalIdleSeconds - (hours * 3600)) / 60);
			var seconds = totalIdleSeconds - (hours * 3600) - (minutes * 60);

			if (hours > 0 && minutes < 10) {minutes = "0"+minutes;}
			if (seconds < 10) {seconds = "0"+seconds;}
			if(hours > 0){
				$('#idleTimeValue').text(hours+':'+minutes+':'+seconds);
			} else {
				$('#idleTimeValue').text(minutes+':'+seconds);
			}
		}
	}
	function updateSpeedAll(){
		$.get('/tmp/root/speedCurrent', function (data) {
			data = $.trim(data);
// Revised for using speed from smdb-read as it is in 0.01 KPH increments
			if ($.isNumeric(data)) {
				data = data * 0.01;
				// Cutoff under 1KPH
				if (data < 1.0) {
					data = 0;
				}
			}
			if ($.isNumeric(data) && isEnglish) {
				data = data * 0.6213712;
			}
			if ($.isNumeric(data) && data != speedValue) {
				speedValue = data;
				var speedTemp = Math.round(data);
				if(speedTemp > 0){
					updateSpeedTop(speedTemp);
					updateSpeedAvg(speedTemp);
				}
				$('#speedCurrent').each(function () {
					var $this = $(this);
					$({Counter: $this.text()}).animate({Counter: speedValue}, {
						duration: 950,
						easing: 'linear',
						step: function (now) {
							$this.text(Math.round(now));
							speedCurrent = $this.text();
							updateSpeedIndicator(speedCurrent);
						},
						complete: function () {
						}
					});
				});
			}
		});
	}
	function updateSpeedGPS(){
		$.get('/tmp/root/GPSvelocity', function (data) {
			data = $.trim(data);
			if ($.isNumeric(data)) {
				// Cutoff under 1.0
				if (data < 1.0) {
					data = 0;
				}
			}
			if ($.isNumeric(data) && isEnglish) {
				data = data * 0.6213712;
			}
			if ($.isNumeric(data) && data != lastGPSspeedValue) {
				lastGPSspeedValue = data;
				$('#gpsSpeedValue').each(function () {
					var $this = $(this);
					$({Counter: $this.text()}).animate({Counter: lastGPSspeedValue}, {
						duration: 950,
						easing: 'linear',
						step: function (now) {
							$this.text(Math.round(now));
							gpsSpeedValue = $this.text();
						},
						complete: function () {
						}
					});
				});
			}
		});
	}
	function updateAltGPS(){
		$.get('/tmp/root/GPSaltitude', function (data) {
			data = $.trim(data);
			if ($.isNumeric(data) && isEnglish) {
				data = data * 3.28084;
			}
			if ($.isNumeric(data) && data != lastGPSaltValue) {
				lastGPSaltValue = data;
				$('#gpsAltitudeValue').text(Math.round(data));
			}
		});
	}
	function updateHeadingGPS(){
		$.get('/tmp/root/GPSheading', function (data) {
			data = $.trim(data);
			// if ($.isNumeric(data) && data != lastGPSheadingValue && speedCurrent > 1) {
			if ($.isNumeric(data) && data != lastGPSheadingValue) {
				if (Math.abs(lastGPSheadingValue-data) >= 1) {
					$('#gpsCompassBG').css("transform","rotate("+(-Math.abs(Math.round(data))+180)+"deg)");
				}
				lastGPSheadingValue = data;
				// Mazda Infotainment System GPS heading is S = 0/360 degrees even though docs say otherwise, YMMV
				headingSwitchValue = Math.round(lastGPSheadingValue / 22.5);
				// Close enough
				switch(headingSwitchValue) {
					case 1:
						direction = "SSW";
						break;
					case 2:
						direction = "SW";
						break;
					case 3:
						direction = "WSW";
						break;
					case 4:
						direction = "W";
						break;
					case 5:
						direction = "WNW";
						break;
					case 6:
						direction = "NW";
						break;
					case 7:
						direction = "NNW";
						break;
					case 8:
						direction = "N";
						break;
					case 9:
						direction = "NNE";
						break;
					case 10:
						direction = "NE";
						break;
					case 11:
						direction = "ENE";
						break;
					case 12:
						direction = "E";
						break;
					case 13:
						direction = "ESE";
						break;
					case 14:
						direction = "SE";
						break;
					case 15:
						direction = "SSE";
						break;
					default:
						direction = "S";
				}
				$('#gpsHeadingValue').text(direction);
			}
		});
	}
	function updateDrv1AvlFuelE(){
		$.get('/tmp/root/Drv1AvlFuelE', function (data) {
			data = $.trim(data);
			// CMU reading is tenths of a kilometer per liter
			if ($.isNumeric(data)) {
				if (isEnglish) {
					// 1 km/L = 2.3521458 US MPG (leave value x10 for now)
					data = Math.round(data * 2.3521458);
				} else {
					// Metric readout is L/100km, leave x10 for now
					data = Math.round(10000 / data);
				}
			}
			if ($.isNumeric(data) && data != lastDrv1AvlFuelE) {
				lastDrv1AvlFuelE = data;
				// move decimal place
				$('#Drv1AvlFuelEValue').text(data/10);
			}
		});
	}
	function updateLatGPS(){
		$.get('/tmp/root/GPSlatitude', function (data) {
			data = $.trim(data);
			if ($.isNumeric(data) && data != lastGPSlatValue) {
				lastGPSlatValue = data;
				if (data > 0) {
					$('#gpsLatitudeValue').html(data+"° N");
				} else {
					$('#gpsLatitudeValue').html(Math.abs(data)+"&deg; S");
				}
			}
		});
	}
	function updateLonGPS(){
		$.get('/tmp/root/GPSlongitude', function (data) {
			data = $.trim(data);
			if ($.isNumeric(data) && data != lastGPSlonValue) {
				lastGPSlonValue = data;
				if (data > 0) {
					$('#gpsLongitudeValue').html(data+"&deg; O");
				} else {
					$('#gpsLongitudeValue').html(Math.abs(data)+"&deg; W");
				}
			}
		});
	}
	function initSpeedometerFlot(){
		var _maxSpeed = 200;
		var _tickSize = 20;
		if(isEnglish){
			_maxSpeed = 140;
			_tickSize = 12;
		}
		speedometerFlotPlot = $.plot("#speedometerFlotPlotDiv", [ getSpeedometerFlotData(0) ], {
			series: {
				shadowSize: 0
			},
			yaxis: {
				min: 0,
				max: _maxSpeed,
				tickSize: _tickSize,
				tickColor: "#666666"
			},
			xaxis: {
				show: false
			},
			lines: { fill: true }
		});
	}

	setInterval(function () {
		updateSpeedAll();
		updateSpeedGPS();
		updateAltGPS();
		// updateHeadingGPS();
		updateDrv1AvlFuelE();
		updateTripTime();
		updateIdleTime();
		updateLatGPS();
		updateLonGPS();
	}, 1000);

	setInterval(function () {
		updateHeadingGPS();
	}, 500);

	// this must only be run after plot render properly
	$('#speedometerContainer').css({'display' : 'none'});
});