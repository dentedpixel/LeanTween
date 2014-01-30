package global {
	
	import System.Enum;
	import System.Type;
	
	public final class EventListenersScatteredCS_MyEvents extends Enum {
		
		public static const CHANGE_COLOR: EventListenersScatteredCS_MyEvents = new EventListenersScatteredCS_MyEvents("CHANGE_COLOR", 0);
		
		public static const JUMP: EventListenersScatteredCS_MyEvents = new EventListenersScatteredCS_MyEvents("JUMP", 1);
		
		public static const LENGTH: EventListenersScatteredCS_MyEvents = new EventListenersScatteredCS_MyEvents("LENGTH", 2);
		
		public static function ValueOf($value: int): EventListenersScatteredCS_MyEvents {
			switch ($value) {
				case 0:
					return CHANGE_COLOR;
				case 1:
					return JUMP;
				case 2:
					return LENGTH;
			}
			return new EventListenersScatteredCS_MyEvents($value.toString(), $value);
		}
		
		public function EventListenersScatteredCS_MyEvents($name: String, $value: int) {
			super($name, $value);
		}
		
		cil2as static function DefaultValue(): EventListenersScatteredCS_MyEvents {
			return ValueOf(0);
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.EventListenersScatteredCS_MyEvents, {}, Enum.$Type));
		}
		
		public static var _$Type: Type;
	}
}
