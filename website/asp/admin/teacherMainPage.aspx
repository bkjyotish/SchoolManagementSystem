﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teacherMainPage.aspx.cs"
    Inherits="WebSite.asp.teacherManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="../../Jscript/easyui1.2.6/js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript/easyui1.2.6/js/themes/icon.css" />

    <script type="text/javascript" src="../../Jscript/easyui1.2.6/js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript" src="../../Jscript/easyui1.2.6/js/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="../../Jscript/easyui1.2.6/js/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src='../../Jscript/easyui1.2.6/js/Jinjuan.index.js'> </script>
    
    <script type="text/javascript" src='../../Jscript/easyui1.2.6/js/form.js'> </script>

    <style type="text/css">
        legend
        {
            font-size: 12px;
            color: Blue;
        }
        fieldset
        {
            margin: 3px;
        }
        .table input
        {
            width: 128px;
        }
        .table
        {
            border-collapse: collapse;
            font-size: 13px;
            height: 24px;
            line-height: 24px;
            color: #000000;
            text-align: center;
        }
        .table tr th
        {
            background: #000;
            color: #FFF;
            font-size: 13px;
            height: 24px;
            line-height: 24px;
        }
        .table tr th.th_border
        {
            border-right: solid 1px #FFF;
            border-left: solid 1px #aabbcc;
        }
        .table tr td
        {
            border: solid 1px #aabbcc;
        }
    </style>
