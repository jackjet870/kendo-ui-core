<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /*
            Use the DejaVu Sans font for display and embedding in the PDF file.
            The standard PDF fonts have no support for Unicode characters.
        */
        .k-grid {
            font-family: "DejaVu Sans", "Arial", sans-serif;
        }
    </style>

    <!-- Load Pako ZLIB library to enable PDF compression -->
    <script src="<%= Url.Content("~/Scripts/pako.min.js") %>"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<%: Html.Kendo().Grid<Kendo.Mvc.Examples.Models.EmployeeViewModel>()    
    .Name("grid")    
    .HtmlAttributes( new { style = "width: 900px" } )
     .Columns(columns =>
    {
        columns.Bound(e => e.EmployeeID).Width(140).Title("Picture");
        columns.Bound(e => e.Title).Width(400).Title("Details");
        columns.Bound(e => e.Title).Title("Country");
        columns.Bound(e=> e.EmployeeID).Title("ID");
    })
    .ClientRowTemplate(
        "<tr data-uid='#: uid #'>" +
            "<td class='photo'>" +
               "<img src='" + Url.Content("~/Content/web/Employees/") +"#:data.EmployeeID#.jpg' alt='#: data.EmployeeID #' />" +
            "</td>" +
            "<td class='details'>" +
                "<span class='name'>#: FirstName# #: LastName#</span>" +
                "<span class='title'>Title: #: Title #</span>" +
            "</td>" +
            "<td class='country'>" +
                "#: Country #" +
            "</td>" +
            "<td class='employeeID'>" +
                "#: EmployeeID #" +
            "</td>" +
         "</tr>"       
    )
    .ClientAltRowTemplate(
        "<tr class='k-alt' data-uid='#: uid #'>" +
            "<td class='photo'>" +
                "<img src='" + Url.Content("~/Content/web/Employees/") + "#:data.EmployeeID#.jpg' alt='#: data.EmployeeID #' />" +
            "</td>" +
            "<td class='details'>" +
                "<span class='name'>#: FirstName# #: LastName#</span>" +
                "<span class='title'>Title: #: Title #</span>" +
            "</td>" +
            "<td class='country'>" +
                "#: Country #" +
            "</td>" +
            "<td class='employeeID'>" +
                "#: EmployeeID #" +
            "</td>" +
            "</tr>"
    )
    .ToolBar(tools => tools.Pdf())
    .Pdf(pdf => pdf
        .FileName("Kendo UI Grid Export.pdf")
        .ProxyURL(Url.Action("Pdf_Export_Save", "Grid"))
    )
    .DataSource(dataSource => dataSource
        .Ajax()                 
        .Read(read => read.Action("Pdf_Export_Read", "Grid"))
    )
%>

<style>
    .employeeID,
    .country {
        font-size: 50px;
        font-weight: bold;
        color: #898989;
    }
    .name {
        display: block;
        font-size: 1.6em;
    }
    .title {
        display: block;
        padding-top: 1.6em;
    }
    td.photo, .employeeID {
        text-align: center;
    }
    .k-grid-header .k-header {
        padding: 10px 20px;
    }
    .k-grid tr {
        background: -moz-linear-gradient(top,  rgba(0,0,0,0.05) 0%, rgba(0,0,0,0.15) 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0.05)), color-stop(100%,rgba(0,0,0,0.15)));
        background: -webkit-linear-gradient(top,  rgba(0,0,0,0.05) 0%,rgba(0,0,0,0.15) 100%);
        background: -o-linear-gradient(top,  rgba(0,0,0,0.05) 0%,rgba(0,0,0,0.15) 100%);
        background: -ms-linear-gradient(top,  rgba(0,0,0,0.05) 0%,rgba(0,0,0,0.15) 100%);
        background: linear-gradient(to bottom,  rgba(0,0,0,0.05) 0%,rgba(0,0,0,0.15) 100%);
        padding: 20px;
    }
    .k-grid tr.k-alt {
        background: -moz-linear-gradient(top,  rgba(0,0,0,0.2) 0%, rgba(0,0,0,0.1) 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0.2)), color-stop(100%,rgba(0,0,0,0.1)));
        background: -webkit-linear-gradient(top,  rgba(0,0,0,0.2) 0%,rgba(0,0,0,0.1) 100%);
        background: -o-linear-gradient(top,  rgba(0,0,0,0.2) 0%,rgba(0,0,0,0.1) 100%);
        background: -ms-linear-gradient(top,  rgba(0,0,0,0.2) 0%,rgba(0,0,0,0.1) 100%);
        background: linear-gradient(to bottom,  rgba(0,0,0,0.2) 0%,rgba(0,0,0,0.1) 100%);
    }
</style>
</asp:Content>
