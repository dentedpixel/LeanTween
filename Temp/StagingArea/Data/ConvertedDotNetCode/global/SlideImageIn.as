package global {
	
	import System.CLIArrayFactory;
	import System.Type;
	import UnityEngine.GUI;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Screen;
	import UnityEngine.Texture2D;
	import UnityEngine.Vector2;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class SlideImageIn extends MonoBehaviour implements IDeserializable {
		
		public var SlideImageIn$grumpy$: Texture2D;
		
		public var SlideImageIn$grumpyRect$: LTRect;
		
		public function SlideImageIn_Start(): void {
			this.SlideImageIn$grumpyRect$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(Number(-Number(this.SlideImageIn$grumpy$.Texture_width)), (0.5 * Number(Screen.height)) - (Number(this.SlideImageIn$grumpy$.Texture_height) / 2), Number(this.SlideImageIn$grumpy$.Texture_width), Number(this.SlideImageIn$grumpy$.Texture_height));
			LeanTween.LeanTween_move_LTRect_Vector3_Single_ObjectArray(this.SlideImageIn$grumpyRect$, Vector2.op_Implicit_Vector2_Vector3(new Vector2().Constructor_Single_Single((0.5 * Number(Screen.width)) - (Number(this.SlideImageIn$grumpy$.Texture_width) / 2), this.SlideImageIn$grumpyRect$.LTRect_rect.y)), 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTween.LeanTween_easeOutQuad_Single_Single_Single));
		}
		
		public function SlideImageIn_OnGUI(): void {
			GUI.GUI_DrawTexture_Rect_Texture(this.SlideImageIn$grumpyRect$.LTRect_rect, this.SlideImageIn$grumpy$);
		}
		
		public function SlideImageIn_Main(): void {
		}
		
		cil2as static function DefaultValue(): SlideImageIn {
			return new SlideImageIn().SlideImageIn_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.SlideImageIn$grumpy$ = reader.ReadUnityEngineObject() as Texture2D;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteUnityEngineObject(this.SlideImageIn$grumpy$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.SlideImageIn$grumpy$ = remapper.GetNewInstanceToReplaceOldInstance(this.SlideImageIn$grumpy$) as Texture2D;
		}
		
		public function SlideImageIn_Constructor(): SlideImageIn {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.SlideImageIn, {"Start" : "SlideImageIn_Start", "OnGUI" : "SlideImageIn_OnGUI", "Main" : "SlideImageIn_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