</head>
<body class="easyui-layout">
    <div region="north" style="overflow: hidden;">
        <fieldset>
            <legend>查询</legend>
            <table>
                <tr>
                    <td>
                        姓名
                    </td>
                    <td>
                        <input id="Name_sel" name="Name" type="text" style="width: 100px" />
                    </td>
                    <td>
                        性别
                    </td>
                    <td>
                        <select id="Sex_sel" name="Sex" style="width: 50px">
                            <option>男</option>
                            <option>女</option>
                        </select>
                    </td>
                    <td>
                        身份证
                    </td>
                    <td>
                        <input id="IDcode_sel" name="IDcode" type="text" style="width: 150px" />
                    </td>
                    <td>
                        教职编号
                    </td>
                    <td>
                        <input id="Sn_sel" name="Sn" type="text" style="width: 100px" />
                    </td>
                    
                    <td>
                        <a id="searchBtn" class="easyui-linkbutton" iconcls="icon-search" href="###">搜索</a> 
                        <a id="refreshBtn" class="easyui-linkbutton" iconcls="icon-reload" href="###">刷新</a>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div id="toolbar">
        <a id="newUserBtn" href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add"
            plain="true"">添加</a> <a id="editUserBtn" href="javascript:void(0)" class="easyui-linkbutton"
                iconcls="icon-edit" plain="true")">修改</a> <a id="destroyUserBtn" href="javascript:void(0)"
                    class="easyui-linkbutton" iconcls="icon-remove" plain="true"">删除</a>
    </div>
    <div region="center" title="老师管理" border="false">
        <table id="datagrid" idField="Id" class="easyui-datagrid" url="../../control/TeacherControl.ashx?method=getTeachers" border="false" fit="true"
            toolbar="#toolbar" pagination="true" rownumbers="true" singleselect="true">
            <thead>
                <tr>
                    <th field="Sn" width="120">
                        教职编号
                    </th>
                    <th field="Name" width="100">
                        姓名
                    </th>
                    <th field="Sex" width="120">
                        性别
                    </th>
                    <th field="IDcode" width="100">
                        身份证
                    </th>
                    <th field="Nation" width="70">
                        民族
                    </th>
                    <th field="Telphone" width="100">
                        联系电话
                    </th>
                </tr>
            </thead>
        </table>
    </div>
    <div id="w" class="easyui-window" closed="true" style="padding: 5px;">
        <form id="editForm" action="../../control/TeacherControl.ashx" style="margin: 0 0 0 0;" method="post" enctype="multipart/form-data">
        <input type="hidden" id="method" name="method" value="addTeacher" />
        <input type="hidden" id="Id" name="Id"/>
        <table id="table" class="table" style="width: 100%; height: 100%">
            <tr>
                <td style="width:80px">
                    教职编号
                </td>
                <td>
                    <input id='Sn' name='Sn' type="text" class="easyui-validatebox" required="required"/>
                </td>
                <td colspan="2" rowspan="4" align="center">
                    <img alt='' id="headImg" width="100" height="100" style="border: solid 1px #aabbcc"
                        src="/images/default_head.gif" />
                </td>
            </tr>
            <tr>
                <td>
                    姓　　名
                </td>
                <td>
                    <input id='Name' name='Name' type="text" class="easyui-validatebox" required="required"/>
                </td>
            </tr>
            <tr>
                <td>
                    身 份 证
                </td>
                <td>
                    <input id='IDcode' name='IDcode' type="text" class="easyui-validatebox" required="required"/>
                </td>
            </tr>
            <tr>
                <td>
                    性　　别
                </td>
                <td>
                    <input id='Sex' name='Sex' type="text" class="easyui-validatebox" required="required"/>
                </td>
            </tr>
            <tr>
                <td>
                    民　　族
                </td>
                <td> 
                    <select id='Nation' name='Nation' class="easyui-validatebox" required="required">
                         <option value="汉族" selected>汉族</option>
                         <option value="阿昌族">阿昌族</option>
                         <option value="白族">白族</option>
                         <option value="保安族">保安族</option>
                         <option value="布朗族">布朗族</option>
                         <option value="布依族">布依族</option>
                         <option value="朝鲜族">朝鲜族</option>
                         <option value="达斡尔族">达斡尔族</option>
                         <option value="傣族">傣族</option>
                         <option value="德昂族">德昂族</option>
                         <option value="侗族">侗族</option>
                         <option value="东乡族">东乡族</option>
                         <option value="独龙族">独龙族</option>
                         <option value="鄂伦春族">鄂伦春族</option>
                         <option value="俄罗斯族">俄罗斯族</option>
                         <option value="鄂温克族">鄂温克族</option>
                         <option value="高山族">高山族</option>
                         <option value="仡佬族">仡佬族</option>
                         <option value="哈尼族">哈尼族</option>
                         <option value="哈萨克族">哈萨克族</option>
                         <option value="赫哲族">赫哲族</option>
                         <option value="回族">回族</option>
                         <option value="基诺族">基诺族</option>
                         <option value="京族">京族</option>
                         <option value="景颇族">景颇族</option>
                         <option value="柯尔克孜族">柯尔克孜族</option>
                         <option value="拉祜族">拉祜族</option>
                         <option value="黎族">黎族</option>
                         <option value="傈僳族">傈僳族</option>
                         <option value="珞巴族">珞巴族</option>
                         <option value="满族">满族</option>
                         <option value="毛南族">毛南族</option>
                         <option value="门巴族">门巴族</option>
                         <option value="蒙古族">蒙古族</option>
                         <option value="苗族">苗族</option>
                         <option value="仫佬族">仫佬族</option>
                         <option value="纳西族">纳西族</option>
                         <option value="怒族">怒族</option>
                         <option value="普米族">普米族</option>
                         <option value="羌族">羌族</option>
                         <option value="撒拉族">撒拉族</option>
                         <option value="畲族">畲族</option>
                         <option value="水族">水族</option>
                         <option value="塔吉克族">塔吉克族</option>
                         <option value="塔塔尔族">塔塔尔族</option>
                         <option value="土族">土族</option>
                         <option value="土家族">土家族</option>
                         <option value="佤族">佤族</option>
                         <option value="锡伯族">锡伯族</option>
                         <option value="乌兹别克族">乌兹别克族</option>
                         <option value="瑶族">瑶族</option>
                         <option value="彝族">彝族</option>
                         <option value="裕固族">裕固族</option>
                         <option value="藏族">藏族</option>
                         <option value="维吾尔族">维吾尔族</option>
                         <option value="壮族">壮族</option>
                         </select>

                </td>
                <td style="width:80px">
                    头像上传
                </td>
                <td>
                    <input id="headImgFile" runat="server" name="headImgFile" type="file"
                        size="2" onchange="changeHead()" class="easyui-validatebox" required="required"/>
                </td>
            </tr>
            <tr>
               <td>
                  入校时间
                </td>
                <td>
                    <input id='EntryTime' name='EntryTime' class="easyui-datebox" type="text" required="true" />
                </td>
                <td>
                    移动电话
                </td>
                <td>
                    <input id='Telphone' name='Telphone' type="text" class="easyui-validatebox" required="required"/>
                </td>
            </tr>
            <tr>
                <td>
                    家庭地址
                </td>
                <td>
                    <input id='Address' name='Address' class="easyui-validatebox" required="required"/>
                </td>
                <td>
                    家庭固话
                </td>
                <td>
                    <input id="MobilePhone" name='MobilePhone' type="text" />
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center" style="padding: 10 10 10 10">
                    <a id="dialogSaveBtn" href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-save"
                        plain="true"">保存</a> <a id="dialogCancelBtn" href="javascript:void(0)" class="easyui-linkbutton"
                            iconcls="icon-cancel" plain="true"">取消</a>
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>

