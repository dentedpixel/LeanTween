package global {
	
	import System.CLIArray;
	import System.CLIArrayFactory;
	import System.CLIObjectArray;
	import System.Type;
	import UnityEngine.Debug;
	import UnityEngine.GameObject;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Time;
	import UnityEngine.Transform;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class ExampleCatmull extends MonoBehaviour implements IDeserializable {
		
		public var ExampleCatmull$trans$: CLIObjectArray;
		
		public var ExampleCatmull$cr$: LTSpline;
		
		public var ExampleCatmull$ltLogo$: GameObject;
		
		public var ExampleCatmull$iter$: Number = 0;
		
		public function ExampleCatmull_Start(): void {
			var $b: Vector3 = Vector3.op_Subtraction_Vector3_Vector3((this.ExampleCatmull$trans$.elements[1] as Transform).position, (this.ExampleCatmull$trans$.elements[0] as Transform).position);
			this.ExampleCatmull$cr$ = new LTSpline().LTSpline_Constructor_Vector3Array(CLIArrayFactory.NewArrayWithElements(Vector3.$Type, Vector3.op_Subtraction_Vector3_Vector3((this.ExampleCatmull$trans$.elements[0] as Transform).position, $b), (this.ExampleCatmull$trans$.elements[0] as Transform).position.cil2as::Copy(), (this.ExampleCatmull$trans$.elements[1] as Transform).position.cil2as::Copy(), (this.ExampleCatmull$trans$.elements[2] as Transform).position.cil2as::Copy(), Vector3.op_Addition_Vector3_Vector3((this.ExampleCatmull$trans$.elements[2] as Transform).position, $b)));
			this.ExampleCatmull$ltLogo$ = GameObject.GameObject_Find_String("LeanTweenLogo");
		}
		
		public function ExampleCatmull_Update(): void {
			Debug.Debug_Log_Object("iter:" + this.ExampleCatmull$iter$);
			this.ExampleCatmull$ltLogo$.transform.position = this.ExampleCatmull$cr$.LTSpline_point_Single(this.ExampleCatmull$iter$);
			this.ExampleCatmull$iter$ = this.ExampleCatmull$iter$ + (Time.deltaTime * 0.1);
			if (this.ExampleCatmull$iter$ > 1) {
				this.ExampleCatmull$iter$ = 0;
			}
		}
		
		public function ExampleCatmull_OnDrawGizmos(): void {
			if (this.ExampleCatmull$cr$ != null) {
				this.ExampleCatmull$cr$.LTSpline_gizmoDraw_Single(this.ExampleCatmull$iter$);
			}
		}
		
		cil2as static function DefaultValue(): ExampleCatmull {
			return new ExampleCatmull().ExampleCatmull_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.ExampleCatmull$trans$ = CLIArray.TakeOwnership(Transform.$Type, reader.ReadArray(reader.ReadUnityEngineObject));
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteArray(CLIArray.ElementsOf(this.ExampleCatmull$trans$), writer.WriteUnityEngineObject);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			if (this.ExampleCatmull$trans$ != null) {
				for (var _0: int = 0; _0 < this.ExampleCatmull$trans$.Length; ++_0) {
					this.ExampleCatmull$trans$.elements[_0] = remapper.GetNewInstanceToReplaceOldInstance(this.ExampleCatmull$trans$.elements[_0] as Transform) as Transform;
				}
			}
		}
		
		public function ExampleCatmull_Constructor(): ExampleCatmull {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.ExampleCatmull, {"Start" : "ExampleCatmull_Start", "Update" : "ExampleCatmull_Update", "OnDrawGizmos" : "ExampleCatmull_OnDrawGizmos"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
