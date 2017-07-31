/*
author yao.zhou@dianping.com 

*/
(function (WIN) {
    var 

    Local = WIN.Storage,

    DB_EXPIRE_NAME = 'html5-storage-local-expire',

    OVERWRITE_FUNCTIONS = {

        _removeExpire: function (key) {

            delete expire_data[key];

            Local.setItem(DB_EXPIRE_NAME, expire_data, true);
        },

        clear: function () {

            this.call(Local);

            reset();
        },

        length: function () {

            var length = this.call(Local);

            return length ? (length - 1) : length;
        },

        getItem: function (key, json) {
            var value = this.call(Local, key, json),
                expire_date = expire_data && expire_data[key];

            if (expire_date && new Date(expire_date) < new Date()) {

                value = null;

                Local.removeItem(key);
            };

            return value;
        },

        removeItem: function (key) {

            this.call(Local, key);

            OVERWRITE_FUNCTIONS._removeExpire(key);
        },

        setItem: function (key, value, json, expire) {

            this.call(Local, key, value, json);

            if (expire) {

                expire_data[key] = expire;
                Local.setItem(DB_EXPIRE_NAME, expire_data, true);

            } else {

                if (expire_data[key]) {

                    OVERWRITE_FUNCTIONS._removeExpire(key);
                };
            };
        }
    },

    expire_data
    ;

    function reset() {

        expire_data = Local.getItem(DB_EXPIRE_NAME, true);

        if (!expire_data) {

            expire_data = {};

            Local.setItem(DB_EXPIRE_NAME, expire_data, true);

        } else {

            $.each(expire_data, function (date, key) {

                if (new Date(date) < new Date()) {

                    Local.removeItem(key);
                };

            });
        };

    };

    for (var key in OVERWRITE_FUNCTIONS) {
        (function (name) {
            var dest_fun = OVERWRITE_FUNCTIONS[key],
                origin = Local[name];

            if (origin) {

                Local[name] = function () {
                    return dest_fun.apply(origin, $.makeArray(arguments));
                };

            };
        })(key);
    };
    
    Local.ready(reset);

})(this);