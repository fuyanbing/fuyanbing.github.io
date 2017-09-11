/**
 * Created by Administrator on 2017/7/3.
 */
var formidable = require("formidable"),// 引用formidable模块，用于文件保存
    fs = require('fs'),//引入fs模块，用于对文件操作
    http = require('http'),//引入http模块，用于web服务器
    util = require('util'),//工具模板
    path = require('path'),//路径模板
    url = require('url'),//url模板
    crypto = require('crypto');//加密解密模板

http.createServer(function (req, res) {//创建新服务器
    var form = new formidable.IncomingForm(),//新建form实例
        files = [];//新建files数组，用于储存上传文件实例
    //所有域名跨域访问均可以被通过
    res.setHeader('Access-Control-Allow-Origin', '*');
    //服务器支持'OPTIONS,HEAD,GET,POST,PUT,DELETE'方法
    res.setHeader('Access-Control-Allow-Methods', 'GET');//OPTION,HEAD,GET,POST,PUT,DELETE
    //浏览器AJAX跨域会发送两个请求，第一个请求方法为options，预检查服务器
    if (req.method == 'OPTIONS') {
        res.end();
    } else if (req.method == 'GET') {
        var pathname = url.parse(req.url).pathname,
            filepath = __dirname + '\\images' + pathname;
        fs.readFile(filepath, "binary", function (err, file) {
            if (err) {
                res.writeHead(500, {'Content-Type': 'text/plain'});
                res.end('500');
            } else {
                res.writeHead(200, {'Content-Type': 'image/' + path.extname(pathname).slice(1)});
                res.write(file, "binary");
                res.end();
            }
        });
    } else {
        var single_file, file_name;
        form.on('end', function () {//监听form上传结束事件
            res.write(JSON.stringify({//写入上传成功状态码和信息
                "code": 200,
                "name": file_name
            }));
            res.end();//响应结束
        }).on('file', function (field, file) {//监听上传事件
            single_file = file;//将上传文件的file实例存入数组
            file_name = crypto.createHash('md5').update(single_file.name.split('.')[0]).digest('hex');
            file_name += '.' + single_file.name.split('.')[1];
        }).on('error', function (error) {//监听form上传出错事件
            res.write(JSON.stringify({//写入上传失败状态码和信息
                "code": 500,
                "msg": '上传失败,' + error
            }));
            res.end();
        });
        form.parse(req, function (err) {//调用parse接口解析请求信息并保存文件
            util.pump(fs.createReadStream(single_file.path), fs.createWriteStream(__dirname + '\\images\\' + file_name), function (err) {
                if (err) {
                    console.log(err);
                }
            });
        });
    }
    ;
}).listen(8004, function () {// 设置web服务器监听端口，并启动服务
    // 控制台显示web服务器启动成功
    console.log('listening on http://localhost:8004');
})
