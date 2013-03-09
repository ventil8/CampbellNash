using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using umbraco.BusinessLogic;
using umbraco.cms.businesslogic;
using umbraco.cms.businesslogic.media;
using umbraco.cms.businesslogic.web;

namespace Umbraco.Extensions.EventHandlers
{
    public class RefreshOnUpload : ApplicationBase
    {
        public RefreshOnUpload()
        {
            CMSNode.AfterSave += RedirectIfNeeded;
        }

        private static void RedirectIfNeeded(object sender, SaveEventArgs e)
        {
            if (sender is Document == false && sender is Media == false) return;

            //Check if image cropper is specified on this document type
            var hasImageCropper = false;

            if (sender is Document)
            {
                var doc = sender as Document;

                foreach (var p in doc.GenericProperties.Where(p => p.PropertyType.DataTypeDefinition.DataType.ToString() == "umbraco.editorControls.imagecropper.DataType"))
                    hasImageCropper = true;
            }

            if (sender is Media)
            {
                var media = sender as Media;

                foreach (var p in media.GenericProperties.Where(p => p.PropertyType.DataTypeDefinition.DataType.ToString() == "umbraco.editorControls.imagecropper.DataType"))
                    hasImageCropper = true;
            }

            if (hasImageCropper == false) return;

            //Have files been uploaded?
            if (HttpContext.Current.Request.Files.Count == 0) return;
            if (string.IsNullOrEmpty(HttpContext.Current.Request.Files[0].FileName)) return;

            //If we have gotten this far, a file is being uploaded, make sure there is a redirect!
            if (((Page)HttpContext.Current.Handler).Items.Contains("RedirectUrl"))
                ((Page)HttpContext.Current.Handler).Items.Remove("RedirectUrl");

            ((Page)HttpContext.Current.Handler).Items.Add("RedirectUrl", HttpContext.Current.Request.Url.ToString());
            ((Page)HttpContext.Current.Handler).PreRender += PreRender;
        }

        private static void PreRender(object sender, EventArgs e)
        {
            if (((Page)HttpContext.Current.Handler).Items.Contains("RedirectUrl") && !string.IsNullOrEmpty((string)((Page)HttpContext.Current.Handler).Items["RedirectUrl"]))
                HttpContext.Current.Response.Redirect((string)((Page)HttpContext.Current.Handler).Items["RedirectUrl"]);
        }
    }
}
