/**
 * Created by Administrator on 2017/6/1.
 */
var formidable = require("formidable"),     //引用formidable模块，用于文件保存
    fs = require("fs"),                         //引用fs模块，用于对文件操作
    http = require("http");                     //引用http模块，用于web服务器

http.createServer(function(req,res){            //创建新服务器
    var form = new formidable.IncomingForm(), //新建form实例
        files = [];                                //新建files数组，用于存储上传文件实例

    //所有域名跨域访问均可以被通过
    res.setHeader('Access-Control-Allow-Origin','*');
    //服务器支持'OPTIONS,HEAD,GET,POST,PUT,DELETE'方法
    res.setHeader('Access-Control-Allow-Methods','GET');
    //设置响应头MIME类型和编码
    res.setHeader('content-type','text/html;charset=utf-8');
    //浏览器AJAX跨域会发送两个请求，第一个请求方法为OPTIONS，预检查服务器
    if(req.method == "OPTIONS"){
        res.end();
    }else{
        form.on('end',function(){           //监听form上传结束事件
            res.write(JSON.stringify({         //写入上传成功状态码和消息
                "code":200,
                "msg":"上传成功，文件已经保存到服务器，远程路径：" + form.uploadDir
            }));
            res.end();          //响应结束
        }).on('file',function(field,file){
            files.push(file);   //监听form上传出错事件 将上传文件的file实例存入数组
        }).on('error',function(error){
            res.write(JSON.stringify({      //监听上传出错事件 写入上传失败码和信息
                "code":500,
                "msg":'上传失败，'+error
            }));
            res.end();
        });
        form.parse(req,function(err){                   //调用parse接口解析请求信息并保存文件
            files.forEach(function(item,index){         //循环上传的文件数组
                console.log(item.name);                 //在控制台显示文件名
                //将上传至服务器端的文件重新命名为原文件名
                fs.rename(item.path,form.uploadDir + '\\' +item.name,function(err){});
            })
        })

    }
}).listen(8003,function(){
    console.log('listening on http://localhost:8003');
})