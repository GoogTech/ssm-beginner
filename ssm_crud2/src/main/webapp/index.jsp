<%@ page language="java" pageEncoding="utf-8" %>
<!-- use EL-Expression-->
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>同学录 (っ•̀ω•́)っ✎⁾⁾ ~</title>

    <!-- 禁止浏览器从本地计算机的缓存中访问页面内容 -->
    <meta http-equiv="pragma" content="no-cache">
    <!-- 控制HTTP缓存 -->
    <meta http-equiv="cache-control" content="no-cache">
    <!-- 设置网页的到期时间 -->
    <meta http-equiv="expires" content="0">
    <!-- 网页的关键字 -->
    <meta http-equiv="keywords" content="alumni,jquery,easyui,ssm,,mysql">
    <!-- 网页内容 -->
    <meta http-equiv="description" content="A Simple Alumni">
    <!-- easyui-js -->
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <!-- easyui-css -->
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <link id="themeLink" rel="stylesheet" type="text/css" href="static/easyui/themes/metro/easyui.css">
</head>

<body class="easyui-layout">

<!-- 页面顶部 -->
<div data-options="region:'north',split:true" style="height:30px;">
    <!-- 切换页面主题功能 -->
    <div id="themesDiv" style="position: absolute;right: 20px;top:1px;">
        <a href="javascript:void(0)" id="mb" class="easyui-menubutton"
           data-options="menu:'#Themesmeus',iconCls:'icon-reload'">切换页面主题
        </a>
        <div id="Themesmeus" style="width:150px;">
            <div>metro</div>
            <div>material</div>
            <div>gray</div>
            <div>black</div>
            <div>bootstrap</div>
            <div>default</div>
        </div>
    </div>
</div>


<!-- 系统菜单 -->
<div data-options="region:'west',title:'系统菜单',split:true" style="width:200px;">
    <div id="aa" class="easyui-accordion" style="width:193px;" data-options="border:0,multiple:true">
        <div title="备忘录" data-options="iconCls:'icon-edit',selected:true" style="padding:10px;">
            <ul>
                <li><a style="color: #8A2BE2" href="javascript:void(0)" pageUrl="friendInfo.jsp">好友列表</a></li>
            </ul>
        </div>
    </div>
</div>

<!-- 页面中间:项目介绍页面 -->
<div data-options="region:'center'" style="padding:5px;">
    <div id="tt" class="easyui-tabs" style="width:500px;height:250px;" data-options="fit:true">
        <div title="欢迎页面" style="padding: 20px; overflow: hidden; color: #8A2BE2;">
            <p style="font-size: 25px; line-height: 30px; height: 30px;">欢迎使用同学录哟(っ•̀ω•́)っ✎⁾⁾ ~</p>
            <p>开发人员: 黄宇辉</p>
            <p>联系方式-Email: Gentleman_0109@outlook.com</p>
            <p>联系方式-QQ: 3083968068</p>
            <p>开发周期: 2019/6/6 —— 2019/6/7</p>
            <hr/>
            <p align="center">项目开发环境介绍</p>
            <p>操作系统: Windows 10 Pro</p>
            <p>开发工具: Intellij IDEA 2019.1.3(UItimate Edition)</p>
            <p>Java版本: 11.0.2</p>
            <p>服务器: Tomcat 9.0</p>
            <p>数据库: Server version: 8.0.11 MySQL Community Server - GPL</p>
            <p>采用技术: JSP+Spring+Spring MVC+MyBatis+jQuery+Ajax+EasyUI+Maven</p>
        </div>
    </div>
</div>

<!-- 页面事件 -->
<script type="text/javascript">
    $(function () {
        //给a标签绑定时间
        $("a[pageUrl]").click(function () {
            //1.获取pageUrl属性值(需要跳转的页面地址)
            var pageUrl = $(this).attr("pageUrl");
            var title = $(this).text();//获取a标签的内容:标题

            //2.判断是否存在指定标题的选项卡
            if ($("#tt").tabs("exists", title)) {
                //3.如果存在,则选项该选项卡
                $("#tt").tabs("select", title);
            } else {
                //4.如果不存在，则添加选项卡
                $("#tt").tabs("add", {
                    title: title,
                    content: "<iframe src='" + pageUrl + "' width='100%' height='100%' frameborder='0'><iframe>",
                    closable: true
                });
            }
        });

        //切换页面主题事件
        $("#Themesmeus").menu({
            onClick: function (item) {
                //1.获取需要改变的模块名称
                var themeName = item.text;
                //2.获取link标签的href属性
                var href = $("#themeLink").attr("href");
                //3.更改href的属性值
                href = href.substring(0, href.indexOf("themes")) + "themes/" + themeName + "/easyui.css";
                //4.更新link的href属性
                $("#themeLink").attr("href", href);
            }
        });
    });

</script>

<!-- 页面底部 -->
<div data-options="region:'south',split:true" style="height:30px; color: rebeccapurple">
    <div id="copyrightDiv" style="text-align: center;font:11px 'Lucida Console';">
        Copyright @ 2019/6/7 黄宇辉. All rights reserved | 本人博客网站 : https://yubuntu0109.github.io
    </div>
</div>

</body>
</html>