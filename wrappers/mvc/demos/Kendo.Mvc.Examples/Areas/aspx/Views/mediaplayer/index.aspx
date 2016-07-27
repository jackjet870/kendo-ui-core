<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="demo-section k-content" style="width: 646px; max-width: none">
        <%= Html.Kendo().MediaPlayer()
        .AutoPlay(true)
        .Media(m => m.Title("Digital Transformation: A New Way of Thinking").Source("https://www.youtube.com/watch?v=gNlya720gbk"))
        .Name("mediaPlayer")
        .HtmlAttributes(new { style = "height:360px; width:640px" })
        %>
    </div>
</asp:Content>
