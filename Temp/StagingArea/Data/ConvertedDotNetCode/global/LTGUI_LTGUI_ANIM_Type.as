package global {
	
	import System.Enum;
	import System.Type;
	
	public final class LTGUI_LTGUI_ANIM_Type extends Enum {
		
		public static const Texture: LTGUI_LTGUI_ANIM_Type = new LTGUI_LTGUI_ANIM_Type("Texture", 0);
		
		public static const Label: LTGUI_LTGUI_ANIM_Type = new LTGUI_LTGUI_ANIM_Type("Label", 1);
		
		public static function ValueOf($value: int): LTGUI_LTGUI_ANIM_Type {
			switch ($value) {
				case 0:
					return Texture;
				case 1:
					return Label;
			}
			return new LTGUI_LTGUI_ANIM_Type($value.toString(), $value);
		}
		
		public function LTGUI_LTGUI_ANIM_Type($name: String, $value: int) {
			super($name, $value);
		}
		
		cil2as static function DefaultValue(): LTGUI_LTGUI_ANIM_Type {
			return ValueOf(0);
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LTGUI_LTGUI_ANIM_Type, {}, Enum.$Type));
		}
		
		public static var _$Type: Type;
	}
}
