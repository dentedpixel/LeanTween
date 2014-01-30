package global {
	
	import System.Type;
	import UnityEngine.Input;
	import UnityEngine.KeyCode;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class PunchTester extends MonoBehaviour implements IDeserializable {
		
		public function PunchTester_Start(): void {
		}
		
		public function PunchTester_Update(): void {
			if (Input.Input_GetKeyDown_KeyCode(KeyCode.S)) {
				LeanTween.LeanTween_scale_GameObject_Vector3_Single(super.Component_gameObject, Vector3.one, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.punch);
				MonoBehaviour.MonoBehaviour_print_Object("scale punch!");
			}
			if (Input.Input_GetKeyDown_KeyCode(KeyCode.R)) {
				LeanTween.LeanTween_rotate_GameObject_Vector3_Single(super.Component_gameObject, Vector3.one, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.punch);
				MonoBehaviour.MonoBehaviour_print_Object("rotate punch!");
			}
			if (Input.Input_GetKeyDown_KeyCode(KeyCode.M)) {
				LeanTween.LeanTween_move_GameObject_Vector3_Single(super.Component_gameObject, new Vector3().Constructor_Single_Single_Single(0, 0, 1), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.punch);
				MonoBehaviour.MonoBehaviour_print_Object("move punch!");
			}
		}
		
		cil2as static function DefaultValue(): PunchTester {
			return new PunchTester().PunchTester_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function PunchTester_Constructor(): PunchTester {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.PunchTester, {"Start" : "PunchTester_Start", "Update" : "PunchTester_Update"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
