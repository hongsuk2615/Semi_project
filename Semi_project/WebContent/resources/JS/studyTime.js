
function get_cookie(key) {
	let cookie_list = document.cookie.split("; ");
	console.log(cookie_list);
	for (i of cookie_list) {
		console.log("i:" + i);
		if (i.split("=")[0] == key) {
			return (i.split("=")[1]);
		}

	}
	return "";
}



if (get_cookie('targetTime') != '' && get_cookie('time') != '') {
	if (get_cookie('isPause') == 'N') {
		timer = setInterval(function() {
			document.cookie = 'time=' + (get_cookie('time') * 1 + 1);
			if (get_cookie('targetTime') == get_cookie('time')) {
				insertStudy();
			}
		}, 1000);
	}
}




function insertStudy() {
	console.log('ajax');
	$.ajax({
		url: '/Semi_project/studyInsert.bo',
		data: {
			"time": get_cookie('time'),
			"targetTime": get_cookie('targetTime')
		},
		success: function(result) {
			if (result) {
				document.cookie = 'time=';
				document.cookie = 'targetTime=';
				document.cookie = 'isPause=Y';
				clearInterval(timer);
			}
		},
		error: function() {

		}

	});
}

