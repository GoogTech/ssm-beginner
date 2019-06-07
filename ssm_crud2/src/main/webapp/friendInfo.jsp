<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>好友列表</title>
    <!-- 禁止浏览器从本地计算机的缓存中访问页面内容 -->
    <meta http-equiv="pragma" content="no-cache">
    <!-- 控制HTTP缓存 -->
    <meta http-equiv="cache-control" content="no-cache">
    <!-- 设置网页的到期时间 -->
    <meta http-equiv="expires" content="0">
    <!-- 网页关键字 -->
    <meta http-equiv="keywords" content="alumni,jquery,easyui,ssm,,mysql">
    <!-- 网页描述 -->
    <meta http-equiv="description" content="A Simple Alumni">
    <!-- easyui-js -->
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <!-- easyui-css -->
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <link id="themeLink" rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
</head>

<body>
<!-- 工具条 -->
<div id="tb">
    <a id="addBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a id="editBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a id="deleteBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>

<!-- 学生信息列表 -->
<table id="list"></table>

<!-- 编辑学生信息窗口 -->
<div id="win" class="easyui-window" title="学生信息编辑窗口" style="width:420px;height:435px;padding: 20px 65px;"
     data-options="iconCls:'icon-save',modal:true,closed:true">
    <form id="editForm" method="post" action="">
        <%-- 设置id隐藏域: 用于区分添加与修改逻辑 --%>
        <input type="hidden" name="id">
        <!--
        利用style="border-collapse:separate; border-spacing:0px 13px;调节tr间的距离
        利用cellpadding="6"调节td间的距离
        -->
        <table style="border-collapse:separate; border-spacing:0px 3px;" cellpadding="6">
            <tr>
                <td>姓名</td>
                <td><input class="easyui-textbox" name="name" style="width: 200px;height: 25px" data-options="required:true"/></td>
            </tr>
            <tr>
                <td>性别</td>
                <td colspan="4">
                    <select class="easyui-combobox" name="gender"
                            data-options="required:true,editable: false, panelHeight: 50, width: 60, height: 25">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>年纪</td>
                <td>
                    <input class="easyui-textbox" name="age" style="width: 60px;height: 25px" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>班级</td>
                <td>
                    <input class="easyui-textbox" name="clazz" style="width: 200px;height: 25px" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>QQ</td>
                <td>
                    <input class="easyui-textbox" name="qq" style="width: 200px;height: 25px" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>微信</td>
                <td>
                    <input class="easyui-textbox" name="wechat" style="width: 200px;height: 25px" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>电话</td>
                <td>
                    <input class="easyui-textbox" name="telephone" style="width: 200px;height: 25px" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>住址</td>
                <td>
                    <input class="easyui-textbox" name="address" style="width: 200px;height: 25px" data-options="required:true"/>
                </td>
            </tr>
        </table>
        <div align="center" style="padding-top: 20px">
            <a id="saveBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">添加</a>
        </div>
    </form>
</div>


<!-- 加载并展示学生列表信息 -->
<script type="text/javascript">
    $(function () {
        $("#list").datagrid({
            //url:后台数据查询的地址
            url: "friend/getFriendList",
            //columns:填充的列数据
            //field:后台对象的属性
            //tille:列标题
            columns: [[
                {
                    field: "id",
                    title: "编号",
                    width: 100,
                    checkbox: true //单选框
                },
                {
                    field: "name",
                    title: "姓名",
                    width: 100
                },
                {
                    field: "gender",
                    title: "性别",
                    width: 50
                },
                {
                    field: "age",
                    title: "年纪",
                    width: 50
                },
                {
                    field: "clazz",
                    title: "班级",
                    width: 100
                },
                {
                    field: "qq",
                    title: "QQ",
                    width: 130
                },
                {
                    field: "wechat",
                    title: "微信",
                    width: 130
                },
                {
                    field: "telephone",
                    title: "电话",
                    width: 130
                },
                {
                    field: "address",
                    title: "家庭住址",
                    width: 300
                }
            ]],
            //显示分页
            pagination: true,
            //工具条
            toolbar: "#tb",
            //显示行号
            rownumbers: true
        });


        //添加按钮事件
        $("#addBtn").click(function () {
            $("#editForm").form("clear");//清空表单数据
            $("#win").window("open");//打开编辑窗口
        });


        //提交按钮事件
        $("#saveBtn").click(function () {
            $("#editForm").form("submit", {
                //url: 提交到后台的地址
                url: "friend/submitForm",
                //onSubmit: 表单提交前的回调函数,true:提交表单,false:不提交表单
                onSubmit: function () {
                    //判断表单的验证是否都通过了,validate:用作表单字段验证
                    return $("#editForm").form("validate");
                },
                //success: 服务器执行完毕后的回调函数
                //要求Controller返回的数据格式如: 成功:{success:true} 失败:{success:false,msg:错误信息}
                success: function (data) { //data: 服务器返回的类型为字符串的数据
                    data = eval("(" + data + ")");//把字符串类型的data转换对象类型

                    if (data.success) {
                        $("#win").window("close");//关闭窗口
                        $("#list").datagrid("reload");//刷新datagrid
                        $.messager.alert("提示", "保存成功", "info");
                    } else {
                        $.messager.alert("提示", "保存失败: " + data.msg, "error");
                    }
                }
            });

        });


        //修改按钮事件
        $("#editBtn").click(function () {
            //设置仅单选
            var rows = $("#list").datagrid("getSelections");
            if (rows.length != 1) {
                $.messager.alert("提示", "请选择一行数据进行修改哟 !", "warning");
                return;
            }
            $("#editForm").form("load", "friend/editFriend?id=" + rows[0].id);//表单回显
            $("#win").window("open");//打开编辑窗口
        });


        //删除按钮事件
        $("#deleteBtn").click(function () {
            var rows = $("#list").datagrid("getSelections");
            if (rows.length == 0) {
                $.messager.alert("提示", "请至少选择一行删除哟 !", "warning");
                return;
            }
            //确认删除提示
            $.messager.confirm("提示", "确认要删除所选择的数据吗 ?", function (value) {
                if (value) {

                    //设置多选删除,其格式为: id=1&id=2&id=3
                    var idStr = "";
                    $(rows).each(function (i) {
                        idStr += ("id=" + rows[i].id + "&");
                    });
                    idStr = idStr.substring(0, idStr.length - 1);

                    //将拼装后的id传递到后台
                    $.post("friend/deleteFriend", idStr, function (data) {
                        if (data.success) {
                            $("#list").datagrid("reload");//刷新datagrid
                            $.messager.alert("提示", "删除成功啦 !", "info");
                        } else {
                            $.messager.alert("提示", "删除失败 !：" + data.msg, "error");
                        }
                    }, "json");
                }
            });
        });


        //消息推送框口
        $.messager.show({
            width: 350,
            height: 50,
            title: '推送',
            msg: '黄宇辉祝您端午节安康 （づ￣3￣）づ╭❤～',
            showSpeed: 1000,
            timeout: 0,
            showType: 'slide'
        });

    });
</script>
</body>
</html>
