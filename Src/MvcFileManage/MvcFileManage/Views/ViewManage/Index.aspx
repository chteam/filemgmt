<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ViewManageIndexViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=Model.Path %></title>
    <script src="/Scripts/jquery-1.3.1.js" type="text/javascript"></script>
    <style type="text/css">
    .tools{float:right}
    .dicts{float:left;width:45%;min-width:400px}
    .files{float:left;min-width:400px}
    </style>
</head>
<body>
    <h2>
        Current Path:<%=Model.Path %></h2>
    <div>
        <fieldset class="dicts">
            <legend>Dictionarys</legend>
            <ul>
                <li>
                    <%=Html.ActionLink("..", "Index", new { fn = Path.GetDirectoryName(Model.Path),title="返回上级目录" })%>
                </li>
                <% foreach (var d in Model.Dict) { %>
                <li>
                <div class="tools">
                <%=Html.ActionLink("Rename", "RenameDictionary", new { fn = Path.Combine(Model.Path, Path.GetFileName(d)) })%>
                Delete</div>
                    <%=Html.ActionLink(Path.GetFileName(d), "Index", new { fn = Path.Combine(Model.Path, Path.GetFileName(d)) })%>
                    
                </li>
                <%} %>
            </ul>
               <div>Other：
               <%=Html.ActionLink("Create", "CreateDictionary", new { fn=Model.Path})%>
               </div>
        </fieldset>
        
        <fieldset class="files">
            <legend>Files</legend>
            <ul>
                <% foreach (var d in Model.Files) { %>
                <li>
                    <%=Path.GetFileName(d)%></li>
                <%} %>
            </ul>
        </fieldset>
     
    </div>
    <script type="text/javascript">
        $('li').hover(function() { $(this).css('background', 'lightblue'); },
        function() { $(this).css('background', ''); }
        );
    </script>
</body>
</html>
