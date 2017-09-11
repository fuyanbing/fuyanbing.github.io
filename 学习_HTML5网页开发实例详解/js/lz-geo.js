(function (W) {
    var 
    map = null,
	geo_log = W.querySelector("#geo-log"), // 提示信息div
	geo_map = W.querySelector("#geo-map"), // 地图div
	geo_button = W.querySelector('#see-position'),
    geo = {
        //业务初始化
        init: function () {
            geo_button.addEventListener('click', this.successPositionHandler, false);
            geo_map.addEventListener('click', this.successPositionHandler, false);
        },
        successPositionHandler: function () {
            // 当用户点击时，如果地图不存在，则载入地图（默认中国地图）。
            var self = geo;
            if (!map) {
                map = new google.maps.Map(geo_map, {
                    zoom: 3,
                    center: new google.maps.LatLng(35.86166, 104.195397),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });
                map.getDiv().style.border = '1px solid #ccc';
            }

            geo_log.style.visibility = 'visible';
            geo_log.textContent = '查找当前位置';
            navigator.geolocation.getCurrentPosition(self.showPosition, self.handlePositionError);

        },
        //显示当前位置
        showPosition: function (position) {
            geo_log.textContent = "你现在的位置在经纬度（" + position.coords.latitude + ", " +
			position.coords.longitude + "）" + position.coords.accuracy + "米的范围内";

            //在google地图上显示位置
            var latLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            var marker = new google.maps.Marker({ position: latLng, map: map });
            map.setCenter(latLng);
            map.setZoom(15);
        },
        //当前位置信息获取错误，打印出错误信息
        handlePositionError: function (error) {
            geo_log.textContent = error.message;
        }
    }
    ;
    geo.init();
})(document);