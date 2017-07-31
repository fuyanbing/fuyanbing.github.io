(function() {
	var DB_NAME = 'html5_storage_form_test', //数据库和表名
		item_tpl = $('#J_item').html(), //列表单个元素模板
		substitute = function(str, sub) { //格式化字符串
			return str.replace(/\{(.+?)\}/g, function($0, $1) {
				return $1 in sub ? sub[$1] : $0;
			});
		},
		tbody = $('table.data tbody'), //列表容器
		//打开WebSQL数据库
		storageDriver = window.openDatabase(DB_NAME, '1.0', 'html5 storage table', 1048576);

	function add_item(data, toDB) { //添加列表项，数据库
		if(toDB) {
			storageDriver.transaction(function(t) { //往数据库插入一条数据
				t.executeSql("INSERT INTO " + DB_NAME + " (name,sex,age) VALUES (?,?,?);", [data.name, data.sex, data.age], function(transaction, resultSet) { //存入保存数据
					data.id = resultSet.insertId; //获取数据库返回的自增ID
					tbody.append(substitute(item_tpl, data)); //添加到列表
				}, function() {
					alert('添加失败');
				}); //错误回调函数
			});
		} else {
			tbody.append(substitute(item_tpl, data));
		};
	};

	function del_item(target) { //删除一条数据
		storageDriver.transaction(function(t) { //执行删除SQL
			t.executeSql("delete from " + DB_NAME + " where id=" + target.attr('data-id'), [], function() {
				target.closest('tr').fadeOut(); //隐藏元素
			});
		});
	};

	function modify_item(target) { //修改一条数据
		var id = target.attr('data-id');

		function update_db(data) {
			storageDriver.transaction(function(t) {
				t.executeSql("update " + DB_NAME + " set name=?, sex=?, age=? where id=?", [data.name, data.sex, data.age, id], function(transaction, resultSet) { //传入保存数据
					target.closest('tr').replaceWith(substitute(item_tpl, data));
				})
			})
		}
		storageDriver.transaction(function(t) {
			t.executeSql("SELECT * FROM " + DB_NAME + " where id=" + id, [], function(t, results) {
				var wraper = open_dialog('修改', function(data) {
						data.id = id;
						update_db(data);
					}),
					result;
				for(var i = 0; i < results.rows.length; i++) {
					result = results.rows.item(i);
					wraper.find('input.name').val(result.name); //姓名值
					wraper.find('select.sex').val(result.sex); //性别值
					wraper.find('input.age').val(result.age); //年龄值
				};
			})
		})

	};

	function open_dialog(title, callback) {
		var wraper = $($('#J_form').html()); //新建添加弹层
		$(document.body).append(wraper); //注意页面结构
		wraper.dialog({
			position: 'center',
			title: title,
			modal: true,
			buttons: [{
				text: "确认",
				click: function() {
					var name = wraper.find('input.name').val(),
						sex = wraper.find('select.sex').val(),
						age = wraper.find('input.age').val();
					if(name.length && sex.length && age.length) {
						callback({
							name: name,
							sex: sex,
							age: age
						});
						$(this).dialog("close"); //关闭弹出
					} else {
						alert('请正确填写所有填写内容');
					}
				}
			}, {
				text: "取消",
				click: function() {
					$(this).dialog("close"); //关闭按钮事件
				}
			}]
		});
		wraper.dialog("open"); //打开弹出框
		return wraper;
	};

	$('span.add').on('click', function(e) { //添加操作按钮事件
		open_dialog('添加', function(data) {
			add_item(data, true);
		})
	})

	tbody.on('click', function(e) { //监听列表单机事件
		var target = $(e.target);
		if(target.hasClass('del')) { //目标元素为删除按钮
			e.preventDefault();
			del_item(target); //删除元素和数据库内容
		} else if(target.hasClass('modify')) {
			e.preventDefault();
			modify_item(target);
		};
	});

	storageDriver.transaction(function(t) { //启动一个事务生成列表
		t.executeSql("CREATE TABLE IF NOT EXISTS " + DB_NAME + //创建数据表
			"(id INTEGER PRIMARY KEY AUTOINCREMENT, " + //自增字段
			"name TEXT NOT NULL, " + //姓名字段
			"sex TEXT NOT NULL, " + //性别字段
			"age INTEGER DEFAULT 0" //年龄字段
		);
		t.executeSql('SELECT * FROM ' + DB_NAME, [], function(t, results) {
			for(var i = 0; i < results.rows.length; i++) {
				add_item(results.rows.item(i), false); //生成列表
			}
		})
	})

})()