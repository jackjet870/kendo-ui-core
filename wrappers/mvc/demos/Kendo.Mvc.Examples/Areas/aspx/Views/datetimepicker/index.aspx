<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div id="to-do">
<%= Html.Kendo().DateTimePicker()
        .Name("datetimepicker")
        .Value(DateTime.Now)        
%>
</div>

<style>
    .k-datetimepicker 
    {
        width: 200px;
    }
    #to-do {
        height: 52px;
        width: 221px;
        margin: 30px auto;
        padding: 91px 0 0 188px;
        background: url('<%=Url.Content("~/content/web/datepicker/todo.png")%>') transparent no-repeat 0 0;
    }
</style>

</asp:Content>