﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.ProductViewModel>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/x-kendo-tmpl" id="template">
        <div class="product">
            <img src="<%:Url.Content("~/content/web/foods/")%>#:ProductID#.jpg" alt="#:ProductName# image" />
            <h3>#:ProductName#</h3>
            <p>#:kendo.toString(UnitPrice, "c")#</p>
        </div>
    </script>

    <div class="demo-section">
    <%:Html.Kendo().ListView<Kendo.Mvc.Examples.Models.ProductViewModel>(Model)
        .Name("listView")
        .TagName("div")
        .ClientTemplateId("template")
        .DataSource(dataSource => {
            dataSource.Read(read => read.Action("Products_Read", "ListView"));
            dataSource.PageSize(15);
        })
        .Pageable()
    %>

    <%:Html.Kendo().Sortable()
        .For("#listView")
        .Filter(">div.product")
        .Cursor("move")
        .PlaceholderHandler("placeholder")
        .HintHandler("hint")
        .Events(events => events.Change("onChange"))
    %>
    </div>

    <script>
        function placeholder(element) {
            return element.clone().css("opacity", 0.1);
        }

        function hint(element) {
            return element.clone().removeClass("k-state-selected");
        }

        function onChange(e) {
            var listView = $("#listView").data("kendoListView"),
                dataSource = listView.dataSource,
                skip = dataSource.skip(),
                oldIndex = e.oldIndex + skip,
                newIndex = e.newIndex + skip,
                data = dataSource.data(),
                dataItem = dataSource.getByUid(e.item.data("uid"));

            dataSource.remove(dataItem);
            dataSource.insert(newIndex, dataItem);
        }
    </script>

    <style>
        .demo-section {
            padding: 30px;
            width: 577px;
        }

        #listView {
            padding: 10px;
            margin-bottom: -1px;
            min-width: 555px;
            min-height: 510px;
        }

        .product {
            float: left;
            position: relative;
            width: 111px;
            height: 170px;
            margin: 0;
            padding: 0;
            cursor: move;
        }

        .product img {
            width: 110px;
            height: 110px;
        }

        .product h3 {
            margin: 0;
            padding: 3px 5px 0 0;
	        max-width: 96px;
	        overflow: hidden;
            line-height: 1.1em;
            font-size: .9em;
            font-weight: normal;
            text-transform: uppercase;
            color: #999;
        }

        .product p {
            visibility: hidden;
        }

        .product:hover p {
            visibility: visible;
            position: absolute;
            width: 110px;
            height: 110px;
            top: 0;
            margin: 0;
            padding: 0;
            line-height: 110px;
            vertical-align: middle;
            text-align: center;
            color: #fff;
            background-color: rgba(0,0,0,0.75);
            transition: background .2s linear, color .2s linear;
            -moz-transition: background .2s linear, color .2s linear;
            -webkit-transition: background .2s linear, color .2s linear;
            -o-transition: background .2s linear, color .2s linear;
        }

        .k-listview:after, .product dl:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>

</asp:Content>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>