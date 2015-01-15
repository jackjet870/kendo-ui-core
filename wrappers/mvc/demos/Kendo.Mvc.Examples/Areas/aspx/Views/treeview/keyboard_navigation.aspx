<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section">
    <%: Html.Kendo().TreeView()
            .Name("treeview")
            .HtmlAttributes(new { tabindex = "1", accesskey = "w" })
            .Items(treeview =>
            {
                treeview.Add().Text("Furniture")
                    .Items(root =>
                    {
                        root.Add().Text("Tables & Chairs");
                        root.Add().Text("Sofas");
                        root.Add().Text("Occasional Furniture");
                        root.Add().Text("Childerns Furniture");
                        root.Add().Text("Beds");
                    });

                treeview.Add().Text("Decor")
                    .Expanded(true)
                    .Items(root =>
                    {
                        root.Add().Text("Bed Linen");
                        root.Add().Text("Throws");
                        root.Add().Text("Curtains & Blinds");
                        root.Add().Text("Rugs");
                        root.Add().Text("Carpets");
                    });

                treeview.Add().Text("Storage")
                    .Items(root =>
                    {
                        root.Add().Text("Wall Shelving");
                        root.Add().Text("Kids Storage");
                        root.Add().Text("Baskets");
                        root.Add().Text("Multimedia Storage");
                        root.Add().Text("Floor Shelving");
                        root.Add().Text("Toilet Roll Holders");
                        root.Add().Text("Storage Jars");
                        root.Add().Text("Drawers");
                        root.Add().Text("Boxes");
                    });
            })
    %>
</div>

<ul class="keyboard-legend">
    <li>
        <span class="button-preview">
            <span class="key-button leftAlign wider">Alt</span>
            +
            <span class="key-button">w</span>
        </span>
        <span class="button-descr">
            focuses the widget
        </span>
    </li>
</ul>

<ul class="keyboard-legend">
    <li>
        <span class="button-preview">
            <span class="key-button wider leftAlign">up arrow</span>
        </span>
        <span class="button-descr">
            highlights previous item
        </span>
    </li>
    <li>
        <span class="button-preview">
            <span class="key-button wider leftAlign">left arrow</span>
        </span>
        <span class="button-descr">
            collapses the item
        </span>
    </li>
    <li>
        <span class="button-preview">
            <span class="key-button wider leftAlign">down arrow</span>
        </span>
        <span class="button-descr">
            highlights next item
        </span>
    </li>
    <li>
        <span class="button-preview">
            <span class="key-button wider leftAlign">right arrow</span>
        </span>
        <span class="button-descr">
            expands the item
        </span>
    </li>
    <li>
        <span class="button-preview">
            <span class="key-button">home</span>
        </span>
        <span class="button-descr">
            highlights first item in the list
        </span>
    </li>
    <li>
        <span class="button-preview">
            <span class="key-button">end</span>
        </span>
        <span class="button-descr">
            highlights last item in the list
        </span>
    </li>
    <li>
        <span class="button-preview">
            <span class="key-button wider rightAlign">enter</span>
        </span>
        <span class="button-descr">
            selects highlighted item
        </span>
    </li>
</ul>

<script>
    $(document).ready(function () {
        //focus the widget
        $(document).on("keydown.examples", function (e) {
            if (e.altKey && e.keyCode === 87 /* w */) {
                $("#treeview").data("kendoTreeView").wrapper.focus();
            }
        });
    });
</script>

<style>
    .demo-section {
        width: 200px;
    }
</style>
</asp:Content>