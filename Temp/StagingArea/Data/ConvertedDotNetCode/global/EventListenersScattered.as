package global {
	
	import System.Type;
	import UnityEngine.Collision;
	import UnityEngine.Color;
	import UnityEngine.Input;
	import UnityEngine.KeyCode;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Quaternion;
	import UnityEngine.Random;
	import UnityEngine.Time;
	import UnityEngine.Transform;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class EventListenersScattered extends MonoBehaviour implements IDeserializable {
		
		public var EventListenersScattered$towardsRotation$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var EventListenersScattered$turnForLength$: Number = 0.5;
		
		public var EventListenersScattered$turnForIter$: Number = 0;
		
		public var EventListenersScattered$fromColor$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public function EventListenersScattered_Awake(): void {
			LeanTween.LeanTween$LISTENERS_MAX$ = 100;
			LeanTween.LeanTween$EVENTS_MAX$ = 2;
		}
		
		public function EventListenersScattered_Start(): void {
			LeanTween.LeanTween_addListener_Int32_Action$1(0, this.EventListenersScattered_changeColor_LTEvent);
			LeanTween.LeanTween_addListener_Int32_Action$1(1, this.EventListenersScattered_jumpUp_LTEvent);
			this.EventListenersScattered$fromColor$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(super.Component_renderer.Renderer_material.Material_color.r, super.Component_renderer.Renderer_material.Material_color.g, super.Component_renderer.Renderer_material.Material_color.b));
		}
		
		public function EventListenersScattered_jumpUp_LTEvent($e: LTEvent): void {
			super.Component_rigidbody.Rigidbody_AddRelativeForce_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.forward, 300));
		}
		
		public function EventListenersScattered_changeColor_LTEvent($e: LTEvent): void {
			var $transform: Transform = $e.LTEvent$data$ as Transform;
			var $num: Number = Vector3.Distance_Vector3_Vector3($transform.position, super.Component_transform.position);
			var $to: Vector3 = new Vector3().Constructor_Single_Single_Single(Random.Random_Range_Single_Single(0, 1), 0, Random.Random_Range_Single_Single(0, 1));
			LeanTween.LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single(super.Component_gameObject, this.EventListenersScattered_updateColor_Vector3, this.EventListenersScattered$fromColor$, $to, 0.8).LTDescr_setRepeat_Int32(2).LTDescr_setLoopPingPong().LTDescr_setDelay_Single($num * 0.05);
		}
		
		public function EventListenersScattered_updateColor_Vector3($v: Vector3): void {
			super.Component_renderer.Renderer_material.Material_color_Color = new Color().Constructor_Single_Single_Single($v.x, $v.y, $v.z);
		}
		
		public function EventListenersScattered_OnCollisionEnter_Collision($collision: Collision): void {
			if ($collision.Collision_gameObject.layer != 2) {
				this.EventListenersScattered$towardsRotation$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(0, 0, Number(Random.Random_Range_Int32_Int32(-180, 180))));
			}
		}
		
		public function EventListenersScattered_OnCollisionStay_Collision($collision: Collision): void {
			if ($collision.Collision_gameObject.layer != 2) {
				this.EventListenersScattered$turnForIter$ = 0;
				this.EventListenersScattered$turnForLength$ = Random.Random_Range_Single_Single(0.5, 1.5);
			}
		}
		
		public function EventListenersScattered_FixedUpdate(): void {
			if (this.EventListenersScattered$turnForIter$ < this.EventListenersScattered$turnForLength$) {
				super.Component_rigidbody.Rigidbody_MoveRotation_Quaternion(Quaternion.op_Multiply_Quaternion_Quaternion(super.Component_rigidbody.rotation, Quaternion.Euler_Vector3(Vector3.op_Multiply_Vector3_Single(this.EventListenersScattered$towardsRotation$, Time.deltaTime))));
				this.EventListenersScattered$turnForIter$ = this.EventListenersScattered$turnForIter$ + Time.deltaTime;
			}
			super.Component_rigidbody.Rigidbody_AddRelativeForce_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.down, 4.5));
		}
		
		public function EventListenersScattered_OnMouseDown(): void {
			if (Input.Input_GetKey_KeyCode(KeyCode.J)) {
				LeanTween.LeanTween_dispatchEvent_Int32(1);
			} else {
				LeanTween.LeanTween_dispatchEvent_Int32_Object(0, super.Component_transform);
			}
		}
		
		cil2as static function DefaultValue(): EventListenersScattered {
			return new EventListenersScattered().EventListenersScattered_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function EventListenersScattered_Constructor(): EventListenersScattered {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.EventListenersScattered, {"Awake" : "EventListenersScattered_Awake", "Start" : "EventListenersScattered_Start", "jumpUp" : "EventListenersScattered_jumpUp_LTEvent", "changeColor" : "EventListenersScattered_changeColor_LTEvent", "updateColor" : "EventListenersScattered_updateColor_Vector3", "OnCollisionEnter" : "EventListenersScattered_OnCollisionEnter_Collision", "OnCollisionStay" : "EventListenersScattered_OnCollisionStay_Collision", "FixedUpdate" : "EventListenersScattered_FixedUpdate", "OnMouseDown" : "EventListenersScattered_OnMouseDown"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
