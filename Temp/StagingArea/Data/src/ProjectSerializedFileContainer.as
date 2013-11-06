
package
{
        import flash.utils.ByteArray;
        import flash.utils.Dictionary;
        import flash.utils.Endian;
        import UnityEngine.*;
		import com.unity.SerializedFileContainer;

        public class ProjectSerializedFileContainer extends SerializedFileContainer
        {
                
        [Embed("/Users/rsavage/Sites/DentedPixel.com/AssetStore/LeanTween/LeanTween/Temp/StagingArea/Data/mainData_txt", mimeType="application/octet-stream")]
        private var mainData:Class;

        [Embed("/Users/rsavage/Sites/DentedPixel.com/AssetStore/LeanTween/LeanTween/Temp/StagingArea/Data/Resources/unity default resources_txt", mimeType="application/octet-stream")]
        private var Resources_unity_default_resources:Class;

        [Embed("/Users/rsavage/Sites/DentedPixel.com/AssetStore/LeanTween/LeanTween/Temp/StagingArea/Data/sharedassets0.assets_txt", mimeType="application/octet-stream")]
        private var sharedassets0_assets:Class;

     
       public function ProjectSerializedFileContainer()
       {
              files = new Dictionary();
files["mainData"] = new mainData() as ByteArray
fileSizes["mainData"] = 14664
files["Resources/unity default resources"] = new Resources_unity_default_resources() as ByteArray
fileSizes["Resources/unity default resources"] = 2417517
files["sharedassets0.assets"] = new sharedassets0_assets() as ByteArray
fileSizes["sharedassets0.assets"] = 34776
}	}
}
