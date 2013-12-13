package global {
	
	import System.CLIArrayFactory;
	import System.CLIObjectArray;
	import System.Type;
	import System.Collections.Hashtable;
	import UnityEngine.AnimationCurve;
	import UnityEngine.Debug;
	import UnityEngine.GameObject;
	import UnityEngine.GUI;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Rect;
	import UnityEngine.Screen;
	import UnityEngine.Time;
	import UnityEngine.Transform;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class ExampleCSharp extends MonoBehaviour implements IDeserializable {
		
		public var ExampleCSharp$customAnimationCurve$: AnimationCurve;
		
		public var ExampleCSharp$pt1$: Transform;
		
		public var ExampleCSharp$pt2$: Transform;
		
		public var ExampleCSharp$pt3$: Transform;
		
		public var ExampleCSharp$pt4$: Transform;
		
		public var ExampleCSharp$pt5$: Transform;
		
		public var ExampleCSharp$exampleIter$: int;
		
		public var ExampleCSharp$exampleFunctions$: CLIObjectArray = CLIArrayFactory.NewArrayWithElements(Type.ForClass(String), "updateValue3Example", "loopTestClamp", "loopTestPingPong", "moveOnACurveExample", "customTweenExample", "moveExample", "rotateExample", "scaleExample", "updateValueExample", "delayedCallExample", "alphaExample", "moveLocalExample", "rotateAroundExample");
		
		public var ExampleCSharp$useEstimatedTime$: Boolean = true;
		
		public var ExampleCSharp$ltLogo$: GameObject;
		
		public function ExampleCSharp_Awake(): void {
		}
		
		public function ExampleCSharp_Start(): void {
			this.ExampleCSharp$ltLogo$ = GameObject.GameObject_Find_String("LeanTweenLogo");
			this.ExampleCSharp_cycleThroughExamples();
		}
		
		public function ExampleCSharp_OnGUI(): void {
			GUI.GUI_Label_Rect_String(new Rect().Constructor_Single_Single_Single_Single(0.03 * Number(Screen.width), 0.03 * Number(Screen.height), 0.5 * Number(Screen.width), 0.3 * Number(Screen.height)), "useEstimatedTime:" + this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_cycleThroughExamples(): void {
			if (this.ExampleCSharp$exampleIter$ == 0) {
				this.ExampleCSharp$useEstimatedTime$ = !this.ExampleCSharp$useEstimatedTime$;
				Time.timeScale = !this.ExampleCSharp$useEstimatedTime$ ? 1 : 0;
			}
			super.Component_gameObject.GameObject_BroadcastMessage_String(this.ExampleCSharp$exampleFunctions$.elements[this.ExampleCSharp$exampleIter$] as String);
			this.ExampleCSharp$exampleIter$ = (this.ExampleCSharp$exampleIter$ + 1) < this.ExampleCSharp$exampleFunctions$.Length ? (this.ExampleCSharp$exampleIter$ + 1) : 0;
			LeanTween.LeanTween_delayedCall_GameObject_Single_Action(super.Component_gameObject, 1.05, this.ExampleCSharp_cycleThroughExamples).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_updateValue3Example(): void {
			Debug.Debug_Log_Object("updateValue3Example Time:" + Time.time);
			LeanTween.LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single(super.Component_gameObject, this.ExampleCSharp_updateValue3ExampleCallback_Vector3, new Vector3().Constructor_Single_Single_Single(0, 270, 0), new Vector3().Constructor_Single_Single_Single(30, 270, 180), 0.5).LTDescr_setEase_LeanTweenType(LeanTweenType.easeInBounce).LTDescr_setRepeat_Int32(2).LTDescr_setLoopPingPong().LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_updateValue3ExampleCallback_Vector3($val: Vector3): void {
			this.ExampleCSharp$ltLogo$.transform.eulerAngles = $val.cil2as::Copy();
		}
		
		public function ExampleCSharp_loopTestClamp(): void {
			Debug.Debug_Log_Object("loopTestClamp Time:" + Time.time);
			var $gameObject: GameObject = GameObject.GameObject_Find_String("Cube1");
			$gameObject.transform.localScale = new Vector3().Constructor_Single_Single_Single(1, 1, 1);
			LeanTween.LeanTween_scaleZ_GameObject_Single_Single($gameObject, 4, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutElastic).LTDescr_setRepeat_Int32(7).LTDescr_setLoopClamp().LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_loopTestPingPong(): void {
			Debug.Debug_Log_Object("loopTestPingPong Time:" + Time.time);
			var $gameObject: GameObject = GameObject.GameObject_Find_String("Cube2");
			$gameObject.transform.localScale = new Vector3().Constructor_Single_Single_Single(1, 1, 1);
			LeanTween.LeanTween_scaleY_GameObject_Single_Single($gameObject, 4, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad).LTDescr_setLoopPingPong().LTDescr_setRepeat_Int32(8).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_moveOnACurveExample(): void {
			Debug.Debug_Log_Object("moveOnACurveExample Time:" + Time.time);
			var $to: CLIObjectArray = CLIArrayFactory.NewArrayWithElements(Vector3.$Type, this.ExampleCSharp$ltLogo$.transform.position.cil2as::Copy(), this.ExampleCSharp$pt1$.position.cil2as::Copy(), this.ExampleCSharp$pt2$.position.cil2as::Copy(), this.ExampleCSharp$pt3$.position.cil2as::Copy(), this.ExampleCSharp$pt3$.position.cil2as::Copy(), this.ExampleCSharp$pt4$.position.cil2as::Copy(), this.ExampleCSharp$pt5$.position.cil2as::Copy(), this.ExampleCSharp$ltLogo$.transform.position.cil2as::Copy());
			LeanTween.LeanTween_move_GameObject_Vector3Array_Single(this.ExampleCSharp$ltLogo$, $to, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad).LTDescr_setOrientToPath_Boolean(true).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_customTweenExample(): void {
			Debug.Debug_Log_Object("customTweenExample");
			LeanTween.LeanTween_moveX_GameObject_Single_Single(this.ExampleCSharp$ltLogo$, -10, 0.5).LTDescr_setEase_AnimationCurve(this.ExampleCSharp$customAnimationCurve$).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
			LeanTween.LeanTween_moveX_GameObject_Single_Single(this.ExampleCSharp$ltLogo$, 0, 0.5).LTDescr_setEase_AnimationCurve(this.ExampleCSharp$customAnimationCurve$).LTDescr_setDelay_Single(0.5).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_moveExample(): void {
			Debug.Debug_Log_Object("moveExample");
			LeanTween.LeanTween_move_GameObject_Vector3_Single(this.ExampleCSharp$ltLogo$, new Vector3().Constructor_Single_Single_Single(-2, -1, 0), 0.5).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
			LeanTween.LeanTween_move_GameObject_Vector3_Single(this.ExampleCSharp$ltLogo$, this.ExampleCSharp$ltLogo$.transform.position, 0.5).LTDescr_setDelay_Single(0.5).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_rotateExample(): void {
			Debug.Debug_Log_Object("rotateExample");
			var $hashtable: Hashtable = new Hashtable().Hashtable_Constructor();
			$hashtable.IDictionary_Add_Object_Object("yo", 5);
			LeanTween.LeanTween_rotate_GameObject_Vector3_Single(this.ExampleCSharp$ltLogo$, new Vector3().Constructor_Single_Single_Single(0, 360, 0), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad).LTDescr_setOnComplete_Action$1(this.ExampleCSharp_rotateFinished_Object).LTDescr_setOnCompleteParam_Object($hashtable).LTDescr_setOnUpdate_Action$1(this.ExampleCSharp_rotateOnUpdate_Single).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_rotateOnUpdate_Single($val: Number): void {
		}
		
		public function ExampleCSharp_rotateFinished_Object($hash: Object): void {
			var $hashtable: Hashtable = $hash as Hashtable;
			Debug.Debug_Log_Object("rotateFinished hash:" + $hashtable.IDictionary_get_Item_Object("yo"));
		}
		
		public function ExampleCSharp_scaleExample(): void {
			Debug.Debug_Log_Object("scaleExample");
			var $localScale: Vector3 = this.ExampleCSharp$ltLogo$.transform.localScale.cil2as::Copy();
			LeanTween.LeanTween_scale_GameObject_Vector3_Single(this.ExampleCSharp$ltLogo$, new Vector3().Constructor_Single_Single_Single($localScale.x + 0.2, $localScale.y + 0.2, $localScale.z + 0.2), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_updateValueExample(): void {
			Debug.Debug_Log_Object("updateValueExample");
			var $hashtable: Hashtable = new Hashtable().Hashtable_Constructor();
			$hashtable.IDictionary_Add_Object_Object("message", "hi");
			LeanTween.LeanTween_value_GameObject_Action$2_Single_Single_Single(super.Component_gameObject, this.ExampleCSharp_updateValueExampleCallback_Single_Object, this.ExampleCSharp$ltLogo$.transform.eulerAngles.y, 270, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutElastic).LTDescr_setOnUpdateParam_Object($hashtable).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_updateValueExampleCallback_Single_Object($val: Number, $hash: Object): void {
			var $eulerAngles: Vector3 = this.ExampleCSharp$ltLogo$.transform.eulerAngles.cil2as::Copy();
			$eulerAngles.y = $val;
			this.ExampleCSharp$ltLogo$.transform.eulerAngles = $eulerAngles.cil2as::Copy();
		}
		
		public function ExampleCSharp_delayedCallExample(): void {
			Debug.Debug_Log_Object("delayedCallExample");
			LeanTween.LeanTween_delayedCall_Single_Action(0.5, this.ExampleCSharp_delayedCallExampleCallback).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_delayedCallExampleCallback(): void {
			Debug.Debug_Log_Object("Delayed function was called");
			var $localScale: Vector3 = this.ExampleCSharp$ltLogo$.transform.localScale.cil2as::Copy();
			LeanTween.LeanTween_scale_GameObject_Vector3_Single(this.ExampleCSharp$ltLogo$, new Vector3().Constructor_Single_Single_Single($localScale.x - 0.2, $localScale.y - 0.2, $localScale.z - 0.2), 0.5).LTDescr_setEase_LeanTweenType(LeanTweenType.easeInOutCirc).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_alphaExample(): void {
			Debug.Debug_Log_Object("alphaExample");
			var $gameObject: GameObject = GameObject.GameObject_Find_String("LCharacter");
			LeanTween.LeanTween_alpha_GameObject_Single_Single($gameObject, 0, 0.5).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
			LeanTween.LeanTween_alpha_GameObject_Single_Single($gameObject, 1, 0.5).LTDescr_setDelay_Single(0.5).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_moveLocalExample(): void {
			Debug.Debug_Log_Object("moveLocalExample");
			var $gameObject: GameObject = GameObject.GameObject_Find_String("LCharacter");
			var $localPosition: Vector3 = $gameObject.transform.localPosition.cil2as::Copy();
			LeanTween.LeanTween_moveLocal_GameObject_Vector3_Single($gameObject, new Vector3().Constructor_Single_Single_Single(0, 2, 0), 0.5).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
			LeanTween.LeanTween_moveLocal_GameObject_Vector3_Single($gameObject, $localPosition, 0.5).LTDescr_setDelay_Single(0.5).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_rotateAroundExample(): void {
			Debug.Debug_Log_Object("rotateAroundExample");
			var $gameObject: GameObject = GameObject.GameObject_Find_String("LCharacter");
			LeanTween.LeanTween_rotateAround_GameObject_Vector3_Single_Single($gameObject, Vector3.up, 360, 1).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		public function ExampleCSharp_loopPause(): void {
			var $gameObject: GameObject = GameObject.GameObject_Find_String("Cube1");
			LeanTween.LeanTween_pause_GameObject($gameObject);
		}
		
		public function ExampleCSharp_loopResume(): void {
			var $gameObject: GameObject = GameObject.GameObject_Find_String("Cube1");
			LeanTween.LeanTween_resume_GameObject($gameObject);
		}
		
		public function ExampleCSharp_punchTest(): void {
			LeanTween.LeanTween_moveX_GameObject_Single_Single(this.ExampleCSharp$ltLogo$, 7, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.punch).LTDescr_setUseEstimatedTime_Boolean(this.ExampleCSharp$useEstimatedTime$);
		}
		
		cil2as static function DefaultValue(): ExampleCSharp {
			return new ExampleCSharp().ExampleCSharp_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.ExampleCSharp$customAnimationCurve$ = reader.ReadAnimationCurve();
			this.ExampleCSharp$pt1$ = reader.ReadUnityEngineObject() as Transform;
			this.ExampleCSharp$pt2$ = reader.ReadUnityEngineObject() as Transform;
			this.ExampleCSharp$pt3$ = reader.ReadUnityEngineObject() as Transform;
			this.ExampleCSharp$pt4$ = reader.ReadUnityEngineObject() as Transform;
			this.ExampleCSharp$pt5$ = reader.ReadUnityEngineObject() as Transform;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteAnimationCurve(this.ExampleCSharp$customAnimationCurve$);
			writer.WriteUnityEngineObject(this.ExampleCSharp$pt1$);
			writer.WriteUnityEngineObject(this.ExampleCSharp$pt2$);
			writer.WriteUnityEngineObject(this.ExampleCSharp$pt3$);
			writer.WriteUnityEngineObject(this.ExampleCSharp$pt4$);
			writer.WriteUnityEngineObject(this.ExampleCSharp$pt5$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.ExampleCSharp$pt1$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleCSharp$pt1$) as Transform;
			this.ExampleCSharp$pt2$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleCSharp$pt2$) as Transform;
			this.ExampleCSharp$pt3$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleCSharp$pt3$) as Transform;
			this.ExampleCSharp$pt4$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleCSharp$pt4$) as Transform;
			this.ExampleCSharp$pt5$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleCSharp$pt5$) as Transform;
		}
		
		public function ExampleCSharp_Constructor(): ExampleCSharp {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.ExampleCSharp, {"Awake" : "ExampleCSharp_Awake", "Start" : "ExampleCSharp_Start", "OnGUI" : "ExampleCSharp_OnGUI", "cycleThroughExamples" : "ExampleCSharp_cycleThroughExamples", "updateValue3Example" : "ExampleCSharp_updateValue3Example", "updateValue3ExampleCallback" : "ExampleCSharp_updateValue3ExampleCallback_Vector3", "loopTestClamp" : "ExampleCSharp_loopTestClamp", "loopTestPingPong" : "ExampleCSharp_loopTestPingPong", "moveOnACurveExample" : "ExampleCSharp_moveOnACurveExample", "customTweenExample" : "ExampleCSharp_customTweenExample", "moveExample" : "ExampleCSharp_moveExample", "rotateExample" : "ExampleCSharp_rotateExample", "rotateOnUpdate" : "ExampleCSharp_rotateOnUpdate_Single", "rotateFinished" : "ExampleCSharp_rotateFinished_Object", "scaleExample" : "ExampleCSharp_scaleExample", "updateValueExample" : "ExampleCSharp_updateValueExample", "updateValueExampleCallback" : "ExampleCSharp_updateValueExampleCallback_Single_Object", "delayedCallExample" : "ExampleCSharp_delayedCallExample", "delayedCallExampleCallback" : "ExampleCSharp_delayedCallExampleCallback", "alphaExample" : "ExampleCSharp_alphaExample", "moveLocalExample" : "ExampleCSharp_moveLocalExample", "rotateAroundExample" : "ExampleCSharp_rotateAroundExample", "loopPause" : "ExampleCSharp_loopPause", "loopResume" : "ExampleCSharp_loopResume", "punchTest" : "ExampleCSharp_punchTest"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
