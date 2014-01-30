package global {
	
	import System.Enum;
	import System.Type;
	
	public final class EventListenersScattered_MyEvents extends Enum {
		
		public static const CHANGE_COLOR: EventListenersScattered_MyEvents = new EventListenersScattered_MyEvents("CHANGE_COLOR", 0);
		
		public static const JUMP: EventListenersScattered_MyEvents = new EventListenersScattered_MyEvents("JUMP", 1);
		
		public static const LENGTH: EventListenersScattered_MyEvents = new EventListenersScattered_MyEvents("LENGTH", 2);
		
		public static function ValueOf($value: int): EventListenersScattered_MyEvents {
			switch ($value) {
				case 0:
					return CHANGE_COLOR;
				case 1:
					return JUMP;
				case 2:
					return LENGTH;
			}
			return new EventListenersScattered_MyEvents($value.toString(), $value);
		}
		
		public function EventListenersScattered_MyEvents($name: String, $value: int) {
			super($name, $value);
		}
		
		cil2as static function DefaultValue(): EventListenersScattered_MyEvents {
			return ValueOf(0);
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.EventListenersScattered_MyEvents, {}, Enum.$Type));
		}
		
		public static var _$Type: Type;
	}
}
