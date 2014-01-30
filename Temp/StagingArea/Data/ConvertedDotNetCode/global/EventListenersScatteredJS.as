package global {
	
	import Boo.Lang.Runtime.RuntimeServices;
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
	
	public class EventListenersScatteredJS extends MonoBehaviour implements IDeserializable {
		
		public var EventListenersScatteredJS$towardsRotation$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var EventListenersScatteredJS$turnForLength$: Number = 0;
		
		public var EventListenersScatteredJS$turnForIter$: Number = 0;
		
		public var EventListenersScatteredJS$fromColor$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public function EventListenersScatteredJS_Constructor(): EventListenersScatteredJS {
			this.MonoBehaviour_Constructor();
			this.EventListenersScatteredJS$turnForLength$ = 0.5;
			return this;
		}
		
		public function EventListenersScatteredJS_Awake(): void {
			LeanTween.LeanTween$LISTENERS_MAX$ = 100;
			LeanTween.LeanTween$EVENTS_MAX$ = 2;
			this.EventListenersScatteredJS$fromColor$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(this.Component_renderer.Renderer_material.Material_color.r, this.Component_renderer.Renderer_material.Material_color.g, this.Component_renderer.Renderer_material.Material_color.b));
		}
		
		public function EventListenersScatteredJS_Start(): void {
			LeanTween.LeanTween_addListener_GameObject_Int32_Action$1(this.Component_gameObject, 0, this.EventListenersScatteredJS_changeColor_LTEvent);
			LeanTween.LeanTween_addListener_GameObject_Int32_Action$1(this.Component_gameObject, 1, this.EventListenersScatteredJS_jumpUp_LTEvent);
		}
		
		public function EventListenersScatteredJS_jumpUp_LTEvent($e: LTEvent): void {
			this.Component_rigidbody.Rigidbody_AddRelativeForce_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.forward, 300));
		}
		
		public function EventListenersScatteredJS_changeColor_LTEvent($e: LTEvent): void {
			var $arg_20_0: Object;
			var $expr_06: Object = $arg_20_0 = $e.LTEvent$data$;
			if (!($expr_06 is Transform)) {
				$arg_20_0 = RuntimeServices.RuntimeServices_Coerce_Object_Type($expr_06, Transform.$Type);
			}
			var $transform: Transform = $arg_20_0 as Transform;
			var $num: Number = Vector3.Distance_Vector3_Vector3($transform.position, this.Component_transform.position);
			var $to: Vector3 = new Vector3().Constructor_Single_Single_Single(Random.Random_Range_Single_Single(Number(0), 1), Number(0), Random.Random_Range_Single_Single(Number(0), 1));
			LeanTween.LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single(this.Component_gameObject, this.EventListenersScatteredJS_updateColor_Vector3, this.EventListenersScatteredJS$fromColor$, $to, 0.8).LTDescr_setRepeat_Int32(2).LTDescr_setLoopPingPong().LTDescr_setDelay_Single($num * 0.05);
		}
		
		public function EventListenersScatteredJS_updateColor_Vector3($v: Vector3): void {
			this.Component_renderer.Renderer_material.Material_color_Color = new Color().Constructor_Single_Single_Single($v.x, $v.y, $v.z);
		}
		
		public function EventListenersScatteredJS_OnCollisionEnter_Collision($collision: Collision): void {
			if ($collision.Collision_gameObject.layer != 2) {
				this.EventListenersScatteredJS$towardsRotation$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(Number(0), Number(0), Number(Random.Random_Range_Int32_Int32(-180, 180))));
			}
		}
		
		public function EventListenersScatteredJS_OnCollisionStay_Collision($collision: Collision): void {
			if ($collision.Collision_gameObject.layer != 2) {
				this.EventListenersScatteredJS$turnForIter$ = Number(0);
				this.EventListenersScatteredJS$turnForLength$ = Random.Random_Range_Single_Single(0.5, 1.5);
			}
		}
		
		public function EventListenersScatteredJS_FixedUpdate(): void {
			if (this.EventListenersScatteredJS$turnForIter$ < this.EventListenersScatteredJS$turnForLength$) {
				this.Component_rigidbody.Rigidbody_MoveRotation_Quaternion(Quaternion.op_Multiply_Quaternion_Quaternion(this.Component_rigidbody.rotation, Quaternion.Euler_Vector3(Vector3.op_Multiply_Vector3_Single(this.EventListenersScatteredJS$towardsRotation$, Time.deltaTime))));
				this.EventListenersScatteredJS$turnForIter$ = this.EventListenersScatteredJS$turnForIter$ + Time.deltaTime;
			}
			this.Component_rigidbody.Rigidbody_AddRelativeForce_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.down, 4.5));
		}
		
		public function EventListenersScatteredJS_OnMouseDown(): void {
			if (Input.Input_GetKey_KeyCode(KeyCode.J)) {
				LeanTween.LeanTween_dispatchEvent_Int32(1);
			} else {
				LeanTween.LeanTween_dispatchEvent_Int32_Object(0, this.Component_transform);
			}
		}
		
		public function EventListenersScatteredJS_Main(): void {
		}
		
		cil2as static function DefaultValue(): EventListenersScatteredJS {
			return new EventListenersScatteredJS().EventListenersScatteredJS_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.EventListenersScatteredJS, {"Awake" : "EventListenersScatteredJS_Awake", "Start" : "EventListenersScatteredJS_Start", "jumpUp" : "EventListenersScatteredJS_jumpUp_LTEvent", "changeColor" : "EventListenersScatteredJS_changeColor_LTEvent", "updateColor" : "EventListenersScatteredJS_updateColor_Vector3", "OnCollisionEnter" : "EventListenersScatteredJS_OnCollisionEnter_Collision", "OnCollisionStay" : "EventListenersScatteredJS_OnCollisionStay_Collision", "FixedUpdate" : "EventListenersScatteredJS_FixedUpdate", "OnMouseDown" : "EventListenersScatteredJS_OnMouseDown", "Main" : "EventListenersScatteredJS_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
