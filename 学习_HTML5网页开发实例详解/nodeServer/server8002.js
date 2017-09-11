/**
 * Created by Administrator on 2017/6/1.
 */
var formidable = require('formidable'),     //引用formidable模块，用于文件保存
    fs = require('fs'),                         //引用fs板块，用于对文件操作
    http = require('http');                     //引用http模块，用于web服务器

http.createServer(function(req,res){            //创建新服务器
    var form = new  formidable.IncomingForm(),  //创建form实例
        files = [];                                //新建files数组，用于存储上传文件实例

    form.on('end',function(){                     //监听form上传结束事件
        //设置响应头MIME类型和编码
        res.setHeader('content-type','text/html;charset=utf-8');
        //写入上传成功信息
        res.write('上传成功，文件已经保存到服务器，远程路径：'+form.uploadDir);
        //响应结束
        res.end();
    }).on('file',function(field,file){
        files.push(file);                           //监听上传事件 将上传文件的实例存入数组
    }).on('error',function(error){
        res.setHeader('content-type','text/html;charset=utf-8');
        res.write('上传失败，'+error);
        res.end();
    });

    form.parse(req,function(err){                   //调用parse接口解析请求信息并保存文件
        files.forEach(function(item,index){         //循环上传的文件数组
            console.log(item.name);                 //在控制台显示文件名
            //将上传至服务器端的文件名重命名为原文件名
            fs.rename(item.path,form.uploadDir + '\\' + item.name , function(err){})
        });
    });
}).listen(8002,function(){                          //设置web服务器监听端口，并启动服务
    //控制台显示web服务器启动成功
    console.log('listing on http://localhost:8002')
})