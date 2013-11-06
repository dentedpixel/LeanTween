package global {
	
	import System.CLIArrayFactory;
	import System.CLIObject;
	import System.StringOperations;
	import System.Type;
	import System.Collections.Hashtable;
	import UnityEngine.AnimationCurve;
	import UnityEngine.Transform;
	import UnityEngine.Vector3;
	
	public class LeanTweenDescr extends CLIObject {
		
		public var LeanTweenDescr$toggle$: Boolean;
		
		public var LeanTweenDescr$trans$: Transform;
		
		public var LeanTweenDescr$ltRect$: LTRect;
		
		public var LeanTweenDescr$from$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LeanTweenDescr$to$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LeanTweenDescr$diff$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LeanTweenDescr$path$: LTBezierPath;
		
		public var LeanTweenDescr$time$: Number = 0;
		
		public var LeanTweenDescr$useEstimatedTime$: Boolean;
		
		public var LeanTweenDescr$useFrames$: Boolean;
		
		public var LeanTweenDescr$hasInitiliazed$: Boolean;
		
		public var LeanTweenDescr$hasPhysics$: Boolean;
		
		public var LeanTweenDescr$passed$: Number = 0;
		
		public var LeanTweenDescr$type$: TweenAction = TweenAction.cil2as::DefaultValue();
		
		public var LeanTweenDescr$optional$: Hashtable;
		
		public var LeanTweenDescr$delay$: Number = 0;
		
		public var LeanTweenDescr$tweenFunc$: String;
		
		public var LeanTweenDescr$tweenType$: LeanTweenType = LeanTweenType.cil2as::DefaultValue();
		
		public var LeanTweenDescr$animationCurve$: AnimationCurve;
		
		public var LeanTweenDescr$id$: int;
		
		public var LeanTweenDescr$loopType$: LeanTweenType = LeanTweenType.cil2as::DefaultValue();
		
		public var LeanTweenDescr$loopCount$: int;
		
		public var LeanTweenDescr$direction$: Number = 0;
		
		public function LeanTweenDescr_TweenToString(): String {
			return StringOperations.String_Concat_ObjectArray(CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "gameObject:", this.LeanTweenDescr$trans$.Component_gameObject, " toggle:", this.LeanTweenDescr$toggle$, " passed:", this.LeanTweenDescr$passed$, " time:", this.LeanTweenDescr$time$, " delay:", this.LeanTweenDescr$delay$, " from:", this.LeanTweenDescr$from$.cil2as::Copy(), " to:", this.LeanTweenDescr$to$.cil2as::Copy(), " type:", this.LeanTweenDescr$type$, " useEstimatedTime:", this.LeanTweenDescr$useEstimatedTime$, " id:", this.LeanTweenDescr$id$));
		}
		
		public function LeanTweenDescr_Constructor(): LeanTweenDescr {
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LeanTweenDescr, {"TweenToString" : "LeanTweenDescr_TweenToString"}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
