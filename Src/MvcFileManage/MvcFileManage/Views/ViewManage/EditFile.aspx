<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<MvcFileManage.Models.ViewManageFileEditViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%if (Model.IsEdit) {%>Edit File<%}
          else { %>Create File<%} %></title>
</head>
<body>
    <h2>
        <%if (Model.IsEdit) {%>Edit File:"<%=Model.Filename %>"<%}
          else { %>Create File<%} %></h2>
    <div>
        Path:"<%=Model.Path %>"</div>
    <div>
        <fieldset>
            <legend>
                <%if (Model.IsEdit) {%>Edit File:"<%=Model.Filename %>"<%}
                  else { %>Create File<%} %></legend>
            <form action="" method="post">
            <%if (!Model.IsEdit) {%>
            <p>
                <label>File Name</label><%=Html.TextBox("fn", Model.Filename)%></p>
            <%}
              else
                  Writer.Write(Html.Hidden("fn", Model.Filename));
              Writer.Write(Html.Hidden("isedit", Model.IsEdit));
                 %>
            <p>
                <label>Content</label>
                <%=Html.TextArea("Content", Model.Content, new {rows=30,cols=80})%>
            </p>
            <p>
                <%if (Model.IsEdit) {%>
                <input type="submit" value="Edit" />
                <%}
                  else { %>
                <input type="submit" value="Create" />
                <%} %>
            </p>
            </form>
            <%=Html.ActionLink("Back to the " + Model.Path, "Index", new { fn = Model.Path })%>
        </fieldset>
    </div>
</body>
</html>
