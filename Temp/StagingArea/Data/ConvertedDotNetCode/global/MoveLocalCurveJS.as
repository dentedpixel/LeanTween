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
	
	public class MoveLocalCurveJS extends MonoBehaviour implements IDeserializable {
		
		public var MoveLocalCurveJS$customAnimationCurve$: AnimationCurve;
		
		public var MoveLocalCurveJS$pt1$: Transform;
		
		public var MoveLocalCurveJS$pt2$: Transform;
		
		public var MoveLocalCurveJS$pt3$: Transform;
		
		public var MoveLocalCurveJS$pt4$: Transform;
		
		public var MoveLocalCurveJS$pt5$: Transform;
		
		public var MoveLocalCurveJS$containingSphere$: Transform;
		
		public var MoveLocalCurveJS$exampleIter$: int;
		
		public var MoveLocalCurveJS$exampleFunctions$: CLIObjectArray;
		
		public var MoveLocalCurveJS$useEstimatedTime$: Boolean;
		
		public var MoveLocalCurveJS$ltLogo$: GameObject;
		
		public function MoveLocalCurveJS_Constructor(): MoveLocalCurveJS {
			this.MonoBehaviour_Constructor();
			this.MoveLocalCurveJS$exampleFunctions$ = CLIArrayFactory.NewArrayWithElements(Type.ForClass(Function), this.MoveLocalCurveJS_moveOnACurveExample);
			this.MoveLocalCurveJS$useEstimatedTime$ = true;
			return this;
		}
		
		public function MoveLocalCurveJS_Awake(): void {
			LeanTween.LeanTween_init_Int32(400);
		}
		
		public function MoveLocalCurveJS_Start(): void {
			this.MoveLocalCurveJS$ltLogo$ = GameObject.GameObject_Find_String("LeanTweenLogo");
			this.MoveLocalCurveJS$containingSphere$ = GameObject.GameObject_Find_String("ContaingCube").transform;
			this.MoveLocalCurveJS_cycleThroughExamples();
		}
		
		public function MoveLocalCurveJS_OnGUI(): void {
			GUI.GUI_Label_Rect_String(new Rect().Constructor_Single_Single_Single_Single(0.03 * Number(Screen.width), 0.03 * Number(Screen.height), 0.5 * Number(Screen.width), 0.3 * Number(Screen.height)), "useEstimatedTime:" + this.MoveLocalCurveJS$useEstimatedTime$);
		}
		
		public function MoveLocalCurveJS_Update(): void {
			var $y: Number = this.MoveLocalCurveJS$containingSphere$.Component_transform.eulerAngles.y + (Time.deltaTime * 100);
			var $eulerAngles: Vector3 = this.MoveLocalCurveJS$containingSphere$.Component_transform.eulerAngles.cil2as::Copy();
			var $num: Number = $eulerAngles.y = $y;
			var $vector: Vector3 = this.MoveLocalCurveJS$containingSphere$.Component_transform.eulerAngles = $eulerAngles.cil2as::Copy();
		}
		
		public function MoveLocalCurveJS_cycleThroughExamples(): void {
			if (this.MoveLocalCurveJS$exampleIter$ == 0) {
				this.MoveLocalCurveJS$useEstimatedTime$ = !this.MoveLocalCurveJS$useEstimatedTime$;
				Time.timeScale = Number(!this.MoveLocalCurveJS$useEstimatedTime$ ? Number(1) : Number(0));
			}
			(this.MoveLocalCurveJS$exampleFunctions$.elements[this.MoveLocalCurveJS$exampleIter$] as Function)();
			this.MoveLocalCurveJS$exampleIter$ = (this.MoveLocalCurveJS$exampleIter$ + 1) < Extensions.Extensions_get_length_CLIArray(this.MoveLocalCurveJS$exampleFunctions$) ? (this.MoveLocalCurveJS$exampleIter$ + 1) : 0;
			LeanTween.LeanTween_delayedCall_Single_Action_ObjectArray(3.05, this.MoveLocalCurveJS_cycleThroughExamples, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "useEstimatedTime", this.MoveLocalCurveJS$useEstimatedTime$));
		}
		
		public function MoveLocalCurveJS_moveOnACurveExample(): void {
			Debug.Debug_Log_Object("moveOnACurveExample");
			var $to: CLIObjectArray = CLIArrayFactory.NewArrayWithElements(Vector3.$Type, this.MoveLocalCurveJS$ltLogo$.transform.localPosition.cil2as::Copy(), this.MoveLocalCurveJS$pt1$.position.cil2as::Copy(), this.MoveLocalCurveJS$pt2$.position.cil2as::Copy(), this.MoveLocalCurveJS$pt3$.position.cil2as::Copy(), this.MoveLocalCurveJS$pt3$.position.cil2as::Copy(), this.MoveLocalCurveJS$pt4$.position.cil2as::Copy(), this.MoveLocalCurveJS$pt5$.position.cil2as::Copy(), this.MoveLocalCurveJS$ltLogo$.transform.localPosition.cil2as::Copy());
			LeanTween.LeanTween_moveLocal_GameObject_Vector3Array_Single_ObjectArray(this.MoveLocalCurveJS$ltLogo$, $to, 3, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "ease", LeanTweenType.easeInQuad, "useEstimatedTime", this.MoveLocalCurveJS$useEstimatedTime$, "orientToPath", true));
		}
		
		public function MoveLocalCurveJS_Main(): void {
		}
		
		cil2as static function DefaultValue(): MoveLocalCurveJS {
			return new MoveLocalCurveJS().MoveLocalCurveJS_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.MoveLocalCurveJS$customAnimationCurve$ = reader.ReadAnimationCurve();
			this.MoveLocalCurveJS$pt1$ = reader.ReadUnityEngineObject() as Transform;
			this.MoveLocalCurveJS$pt2$ = reader.ReadUnityEngineObject() as Transform;
			this.MoveLocalCurveJS$pt3$ = reader.ReadUnityEngineObject() as Transform;
			this.MoveLocalCurveJS$pt4$ = reader.ReadUnityEngineObject() as Transform;
			this.MoveLocalCurveJS$pt5$ = reader.ReadUnityEngineObject() as Transform;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteAnimationCurve(this.MoveLocalCurveJS$customAnimationCurve$);
			writer.WriteUnityEngineObject(this.MoveLocalCurveJS$pt1$);
			writer.WriteUnityEngineObject(this.MoveLocalCurveJS$pt2$);
			writer.WriteUnityEngineObject(this.MoveLocalCurveJS$pt3$);
			writer.WriteUnityEngineObject(this.MoveLocalCurveJS$pt4$);
			writer.WriteUnityEngineObject(this.MoveLocalCurveJS$pt5$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.MoveLocalCurveJS$pt1$ = remapper.GetNewInstanceToReplaceOldInstance(this.MoveLocalCurveJS$pt1$) as Transform;
			this.MoveLocalCurveJS$pt2$ = remapper.GetNewInstanceToReplaceOldInstance(this.MoveLocalCurveJS$pt2$) as Transform;
			this.MoveLocalCurveJS$pt3$ = remapper.GetNewInstanceToReplaceOldInstance(this.MoveLocalCurveJS$pt3$) as Transform;
			this.MoveLocalCurveJS$pt4$ = remapper.GetNewInstanceToReplaceOldInstance(this.MoveLocalCurveJS$pt4$) as Transform;
			this.MoveLocalCurveJS$pt5$ = remapper.GetNewInstanceToReplaceOldInstance(this.MoveLocalCurveJS$pt5$) as Transform;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.MoveLocalCurveJS, {"Awake" : "MoveLocalCurveJS_Awake", "Start" : "MoveLocalCurveJS_Start", "OnGUI" : "MoveLocalCurveJS_OnGUI", "Update" : "MoveLocalCurveJS_Update", "cycleThroughExamples" : "MoveLocalCurveJS_cycleThroughExamples", "moveOnACurveExample" : "MoveLocalCurveJS_moveOnACurveExample", "Main" : "MoveLocalCurveJS_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
