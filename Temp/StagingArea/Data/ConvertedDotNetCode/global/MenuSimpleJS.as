package global {
	
	import System.Type;
	import UnityEngine.GUI;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Vector2;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class MenuSimpleJS extends MonoBehaviour implements IDeserializable {
		
		public var MenuSimpleJS$bRect$: LTRect;
		
		public function MenuSimpleJS_Constructor(): MenuSimpleJS {
			this.MonoBehaviour_Constructor();
			this.MenuSimpleJS$bRect$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(Number(0), Number(0), Number(100), Number(50));
			return this;
		}
		
		public function MenuSimpleJS_OnGUI(): void {
			if (GUI.GUI_Button_Rect_String(this.MenuSimpleJS$bRect$.LTRect_rect, "Scale")) {
				LeanTween.LeanTween_scale_LTRect_Vector2_Single(this.MenuSimpleJS$bRect$, Vector2.op_Multiply_Vector2_Single(new Vector2().Constructor_Single_Single(this.MenuSimpleJS$bRect$.LTRect_rect.width, this.MenuSimpleJS$bRect$.LTRect_rect.height), 1.3), 0.25);
			}
		}
		
		public function MenuSimpleJS_Main(): void {
		}
		
		cil2as static function DefaultValue(): MenuSimpleJS {
			return new MenuSimpleJS().MenuSimpleJS_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.MenuSimpleJS, {"OnGUI" : "MenuSimpleJS_OnGUI", "Main" : "MenuSimpleJS_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
