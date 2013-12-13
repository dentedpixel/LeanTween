package global {
	
	import System.CLIArrayFactory;
	import System.CLIObject;
	import System.StringOperations;
	import System.Type;
	import System.Collections.Hashtable;
	import UnityEngine._Object;
	import UnityEngine.AnimationCurve;
	import UnityEngine.Rect;
	import UnityEngine.Transform;
	import UnityEngine.Vector3;
	
	public class LTDescr extends CLIObject {
		
		public var LTDescr$toggle$: Boolean;
		
		public var LTDescr$trans$: Transform;
		
		public var LTDescr$ltRect$: LTRect;
		
		public var LTDescr$from$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTDescr$to$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTDescr$diff$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTDescr$point$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTDescr$axis$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTDescr$origRotation$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTDescr$path$: LTBezierPath;
		
		public var LTDescr$time$: Number = 0;
		
		public var LTDescr$lastVal$: Number = 0;
		
		public var LTDescr$useEstimatedTime$: Boolean;
		
		public var LTDescr$useFrames$: Boolean;
		
		public var LTDescr$hasInitiliazed$: Boolean;
		
		public var LTDescr$hasPhysics$: Boolean;
		
		public var LTDescr$passed$: Number = 0;
		
		public var LTDescr$type$: TweenAction = TweenAction.cil2as::DefaultValue();
		
		public var LTDescr$optional$: Hashtable;
		
		public var LTDescr$delay$: Number = 0;
		
		public var LTDescr$tweenType$: LeanTweenType = LeanTweenType.cil2as::DefaultValue();
		
		public var LTDescr$animationCurve$: AnimationCurve;
		
		public var LTDescr$_id$: int;
		
		public var LTDescr$loopType$: LeanTweenType = LeanTweenType.cil2as::DefaultValue();
		
		public var LTDescr$loopCount$: int;
		
		public var LTDescr$direction$: Number = 0;
		
		public var LTDescr$onUpdateFloat$: Function;
		
		public var LTDescr$onUpdateFloatObject$: Function;
		
		public var LTDescr$onUpdateVector3$: Function;
		
		public var LTDescr$onComplete$: Function;
		
		public var LTDescr$onCompleteObject$: Function;
		
		public var LTDescr$onCompleteParam$: Object;
		
		public var LTDescr$onUpdateParam$: Object;
		
		public function get LTDescr_uniqueId(): int {
			return this.LTDescr$_id$ | ((this.LTDescr$type$.value << 24) as int);
		}
		
		public function get LTDescr_id(): int {
			return this.LTDescr_uniqueId;
		}
		
		override public function toString(): String {
			return StringOperations.String_Concat_ObjectArray(CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), !_Object.Object_op_Inequality_Object_Object(this.LTDescr$trans$, null) ? "gameObject:null" : ("gameObject:" + this.LTDescr$trans$.Component_gameObject), " toggle:", this.LTDescr$toggle$, " passed:", this.LTDescr$passed$, " time:", this.LTDescr$time$, " delay:", this.LTDescr$delay$, " from:", this.LTDescr$from$.cil2as::Copy(), " to:", this.LTDescr$to$.cil2as::Copy(), " type:", this.LTDescr$type$, " useEstimatedTime:", this.LTDescr$useEstimatedTime$, " id:", this.LTDescr_id));
		}
		
		public function LTDescr_cancel(): LTDescr {
			LeanTween.LeanTween_removeTween_Int32(this.LTDescr$_id$);
			return this;
		}
		
		public function LTDescr_reset(): void {
			this.LTDescr$toggle$ = true;
			this.LTDescr$optional$ = null;
			this.LTDescr$passed$ = this.LTDescr$delay$ = 0;
			this.LTDescr$useEstimatedTime$ = this.LTDescr$useFrames$ = this.LTDescr$hasInitiliazed$ = false;
			this.LTDescr$animationCurve$ = null;
			this.LTDescr$tweenType$ = LeanTweenType.linear;
			this.LTDescr$loopType$ = LeanTweenType.once;
			this.LTDescr$direction$ = 1;
			this.LTDescr$onUpdateFloat$ = null;
			this.LTDescr$onUpdateVector3$ = null;
			this.LTDescr$onUpdateFloatObject$ = null;
			this.LTDescr$onComplete$ = null;
			this.LTDescr$onCompleteObject$ = null;
			this.LTDescr$onCompleteParam$ = null;
			this.LTDescr$point$.cil2as::Assign(Vector3.zero);
		}
		
		public function LTDescr_pause(): LTDescr {
			this.LTDescr$lastVal$ = this.LTDescr$direction$;
			this.LTDescr$direction$ = 0;
			return this;
		}
		
		public function LTDescr_resume(): LTDescr {
			this.LTDescr$direction$ = this.LTDescr$lastVal$;
			return this;
		}
		
		public function LTDescr_setAxis_Vector3($axis: Vector3): LTDescr {
			this.LTDescr$axis$.cil2as::Assign($axis);
			return this;
		}
		
		public function LTDescr_setDelay_Single($delay: Number): LTDescr {
			this.LTDescr$delay$ = $delay;
			return this;
		}
		
		public function LTDescr_setEase_LeanTweenType($easeType: LeanTweenType): LTDescr {
			this.LTDescr$tweenType$ = $easeType;
			return this;
		}
		
		public function LTDescr_setEase_AnimationCurve($easeCurve: AnimationCurve): LTDescr {
			this.LTDescr$animationCurve$ = $easeCurve;
			return this;
		}
		
		public function LTDescr_setFrom_Vector3($from: Vector3): LTDescr {
			this.LTDescr$from$.cil2as::Assign($from);
			return this;
		}
		
		public function LTDescr_setId_Int32($id: int): LTDescr {
			this.LTDescr$_id$ = $id;
			return this;
		}
		
		public function LTDescr_setRepeat_Int32($repeat: int): LTDescr {
			this.LTDescr$loopCount$ = $repeat;
			if (($repeat > 1) && (this.LTDescr$loopType$ == LeanTweenType.once)) {
				this.LTDescr$loopType$ = LeanTweenType.clamp;
			}
			return this;
		}
		
		public function LTDescr_setLoopType_LeanTweenType($loopType: LeanTweenType): LTDescr {
			this.LTDescr$loopType$ = $loopType;
			return this;
		}
		
		public function LTDescr_setUseEstimatedTime_Boolean($useEstimatedTime: Boolean): LTDescr {
			this.LTDescr$useEstimatedTime$ = $useEstimatedTime;
			return this;
		}
		
		public function LTDescr_setUseFrames_Boolean($useFrames: Boolean): LTDescr {
			this.LTDescr$useFrames$ = $useFrames;
			return this;
		}
		
		public function LTDescr_setLoopCount_Int32($loopCount: int): LTDescr {
			this.LTDescr$loopCount$ = $loopCount;
			return this;
		}
		
		public function LTDescr_setLoopOnce(): LTDescr {
			this.LTDescr$loopType$ = LeanTweenType.once;
			return this;
		}
		
		public function LTDescr_setLoopClamp(): LTDescr {
			this.LTDescr$loopType$ = LeanTweenType.clamp;
			return this;
		}
		
		public function LTDescr_setLoopPingPong(): LTDescr {
			this.LTDescr$loopType$ = LeanTweenType.pingPong;
			return this;
		}
		
		public function LTDescr_setOnComplete_Action($onComplete: Function): LTDescr {
			this.LTDescr$onComplete$ = $onComplete;
			return this;
		}
		
		public function LTDescr_setOnComplete_Action$1($onComplete: Function): LTDescr {
			this.LTDescr$onCompleteObject$ = $onComplete;
			return this;
		}
		
		public function LTDescr_setOnCompleteParam_Object($onCompleteParam: Object): LTDescr {
			this.LTDescr$onCompleteParam$ = $onCompleteParam;
			return this;
		}
		
		public function LTDescr_setOnUpdate_Action$1($onUpdate: Function): LTDescr {
			this.LTDescr$onUpdateFloat$ = $onUpdate;
			return this;
		}
		
		public function LTDescr_setOnUpdateObject_Action$2($onUpdate: Function): LTDescr {
			this.LTDescr$onUpdateFloatObject$ = $onUpdate;
			return this;
		}
		
		public function LTDescr_setOnUpdateVector3_Action$1($onUpdate: Function): LTDescr {
			this.LTDescr$onUpdateVector3$ = $onUpdate;
			return this;
		}
		
		public function LTDescr_setOnUpdateParam_Object($onUpdateParam: Object): LTDescr {
			this.LTDescr$onUpdateParam$ = $onUpdateParam;
			return this;
		}
		
		public function LTDescr_setOrientToPath_Boolean($doesOrient: Boolean): LTDescr {
			if (this.LTDescr$path$ == null) {
				this.LTDescr$path$ = new LTBezierPath().LTBezierPath_Constructor();
			}
			this.LTDescr$path$.LTBezierPath$orientToPath$ = $doesOrient;
			return this;
		}
		
		public function LTDescr_setRect_LTRect($rect: LTRect): LTDescr {
			this.LTDescr$ltRect$ = $rect;
			return this;
		}
		
		public function LTDescr_setRect_Rect($rect: Rect): LTDescr {
			this.LTDescr$ltRect$ = new LTRect().LTRect_Constructor_Rect($rect.cil2as::Copy());
			return this;
		}
		
		public function LTDescr_setPath_LTBezierPath($path: LTBezierPath): LTDescr {
			this.LTDescr$path$ = $path;
			return this;
		}
		
		public function LTDescr_setPoint_Vector3($point: Vector3): LTDescr {
			this.LTDescr$point$.cil2as::Assign($point);
			return this;
		}
		
		public function LTDescr_Constructor(): LTDescr {
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LTDescr, {"get_uniqueId" : "LTDescr_uniqueId", "get_id" : "LTDescr_id", "ToString" : "toString", "cancel" : "LTDescr_cancel", "reset" : "LTDescr_reset", "pause" : "LTDescr_pause", "resume" : "LTDescr_resume", "setAxis" : "LTDescr_setAxis_Vector3", "setDelay" : "LTDescr_setDelay_Single", "setEase" : ["LTDescr_setEase_LeanTweenType", "LTDescr_setEase_AnimationCurve"], "setFrom" : "LTDescr_setFrom_Vector3", "setId" : "LTDescr_setId_Int32", "setRepeat" : "LTDescr_setRepeat_Int32", "setLoopType" : "LTDescr_setLoopType_LeanTweenType", "setUseEstimatedTime" : "LTDescr_setUseEstimatedTime_Boolean", "setUseFrames" : "LTDescr_setUseFrames_Boolean", "setLoopCount" : "LTDescr_setLoopCount_Int32", "setLoopOnce" : "LTDescr_setLoopOnce", "setLoopClamp" : "LTDescr_setLoopClamp", "setLoopPingPong" : "LTDescr_setLoopPingPong", "setOnComplete" : ["LTDescr_setOnComplete_Action", "LTDescr_setOnComplete_Action$1"], "setOnCompleteParam" : "LTDescr_setOnCompleteParam_Object", "setOnUpdate" : "LTDescr_setOnUpdate_Action$1", "setOnUpdateObject" : "LTDescr_setOnUpdateObject_Action$2", "setOnUpdateVector3" : "LTDescr_setOnUpdateVector3_Action$1", "setOnUpdateParam" : "LTDescr_setOnUpdateParam_Object", "setOrientToPath" : "LTDescr_setOrientToPath_Boolean", "setRect" : ["LTDescr_setRect_LTRect", "LTDescr_setRect_Rect"], "setPath" : "LTDescr_setPath_LTBezierPath", "setPoint" : "LTDescr_setPoint_Vector3"}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
