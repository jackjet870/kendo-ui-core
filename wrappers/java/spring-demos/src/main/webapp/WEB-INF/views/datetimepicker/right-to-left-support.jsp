<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<demo:header />
    <div class="demo-section">
	    <div class="k-rtl">
	        <label for="datetimepicker">Choose date:</label>
	        <kendo:dateTimePicker name="datetimepicker"></kendo:dateTimePicker>
	    </div>
    </div>
    <style>
        .demo-section {
            width: 400px;
            text-align: center;
            margin: 50px auto;
            padding-top: 50px;
            padding-bottom: 50px;
        }
    </style>    
<demo:footer />