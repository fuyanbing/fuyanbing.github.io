/*
localStorage
IE 8+
Firefox 3.5+
Safari 4+
Chrome 4+
Opera 10.5+
iPhone 2+
Android 2+

sessionStorage
IE 8+
Firefox 2+
Safari 4+
Chrome
Opera 10.5+
iPhone 2+
Android 2+

globalStorage
Firefox 2+
Firefox 2.x 
Firefox 3.0.x

Database Storage
Safari 3.1 
Safari 3.2

userData
IE 5 - 7

https://github.com/rgrove/storage-lite
http://amplifyjs.com/api/store/

author yao.zhou@dianping.com 

*/
(function (WIN) {
    var NOOP = function () { },

    DOC = document,

    DB_NAME = 'html5_storage',
    DB_DISPLAYNAME = 'html5 storage data',
    DB_MAXSIZE = 1048576,
    DB_VERSION = '1.0',

    USERDATA_PATH = 'html5_storage',
    USERDATA_NAME = 'data',

    MODE_NOOP = 0,
    MODE_HTML5 = 1,
    MODE_GECKO = 2,
    MODE_DB = 3,
    MODE_USERDATA = 4
    ;

    var 
    data = {},
    readys = [],
    storageDriver,
    storageMode
    ;

    function _mix(r, s) {
        var key;

        for (key in s) {
            r[key] = s[key];
        }

        return r;
    };

    try {
        if (WIN.localStorage) {
            storageMode = MODE_HTML5;
        } else if (WIN.globalStorage) {
            // Gecko globalStorage methods. Supported by Firefox 2 and 3.0.
            storageMode = MODE_GECKO;
        } else if (WIN.openDatabase && navigator.userAgent.indexOf('Chrome') === -1) {
            // Database storage methods. Supported by Safari 3.1 and 3.2.
            storageMode = MODE_DB;
        } else if (D.UA.ie >= 5) {
            // userData storage methods. Supported by IE5, 6, and 7.
            storageMode = MODE_USERDATA;
        } else {
            storageMode = MODE_NOOP;
        };
    } catch (ex) {
        storageMode = MODE_NOOP;
    };

    var Storage = {
        /**
        * @public
        * @method clear
        * @description 全部清除
        */
        clear: NOOP,
        /**
        * @public
        * @method length
        * @description 获存储数量
        * @return {Number}
        */
        length: function () { return 0; },
        /**
        * @public
        * @method getItem
        * @param key {string}
        * @param json {bool}
        * @description 获取值
        * @return {Object}
        */
        getItem: NOOP,
        /**
        * @public
        * @method removeItem
        * @param key {string}
        * @description 移除值
        */
        removeItem: NOOP,
        /**
        * @public
        * @method setItem
        * @param key {string}
        * @param value {object}
        * @description 存储值
        */
        setItem: NOOP,
        /**
        * @public
        * @method ready
        * @description 组件准备完毕
        */
        ready: function (fn) {
            if (Storage.isReady) {
                fn();
            } else {
                readys.push(fn);
            };
        },
        isReady: false
    };

    function _doReady() {
        DOC.body.appendChild(storageDriver);
        storageDriver.load(USERDATA_PATH);

        try {
            data = JSON.parse(storageDriver.getAttribute(USERDATA_NAME) || '{}');
        } catch (ex) {
            data = {};
        };

        Storage.isReady = true;
    };

    if (storageMode === MODE_HTML5 || storageMode === MODE_GECKO) {

        _mix(Storage, {
            length: function () {
                return storageDriver.length;
            },
            removeItem: function (key) {
                storageDriver.removeItem(key);
            },
            setItem: function (key, value, json) {
                if (value === undefined || value === null) {
                    Storage.removeItem(key);
                } else {
                    storageDriver.setItem(key, json ? JSON.stringify(value) : value);
                };
            }
        });

        if (storageMode === MODE_HTML5) {

            storageDriver = WIN.localStorage;

            _mix(Storage, {
                clear: function () {
                    storageDriver.clear();
                },
                getItem: function (key, json) {
                    try {
                        return json ? JSON.parse(storageDriver.getItem(key)) :
                            storageDriver.getItem(key);
                    } catch (ex) {
                        return null;
                    };
                }
            });

        } else if (storageMode === MODE_GECKO) {

            storageDriver = WIN.globalStorage[WIN.location.hostname];

            _mix(Storage, {
                clear: function () {
                    for (var key in storageDriver) {
                        if (storageDriver.hasOwnProperty(key)) {
                            storageDriver.removeItem(key);
                            delete storageDriver[key];
                        };
                    };
                },
                getItem: function (key, json) {
                    try {
                        return json ? JSON.parse(storageDriver[key].value) :
                            storageDriver[key].value;
                    } catch (ex) {
                        return null;
                    };
                }
            });

        };

        Storage.isReady = true;

    } else if (storageMode === MODE_DB || storageMode === MODE_USERDATA) {

        _mix(Storage, {
            clear: function () {
                data = {};
                Storage._save();
            },
            getItem: function (key, json) {
                return data.hasOwnProperty(key) ? data[key] : null;
            },
            length: function () {
                var count = 0, key;
                for (key in data) {
                    if (data.hasOwnProperty(key)) {
                        count += 1;
                    }
                };
                return count;
            },
            removeItem: function (key) {
                delete data[key];
                Storage._save();
            },
            setItem: function (key, value, json) {
                if (value === undefined || value === null) {
                    Storage.removeItem(key);
                } else {
                    data[key] = value.toString();
                    Storage._save();
                };
            }
        });

        if (storageMode === MODE_DB) {

            storageDriver = WIN.openDatabase(DB_NAME, DB_VERSION, DB_DISPLAYNAME, DB_MAXSIZE);

            _mix(Storage, {
                _save: function () {
                    storageDriver.transaction(function (t) {
                        t.executeSql("REPLACE INTO " + DB_NAME + " (name, value) VALUES ('data', ?)", [JSON.stringify(data)]);
                    });
                }
            });

            storageDriver.transaction(function (t) {
                t.executeSql("CREATE TABLE IF NOT EXISTS " + DB_NAME + "(name TEXT PRIMARY KEY, value TEXT NOT NULL)");
                t.executeSql("SELECT value FROM " + DB_NAME + " WHERE name = 'data'", [], function (t, results) {
                    if (results.rows.length) {
                        try {
                            data = JSON.parse(results.rows.item(0).value);
                        } catch (ex) {
                            data = {};
                        };
                    };
                    Storage.isReady = true;
                });
            });

        } else if (storageMode === MODE_USERDATA) {

            storageDriver = DOC.createElement('span');
            storageDriver.addBehavior('#default#userData');

            _mix(Storage, {
                _save: function () {
                    var _data = JSON.stringify(data);

                    try {
                        storageDriver.setAttribute(USERDATA_NAME, _data);
                        storageDriver.save(USERDATA_PATH);
                    } catch (ex) { };
                }
            });

            if ($.isReady) {
                _doReady();
            } else {
                $(document).ready(_doReady);
            };
        };
    } else {
        Storage.isReady = true;
    };

    var interval = WIN.setInterval(function () {

        if (Storage.isReady) {

            readys.forEach(function (fn) {
                try { fn() } catch (e) { };
            });

            WIN.clearInterval(interval);
            interval = null;
            readys = [];
        };

    }, 100);

    WIN.Storage = Storage;
})(this);