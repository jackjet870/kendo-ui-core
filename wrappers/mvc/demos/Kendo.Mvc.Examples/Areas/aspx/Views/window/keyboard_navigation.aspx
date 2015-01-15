<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<% Html.Kendo().Window()
    .Name("window")    
    .Title("About Alvar Aalto")
    .Content(() => 
    {
        %>
        <p>
            Alvar Aalto is one of the greatest names in modern architecture and design.
            Glassblowers at the iittala factory still meticulously handcraft the legendary
            vases that are variations on one theme, fluid organic shapes that let the end user 
            decide the use. Interpretations of the shape in new colors and materials add to the
            growing Alvar Aalto Collection that remains true to his original design.
        </p>

        <p>
            Born Hugo Alvar Henrik Aalto (February 3, 1898 - May 11, 1976) in Kuortane, Finland,
            was noted for his humanistic approach to modernism. He studied architecture at the
            Helsinki University of Technology from 1916 to 1921. In 1924 he married architect
            Aino Marsio.
        </p>

        <p>
            Alvar Aalto was one of the first and most influential architects of the Scandinavian
            modern movement, and a member of the Congres Internationaux d'Architecture Moderne.
            Major architectural works include the Finlandia Hall in Helsinki, Finland,
            and the campus of Helsinki University of Technology.
        </p>
        <%
    })
    .Draggable()
    .Resizable()
    .Width(600)
    .Events(ev => ev.Close("onClose"))
    .Render();
%>

<span id="undo" style="display:none" class="k-button">Click here to open the window.</span>

<div class="keyboard-nav">
    <ul class="keyboard-legend">
        <li>
            <span class="button-preview">
                <span class="key-button leftAlign wider">Alt</span>
                <span class="key-button">w</span>
            </span>
            <span class="button-descr">
                focuses first splitbar
            </span>
        </li>
    </ul>

    <ul class="keyboard-legend">
        <li>
            <span class="button-preview">
                <span class="key-button">esc</span>
            </span>
            <span class="button-descr">
                closes window
            </span>
        </li>
        <li>
            <span class="button-preview">
                <span class="key-button wider leftAlign">left arrow</span>
            </span>
            <span class="button-descr">
                moves window to the left
            </span>
        </li>
        <li>
            <span class="button-preview">
                <span class="key-button wider leftAlign">right arrow</span>
            </span>
            <span class="button-descr">
                moves window to the right
            </span>
        </li>
        <li>
            <span class="button-preview">
                <span class="key-button wider leftAlign">up arrow</span>
            </span>
            <span class="button-descr">
                moves window up
            </span>
        </li>
        <li>
            <span class="button-preview">
                <span class="key-button wider leftAlign">down arrow</span>
            </span>
            <span class="button-descr">
                moves window down
            </span>
        </li>
        <li>
            <span class="button-preview">
                <span class="key-button">ctrl</span>
                <span class="key-button wider leftAlign">left arrow</span>
            </span>
            <span class="button-descr">
                narrows window in horizontal direction
            </span>
        </li>
        <li>
            <span class="button-preview">
                <span class="key-button">ctrl</span>
                <span class="key-button wider leftAlign">right arrow</span>
            </span>
            <span class="button-descr">
                expands window in horizontal direction
            </span>
        </li>
        <li>
            <span class="button-preview">
                <span class="key-button">ctrl</span>
                <span class="key-button wider leftAlign">down arrow</span>
            </span>
            <span class="button-descr">
                expands window in vertical direction
            </span>
        </li>
        <li>
            <span class="button-preview">
                <span class="key-button">ctrl</span>
                <span class="key-button wider leftAlign">up arrow</span>
            </span>
            <span class="button-descr">
                narrows window in vertical direction
            </span>
        </li>
    </ul>
</div>

<script>
    function onClose() {
        $("#undo").show();
    }

    $(document).ready(function () {
        $("#undo").bind("click", function () {
            $("#window").data("kendoWindow").open();
            $("#undo").hide();
        });
    });

    //focus the widget
    $(document).on("keydown.examples", function (e) {
        if (e.altKey && e.keyCode === 87 /* w */) {
            $("#window").focus();
        }
    });
</script>

<style>
    #example
    {
        min-height:500px;
    }

    #undo
    {
        position: absolute;
    }

    .keyboard-nav
    {
        margin-top: 350px;
    }

    .button-container
    {
        position: absolute;
    }
</style>
</asp:Content>