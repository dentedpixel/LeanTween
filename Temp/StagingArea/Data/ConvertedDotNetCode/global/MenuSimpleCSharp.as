package global {
	
	import System.Type;
	import UnityEngine.GUI;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Vector2;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class MenuSimpleCSharp extends MonoBehaviour implements IDeserializable {
		
		public var MenuSimpleCSharp$bRect$: LTRect = new LTRect().LTRect_Constructor_Single_Single_Single_Single(0, 0, 100, 50);
		
		public function MenuSimpleCSharp_OnGUI(): void {
			if (GUI.GUI_Button_Rect_String(this.MenuSimpleCSharp$bRect$.LTRect_rect, "Scale")) {
				LeanTween.LeanTween_scale_LTRect_Vector2_Single(this.MenuSimpleCSharp$bRect$, Vector2.op_Multiply_Vector2_Single(new Vector2().Constructor_Single_Single(this.MenuSimpleCSharp$bRect$.LTRect_rect.width, this.MenuSimpleCSharp$bRect$.LTRect_rect.height), 1.3), 0.25);
			}
		}
		
		cil2as static function DefaultValue(): MenuSimpleCSharp {
			return new MenuSimpleCSharp().MenuSimpleCSharp_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function MenuSimpleCSharp_Constructor(): MenuSimpleCSharp {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.MenuSimpleCSharp, {"OnGUI" : "MenuSimpleCSharp_OnGUI"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
