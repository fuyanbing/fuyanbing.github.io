(function (W) {
    var 
    map = null,
	search_key,
	gLocalSearch,
	geo_log = W.getElementById("geo-log"), // 提示信息div
	geo_map = W.getElementById("geo-map"), // 地图div
	geo_button = W.getElementById('see-position')
    ;

    function addEvent(evnt, elem, func) {
        if (elem.addEventListener)
            elem.addEventListener(evnt, func, false);
        else if (elem.attachEvent)
            elem.attachEvent("on" + evnt, func);
        else
            elem[evnt] = func;
    };

    function insertAfter(newEl, targetEl) {
        var parentEl = targetEl.parentNode;

        if (parentEl.lastChild == targetEl)
            parentEl.appendChild(newEl);
        else
            parentEl.insertBefore(newEl, targetEl.nextSibling);
    };

    var geo = {
        //业务初始化
        init: function () {
            addEvent('click', geo_button, this.successPositionHandler);
            addEvent('click', geo_map, this.successPositionHandler);

            gLocalSearch = new GlocalSearch();
            gLocalSearch.setSearchCompleteCallback(null, this.showPosition);
            this.ui();
        },
        ui: function () {
            geo_button.innerText = '定位当前位置';
            search_key = document.createElement('input');
            insertAfter(search_key, geo_button);
        },
        successPositionHandler: function () {
            // 当用户点击时，如果地图不存在，则载入地图（默认中国地图）。
            var self = geo;
            if (!map) {
                map = new google.maps.Map(geo_map, {
                    zoom: 3,
                    center: new google.maps.LatLng(35.86166, 104.195397), // 中国
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });
                map.getDiv().style.border = '1px solid #ccc';
            };
            geo_log.style.visibility = 'visible';
            geo_log.innerText = '查找当前位置';
            gLocalSearch.execute(search_key.value);
        },
        //显示当前位置
        showPosition: function () {
            var first = gLocalSearch.results[0];

            geo_log.innerText = "你现在的位置在经纬度（" + first.lat + ", " +
			first.lng + "）" + first.accuracy + "米的范围内";

            //在google地图上显示位置
            var latLng = new google.maps.LatLng(first.lat, first.lng);
            var marker = new google.maps.Marker({ position: latLng, map: map });
            map.setCenter(latLng);
            map.setZoom(15);
        }
    };
    geo.init();
})(document);