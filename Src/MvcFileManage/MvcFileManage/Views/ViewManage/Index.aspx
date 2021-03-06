<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ViewManageIndexViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%=Model.Path %></title>
    <script src="/Scripts/jquery-1.3.1.js" type="text/javascript"></script>

    <style type="text/css">
        .tools
        {
            float: right;
        }
        .dicts
        {
            float: left;
            width: 45%;
            min-width: 500px;
        }
        .files
        {
            float: left;
            width: 45%;
            min-width: 500px;
        }
    </style>
</head>
<body>
    
    <div style="width:100%"><h2>
        Current Path:<%=Model.Path %></h2>
        <fieldset class="dicts">
            <legend>Dictionarys</legend>
            <ul>
                <li>
                    <%=Html.ActionLink("..", "Index", new { fn = System.IO.Path.GetDirectoryName(Model.Path), title = "�����ϼ�Ŀ¼" }, new { title="Back to the upper dictionary"})%>
                </li>
                <% foreach (var d in Model.Dict) { %>
                <li>
                    <div class="tools">
                        <%=Html.ActionLink("Rename", "RenameDictionary", new { fn = System.IO.Path.Combine(Model.Path, System.IO.Path.GetFileName(d)) }, new { title = "Rename this dictionary" })%>
                        <%=Html.ActionLink("Delete", "DeleteDictionary", new { fn = System.IO.Path.Combine(Model.Path, System.IO.Path.GetFileName(d)) }, new { title = "Delete this dictionary" })%>
                    </div>
                    <%=Html.ActionLink(System.IO.Path.GetFileName(d), "Index", new { fn = System.IO.Path.Combine(Model.Path, System.IO.Path.GetFileName(d)) })%>
                </li>
                <%} %>
            </ul>
            <div>
                Other��
                <%=Html.ActionLink("Create", "CreateDictionary", new { fn = Model.Path }, new { title = "Create a dictionary and appoint a dictionary name" })%>
            </div>
        </fieldset>
        <fieldset class="files">
            <legend>Files</legend>
            <ul>
                <% foreach (var d in Model.Files) { %>
                <li>
                    <div class="tools">
                        <%=Html.ActionLink("Edit", "EditFile", new { path = Model.Path,fn=System.IO.Path.GetFileName(d) }, new { title = "Edit this file" })%>
                        <%=Html.ActionLink("Rename", "RenameFile", new { fn = System.IO.Path.Combine(Model.Path, System.IO.Path.GetFileName(d)) }, new { title = "Rename this file" })%>
                        <%=Html.ActionLink("Delete", "DeleteFile", new { fn = System.IO.Path.Combine(Model.Path, System.IO.Path.GetFileName(d)) }, new { title = "Delete this file" })%>
                    </div>
                    <%=System.IO.Path.GetFileName(d)%>
                </li>
                <%} %>
            </ul>
            <div>
                Other��
                <%=Html.ActionLink("Create a text file", "EditFile", new { path = Model.Path }, new { title = "Create a file and appoint a file name" })%>
            </div>
        </fieldset>
    </div>

    <script type="text/javascript">
        $('li').hover(function() { $(this).css('background', 'lightgray'); },
        function() { $(this).css('background', ''); }
        );
    </script>

    <div style="width: 100%; background: #ffee99;float:left">
        Written by <a href="http://www.cnblogs.com/chsword/">Jian Zou</a></div>
</body>
</html>
