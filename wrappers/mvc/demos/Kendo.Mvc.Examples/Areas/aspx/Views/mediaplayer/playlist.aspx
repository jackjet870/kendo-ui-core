﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" 
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.Video>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section k-content" style="width: 925px; max-width: none">
    <%= Html.Kendo().MediaPlayer()
        .Name("mediaPlayer")
        .AutoPlay(true)
        .HtmlAttributes(new { style = "height:360px; width:640px" })
    %>

    <div class="k-list-container playlist">
        <%= Html.Kendo().ListView<Kendo.Mvc.Examples.Models.Video>(Model)
            .Name("listView")
            .TagName("ul")
            .ClientTemplateId("template")
            .DataSource(dataSource => dataSource
                    .ServerOperation(false)
                )
            .Selectable()
            .Events(e => e
                .Change("onChange")
                .DataBound("onDataBound"))
        %>
    </div>
</div>

<script>
    function onChange() {
        var index = this.select().index();
        var dataItem = this.dataSource.view()[index];
        $("#mediaPlayer").data("kendoMediaPlayer").media(dataItem);
    }

    function onDataBound() {
        this.select(this.element.children().first());
    }
</script>

<script type="text/x-kendo-template" id="template">
    <li class="k-item k-state-default" onmouseover="$(this).addClass('k-state-hover')"
        onmouseout="$(this).removeClass('k-state-hover')">
        <span>
            <img src="#:poster#" />
            <h4>#:title#</h4>
        </span>
    </li>
</script>

<style>
    .k-mediaplayer {
        float: left;
    }
    .playlist {
        float: left;
        width: 280px;
        height: 360px;
        overflow: auto;
    }
    .playlist ul, .playlist li {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }
    .playlist .k-item {
        border-bottom-style: solid;
        border-bottom-width: 1px;
        padding: 14px 15px;
    }
    .playlist .k-item:last-child {
        border-bottom-width: 0;
    }
    .playlist span {
        cursor: pointer;
        display: block;
        overflow: hidden;
        text-decoration: none;
    }
    .playlist span img {
        border: 0 none;
        display: block;
        height: 56px;
        object-fit: cover;
        width: 100px;
        float: left;
    }
    .playlist h4 {
        display: block;
        font-weight: normal;
        margin: 0;
        overflow: hidden;
        padding-left: 10px;
        text-align: left;
    }
</style>
</asp:Content>







