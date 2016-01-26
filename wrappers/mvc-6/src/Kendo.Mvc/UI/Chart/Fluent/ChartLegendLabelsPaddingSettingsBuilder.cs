using System;
using System.Collections.Generic;

namespace Kendo.Mvc.UI.Fluent
{
    /// <summary>
    /// Defines the fluent API for configuring ChartLegendLabelsPaddingSettings
    /// </summary>
    public partial class ChartLegendLabelsPaddingSettingsBuilder
        
    {
        public ChartLegendLabelsPaddingSettingsBuilder(ChartLegendLabelsPaddingSettings container)
        {
            Container = container;
        }

        protected ChartLegendLabelsPaddingSettings Container
        {
            get;
            private set;
        }

        // Place custom settings here
    }
}