package global {
	
	import System.CLIArrayFactory;
	import System.Type;
	import System.Collections.Hashtable;
	import UnityEngine.GameObject;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class ExampleRigidbodyCS extends MonoBehaviour implements IDeserializable {
		
		public var ExampleRigidbodyCS$ball1$: GameObject;
		
		public function ExampleRigidbodyCS_Start(): void {
			this.ExampleRigidbodyCS$ball1$ = GameObject.GameObject_Find_String("Sphere1");
			LeanTween.LeanTween_rotateAround_GameObject_Vector3_Single_Single_Hashtable(this.ExampleRigidbodyCS$ball1$, Vector3.forward, -90, 1, new Hashtable().Hashtable_Constructor());
			LeanTween.LeanTween_move_GameObject_Vector3_Single_ObjectArray(this.ExampleRigidbodyCS$ball1$, new Vector3().Constructor_Single_Single_Single(2, 0, 7), 1, CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "delay", 1));
		}
		
		public function ExampleRigidbodyCS_Update(): void {
		}
		
		cil2as static function DefaultValue(): ExampleRigidbodyCS {
			return new ExampleRigidbodyCS().ExampleRigidbodyCS_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function ExampleRigidbodyCS_Constructor(): ExampleRigidbodyCS {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.ExampleRigidbodyCS, {"Start" : "ExampleRigidbodyCS_Start", "Update" : "ExampleRigidbodyCS_Update"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
