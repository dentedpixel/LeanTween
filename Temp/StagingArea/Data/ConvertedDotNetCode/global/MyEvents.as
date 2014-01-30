package global {
	
	import System.Enum;
	import System.Type;
	
	public final class MyEvents extends Enum {
		
		public static const CHANGE_COLOR: MyEvents = new MyEvents("CHANGE_COLOR", 0);
		
		public static const JUMP: MyEvents = new MyEvents("JUMP", 1);
		
		public static const LENGTH: MyEvents = new MyEvents("LENGTH", 2);
		
		public static function ValueOf($value: int): MyEvents {
			switch ($value) {
				case 0:
					return CHANGE_COLOR;
				case 1:
					return JUMP;
				case 2:
					return LENGTH;
			}
			return new MyEvents($value.toString(), $value);
		}
		
		public function MyEvents($name: String, $value: int) {
			super($name, $value);
		}
		
		cil2as static function DefaultValue(): MyEvents {
			return ValueOf(0);
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.MyEvents, {}, Enum.$Type));
		}
		
		public static var _$Type: Type;
	}
}
