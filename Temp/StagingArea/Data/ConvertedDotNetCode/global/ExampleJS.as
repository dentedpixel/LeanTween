package global {
	
	import System.CLIArrayFactory;
	import System.CLIObjectArray;
	import System.Type;
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
	import UnityScript.Lang.Extensions;
	
	public class ExampleJS extends MonoBehaviour implements IDeserializable {
		
		public var ExampleJS$customAnimationCurve$: AnimationCurve;
		
		public var ExampleJS$shakeCurve$: AnimationCurve;
		
		public var ExampleJS$pt1$: Transform;
		
		public var ExampleJS$pt2$: Transform;
		
		public var ExampleJS$pt3$: Transform;
		
		public var ExampleJS$pt4$: Transform;
		
		public var ExampleJS$pt5$: Transform;
		
		public var ExampleJS$exampleIter$: int;
		
		public var ExampleJS$exampleFunctions$: CLIObjectArray;
		
		public var ExampleJS$useEstimatedTime$: Boolean;
		
		public var ExampleJS$ltLogo$: GameObject;
		
		public var ExampleJS$loopTestId$: int;
		
		public function ExampleJS_Constructor(): ExampleJS {
			this.MonoBehaviour_Constructor();
			this.ExampleJS$exampleFunctions$ = CLIArrayFactory.NewArrayWithElements(Type.ForClass(Function), this.ExampleJS_updateValue3Example, this.ExampleJS_loopTestPingPong, this.ExampleJS_loopTestClamp, this.ExampleJS_moveOnACurveExample, this.ExampleJS_punchTest, this.ExampleJS_customTweenExample, this.ExampleJS_moveExample, this.ExampleJS_rotateExample, this.ExampleJS_scaleExample, this.ExampleJS_updateValueExample, this.ExampleJS_alphaExample, this.ExampleJS_moveLocalExample, this.ExampleJS_delayedCallExample, this.ExampleJS_rotateAroundExample);
			this.ExampleJS$useEstimatedTime$ = true;
			return this;
		}
		
		public function ExampleJS_Awake(): void {
			LeanTween.LeanTween_init_Int32(400);
		}
		
		public function ExampleJS_Start(): void {
			this.ExampleJS$ltLogo$ = GameObject.GameObject_Find_String("LeanTweenLogo");
			this.ExampleJS_cycleThroughExamples();
		}
		
		public function ExampleJS_OnGUI(): void {
			GUI.GUI_Label_Rect_String(new Rect().Constructor_Single_Single_Single_Single(0.03 * Number(Screen.width), 0.03 * Number(Screen.height), 0.5 * Number(Screen.width), 0.3 * Number(Screen.height)), "useEstimatedTime:" + this.ExampleJS$useEstimatedTime$);
		}
		
		public function ExampleJS_cycleThroughExamples(): void {
			if (this.ExampleJS$exampleIter$ == 0) {
				this.ExampleJS$useEstimatedTime$ = !this.ExampleJS$useEstimatedTime$;
				Time.timeScale = Number(!this.ExampleJS$useEstimatedTime$ ? Number(1) : Number(0));
			}
			(this.ExampleJS$exampleFunctions$.elements[this.ExampleJS$exampleIter$] as Function)();
			this.ExampleJS$exampleIter$ = (this.ExampleJS$exampleIter$ + 1) < Extensions.Extensions_get_length_CLIArray(this.ExampleJS$exampleFunctions$) ? (this.ExampleJS$exampleIter$ + 1) : 0;
			LeanTween.LeanTween_delayedCall_Single_Action_ObjectArray(1.05, this.ExampleJS_cycleThroughExamples, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_loopTestClamp(): void {
			Debug.Debug_Log_Object("loopTestClamp");
			var $gameObject: GameObject = GameObject.GameObject_Find_String("Cube1");
			var $z: Number = 1;
			var $localScale: Vector3 = $gameObject.transform.localScale.cil2as::Copy();
			var $num: Number = $localScale.z = $z;
			var $vector: Vector3 = $gameObject.transform.localScale = $localScale.cil2as::Copy();
			LeanTween.LeanTween_scaleZ_GameObject_Single_Single_ObjectArray($gameObject, 4, 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeOutElastic, "useEstimatedTime", this.ExampleJS$useEstimatedTime$, "repeat", 7));
		}
		
		public function ExampleJS_loopPause(): void {
			var $gameObject: GameObject = GameObject.GameObject_Find_String("Cube1");
			LeanTween.LeanTween_pause_GameObject($gameObject);
		}
		
		public function ExampleJS_loopResume(): void {
			var $gameObject: GameObject = GameObject.GameObject_Find_String("Cube1");
			LeanTween.LeanTween_resume_GameObject($gameObject);
		}
		
		public function ExampleJS_loopTestPingPong(): void {
			Debug.Debug_Log_Object("loopTestPingPong");
			var $gameObject: GameObject = GameObject.GameObject_Find_String("Cube2");
			var $y: Number = 1;
			var $localScale: Vector3 = $gameObject.transform.localScale.cil2as::Copy();
			var $num: Number = $localScale.y = $y;
			var $vector: Vector3 = $gameObject.transform.localScale = $localScale.cil2as::Copy();
			LeanTween.LeanTween_scaleY_GameObject_Single_Single_ObjectArray($gameObject, 4, 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeOutQuad, "useEstimatedTime", this.ExampleJS$useEstimatedTime$, "repeat", 8, "loopType", LeanTweenType.pingPong));
		}
		
		public function ExampleJS_moveOnACurveExample(): void {
			Debug.Debug_Log_Object("moveOnACurveExample");
			var $to: CLIObjectArray = CLIArrayFactory.NewArrayWithElements(Vector3.$Type, this.ExampleJS$ltLogo$.transform.position.cil2as::Copy(), this.ExampleJS$pt1$.position.cil2as::Copy(), this.ExampleJS$pt2$.position.cil2as::Copy(), this.ExampleJS$pt3$.position.cil2as::Copy(), this.ExampleJS$pt3$.position.cil2as::Copy(), this.ExampleJS$pt4$.position.cil2as::Copy(), this.ExampleJS$pt5$.position.cil2as::Copy(), this.ExampleJS$ltLogo$.transform.position.cil2as::Copy());
			LeanTween.LeanTween_move_GameObject_Vector3Array_Single_ObjectArray(this.ExampleJS$ltLogo$, $to, 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeInQuad, "useEstimatedTime", this.ExampleJS$useEstimatedTime$, "orientToPath", true));
		}
		
		public function ExampleJS_punchTest(): void {
			LeanTween.LeanTween_moveX_GameObject_Single_Single_ObjectArray(this.ExampleJS$ltLogo$, Number(7), 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "useEstimatedTime", this.ExampleJS$useEstimatedTime$, "ease", LeanTweenType.punch));
		}
		
		public function ExampleJS_customTweenExample(): void {
			Debug.Debug_Log_Object("customTweenExample");
			LeanTween.LeanTween_moveX_GameObject_Single_Single_ObjectArray(this.ExampleJS$ltLogo$, Number(-10), 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "useEstimatedTime", this.ExampleJS$useEstimatedTime$, "ease", this.ExampleJS$customAnimationCurve$));
			LeanTween.LeanTween_moveX_GameObject_Single_Single_ObjectArray(this.ExampleJS$ltLogo$, Number(0), 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "delay", 0.5, "useEstimatedTime", this.ExampleJS$useEstimatedTime$, "ease", this.ExampleJS$customAnimationCurve$));
		}
		
		public function ExampleJS_moveExample(): void {
			Debug.Debug_Log_Object("moveExample");
			LeanTween.LeanTween_move_GameObject_Vector3_Single_ObjectArray(this.ExampleJS$ltLogo$, new Vector3().Constructor_Single_Single_Single(-2, -1, Number(0)), 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
			LeanTween.LeanTween_move_GameObject_Vector3_Single_ObjectArray(this.ExampleJS$ltLogo$, this.ExampleJS$ltLogo$.transform.position, 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "delay", 0.5, "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_rotateExample(): void {
			Debug.Debug_Log_Object("rotateExample");
			LeanTween.LeanTween_rotate_GameObject_Vector3_Single_ObjectArray(this.ExampleJS$ltLogo$, new Vector3().Constructor_Single_Single_Single(Number(0), Number(360), Number(0)), 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeOutQuad, "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_scaleExample(): void {
			Debug.Debug_Log_Object("scaleExample");
			var $localScale: Vector3 = this.ExampleJS$ltLogo$.transform.localScale.cil2as::Copy();
			LeanTween.LeanTween_scale_GameObject_Vector3_Single_ObjectArray(this.ExampleJS$ltLogo$, new Vector3().Constructor_Single_Single_Single($localScale.x + 0.2, $localScale.y + 0.2, $localScale.z + 0.2), Number(1), CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeOutBounce, "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_updateValueExample(): void {
			Debug.Debug_Log_Object("updateValueExample");
			LeanTween.LeanTween_value_GameObject_Action$1_Single_Single_Single_ObjectArray(this.ExampleJS$ltLogo$, this.ExampleJS_updateValueExampleCallback_Single, this.ExampleJS$ltLogo$.transform.eulerAngles.y, 270, Number(1), CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeOutElastic, "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_updateValueExampleCallback_Single($val: Number): void {
			var $eulerAngles: Vector3 = this.ExampleJS$ltLogo$.transform.eulerAngles.cil2as::Copy();
			$eulerAngles.y = $val;
			var $vector: Vector3 = this.ExampleJS$ltLogo$.transform.eulerAngles = $eulerAngles.cil2as::Copy();
		}
		
		public function ExampleJS_updateValue3Example(): void {
			Debug.Debug_Log_Object("updateValue3Example");
			LeanTween.LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single_ObjectArray(this.ExampleJS$ltLogo$, this.ExampleJS_updateValue3ExampleCallback_Vector3, new Vector3().Constructor_Single_Single_Single(Number(0), 270, Number(0)), new Vector3().Constructor_Single_Single_Single(30, 270, Number(180)), 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeInBounce, "useEstimatedTime", this.ExampleJS$useEstimatedTime$, "repeat", 2, "loopType", LeanTweenType.pingPong));
		}
		
		public function ExampleJS_updateValue3ExampleCallback_Vector3($val: Vector3): void {
			this.ExampleJS$ltLogo$.transform.eulerAngles = $val.cil2as::Copy();
		}
		
		public function ExampleJS_delayedCallExample(): void {
			Debug.Debug_Log_Object("delayedCallExample");
			LeanTween.LeanTween_delayedCall_Single_Action(0.5, this.ExampleJS_delayedCallExampleCallback);
		}
		
		public function ExampleJS_delayedCallExampleCallback(): void {
			Debug.Debug_Log_Object("Delayed function was called");
			var $localScale: Vector3 = this.Component_gameObject.transform.localScale.cil2as::Copy();
			LeanTween.LeanTween_scale_GameObject_Vector3_Single_ObjectArray(this.ExampleJS$ltLogo$, new Vector3().Constructor_Single_Single_Single($localScale.x - 0.2, $localScale.y - 0.2, $localScale.z - 0.2), 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeInOutCirc, "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_alphaExample(): void {
			Debug.Debug_Log_Object("alphaExample");
			var $gameObject: GameObject = GameObject.GameObject_Find_String("LCharacter");
			LeanTween.LeanTween_alpha_GameObject_Single_Single_ObjectArray($gameObject, Number(0), 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
			LeanTween.LeanTween_alpha_GameObject_Single_Single_ObjectArray($gameObject, 1, 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "delay", 0.5, "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_moveLocalExample(): void {
			Debug.Debug_Log_Object("moveLocalExample");
			var $gameObject: GameObject = GameObject.GameObject_Find_String("LCharacter");
			var $localPosition: Vector3 = $gameObject.transform.localPosition.cil2as::Copy();
			LeanTween.LeanTween_moveLocal_GameObject_Vector3_Single_ObjectArray($gameObject, new Vector3().Constructor_Single_Single_Single(Number(0), 2, Number(0)), 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
			LeanTween.LeanTween_moveLocal_GameObject_Vector3_Single_ObjectArray($gameObject, $localPosition, 0.5, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "delay", 0.5, "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_rotateAroundExample(): void {
			Debug.Debug_Log_Object("rotateAroundExample");
			var $gameObject: GameObject = GameObject.GameObject_Find_String("LCharacter");
			LeanTween.LeanTween_rotateAround_GameObject_Vector3_Single_Single_ObjectArray($gameObject, Vector3.up, 360, 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "useEstimatedTime", this.ExampleJS$useEstimatedTime$));
		}
		
		public function ExampleJS_moveXExample(): void {
			LeanTween.LeanTween_moveX_GameObject_Single_Single(this.ExampleJS$ltLogo$, Number(5), 0.5);
		}
		
		public function ExampleJS_rotateXExample(): void {
		}
		
		public function ExampleJS_scaleXExample(): void {
		}
		
		public function ExampleJS_Main(): void {
		}
		
		cil2as static function DefaultValue(): ExampleJS {
			return new ExampleJS().ExampleJS_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.ExampleJS$customAnimationCurve$ = reader.ReadAnimationCurve();
			this.ExampleJS$shakeCurve$ = reader.ReadAnimationCurve();
			this.ExampleJS$pt1$ = reader.ReadUnityEngineObject() as Transform;
			this.ExampleJS$pt2$ = reader.ReadUnityEngineObject() as Transform;
			this.ExampleJS$pt3$ = reader.ReadUnityEngineObject() as Transform;
			this.ExampleJS$pt4$ = reader.ReadUnityEngineObject() as Transform;
			this.ExampleJS$pt5$ = reader.ReadUnityEngineObject() as Transform;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteAnimationCurve(this.ExampleJS$customAnimationCurve$);
			writer.WriteAnimationCurve(this.ExampleJS$shakeCurve$);
			writer.WriteUnityEngineObject(this.ExampleJS$pt1$);
			writer.WriteUnityEngineObject(this.ExampleJS$pt2$);
			writer.WriteUnityEngineObject(this.ExampleJS$pt3$);
			writer.WriteUnityEngineObject(this.ExampleJS$pt4$);
			writer.WriteUnityEngineObject(this.ExampleJS$pt5$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.ExampleJS$pt1$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleJS$pt1$) as Transform;
			this.ExampleJS$pt2$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleJS$pt2$) as Transform;
			this.ExampleJS$pt3$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleJS$pt3$) as Transform;
			this.ExampleJS$pt4$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleJS$pt4$) as Transform;
			this.ExampleJS$pt5$ = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleJS$pt5$) as Transform;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.ExampleJS, {"Awake" : "ExampleJS_Awake", "Start" : "ExampleJS_Start", "OnGUI" : "ExampleJS_OnGUI", "cycleThroughExamples" : "ExampleJS_cycleThroughExamples", "loopTestClamp" : "ExampleJS_loopTestClamp", "loopPause" : "ExampleJS_loopPause", "loopResume" : "ExampleJS_loopResume", "loopTestPingPong" : "ExampleJS_loopTestPingPong", "moveOnACurveExample" : "ExampleJS_moveOnACurveExample", "punchTest" : "ExampleJS_punchTest", "customTweenExample" : "ExampleJS_customTweenExample", "moveExample" : "ExampleJS_moveExample", "rotateExample" : "ExampleJS_rotateExample", "scaleExample" : "ExampleJS_scaleExample", "updateValueExample" : "ExampleJS_updateValueExample", "updateValueExampleCallback" : "ExampleJS_updateValueExampleCallback_Single", "updateValue3Example" : "ExampleJS_updateValue3Example", "updateValue3ExampleCallback" : "ExampleJS_updateValue3ExampleCallback_Vector3", "delayedCallExample" : "ExampleJS_delayedCallExample", "delayedCallExampleCallback" : "ExampleJS_delayedCallExampleCallback", "alphaExample" : "ExampleJS_alphaExample", "moveLocalExample" : "ExampleJS_moveLocalExample", "rotateAroundExample" : "ExampleJS_rotateAroundExample", "moveXExample" : "ExampleJS_moveXExample", "rotateXExample" : "ExampleJS_rotateXExample", "scaleXExample" : "ExampleJS_scaleXExample", "Main" : "ExampleJS_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
