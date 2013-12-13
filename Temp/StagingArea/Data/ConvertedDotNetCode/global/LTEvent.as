package global {
	
	import System.CLIObject;
	import System.Type;
	
	public class LTEvent extends CLIObject {
		
		public var LTEvent$id$: int;
		
		public var LTEvent$data$: Object;
		
		public function LTEvent_Constructor_Int32_Object($id: int, $data: Object): LTEvent {
			this.LTEvent$id$ = $id;
			this.LTEvent$data$ = $data;
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LTEvent, {}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