<script type="text/javascript">
    $(function(){ 
		 $("#searchBtn").click(function(){
		    var Sn_sel = $('#Sn_sel').val();
		    var Name_sel = $('#Name_sel').val();
		    var Sex_sel = $('#Sex_sel').val();
		    var IDcode_sel = $('#IDcode_sel').val();
            $('#datagrid').datagrid('reload',{
                Name:Name_sel,
                Sex:Sex_sel,
                IDcode:IDcode_sel,
                Sn:Sn_sel
            });
        });
	    $("#refreshBtn").click(function(){
            $('#datagrid').datagrid('reload',{});
        });
        $("#newUserBtn").click(function(){
           $('#w').window({  
            title:'添加',  
            modal:true  
           }); 
            $('#w').window('open');
            $("#method").val("addTeacher");

        });
        $("#editUserBtn").click(function(){
           var selected =  $('#datagrid').datagrid('getSelected');
            if(!selected){
               msgAlert('提示','请选中一行后再执行此操作','warning');
            }else{
                $('#w').window({  
                    title:'修改',  
                    modal:true  
                }); 
                $('#w').window('open');
                $("#method").val("updateTeacher");
                $.ajax({
                    url: "../../control/TeacherControl.ashx?method=getTeacher",
                    data: {
                       Id: selected.Id
                    },
                    type:'get', 
                    success: function( data ) {
                        if (data.length > 0) {
                          $("#table").serializeJsonToForm(data);
                        } else {
                          msgAlert('提示','加载用户详细信息失败!','error');
                        }
                    },
                    error : function() {      
                       alert("异常！");    
                    } 
                });
            }
        });
        $("#destroyUserBtn").click(function(){
            var selected =  $('#datagrid').datagrid('getSelected');
            if(!selected){
               msgAlert('提示','请选中一行后再执行此操作','warning');
            }else{
                $.ajax({
                    url: "../../control/TeacherControl.ashx?method=delTeacher",
                    data: {
                      Id: selected.Id
                    },
                    type:'get', 
                    success: function( data ) {
                      if(data == "1"){
                          msgShow('提示','操作成功');
                          $('#datagrid').datagrid('reload'); 
                      }else{
                          msgAlert('提示','操作失败','error');
                      }
                    },
                    error : function() {      
                      alert("异常！");    
                    } 
                });
            }
        });
        $("#headImgFile").change(function(){
            $("#headImg").attr("src",$(this).val());
        });
        $("#dialogSaveBtn").click(function(){
            $('#editForm').submit();
        });
        $("#dialogCancelBtn").click(function(){
            $('#w').window('close');
        });
        
        $('#editForm').form({  
                onSubmit: function(){
                    return $('#editForm').form('validate');
                },  
                success:function(data){ 
                    if(data == "1"){
                      $('#w').window('close');
                      msgShow('提示','操作成功');
                      $('#datagrid').datagrid('reload'); 
                    }else if(data =="0"){
                      msgAlert('提示','操作失败','error');
                    }
                }  
            });
    })
    
    function changeHead(){
        $("#headImg").attr("src",$("#headImgFile").val());
    }
    
</script>

