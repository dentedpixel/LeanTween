package global {
	
	import System.CLIArrayFactory;
	import System.Type;
	import UnityEngine.AnimationCurve;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class ExamplePunchJS extends MonoBehaviour implements IDeserializable {
		
		public var ExamplePunchJS$punchCurve$: AnimationCurve;
		
		public function ExamplePunchJS_Awake(): void {
			LeanTween.LeanTween_init_Int32(400);
		}
		
		public function ExamplePunchJS_Start(): void {
			this.ExamplePunchJS_punchTest();
		}
		
		public function ExamplePunchJS_punchTest(): void {
			LeanTween.LeanTween_rotate_GameObject_Vector3_Single_ObjectArray(this.Component_gameObject, new Vector3().Constructor_Single_Single_Single(Number(-40), Number(10), Number(0)), 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "onComplete", this.ExamplePunchJS_punchTest, "ease", LeanTweenType.punch));
		}
		
		public function ExamplePunchJS_Main(): void {
		}
		
		cil2as static function DefaultValue(): ExamplePunchJS {
			return new ExamplePunchJS().ExamplePunchJS_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.ExamplePunchJS$punchCurve$ = reader.ReadAnimationCurve();
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteAnimationCurve(this.ExamplePunchJS$punchCurve$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function ExamplePunchJS_Constructor(): ExamplePunchJS {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.ExamplePunchJS, {"Awake" : "ExamplePunchJS_Awake", "Start" : "ExamplePunchJS_Start", "punchTest" : "ExamplePunchJS_punchTest", "Main" : "ExamplePunchJS_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
