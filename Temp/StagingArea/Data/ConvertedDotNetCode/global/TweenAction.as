package global {
	
	import System.Enum;
	import System.Type;
	
	public final class TweenAction extends Enum {
		
		public static const MOVE_X: TweenAction = new TweenAction("MOVE_X", 0);
		
		public static const MOVE_Y: TweenAction = new TweenAction("MOVE_Y", 1);
		
		public static const MOVE_Z: TweenAction = new TweenAction("MOVE_Z", 2);
		
		public static const MOVE_LOCAL_X: TweenAction = new TweenAction("MOVE_LOCAL_X", 3);
		
		public static const MOVE_LOCAL_Y: TweenAction = new TweenAction("MOVE_LOCAL_Y", 4);
		
		public static const MOVE_LOCAL_Z: TweenAction = new TweenAction("MOVE_LOCAL_Z", 5);
		
		public static const MOVE_CURVED: TweenAction = new TweenAction("MOVE_CURVED", 6);
		
		public static const MOVE_CURVED_LOCAL: TweenAction = new TweenAction("MOVE_CURVED_LOCAL", 7);
		
		public static const SCALE_X: TweenAction = new TweenAction("SCALE_X", 8);
		
		public static const SCALE_Y: TweenAction = new TweenAction("SCALE_Y", 9);
		
		public static const SCALE_Z: TweenAction = new TweenAction("SCALE_Z", 10);
		
		public static const ROTATE_X: TweenAction = new TweenAction("ROTATE_X", 11);
		
		public static const ROTATE_Y: TweenAction = new TweenAction("ROTATE_Y", 12);
		
		public static const ROTATE_Z: TweenAction = new TweenAction("ROTATE_Z", 13);
		
		public static const ROTATE_AROUND: TweenAction = new TweenAction("ROTATE_AROUND", 14);
		
		public static const ALPHA: TweenAction = new TweenAction("ALPHA", 15);
		
		public static const ALPHA_VERTEX: TweenAction = new TweenAction("ALPHA_VERTEX", 16);
		
		public static const CALLBACK: TweenAction = new TweenAction("CALLBACK", 17);
		
		public static const MOVE: TweenAction = new TweenAction("MOVE", 18);
		
		public static const MOVE_LOCAL: TweenAction = new TweenAction("MOVE_LOCAL", 19);
		
		public static const ROTATE: TweenAction = new TweenAction("ROTATE", 20);
		
		public static const ROTATE_LOCAL: TweenAction = new TweenAction("ROTATE_LOCAL", 21);
		
		public static const SCALE: TweenAction = new TweenAction("SCALE", 22);
		
		public static const VALUE3: TweenAction = new TweenAction("VALUE3", 23);
		
		public static const GUI_MOVE: TweenAction = new TweenAction("GUI_MOVE", 24);
		
		public static const GUI_SCALE: TweenAction = new TweenAction("GUI_SCALE", 25);
		
		public static const GUI_ALPHA: TweenAction = new TweenAction("GUI_ALPHA", 26);
		
		public static const GUI_ROTATE: TweenAction = new TweenAction("GUI_ROTATE", 27);
		
		public static function ValueOf($value: int): TweenAction {
			switch ($value) {
				case 0:
					return MOVE_X;
				case 1:
					return MOVE_Y;
				case 2:
					return MOVE_Z;
				case 3:
					return MOVE_LOCAL_X;
				case 4:
					return MOVE_LOCAL_Y;
				case 5:
					return MOVE_LOCAL_Z;
				case 6:
					return MOVE_CURVED;
				case 7:
					return MOVE_CURVED_LOCAL;
				case 8:
					return SCALE_X;
				case 9:
					return SCALE_Y;
				case 10:
					return SCALE_Z;
				case 11:
					return ROTATE_X;
				case 12:
					return ROTATE_Y;
				case 13:
					return ROTATE_Z;
				case 14:
					return ROTATE_AROUND;
				case 15:
					return ALPHA;
				case 16:
					return ALPHA_VERTEX;
				case 17:
					return CALLBACK;
				case 18:
					return MOVE;
				case 19:
					return MOVE_LOCAL;
				case 20:
					return ROTATE;
				case 21:
					return ROTATE_LOCAL;
				case 22:
					return SCALE;
				case 23:
					return VALUE3;
				case 24:
					return GUI_MOVE;
				case 25:
					return GUI_SCALE;
				case 26:
					return GUI_ALPHA;
				case 27:
					return GUI_ROTATE;
			}
			return new TweenAction($value.toString(), $value);
		}
		
		public function TweenAction($name: String, $value: int) {
			super($name, $value);
		}
		
		cil2as static function DefaultValue(): TweenAction {
			return ValueOf(0);
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.TweenAction, {}, Enum.$Type));
		}
		
		public static var _$Type: Type;
	}
}
