
package com.kendoui.taglib.sparkline;


import com.kendoui.taglib.BaseTag;



import com.kendoui.taglib.SparklineTag;




import javax.servlet.jsp.JspException;

@SuppressWarnings("serial")
public class PlotAreaTag extends  BaseTag  /* interfaces */ /* interfaces */ {
    
    @Override
    public int doEndTag() throws JspException {
//>> doEndTag


        SparklineTag parent = (SparklineTag)findParentWithClass(SparklineTag.class);


        parent.setPlotArea(this);

//<< doEndTag

        return super.doEndTag();
    }

    @Override
    public void initialize() {
//>> initialize
//<< initialize

        super.initialize();
    }

    @Override
    public void destroy() {
//>> destroy
//<< destroy

        super.destroy();
    }

//>> Attributes

    public static String tagName() {
        return "sparkline-plotArea";
    }

    public void setBorder(com.kendoui.taglib.sparkline.PlotAreaBorderTag value) {
        setProperty("border", value);
    }

    public java.lang.String getBackground() {
        return (java.lang.String)getProperty("background");
    }

    public void setBackground(java.lang.String value) {
        setProperty("background", value);
    }

    public java.lang.Object getMargin() {
        return (java.lang.Object)getProperty("margin");
    }

    public void setMargin(java.lang.Object value) {
        setProperty("margin", value);
    }

    public float getOpacity() {
        return (Float)getProperty("opacity");
    }

    public void setOpacity(float value) {
        setProperty("opacity", value);
    }

//<< Attributes

}