package global {
	
	import System.Type;
	import UnityEngine.AnimationCurve;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class ExampleCameraShake extends MonoBehaviour implements IDeserializable {
		
		public var ExampleCameraShake$shakeCurve$: AnimationCurve;
		
		public function ExampleCameraShake_Start(): void {
			LeanTween.LeanTween_rotateAround_GameObject_Vector3_Single_Single(super.Component_gameObject, Vector3.up, 1, 0.2).LTDescr_setEase_AnimationCurve(this.ExampleCameraShake$shakeCurve$).LTDescr_setLoopClamp().LTDescr_setRepeat_Int32(-1);
			LeanTween.LeanTween_rotateAround_GameObject_Vector3_Single_Single(super.Component_gameObject, Vector3.right, 1, 0.25).LTDescr_setEase_AnimationCurve(this.ExampleCameraShake$shakeCurve$).LTDescr_setLoopClamp().LTDescr_setRepeat_Int32(-1).LTDescr_setDelay_Single(0.05);
		}
		
		cil2as static function DefaultValue(): ExampleCameraShake {
			return new ExampleCameraShake().ExampleCameraShake_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.ExampleCameraShake$shakeCurve$ = reader.ReadAnimationCurve();
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteAnimationCurve(this.ExampleCameraShake$shakeCurve$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function ExampleCameraShake_Constructor(): ExampleCameraShake {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.ExampleCameraShake, {"Start" : "ExampleCameraShake_Start"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
