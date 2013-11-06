package global {
	
	import System.CLIArrayFactory;
	import System.CLIObjectArray;
	import System.Enum;
	import System.Type;
	import System.Collections.Hashtable;
	import UnityEngine._Object;
	import UnityEngine.AnimationCurve;
	import UnityEngine.Application;
	import UnityEngine.Color;
	import UnityEngine.Debug;
	import UnityEngine.GameObject;
	import UnityEngine.Gizmos;
	import UnityEngine.Keyframe;
	import UnityEngine.Material;
	import UnityEngine.Mathf;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Quaternion;
	import UnityEngine.Rect;
	import UnityEngine.Time;
	import UnityEngine.Transform;
	import UnityEngine.Vector2;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class LeanTween extends MonoBehaviour implements IDeserializable {
		
		public static var LeanTween$throwErrors$: Boolean = true;
		
		public static var LeanTween$tweens$: CLIObjectArray;
		
		public static var LeanTween$tweenMaxSearch$: int = 0;
		
		public static var LeanTween$maxTweens$: int = 400;
		
		public static var LeanTween$frameRendered$: int = -1;
		
		public static var LeanTween$tweenEmpty$: GameObject;
		
		public static var LeanTween$dtEstimated$: Number = 0;
		
		public static var LeanTween$dt$: Number = 0;
		
		public static var LeanTween$dtActual$: Number = 0;
		
		public static var LeanTween$tween$: LeanTweenDescr;
		
		public static var LeanTween$i$: int;
		
		public static var LeanTween$j$: int;
		
		public static var _LeanTween$punch$: AnimationCurve;
		
		public static var _LeanTween$emptyHash$: Hashtable;
		
		public static var LeanTween$onUpdateF$: Function;
		
		public static var LeanTween$trans$: Transform;
		
		public static var LeanTween$timeTotal$: Number = 0;
		
		public static var LeanTween$tweenAction$: int;
		
		public static var LeanTween$optionalItems$: Hashtable;
		
		public static var LeanTween$animationCurve$: AnimationCurve;
		
		public static var LeanTween$ratioPassed$: Number = 0;
		
		public static var LeanTween$from$: Number = 0;
		
		public static var LeanTween$to$: Number = 0;
		
		public static var LeanTween$val$: Number = 0;
		
		public static var LeanTween$newVect$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public static var LeanTween$isTweenFinished$: Boolean;
		
		public static var LeanTween$target$: GameObject;
		
		public static var LeanTween$customTarget$: GameObject;
		
		public static var LeanTween$startSearch$: int = 0;
		
		public static var LeanTween$lastMax$: int = 0;
		
		public static function LeanTween_init(): void {
			LeanTween_init_Int32(LeanTween$maxTweens$);
		}
		
		public static function LeanTween_init_Int32($maxSimultaneousTweens: int): void {
			if (LeanTween$tweens$ == null) {
				LeanTween$maxTweens$ = $maxSimultaneousTweens;
				LeanTween$tweens$ = CLIArrayFactory.NewArrayWithLength(LeanTweenDescr.$Type, LeanTween$maxTweens$);
				LeanTween$tweenEmpty$ = new GameObject().GameObject_Constructor();
				LeanTween$tweenEmpty$.Object_name_String = "~LeanTween";
				LeanTween$tweenEmpty$.GameObject_AddComponent_Type($Type);
				LeanTween$tweenEmpty$.isStatic = true;
				_Object.Object_DontDestroyOnLoad_Object(LeanTween$tweenEmpty$);
				for (var $i: int = 0; $i < LeanTween$maxTweens$; $i = $i + 1) {
					LeanTween$tweens$.elements[$i] = new LeanTweenDescr().LeanTweenDescr_Constructor();
				}
			}
		}
		
		public static function LeanTween_reset(): void {
			LeanTween$tweens$ = null;
		}
		
		public function LeanTween_Update(): void {
			LeanTween_update();
		}
		
		public static function LeanTween_update(): void {
			if (LeanTween$frameRendered$ != Time.frameCount) {
				LeanTween_init();
				LeanTween$dtEstimated$ = Application.targetFrameRate <= 0 ? 0.01666667 : (1 / Number(Application.targetFrameRate));
				LeanTween$dtActual$ = Time.deltaTime * Time.timeScale;
				var $num: int = 0;
				while (($num < LeanTween$tweenMaxSearch$) && ($num < LeanTween$maxTweens$)) {
					if ((LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$toggle$) {
						LeanTween$tween$ = LeanTween$tweens$.elements[$num] as LeanTweenDescr;
						LeanTween$trans$ = LeanTween$tween$.LeanTweenDescr$trans$;
						LeanTween$timeTotal$ = LeanTween$tween$.LeanTweenDescr$time$;
						LeanTween$tweenAction$ = LeanTween$tween$.LeanTweenDescr$type$.value;
						LeanTween$animationCurve$ = LeanTween$tween$.LeanTweenDescr$animationCurve$;
						LeanTween$optionalItems$ = LeanTween$tween$.LeanTweenDescr$optional$;
						LeanTween$dt$ = LeanTween$dtActual$;
						if (LeanTween$tween$.LeanTweenDescr$useEstimatedTime$) {
							LeanTween$dt$ = LeanTween$dtEstimated$;
						} else {
							if (LeanTween$tween$.LeanTweenDescr$useFrames$) {
								LeanTween$dt$ = 1;
							}
						}
						if (_Object.Object_op_Equality_Object_Object(LeanTween$trans$, null)) {
							LeanTween_removeTween_Int32($num);
						} else {
							LeanTween$isTweenFinished$ = false;
							if (((LeanTween$tween$.LeanTweenDescr$passed$ + LeanTween$dt$) > LeanTween$timeTotal$) && (LeanTween$tween$.LeanTweenDescr$direction$ > 0)) {
								LeanTween$isTweenFinished$ = true;
								LeanTween$tween$.LeanTweenDescr$passed$ = LeanTween$timeTotal$;
							} else {
								if ((LeanTween$tween$.LeanTweenDescr$direction$ < 0) && ((LeanTween$tween$.LeanTweenDescr$passed$ - LeanTween$dt$) < 0)) {
									LeanTween$isTweenFinished$ = true;
									LeanTween$tween$.LeanTweenDescr$passed$ = 1.401298E-45;
								}
							}
							if (((Number(LeanTween$tween$.LeanTweenDescr$passed$) == 0) && (Number((LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$delay$) == 0)) || ((Number(LeanTween$tween$.LeanTweenDescr$passed$) > 0) && (!LeanTween$tween$.LeanTweenDescr$hasInitiliazed$))) {
								LeanTween$tween$.LeanTweenDescr$hasInitiliazed$ = true;
								switch (LeanTween$tweenAction$) {
									case 0:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.position.x;
											break;
										}
									case 1:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.position.y;
											break;
										}
									case 2:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.position.z;
											break;
										}
									case 3:
										{
											(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.x = LeanTween$trans$.localPosition.x;
											break;
										}
									case 4:
										{
											(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.x = LeanTween$trans$.localPosition.y;
											break;
										}
									case 5:
										{
											(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.x = LeanTween$trans$.localPosition.z;
											break;
										}
									case 6:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = 0;
											break;
										}
									case 7:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = 0;
											break;
										}
									case 8:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.localScale.x;
											break;
										}
									case 9:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.localScale.y;
											break;
										}
									case 10:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.localScale.z;
											break;
										}
									case 11:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.eulerAngles.x;
											LeanTween$tween$.LeanTweenDescr$to$.x = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x);
											break;
										}
									case 12:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.eulerAngles.y;
											LeanTween$tween$.LeanTweenDescr$to$.x = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x);
											break;
										}
									case 13:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.eulerAngles.z;
											LeanTween$tween$.LeanTweenDescr$to$.x = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x);
											break;
										}
									case 14:
										{
											LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_set_Item_Object_Object("last", 0);
											LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_set_Item_Object_Object("origRotation", LeanTween$trans$.eulerAngles.cil2as::Copy());
											break;
										}
									case 15:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$trans$.Component_gameObject.renderer.Renderer_material.Material_color.a;
											break;
										}
									case 18:
										{
											LeanTween$tween$.LeanTweenDescr$from$.cil2as::Assign(LeanTween$trans$.position);
											break;
										}
									case 19:
										{
											LeanTween$tween$.LeanTweenDescr$from$.cil2as::Assign(LeanTween$trans$.localPosition);
											break;
										}
									case 20:
										{
											LeanTween$tween$.LeanTweenDescr$from$.cil2as::Assign(LeanTween$trans$.eulerAngles);
											LeanTween$tween$.LeanTweenDescr$to$.x = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x);
											LeanTween$tween$.LeanTweenDescr$to$.y = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y);
											LeanTween$tween$.LeanTweenDescr$to$.z = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z);
											break;
										}
									case 21:
										{
											LeanTween$tween$.LeanTweenDescr$from$.cil2as::Assign(LeanTween$trans$.localEulerAngles);
											LeanTween$tween$.LeanTweenDescr$to$.x = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x);
											LeanTween$tween$.LeanTweenDescr$to$.y = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y);
											LeanTween$tween$.LeanTweenDescr$to$.z = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z);
											break;
										}
									case 22:
										{
											LeanTween$tween$.LeanTweenDescr$from$.cil2as::Assign(LeanTween$trans$.localScale);
											break;
										}
									case 24:
										{
											LeanTween$tween$.LeanTweenDescr$from$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect.x, LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect.y, 0));
											break;
										}
									case 25:
										{
											LeanTween$tween$.LeanTweenDescr$from$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect.width, LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect.height, 0));
											break;
										}
									case 26:
										{
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect$alpha$;
											break;
										}
									case 27:
										{
											if (!LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect$rotateEnabled$) {
												LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect$rotateEnabled$ = true;
												LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_resetForRotation();
											}
											LeanTween$tween$.LeanTweenDescr$from$.x = LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect$rotation$;
											break;
										}
								}
								LeanTween$tween$.LeanTweenDescr$diff$.x = LeanTween$tween$.LeanTweenDescr$to$.x - LeanTween$tween$.LeanTweenDescr$from$.x;
								LeanTween$tween$.LeanTweenDescr$diff$.y = LeanTween$tween$.LeanTweenDescr$to$.y - LeanTween$tween$.LeanTweenDescr$from$.y;
								LeanTween$tween$.LeanTweenDescr$diff$.z = LeanTween$tween$.LeanTweenDescr$to$.z - LeanTween$tween$.LeanTweenDescr$from$.z;
							}
							if (LeanTween$tween$.LeanTweenDescr$delay$ <= 0) {
								LeanTween$ratioPassed$ = LeanTween$tween$.LeanTweenDescr$passed$ / LeanTween$timeTotal$;
								if (Number(LeanTween$ratioPassed$) > 1) {
									LeanTween$ratioPassed$ = 1;
								}
								if ((LeanTween$tweenAction$ >= 0) && (LeanTween$tweenAction$ <= 17)) {
									if (LeanTween$animationCurve$ != null) {
										LeanTween$val$ = LeanTween_tweenOnCurve_LeanTweenDescr_Single(LeanTween$tween$, LeanTween$ratioPassed$);
									} else {
										switch (LeanTween$tween$.LeanTweenDescr$tweenType$) {
											case LeanTweenType.linear:
												{
													LeanTween$val$ = LeanTween$tween$.LeanTweenDescr$from$.x + (LeanTween$tween$.LeanTweenDescr$diff$.x * LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutQuad:
												{
													LeanTween$val$ = LeanTween_easeOutQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$diff$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInQuad:
												{
													LeanTween$val$ = LeanTween_easeInQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$diff$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutQuad:
												{
													LeanTween$val$ = LeanTween_easeInOutQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$diff$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInCubic:
												{
													LeanTween$val$ = LeanTween_easeInCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutCubic:
												{
													LeanTween$val$ = LeanTween_easeOutCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutCubic:
												{
													LeanTween$val$ = LeanTween_easeInOutCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInQuart:
												{
													LeanTween$val$ = LeanTween_easeInQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutQuart:
												{
													LeanTween$val$ = LeanTween_easeOutQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutQuart:
												{
													LeanTween$val$ = LeanTween_easeInOutQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInQuint:
												{
													LeanTween$val$ = LeanTween_easeInQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutQuint:
												{
													LeanTween$val$ = LeanTween_easeOutQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutQuint:
												{
													LeanTween$val$ = LeanTween_easeInOutQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInSine:
												{
													LeanTween$val$ = LeanTween_easeInSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutSine:
												{
													LeanTween$val$ = LeanTween_easeOutSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutSine:
												{
													LeanTween$val$ = LeanTween_easeInOutSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInExpo:
												{
													LeanTween$val$ = LeanTween_easeInExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutExpo:
												{
													LeanTween$val$ = LeanTween_easeOutExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutExpo:
												{
													LeanTween$val$ = LeanTween_easeInOutExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInCirc:
												{
													LeanTween$val$ = LeanTween_easeInCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutCirc:
												{
													LeanTween$val$ = LeanTween_easeOutCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutCirc:
												{
													LeanTween$val$ = LeanTween_easeInOutCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInBounce:
												{
													LeanTween$val$ = LeanTween_easeInBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutBounce:
												{
													LeanTween$val$ = LeanTween_easeOutBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutBounce:
												{
													LeanTween$val$ = LeanTween_easeInOutBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInBack:
												{
													LeanTween$val$ = LeanTween_easeInBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutBack:
												{
													LeanTween$val$ = LeanTween_easeOutBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutBack:
												{
													LeanTween$val$ = LeanTween_easeInOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInElastic:
												{
													LeanTween$val$ = LeanTween_easeInElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeOutElastic:
												{
													LeanTween$val$ = LeanTween_easeOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.easeInOutElastic:
												{
													LeanTween$val$ = LeanTween_easeInOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$);
													break;
												}
											case LeanTweenType.punch:
												{
													LeanTween$tween$.LeanTweenDescr$animationCurve$ = LeanTween$punch$;
													LeanTween$tween$.LeanTweenDescr$to$.x = LeanTween$tween$.LeanTweenDescr$from$.x + LeanTween$tween$.LeanTweenDescr$to$.x;
													LeanTween$val$ = LeanTween_tweenOnCurve_LeanTweenDescr_Single(LeanTween$tween$, LeanTween$ratioPassed$);
													break;
												}
											default:
												{
													LeanTween$val$ = LeanTween$tween$.LeanTweenDescr$from$.x + (LeanTween$tween$.LeanTweenDescr$diff$.x * LeanTween$ratioPassed$);
													break;
												}
										}
									}
									if (LeanTween$tweenAction$ == 0) {
										LeanTween$trans$.position = new Vector3().Constructor_Single_Single_Single(LeanTween$val$, LeanTween$trans$.position.y, LeanTween$trans$.position.z);
									} else {
										if (LeanTween$tweenAction$ == 1) {
											LeanTween$trans$.position = new Vector3().Constructor_Single_Single_Single(LeanTween$trans$.position.x, LeanTween$val$, LeanTween$trans$.position.z);
										} else {
											if (LeanTween$tweenAction$ == 2) {
												LeanTween$trans$.position = new Vector3().Constructor_Single_Single_Single(LeanTween$trans$.position.x, LeanTween$trans$.position.y, LeanTween$val$);
											}
										}
									}
									if (LeanTween$tweenAction$ == 3) {
										LeanTween$trans$.localPosition = new Vector3().Constructor_Single_Single_Single(LeanTween$val$, LeanTween$trans$.localPosition.y, LeanTween$trans$.localPosition.z);
									} else {
										if (LeanTween$tweenAction$ == 4) {
											LeanTween$trans$.localPosition = new Vector3().Constructor_Single_Single_Single(LeanTween$trans$.localPosition.x, LeanTween$val$, LeanTween$trans$.localPosition.z);
										} else {
											if (LeanTween$tweenAction$ == 5) {
												LeanTween$trans$.localPosition = new Vector3().Constructor_Single_Single_Single(LeanTween$trans$.localPosition.x, LeanTween$trans$.localPosition.y, LeanTween$val$);
											} else {
												if (LeanTween$tweenAction$ == 6) {
													if (LeanTween$tween$.LeanTweenDescr$path$.LTBezierPath$orientToPath$) {
														LeanTween$tween$.LeanTweenDescr$path$.LTBezierPath_place_Transform_Single(LeanTween$trans$, LeanTween$val$);
													} else {
														LeanTween$trans$.position = LeanTween$tween$.LeanTweenDescr$path$.LTBezierPath_point_Single(LeanTween$val$);
													}
												} else {
													if (LeanTween$tweenAction$ == 7) {
														if (LeanTween$tween$.LeanTweenDescr$path$.LTBezierPath$orientToPath$) {
															LeanTween$tween$.LeanTweenDescr$path$.LTBezierPath_placeLocal_Transform_Single(LeanTween$trans$, LeanTween$val$);
														} else {
															LeanTween$trans$.localPosition = LeanTween$tween$.LeanTweenDescr$path$.LTBezierPath_point_Single(LeanTween$val$);
														}
													} else {
														if (LeanTween$tweenAction$ == 8) {
															LeanTween$trans$.localScale = new Vector3().Constructor_Single_Single_Single(LeanTween$val$, LeanTween$trans$.localScale.y, LeanTween$trans$.localScale.z);
														} else {
															if (LeanTween$tweenAction$ == 9) {
																LeanTween$trans$.localScale = new Vector3().Constructor_Single_Single_Single(LeanTween$trans$.localScale.x, LeanTween$val$, LeanTween$trans$.localScale.z);
															} else {
																if (LeanTween$tweenAction$ == 10) {
																	LeanTween$trans$.localScale = new Vector3().Constructor_Single_Single_Single(LeanTween$trans$.localScale.x, LeanTween$trans$.localScale.y, LeanTween$val$);
																} else {
																	if (LeanTween$tweenAction$ == 11) {
																		LeanTween$trans$.eulerAngles = new Vector3().Constructor_Single_Single_Single(LeanTween$val$, LeanTween$trans$.eulerAngles.y, LeanTween$trans$.eulerAngles.z);
																	} else {
																		if (LeanTween$tweenAction$ == 12) {
																			LeanTween$trans$.eulerAngles = new Vector3().Constructor_Single_Single_Single(LeanTween$trans$.eulerAngles.x, LeanTween$val$, LeanTween$trans$.eulerAngles.z);
																		} else {
																			if (LeanTween$tweenAction$ == 13) {
																				LeanTween$trans$.eulerAngles = new Vector3().Constructor_Single_Single_Single(LeanTween$trans$.eulerAngles.x, LeanTween$trans$.eulerAngles.y, LeanTween$val$);
																			} else {
																				if (LeanTween$tweenAction$ == 14) {
																					var $num2: Number = LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_get_Item_Object("last") as Number;
																					var $angle: Number = LeanTween$val$ - $num2;
																					if (LeanTween$isTweenFinished$) {
																						var $eulerAngles: Vector3 = LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_get_Item_Object("origRotation") as Vector3;
																						LeanTween$trans$.eulerAngles = $eulerAngles.cil2as::Copy();
																						LeanTween$trans$.Transform_RotateAround_Vector3_Vector3_Single(LeanTween$trans$.Transform_TransformPoint_Vector3(LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_get_Item_Object("point") as Vector3), LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_get_Item_Object("axis") as Vector3, LeanTween$tween$.LeanTweenDescr$to$.x);
																					} else {
																						LeanTween$trans$.Transform_RotateAround_Vector3_Vector3_Single(LeanTween$trans$.Transform_TransformPoint_Vector3(LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_get_Item_Object("point") as Vector3), LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_get_Item_Object("axis") as Vector3, $angle);
																						LeanTween$tween$.LeanTweenDescr$optional$.IDictionary_set_Item_Object_Object("last", LeanTween$val$);
																					}
																				} else {
																					if (LeanTween$tweenAction$ == 15) {
																						var $materials: CLIObjectArray = LeanTween$trans$.Component_gameObject.renderer.Renderer_materials;
																						for (var $i: int = 0; $i < $materials.Length; $i = $i + 1) {
																							var $material: Material = $materials.elements[$i] as Material;
																							$material.Material_color_Color = new Color().Constructor_Single_Single_Single_Single($material.Material_color.r, $material.Material_color.g, $material.Material_color.b, LeanTween$val$);
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								} else {
									if (LeanTween$tweenAction$ >= 18) {
										if (LeanTween$animationCurve$ != null) {
											LeanTween$newVect$.cil2as::Assign(LeanTween_tweenOnCurveVector_LeanTweenDescr_Single(LeanTween$tween$, LeanTween$ratioPassed$));
										} else {
											if (LeanTween$tween$.LeanTweenDescr$tweenType$ == LeanTweenType.linear) {
												LeanTween$newVect$.x = LeanTween$tween$.LeanTweenDescr$from$.x + (LeanTween$tween$.LeanTweenDescr$diff$.x * LeanTween$ratioPassed$);
												LeanTween$newVect$.y = LeanTween$tween$.LeanTweenDescr$from$.y + (LeanTween$tween$.LeanTweenDescr$diff$.y * LeanTween$ratioPassed$);
												LeanTween$newVect$.z = LeanTween$tween$.LeanTweenDescr$from$.z + (LeanTween$tween$.LeanTweenDescr$diff$.z * LeanTween$ratioPassed$);
											} else {
												if (LeanTween$tween$.LeanTweenDescr$tweenType$.value >= LeanTweenType.linear.value) {
													switch (LeanTween$tween$.LeanTweenDescr$tweenType$) {
														case LeanTweenType.easeOutQuad:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$diff$.x, LeanTween$ratioPassed$), LeanTween_easeOutQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$diff$.y, LeanTween$ratioPassed$), LeanTween_easeOutQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$diff$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInQuad:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$diff$.x, LeanTween$ratioPassed$), LeanTween_easeInQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$diff$.y, LeanTween$ratioPassed$), LeanTween_easeInQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$diff$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutQuad:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$diff$.x, LeanTween$ratioPassed$), LeanTween_easeInOutQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$diff$.y, LeanTween$ratioPassed$), LeanTween_easeInOutQuadOpt_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$diff$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInCubic:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutCubic:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutCubic:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutCubic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInQuart:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutQuart:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutQuart:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutQuart_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInQuint:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutQuint:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutQuint:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutQuint_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInSine:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutSine:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutSine:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutSine_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInExpo:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutExpo:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutExpo:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutExpo_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInCirc:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutCirc:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutCirc:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutCirc_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInBounce:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutBounce:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutBounce:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutBounce_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInBack:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutBack:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutBack:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutBack_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInElastic:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeOutElastic:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.easeInOutElastic:
															{
																LeanTween$newVect$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(LeanTween_easeInOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x, LeanTween$ratioPassed$), LeanTween_easeInOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y, LeanTween$ratioPassed$), LeanTween_easeInOutElastic_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z, LeanTween$ratioPassed$)));
																break;
															}
														case LeanTweenType.punch:
															{
																LeanTween$tween$.LeanTweenDescr$animationCurve$ = LeanTween$punch$;
																LeanTween$tween$.LeanTweenDescr$to$.x = LeanTween$tween$.LeanTweenDescr$from$.x + LeanTween$tween$.LeanTweenDescr$to$.x;
																LeanTween$tween$.LeanTweenDescr$to$.y = LeanTween$tween$.LeanTweenDescr$from$.y + LeanTween$tween$.LeanTweenDescr$to$.y;
																LeanTween$tween$.LeanTweenDescr$to$.z = LeanTween$tween$.LeanTweenDescr$from$.z + LeanTween$tween$.LeanTweenDescr$to$.z;
																if ((LeanTween$tweenAction$ == 20) || (LeanTween$tweenAction$ == 21)) {
																	LeanTween$tween$.LeanTweenDescr$to$.x = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.x, LeanTween$tween$.LeanTweenDescr$to$.x);
																	LeanTween$tween$.LeanTweenDescr$to$.y = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.y, LeanTween$tween$.LeanTweenDescr$to$.y);
																	LeanTween$tween$.LeanTweenDescr$to$.z = LeanTween_closestRot_Single_Single(LeanTween$tween$.LeanTweenDescr$from$.z, LeanTween$tween$.LeanTweenDescr$to$.z);
																}
																LeanTween$newVect$.cil2as::Assign(LeanTween_tweenOnCurveVector_LeanTweenDescr_Single(LeanTween$tween$, LeanTween$ratioPassed$));
																break;
															}
													}
												} else {
													LeanTween$newVect$.x = LeanTween$tween$.LeanTweenDescr$from$.x + (LeanTween$tween$.LeanTweenDescr$diff$.x * LeanTween$ratioPassed$);
													LeanTween$newVect$.y = LeanTween$tween$.LeanTweenDescr$from$.y + (LeanTween$tween$.LeanTweenDescr$diff$.y * LeanTween$ratioPassed$);
													LeanTween$newVect$.z = LeanTween$tween$.LeanTweenDescr$from$.z + (LeanTween$tween$.LeanTweenDescr$diff$.z * LeanTween$ratioPassed$);
												}
											}
										}
										if (LeanTween$tweenAction$ == 18) {
											LeanTween$trans$.position = LeanTween$newVect$.cil2as::Copy();
										} else {
											if (LeanTween$tweenAction$ == 19) {
												LeanTween$trans$.localPosition = LeanTween$newVect$.cil2as::Copy();
											} else {
												if (LeanTween$tweenAction$ == 20) {
													if (LeanTween$tween$.LeanTweenDescr$hasPhysics$) {
														LeanTween$trans$.Component_gameObject.rigidbody.Rigidbody_MoveRotation_Quaternion(Quaternion.Euler_Vector3(LeanTween$newVect$));
													} else {
														LeanTween$trans$.eulerAngles = LeanTween$newVect$.cil2as::Copy();
													}
												} else {
													if (LeanTween$tweenAction$ == 21) {
														LeanTween$trans$.localEulerAngles = LeanTween$newVect$.cil2as::Copy();
													} else {
														if (LeanTween$tweenAction$ == 22) {
															LeanTween$trans$.localScale = LeanTween$newVect$.cil2as::Copy();
														} else {
															if (LeanTween$tweenAction$ == 24) {
																LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect_Rect = new Rect().Constructor_Single_Single_Single_Single(LeanTween$newVect$.x, LeanTween$newVect$.y, LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect.width, LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect.height);
															} else {
																if (LeanTween$tweenAction$ == 25) {
																	LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect_Rect = new Rect().Constructor_Single_Single_Single_Single(LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect.x, LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect_rect.y, LeanTween$newVect$.x, LeanTween$newVect$.y);
																} else {
																	if (LeanTween$tweenAction$ == 26) {
																		LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect$alpha$ = LeanTween$newVect$.x;
																	} else {
																		if (LeanTween$tweenAction$ == 27) {
																			LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect$rotation$ = LeanTween$newVect$.x;
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								if (LeanTween$tween$.LeanTweenDescr$optional$ != null) {
									var $obj: Object = LeanTween$optionalItems$.IDictionary_get_Item_Object("onUpdate");
									if ($obj != null) {
										var $arg: Hashtable = LeanTween$optionalItems$.IDictionary_get_Item_Object("onUpdateParam") as Hashtable;
										if (LeanTween$tweenAction$ == 23) {
											if (Type.ForObject($obj) == Type.ForClass(String)) {
												var $methodName: String = $obj as String;
												LeanTween$customTarget$ = LeanTween$optionalItems$.IDictionary_get_Item_Object("onUpdateTarget") == null ? LeanTween$trans$.Component_gameObject : (LeanTween$optionalItems$.IDictionary_get_Item_Object("onUpdateTarget") as GameObject);
												LeanTween$customTarget$.GameObject_BroadcastMessage_String_Object($methodName, LeanTween$newVect$);
											} else {
												if (Type.ForObject($obj) == Type.ForClass(Function)) {
													var $action: Function = $obj as Function;
													$action(LeanTween$newVect$.cil2as::Copy(), $arg);
												} else {
													var $action2: Function = $obj as Function;
													$action2(LeanTween$newVect$.cil2as::Copy());
												}
											}
										} else {
											if (Type.ForObject($obj) == Type.ForClass(String)) {
												var $methodName2: String = $obj as String;
												if (LeanTween$optionalItems$.IDictionary_get_Item_Object("onUpdateTarget") != null) {
													LeanTween$customTarget$ = LeanTween$optionalItems$.IDictionary_get_Item_Object("onUpdateTarget") as GameObject;
													LeanTween$customTarget$.GameObject_BroadcastMessage_String_Object($methodName2, LeanTween$val$);
												} else {
													LeanTween$trans$.Component_gameObject.GameObject_BroadcastMessage_String_Object($methodName2, LeanTween$val$);
												}
											} else {
												if (Type.ForObject($obj) == Type.ForClass(Function)) {
													var $action3: Function = $obj as Function;
													$action3(LeanTween$val$, $arg);
												} else {
													var $action4: Function = $obj as Function;
													$action4(LeanTween$val$);
												}
											}
										}
									}
								}
							}
							if (LeanTween$isTweenFinished$) {
								var $action5: Function = null;
								if (LeanTween$tweenAction$ == 27) {
									LeanTween$tween$.LeanTweenDescr$ltRect$.LTRect$rotateFinished$ = true;
								}
								if ((LeanTween$tween$.LeanTweenDescr$loopType$ == LeanTweenType.once) || (LeanTween$tween$.LeanTweenDescr$loopCount$ == 1)) {
									var $text: String = "";
									var $obj2: Object = null;
									if ((LeanTween$tween$.LeanTweenDescr$optional$ != null) && _Object.Object_op_Implicit_Object_Boolean(LeanTween$tween$.LeanTweenDescr$trans$)) {
										if (LeanTween$optionalItems$.IDictionary_get_Item_Object("onComplete") != null) {
											if (Type.ForObject(LeanTween$optionalItems$.IDictionary_get_Item_Object("onComplete")) == Type.ForClass(String)) {
												$text = LeanTween$optionalItems$.IDictionary_get_Item_Object("onComplete") as String;
											} else {
												$action5 = LeanTween$optionalItems$.IDictionary_get_Item_Object("onComplete") as Function;
											}
										}
										$obj2 = LeanTween$optionalItems$.IDictionary_get_Item_Object("onCompleteParam");
									}
									LeanTween_removeTween_Int32($num);
									if ($action5 != null) {
										$action5();
									} else {
										if ($text != "") {
											if (LeanTween$optionalItems$.IDictionary_get_Item_Object("onCompleteTarget") != null) {
												LeanTween$customTarget$ = LeanTween$optionalItems$.IDictionary_get_Item_Object("onCompleteTarget") as GameObject;
												if ($obj2 != null) {
													LeanTween$customTarget$.GameObject_BroadcastMessage_String_Object($text, $obj2);
												} else {
													LeanTween$customTarget$.GameObject_BroadcastMessage_String($text);
												}
											} else {
												if ($obj2 != null) {
													LeanTween$trans$.Component_gameObject.GameObject_BroadcastMessage_String_Object($text, $obj2);
												} else {
													LeanTween$trans$.Component_gameObject.GameObject_BroadcastMessage_String($text);
												}
											}
										}
									}
								} else {
									if (LeanTween$tween$.LeanTweenDescr$loopCount$ >= 1) {
										LeanTween$tween$.LeanTweenDescr$loopCount$ = LeanTween$tween$.LeanTweenDescr$loopCount$ - 1;
									}
									if (LeanTween$tween$.LeanTweenDescr$loopType$ == LeanTweenType.clamp) {
										LeanTween$tween$.LeanTweenDescr$passed$ = 1.401298E-45;
									} else {
										if (LeanTween$tween$.LeanTweenDescr$loopType$ == LeanTweenType.pingPong) {
											LeanTween$tween$.LeanTweenDescr$direction$ = 0 - LeanTween$tween$.LeanTweenDescr$direction$;
										}
									}
								}
							} else {
								if (LeanTween$tween$.LeanTweenDescr$delay$ <= 0) {
									LeanTween$tween$.LeanTweenDescr$passed$ = LeanTween$tween$.LeanTweenDescr$passed$ + (LeanTween$dt$ * LeanTween$tween$.LeanTweenDescr$direction$);
								} else {
									LeanTween$tween$.LeanTweenDescr$delay$ = LeanTween$tween$.LeanTweenDescr$delay$ - LeanTween$dt$;
									if (LeanTween$tween$.LeanTweenDescr$delay$ < 0) {
										LeanTween$tween$.LeanTweenDescr$passed$ = 0;
										LeanTween$tween$.LeanTweenDescr$delay$ = 0;
									}
								}
							}
						}
					}
					$num = $num + 1;
				}
				LeanTween$frameRendered$ = Time.frameCount;
			}
		}
		
		public static function LeanTween_removeTween_Int32($i: int): void {
			(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$toggle$ = false;
			(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$ = null;
			LeanTween$startSearch$ = $i;
			if (($i + 1) >= LeanTween$tweenMaxSearch$) {
				LeanTween$startSearch$ = 0;
				LeanTween$tweenMaxSearch$ = LeanTween$tweenMaxSearch$ - 1;
			}
		}
		
		public static function LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject: GameObject, $to: Vector3, $time: Number, $tweenAction: TweenAction, $optional: Hashtable): int {
			LeanTween_init_Int32(LeanTween$maxTweens$);
			if (_Object.Object_op_Equality_Object_Object($gameObject, null)) {
				return -1;
			}
			LeanTween$j$ = 0;
			LeanTween$i$ = LeanTween$startSearch$;
			while (LeanTween$j$ < LeanTween$maxTweens$) {
				if (LeanTween$i$ >= (LeanTween$maxTweens$ - 1)) {
					LeanTween$i$ = 0;
				}
				if (!(LeanTween$tweens$.elements[LeanTween$i$] as LeanTweenDescr).LeanTweenDescr$toggle$) {
					if ((LeanTween$i$ + 1) > LeanTween$tweenMaxSearch$) {
						LeanTween$tweenMaxSearch$ = LeanTween$i$ + 1;
					}
					LeanTween$startSearch$ = LeanTween$i$ + 1;
					break;
				}
				LeanTween$j$ = LeanTween$j$ + 1;
				if (LeanTween$j$ >= LeanTween$maxTweens$) {
					var $message: String = ("LeanTween - You have run out of available spaces for tweening. To avoid this error increase the number of spaces to available for tweening when you initialize the LeanTween class ex: LeanTween.init( " + (LeanTween$maxTweens$ * 2)) + " );";
					if (LeanTween$throwErrors$) {
						Debug.Debug_LogError_Object($message);
					} else {
						Debug.Debug_Log_Object($message);
					}
					return -1;
				}
				LeanTween$i$ = LeanTween$i$ + 1;
			}
			LeanTween$tween$ = LeanTween$tweens$.elements[LeanTween$i$] as LeanTweenDescr;
			LeanTween$tween$.LeanTweenDescr$toggle$ = true;
			LeanTween$tween$.LeanTweenDescr$trans$ = $gameObject.transform;
			LeanTween$tween$.LeanTweenDescr$to$.cil2as::Assign($to);
			LeanTween$tween$.LeanTweenDescr$time$ = $time;
			LeanTween$tween$.LeanTweenDescr$passed$ = 0;
			LeanTween$tween$.LeanTweenDescr$type$ = $tweenAction;
			LeanTween$tween$.LeanTweenDescr$optional$ = $optional;
			LeanTween$tween$.LeanTweenDescr$delay$ = 0;
			LeanTween$tween$.LeanTweenDescr$id$ = LeanTween$i$;
			LeanTween$tween$.LeanTweenDescr$useEstimatedTime$ = false;
			LeanTween$tween$.LeanTweenDescr$useFrames$ = false;
			LeanTween$tween$.LeanTweenDescr$animationCurve$ = null;
			LeanTween$tween$.LeanTweenDescr$tweenType$ = LeanTweenType.linear;
			LeanTween$tween$.LeanTweenDescr$loopType$ = LeanTweenType.once;
			LeanTween$tween$.LeanTweenDescr$direction$ = 1;
			LeanTween$tween$.LeanTweenDescr$hasInitiliazed$ = false;
			LeanTween$tween$.LeanTweenDescr$hasPhysics$ = _Object.Object_op_Inequality_Object_Object($gameObject.rigidbody, null);
			if ($optional != null) {
				var $obj: Object = $optional.IDictionary_get_Item_Object("ease");
				var $num: int = 0;
				if ($obj != null) {
					LeanTween$tween$.LeanTweenDescr$tweenType$ = LeanTweenType.notUsed;
					if (Type.ForObject($obj) == LeanTweenType.$Type) {
						LeanTween$tween$.LeanTweenDescr$tweenType$ = Enum.Unbox(LeanTweenType.$Type, $obj) as LeanTweenType;
					} else {
						if (Type.ForObject($obj) == AnimationCurve.$Type) {
							LeanTween$tween$.LeanTweenDescr$animationCurve$ = $optional.IDictionary_get_Item_Object("ease") as AnimationCurve;
						} else {
							LeanTween$tween$.LeanTweenDescr$tweenFunc$ = $optional.IDictionary_get_Item_Object("ease").toString();
							if (LeanTween$tween$.LeanTweenDescr$tweenFunc$ == "easeOutQuad") {
								LeanTween$tween$.LeanTweenDescr$tweenType$ = LeanTweenType.easeOutQuad;
							} else {
								if (LeanTween$tween$.LeanTweenDescr$tweenFunc$ == "easeInQuad") {
									LeanTween$tween$.LeanTweenDescr$tweenType$ = LeanTweenType.easeInQuad;
								} else {
									if (LeanTween$tween$.LeanTweenDescr$tweenFunc$ == "easeInOutQuad") {
										LeanTween$tween$.LeanTweenDescr$tweenType$ = LeanTweenType.easeInOutQuad;
									}
								}
							}
						}
					}
					$num = $num + 1;
				}
				if ($optional.IDictionary_get_Item_Object("rect") != null) {
					LeanTween$tween$.LeanTweenDescr$ltRect$ = $optional.IDictionary_get_Item_Object("rect") as LTRect;
					$num = $num + 1;
				}
				if ($optional.IDictionary_get_Item_Object("path") != null) {
					LeanTween$tween$.LeanTweenDescr$path$ = $optional.IDictionary_get_Item_Object("path") as LTBezierPath;
					$num = $num + 1;
				}
				if ($optional.IDictionary_get_Item_Object("delay") != null) {
					LeanTween$tween$.LeanTweenDescr$delay$ = $optional.IDictionary_get_Item_Object("delay") as Number;
					$num = $num + 1;
				}
				if ($optional.IDictionary_get_Item_Object("useEstimatedTime") != null) {
					LeanTween$tween$.LeanTweenDescr$useEstimatedTime$ = $optional.IDictionary_get_Item_Object("useEstimatedTime") as Boolean;
					$num = $num + 1;
				}
				if ($optional.IDictionary_get_Item_Object("useFrames") != null) {
					LeanTween$tween$.LeanTweenDescr$useFrames$ = $optional.IDictionary_get_Item_Object("useFrames") as Boolean;
					$num = $num + 1;
				}
				if ($optional.IDictionary_get_Item_Object("loopType") != null) {
					LeanTween$tween$.LeanTweenDescr$loopType$ = Enum.Unbox(LeanTweenType.$Type, $optional.IDictionary_get_Item_Object("loopType")) as LeanTweenType;
					$num = $num + 1;
				}
				if ($optional.IDictionary_get_Item_Object("repeat") != null) {
					LeanTween$tween$.LeanTweenDescr$loopCount$ = $optional.IDictionary_get_Item_Object("repeat") as int;
					if (LeanTween$tween$.LeanTweenDescr$loopType$ == LeanTweenType.once) {
						LeanTween$tween$.LeanTweenDescr$loopType$ = LeanTweenType.clamp;
					}
					$num = $num + 1;
				}
				if ($optional.ICollection_Count <= $num) {
					LeanTween$tween$.LeanTweenDescr$optional$ = null;
				}
			} else {
				LeanTween$tween$.LeanTweenDescr$optional$ = null;
			}
			return (LeanTween$tweens$.elements[LeanTween$i$] as LeanTweenDescr).LeanTweenDescr$id$;
		}
		
		public static function LeanTween_add_Vector3Array_Vector3($a: CLIObjectArray, $b: Vector3): CLIObjectArray {
			var $array: CLIObjectArray = CLIArrayFactory.NewArrayOfValueType(Vector3.$Type, $a.Length);
			LeanTween$i$ = 0;
			while (LeanTween$i$ < $a.Length) {
				$array.elements[LeanTween$i$] = Vector3.op_Addition_Vector3_Vector3($a.elements[LeanTween$i$] as Vector3, $b);
				LeanTween$i$ = LeanTween$i$ + 1;
			}
			return $array;
		}
		
		public static function LeanTween_h_ObjectArray($arr: CLIObjectArray): Hashtable {
			if (($arr.Length % 2) == 1) {
				var $message: String = "LeanTween - You have attempted to create a Hashtable with an odd number of values.";
				if (LeanTween$throwErrors$) {
					Debug.Debug_LogError_Object($message);
				} else {
					Debug.Debug_Log_Object($message);
				}
				return null;
			}
			var $hashtable: Hashtable = new Hashtable().Hashtable_Constructor();
			LeanTween$i$ = 0;
			while (LeanTween$i$ < $arr.Length) {
				$hashtable.IDictionary_Add_Object_Object($arr.elements[LeanTween$i$] as String, $arr.elements[LeanTween$i$ + 1]);
				LeanTween$i$ = LeanTween$i$ + 2;
			}
			return $hashtable;
		}
		
		public static function LeanTween_closestRot_Single_Single($from: Number, $to: Number): Number {
			var $num: Number = 0 - (360 - $to);
			var $num2: Number = 360 + $to;
			var $num3: Number = Mathf.Abs_Single($to - $from);
			var $num4: Number = Mathf.Abs_Single($num - $from);
			var $num5: Number = Mathf.Abs_Single($num2 - $from);
			if (($num3 < $num4) && ($num3 < $num5)) {
				return $to;
			}
			if ($num4 < $num5) {
				return $num;
			}
			return $num2;
		}
		
		public static function LeanTween_cancel_GameObject($gameObject: GameObject): void {
			var $transform: Transform = $gameObject.transform;
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if (_Object.Object_op_Equality_Object_Object((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$trans$, $transform)) {
					LeanTween_removeTween_Int32($i);
				}
			}
		}
		
		public static function LeanTween_cancel_GameObject_Int32($gameObject: GameObject, $id: int): void {
			var $transform: Transform = $gameObject.transform;
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if (_Object.Object_op_Equality_Object_Object((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$trans$, $transform) && ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$id$ == $id)) {
					LeanTween_removeTween_Int32($i);
				}
			}
		}
		
		public static function LeanTween_cancel_LTRect_Int32($ltRect: LTRect, $id: int): void {
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if (((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$id$ == $id) && ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$ltRect$ == $ltRect)) {
					LeanTween_removeTween_Int32($i);
				}
			}
		}
		
		public static function LeanTween_description_Int32($id: int): LeanTweenDescr {
			if (((LeanTween$tweens$.elements[$id] as LeanTweenDescr) != null) && ((LeanTween$tweens$.elements[$id] as LeanTweenDescr).LeanTweenDescr$id$ == $id)) {
				return LeanTween$tweens$.elements[$id] as LeanTweenDescr;
			}
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$id$ == $id) {
					return LeanTween$tweens$.elements[$i] as LeanTweenDescr;
				}
			}
			return null;
		}
		
		public static function LeanTween_pause_GameObject_Int32($gameObject: GameObject, $id: int): void {
			var $transform: Transform = $gameObject.transform;
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if (_Object.Object_op_Equality_Object_Object((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$trans$, $transform) && ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$id$ == $id)) {
					if (((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$ == null) || ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$.ICollection_Count == 0)) {
						(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$ = new Hashtable().Hashtable_Constructor();
					}
					(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$.IDictionary_set_Item_Object_Object("directionSaved", (LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$direction$);
					(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$direction$ = 0;
				}
			}
		}
		
		public static function LeanTween_pause_GameObject($gameObject: GameObject): void {
			var $transform: Transform = $gameObject.transform;
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if (_Object.Object_op_Equality_Object_Object((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$trans$, $transform)) {
					if (((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$ == null) || ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$.ICollection_Count == 0)) {
						(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$ = new Hashtable().Hashtable_Constructor();
					}
					(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$.IDictionary_set_Item_Object_Object("directionSaved", (LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$direction$);
					(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$direction$ = 0;
				}
			}
		}
		
		public static function LeanTween_resume_GameObject_Int32($gameObject: GameObject, $id: int): void {
			var $transform: Transform = $gameObject.transform;
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if (_Object.Object_op_Equality_Object_Object((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$trans$, $transform) && ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$id$ == $id)) {
					(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$direction$ = (LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$.IDictionary_get_Item_Object("directionSaved") as Number;
				}
			}
		}
		
		public static function LeanTween_resume_GameObject($gameObject: GameObject): void {
			var $transform: Transform = $gameObject.transform;
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if (_Object.Object_op_Equality_Object_Object((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$trans$, $transform)) {
					(LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$direction$ = (LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$optional$.IDictionary_get_Item_Object("directionSaved") as Number;
				}
			}
		}
		
		public static function LeanTween_isTweening_GameObject($gameObject: GameObject): Boolean {
			var $transform: Transform = $gameObject.transform;
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$toggle$ && _Object.Object_op_Equality_Object_Object((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$trans$, $transform)) {
					return true;
				}
			}
			return false;
		}
		
		public static function LeanTween_isTweening_LTRect($ltRect: LTRect): Boolean {
			for (var $i: int = 0; $i < LeanTween$tweenMaxSearch$; $i = $i + 1) {
				if ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$toggle$ && ((LeanTween$tweens$.elements[$i] as LeanTweenDescr).LeanTweenDescr$ltRect$ == $ltRect)) {
					return true;
				}
			}
			return false;
		}
		
		public static function LeanTween_drawBezierPath_Vector3_Vector3_Vector3_Vector3($a: Vector3, $b: Vector3, $c: Vector3, $d: Vector3): void {
			var $vector: Vector3 = $a.cil2as::Copy();
			var $a2: Vector3 = Vector3.op_Addition_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_UnaryNegation_Vector3($a), Vector3.op_Multiply_Single_Vector3(3, Vector3.op_Subtraction_Vector3_Vector3($b, $c))), $d);
			var $b2: Vector3 = Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Multiply_Single_Vector3(3, Vector3.op_Addition_Vector3_Vector3($a, $c)), Vector3.op_Multiply_Single_Vector3(6, $b));
			var $b3: Vector3 = Vector3.op_Multiply_Single_Vector3(3, Vector3.op_Subtraction_Vector3_Vector3($b, $a));
			for (var $num: Number = 1; $num <= 30; $num = $num + 1) {
				var $d2: Number = $num / 30;
				var $vector2: Vector3 = Vector3.op_Addition_Vector3_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Multiply_Vector3_Single($a2, $d2), $b2), $d2), $b3), $d2), $a);
				Gizmos.Gizmos_DrawLine_Vector3_Vector3($vector.cil2as::Copy(), $vector2.cil2as::Copy());
				$vector = $vector2.cil2as::Copy();
			}
		}
		
		public static function LeanTween_value_String_Single_Single_Single_Hashtable($callOnUpdate: String, $from: Number, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_value_GameObject_String_Single_Single_Single_Hashtable(LeanTween$tweenEmpty$, $callOnUpdate, $from, $to, $time, $optional);
		}
		
		public static function LeanTween_value_GameObject_String_Single_Single_Single($gameObject: GameObject, $callOnUpdate: String, $from: Number, $to: Number, $time: Number): int {
			return LeanTween_value_GameObject_String_Single_Single_Single_Hashtable($gameObject, $callOnUpdate, $from, $to, $time, new Hashtable().Hashtable_Constructor());
		}
		
		public static function LeanTween_value_GameObject_String_Single_Single_Single_ObjectArray($gameObject: GameObject, $callOnUpdate: String, $from: Number, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_value_GameObject_String_Single_Single_Single_Hashtable($gameObject, $callOnUpdate, $from, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_value_GameObject_Action$1_Single_Single_Single($gameObject: GameObject, $callOnUpdate: Function, $from: Number, $to: Number, $time: Number): int {
			return LeanTween_value_GameObject_Action$1_Single_Single_Single_Hashtable($gameObject, $callOnUpdate, $from, $to, $time, new Hashtable().Hashtable_Constructor());
		}
		
		public static function LeanTween_value_GameObject_Action$1_Single_Single_Single_ObjectArray($gameObject: GameObject, $callOnUpdate: Function, $from: Number, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_value_GameObject_Action$1_Single_Single_Single_Hashtable($gameObject, $callOnUpdate, $from, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_value_GameObject_Action$2_Single_Single_Single_ObjectArray($gameObject: GameObject, $callOnUpdate: Function, $from: Number, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_value_GameObject_Action$2_Single_Single_Single_Hashtable($gameObject, $callOnUpdate, $from, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_value_GameObject_String_Single_Single_Single_Hashtable($gameObject: GameObject, $callOnUpdate: String, $from: Number, $to: Number, $time: Number, $optional: Hashtable): int {
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("onUpdate", $callOnUpdate);
			var $num: int = LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.CALLBACK, $optional);
			(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single($from, 0, 0));
			return $num;
		}
		
		public static function LeanTween_value_GameObject_Action$1_Single_Single_Single_Hashtable($gameObject: GameObject, $callOnUpdate: Function, $from: Number, $to: Number, $time: Number, $optional: Hashtable): int {
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("onUpdate", $callOnUpdate);
			var $num: int = LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.CALLBACK, $optional);
			(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single($from, 0, 0));
			return $num;
		}
		
		public static function LeanTween_value_GameObject_Action$2_Single_Single_Single_Hashtable($gameObject: GameObject, $callOnUpdate: Function, $from: Number, $to: Number, $time: Number, $optional: Hashtable): int {
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("onUpdate", $callOnUpdate);
			var $num: int = LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.CALLBACK, $optional);
			(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single($from, 0, 0));
			return $num;
		}
		
		public static function LeanTween_value_GameObject_String_Vector3_Vector3_Single_Hashtable($gameObject: GameObject, $callOnUpdate: String, $from: Vector3, $to: Vector3, $time: Number, $optional: Hashtable): int {
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("onUpdate", $callOnUpdate);
			var $num: int = LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, $to, $time, TweenAction.VALUE3, $optional);
			(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.cil2as::Assign($from);
			return $num;
		}
		
		public static function LeanTween_value_GameObject_String_Vector3_Vector3_Single_ObjectArray($gameObject: GameObject, $callOnUpdate: String, $from: Vector3, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_value_GameObject_String_Vector3_Vector3_Single_Hashtable($gameObject, $callOnUpdate, $from, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single_Hashtable($gameObject: GameObject, $callOnUpdate: Function, $from: Vector3, $to: Vector3, $time: Number, $optional: Hashtable): int {
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("onUpdate", $callOnUpdate);
			var $num: int = LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, $to, $time, TweenAction.VALUE3, $optional);
			(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.cil2as::Assign($from);
			return $num;
		}
		
		public static function LeanTween_value_GameObject_Action$2_Vector3_Vector3_Single_Hashtable($gameObject: GameObject, $callOnUpdate: Function, $from: Vector3, $to: Vector3, $time: Number, $optional: Hashtable): int {
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("onUpdate", $callOnUpdate);
			var $num: int = LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, $to, $time, TweenAction.VALUE3, $optional);
			(LeanTween$tweens$.elements[$num] as LeanTweenDescr).LeanTweenDescr$from$.cil2as::Assign($from);
			return $num;
		}
		
		public static function LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single_ObjectArray($gameObject: GameObject, $callOnUpdate: Function, $from: Vector3, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single_Hashtable($gameObject, $callOnUpdate, $from, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_value_GameObject_Action$2_Vector3_Vector3_Single_ObjectArray($gameObject: GameObject, $callOnUpdate: Function, $from: Vector3, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_value_GameObject_Action$2_Vector3_Vector3_Single_Hashtable($gameObject, $callOnUpdate, $from, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_rotate_GameObject_Vector3_Single($gameObject: GameObject, $to: Vector3, $time: Number): int {
			return LeanTween_rotate_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_rotate_GameObject_Vector3_Single_Hashtable($gameObject: GameObject, $to: Vector3, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, $to, $time, TweenAction.ROTATE, $optional);
		}
		
		public static function LeanTween_rotate_GameObject_Vector3_Single_ObjectArray($gameObject: GameObject, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_rotate_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_rotate_LTRect_Single_Single_Hashtable($ltRect: LTRect, $to: Number, $time: Number, $optional: Hashtable): int {
			LeanTween_init();
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("rect", $ltRect);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable(LeanTween$tweenEmpty$, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.GUI_ROTATE, $optional);
		}
		
		public static function LeanTween_rotate_LTRect_Single_Single_ObjectArray($ltRect: LTRect, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_rotate_LTRect_Single_Single_Hashtable($ltRect, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_rotateX_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_rotateX_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_rotateX_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.ROTATE_X, $optional);
		}
		
		public static function LeanTween_rotateX_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_rotateX_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_rotateY_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_rotateY_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_rotateY_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.ROTATE_Y, $optional);
		}
		
		public static function LeanTween_rotateY_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_rotateY_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_rotateZ_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_rotateZ_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_rotateZ_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.ROTATE_Z, $optional);
		}
		
		public static function LeanTween_rotateZ_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_rotateZ_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_rotateLocal_GameObject_Vector3_Single_Hashtable($gameObject: GameObject, $to: Vector3, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, $to, $time, TweenAction.ROTATE_LOCAL, $optional);
		}
		
		public static function LeanTween_rotateLocal_GameObject_Vector3_Single_ObjectArray($gameObject: GameObject, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_rotateLocal_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_rotateAround_GameObject_Vector3_Single_Single_Hashtable($gameObject: GameObject, $axis: Vector3, $add: Number, $time: Number, $optional: Hashtable): int {
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("axis", $axis.cil2as::Copy());
			if ($optional.IDictionary_get_Item_Object("point") == null) {
				$optional.IDictionary_set_Item_Object_Object("point", Vector3.zero.cil2as::Copy());
			}
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($add, 0, 0), $time, TweenAction.ROTATE_AROUND, $optional);
		}
		
		public static function LeanTween_rotateAround_GameObject_Vector3_Single_Single_ObjectArray($gameObject: GameObject, $axis: Vector3, $add: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_rotateAround_GameObject_Vector3_Single_Single_Hashtable($gameObject, $axis, $add, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_moveX_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.MOVE_X, $optional);
		}
		
		public static function LeanTween_moveX_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_moveX_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_moveX_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_moveX_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_moveY_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.MOVE_Y, $optional);
		}
		
		public static function LeanTween_moveY_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_moveY_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_moveY_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_moveY_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_moveZ_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_moveZ_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_moveZ_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.MOVE_Z, $optional);
		}
		
		public static function LeanTween_moveZ_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_moveZ_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_move_GameObject_Vector3_Single($gameObject: GameObject, $to: Vector3, $time: Number): int {
			return LeanTween_move_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_move_GameObject_Vector3_Single_Hashtable($gameObject: GameObject, $to: Vector3, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, $to, $time, TweenAction.MOVE, $optional);
		}
		
		public static function LeanTween_move_GameObject_Vector3_Single_ObjectArray($gameObject: GameObject, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_move_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_move_GameObject_Vector3Array_Single_Hashtable($gameObject: GameObject, $to: CLIObjectArray, $time: Number, $optional: Hashtable): int {
			if ($to.Length < 4) {
				var $message: String = "LeanTween - When passing values for a vector path, you must pass four or more values!";
				if (LeanTween$throwErrors$) {
					Debug.Debug_LogError_Object($message);
				} else {
					Debug.Debug_Log_Object($message);
				}
				return -1;
			}
			if (($to.Length % 4) != 0) {
				var $message2: String = "LeanTween - When passing values for a vector path, they must be in sets of four: controlPoint1, controlPoint2, endPoint2, controlPoint2, controlPoint2...";
				if (LeanTween$throwErrors$) {
					Debug.Debug_LogError_Object($message2);
				} else {
					Debug.Debug_Log_Object($message2);
				}
				return -1;
			}
			LeanTween_init();
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			var $lTBezierPath: LTBezierPath = new LTBezierPath().LTBezierPath_Constructor_Vector3Array($to);
			if ($optional.IDictionary_get_Item_Object("orientToPath") != null) {
				$lTBezierPath.LTBezierPath$orientToPath$ = true;
			}
			$optional.IDictionary_set_Item_Object_Object("path", $lTBezierPath);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single(1, 0, 0), $time, TweenAction.MOVE_CURVED, $optional);
		}
		
		public static function LeanTween_move_GameObject_Vector3Array_Single_ObjectArray($gameObject: GameObject, $to: CLIObjectArray, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_move_GameObject_Vector3Array_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_move_LTRect_Vector2_Single_Hashtable($ltRect: LTRect, $to: Vector2, $time: Number, $optional: Hashtable): int {
			LeanTween_init();
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("rect", $ltRect);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable(LeanTween$tweenEmpty$, Vector2.op_Implicit_Vector2_Vector3($to), $time, TweenAction.GUI_MOVE, $optional);
		}
		
		public static function LeanTween_move_LTRect_Vector3_Single_ObjectArray($ltRect: LTRect, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_move_LTRect_Vector2_Single_Hashtable($ltRect, Vector2.op_Implicit_Vector3_Vector2($to), $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_move_LTRect_Vector2_Single($ltRect: LTRect, $to: Vector2, $time: Number): int {
			return LeanTween_move_LTRect_Vector2_Single_Hashtable($ltRect, $to, $time, null);
		}
		
		public static function LeanTween_moveLocal_GameObject_Vector3_Single($gameObject: GameObject, $to: Vector3, $time: Number): int {
			return LeanTween_moveLocal_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_moveLocal_GameObject_Vector3_Single_Hashtable($gameObject: GameObject, $to: Vector3, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, $to, $time, TweenAction.MOVE_LOCAL, $optional);
		}
		
		public static function LeanTween_moveLocal_GameObject_Vector3_Single_ObjectArray($gameObject: GameObject, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_moveLocal_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_moveLocal_GameObject_Vector3Array_Single_Hashtable($gameObject: GameObject, $to: CLIObjectArray, $time: Number, $optional: Hashtable): int {
			if ($to.Length < 4) {
				var $message: String = "LeanTween - When passing values for a vector path, you must pass four or more values!";
				if (LeanTween$throwErrors$) {
					Debug.Debug_LogError_Object($message);
				} else {
					Debug.Debug_Log_Object($message);
				}
				return -1;
			}
			if (($to.Length % 4) != 0) {
				var $message2: String = "LeanTween - When passing values for a vector path, they must be in sets of four: controlPoint1, controlPoint2, endPoint2, controlPoint2, controlPoint2...";
				if (LeanTween$throwErrors$) {
					Debug.Debug_LogError_Object($message2);
				} else {
					Debug.Debug_Log_Object($message2);
				}
				return -1;
			}
			LeanTween_init();
			if ($optional == null) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			var $lTBezierPath: LTBezierPath = new LTBezierPath().LTBezierPath_Constructor_Vector3Array($to);
			if ($optional.IDictionary_get_Item_Object("orientToPath") != null) {
				$lTBezierPath.LTBezierPath$orientToPath$ = true;
			}
			$optional.IDictionary_set_Item_Object_Object("path", $lTBezierPath);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single(1, 0, 0), $time, TweenAction.MOVE_CURVED_LOCAL, $optional);
		}
		
		public static function LeanTween_moveLocal_GameObject_Vector3Array_Single_ObjectArray($gameObject: GameObject, $to: CLIObjectArray, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_moveLocal_GameObject_Vector3Array_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_moveLocalX_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.MOVE_LOCAL_X, $optional);
		}
		
		public static function LeanTween_moveLocalX_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_moveLocalX_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_moveLocalY_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.MOVE_LOCAL_Y, $optional);
		}
		
		public static function LeanTween_moveLocalY_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_moveLocalY_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_moveLocalZ_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.MOVE_LOCAL_Z, $optional);
		}
		
		public static function LeanTween_moveLocalZ_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_moveLocalZ_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_scale_GameObject_Vector3_Single($gameObject: GameObject, $to: Vector3, $time: Number): int {
			return LeanTween_scale_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_scale_GameObject_Vector3_Single_Hashtable($gameObject: GameObject, $to: Vector3, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, $to, $time, TweenAction.SCALE, $optional);
		}
		
		public static function LeanTween_scale_GameObject_Vector3_Single_ObjectArray($gameObject: GameObject, $to: Vector3, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_scale_GameObject_Vector3_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_scale_LTRect_Vector2_Single_Hashtable($ltRect: LTRect, $to: Vector2, $time: Number, $optional: Hashtable): int {
			LeanTween_init();
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("rect", $ltRect);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable(LeanTween$tweenEmpty$, Vector2.op_Implicit_Vector2_Vector3($to), $time, TweenAction.GUI_SCALE, $optional);
		}
		
		public static function LeanTween_scale_LTRect_Vector2_Single_ObjectArray($ltRect: LTRect, $to: Vector2, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_scale_LTRect_Vector2_Single_Hashtable($ltRect, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_scale_LTRect_Vector2_Single($ltRect: LTRect, $to: Vector2, $time: Number): int {
			return LeanTween_scale_LTRect_Vector2_Single_Hashtable($ltRect, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_alpha_LTRect_Single_Single_Hashtable($ltRect: LTRect, $to: Number, $time: Number, $optional: Hashtable): int {
			LeanTween_init();
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$ltRect.LTRect$alphaEnabled$ = true;
			$optional.IDictionary_set_Item_Object_Object("rect", $ltRect);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable(LeanTween$tweenEmpty$, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.GUI_ALPHA, $optional);
		}
		
		public static function LeanTween_alpha_LTRect_Single_Single_ObjectArray($ltRect: LTRect, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_alpha_LTRect_Single_Single_Hashtable($ltRect, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_scaleX_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_scaleX_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_scaleX_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.SCALE_X, $optional);
		}
		
		public static function LeanTween_scaleX_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_scaleX_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_scaleY_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_scaleY_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_scaleY_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.SCALE_Y, $optional);
		}
		
		public static function LeanTween_scaleY_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_scaleY_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_scaleZ_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_scaleZ_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_scaleZ_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.SCALE_Z, $optional);
		}
		
		public static function LeanTween_scaleZ_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_scaleZ_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_delayedCall_Single_String($delayTime: Number, $callback: String): int {
			return LeanTween_delayedCall_GameObject_Single_String_Hashtable(LeanTween$tweenEmpty$, $delayTime, $callback, new Hashtable().Hashtable_Constructor());
		}
		
		public static function LeanTween_delayedCall_Single_Action($delayTime: Number, $callback: Function): int {
			return LeanTween_delayedCall_GameObject_Single_Action(LeanTween$tweenEmpty$, $delayTime, $callback);
		}
		
		public static function LeanTween_delayedCall_Single_String_Hashtable($delayTime: Number, $callback: String, $optional: Hashtable): int {
			return LeanTween_delayedCall_GameObject_Single_String_Hashtable(LeanTween$tweenEmpty$, $delayTime, $callback, $optional);
		}
		
		public static function LeanTween_delayedCall_Single_Action_ObjectArray($delayTime: Number, $callback: Function, $optional: CLIObjectArray): int {
			return LeanTween_delayedCall_GameObject_Single_Action_Hashtable(LeanTween$tweenEmpty$, $delayTime, $callback, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_delayedCall_GameObject_Single_String_ObjectArray($gameObject: GameObject, $delayTime: Number, $callback: String, $optional: CLIObjectArray): int {
			return LeanTween_delayedCall_GameObject_Single_String_Hashtable($gameObject, $delayTime, $callback, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_delayedCall_GameObject_Single_Action_ObjectArray($gameObject: GameObject, $delayTime: Number, $callback: Function, $optional: CLIObjectArray): int {
			return LeanTween_delayedCall_GameObject_Single_Action_Hashtable($gameObject, $delayTime, $callback, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_delayedCall_GameObject_Single_String($gameObject: GameObject, $delayTime: Number, $callback: String): int {
			return LeanTween_delayedCall_GameObject_Single_String_Hashtable($gameObject, $delayTime, $callback, new Hashtable().Hashtable_Constructor());
		}
		
		public static function LeanTween_delayedCall_GameObject_Single_String_Hashtable($gameObject: GameObject, $delayTime: Number, $callback: String, $optional: Hashtable): int {
			if (($optional == null) || ($optional.ICollection_Count == 0)) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("onComplete", $callback);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, Vector3.zero, $delayTime, TweenAction.CALLBACK, $optional);
		}
		
		public static function LeanTween_delayedCall_GameObject_Single_Action_Hashtable($gameObject: GameObject, $delayTime: Number, $callback: Function, $optional: Hashtable): int {
			if ($optional == null) {
				$optional = new Hashtable().Hashtable_Constructor();
			}
			$optional.IDictionary_set_Item_Object_Object("onComplete", $callback);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, Vector3.zero, $delayTime, TweenAction.CALLBACK, $optional);
		}
		
		public static function LeanTween_delayedCall_GameObject_Single_Action($gameObject: GameObject, $delayTime: Number, $callback: Function): int {
			var $hashtable: Hashtable = new Hashtable().Hashtable_Constructor();
			$hashtable.IDictionary_set_Item_Object_Object("onComplete", $callback);
			Debug.Debug_Log_Object("callback:" + $callback);
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, Vector3.zero, $delayTime, TweenAction.CALLBACK, $hashtable);
		}
		
		public static function LeanTween_alpha_GameObject_Single_Single_Hashtable($gameObject: GameObject, $to: Number, $time: Number, $optional: Hashtable): int {
			return LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable($gameObject, new Vector3().Constructor_Single_Single_Single($to, 0, 0), $time, TweenAction.ALPHA, $optional);
		}
		
		public static function LeanTween_alpha_GameObject_Single_Single_ObjectArray($gameObject: GameObject, $to: Number, $time: Number, $optional: CLIObjectArray): int {
			return LeanTween_alpha_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween_h_ObjectArray($optional));
		}
		
		public static function LeanTween_alpha_GameObject_Single_Single($gameObject: GameObject, $to: Number, $time: Number): int {
			return LeanTween_alpha_GameObject_Single_Single_Hashtable($gameObject, $to, $time, LeanTween$emptyHash$);
		}
		
		public static function LeanTween_tweenOnCurve_LeanTweenDescr_Single($tweenDescr: LeanTweenDescr, $ratioPassed: Number): Number {
			return $tweenDescr.LeanTweenDescr$from$.x + (($tweenDescr.LeanTweenDescr$to$.x - $tweenDescr.LeanTweenDescr$from$.x) * $tweenDescr.LeanTweenDescr$animationCurve$.AnimationCurve_Evaluate_Single($ratioPassed));
		}
		
		public static function LeanTween_tweenOnCurveVector_LeanTweenDescr_Single($tweenDescr: LeanTweenDescr, $ratioPassed: Number): Vector3 {
			return new Vector3().Constructor_Single_Single_Single($tweenDescr.LeanTweenDescr$from$.x + (($tweenDescr.LeanTweenDescr$to$.x - $tweenDescr.LeanTweenDescr$from$.x) * $tweenDescr.LeanTweenDescr$animationCurve$.AnimationCurve_Evaluate_Single($ratioPassed)), $tweenDescr.LeanTweenDescr$from$.y + (($tweenDescr.LeanTweenDescr$to$.y - $tweenDescr.LeanTweenDescr$from$.y) * $tweenDescr.LeanTweenDescr$animationCurve$.AnimationCurve_Evaluate_Single($ratioPassed)), $tweenDescr.LeanTweenDescr$from$.z + (($tweenDescr.LeanTweenDescr$to$.z - $tweenDescr.LeanTweenDescr$from$.z) * $tweenDescr.LeanTweenDescr$animationCurve$.AnimationCurve_Evaluate_Single($ratioPassed)));
		}
		
		public static function LeanTween_easeOutQuadOpt_Single_Single_Single($start: Number, $diff: Number, $ratioPassed: Number): Number {
			return (((-$diff) * $ratioPassed) * ($ratioPassed - 2)) + $start;
		}
		
		public static function LeanTween_easeInQuadOpt_Single_Single_Single($start: Number, $diff: Number, $ratioPassed: Number): Number {
			return (($diff * $ratioPassed) * $ratioPassed) + $start;
		}
		
		public static function LeanTween_easeInOutQuadOpt_Single_Single_Single($start: Number, $diff: Number, $ratioPassed: Number): Number {
			$ratioPassed = $ratioPassed / 0.5;
			if ($ratioPassed < 1) {
				return ((($diff / 2) * $ratioPassed) * $ratioPassed) + $start;
			}
			$ratioPassed = $ratioPassed - 1;
			return (((-$diff) / 2) * (($ratioPassed * ($ratioPassed - 2)) - 1)) + $start;
		}
		
		public static function LeanTween_linear_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			return Mathf.Lerp_Single_Single_Single($start, $end, $val);
		}
		
		public static function LeanTween_clerp_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			var $num4: Number;
			var $num: Number = 0;
			var $num2: Number = 360;
			var $num3: Number = Mathf.Abs_Single(($num2 - $num) / 2);
			var $result: Number = 0;
			if (($end - $start) < (-$num3)) {
				$num4 = (($num2 - $start) + $end) * $val;
				$result = $start + $num4;
			} else {
				if (($end - $start) > $num3) {
					$num4 = (-(($num2 - $end) + $start)) * $val;
					$result = $start + $num4;
				} else {
					$result = $start + (($end - $start) * $val);
				}
			}
			return $result;
		}
		
		public static function LeanTween_spring_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = Mathf.Clamp01_Single($val);
			$val = ((Mathf.Sin_Single(($val * 3.141593) * (0.2 + (((2.5 * $val) * $val) * $val))) * Mathf.Pow_Single_Single(1 - $val, 2.2)) + $val) * (1 + (1.2 * (1 - $val)));
			return $start + (($end - $start) * $val);
		}
		
		public static function LeanTween_easeInQuad_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return (($end * $val) * $val) + $start;
		}
		
		public static function LeanTween_easeOutQuad_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return (((-$end) * $val) * ($val - 2)) + $start;
		}
		
		public static function LeanTween_easeInOutQuad_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val / 0.5;
			$end = $end - $start;
			if ($val < 1) {
				return ((($end / 2) * $val) * $val) + $start;
			}
			$val = $val - 1;
			return (((-$end) / 2) * (($val * ($val - 2)) - 1)) + $start;
		}
		
		public static function LeanTween_easeInCubic_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return ((($end * $val) * $val) * $val) + $start;
		}
		
		public static function LeanTween_easeOutCubic_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val - 1;
			$end = $end - $start;
			return ($end * ((($val * $val) * $val) + 1)) + $start;
		}
		
		public static function LeanTween_easeInOutCubic_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val / 0.5;
			$end = $end - $start;
			if ($val < 1) {
				return (((($end / 2) * $val) * $val) * $val) + $start;
			}
			$val = $val - 2;
			return (($end / 2) * ((($val * $val) * $val) + 2)) + $start;
		}
		
		public static function LeanTween_easeInQuart_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return (((($end * $val) * $val) * $val) * $val) + $start;
		}
		
		public static function LeanTween_easeOutQuart_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val - 1;
			$end = $end - $start;
			return ((-$end) * (((($val * $val) * $val) * $val) - 1)) + $start;
		}
		
		public static function LeanTween_easeInOutQuart_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val / 0.5;
			$end = $end - $start;
			if ($val < 1) {
				return ((((($end / 2) * $val) * $val) * $val) * $val) + $start;
			}
			$val = $val - 2;
			return (((-$end) / 2) * (((($val * $val) * $val) * $val) - 2)) + $start;
		}
		
		public static function LeanTween_easeInQuint_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return ((((($end * $val) * $val) * $val) * $val) * $val) + $start;
		}
		
		public static function LeanTween_easeOutQuint_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val - 1;
			$end = $end - $start;
			return ($end * ((((($val * $val) * $val) * $val) * $val) + 1)) + $start;
		}
		
		public static function LeanTween_easeInOutQuint_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val / 0.5;
			$end = $end - $start;
			if ($val < 1) {
				return (((((($end / 2) * $val) * $val) * $val) * $val) * $val) + $start;
			}
			$val = $val - 2;
			return (($end / 2) * ((((($val * $val) * $val) * $val) * $val) + 2)) + $start;
		}
		
		public static function LeanTween_easeInSine_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return (((-$end) * Mathf.Cos_Single(($val / 1) * 1.570796)) + $end) + $start;
		}
		
		public static function LeanTween_easeOutSine_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return ($end * Mathf.Sin_Single(($val / 1) * 1.570796)) + $start;
		}
		
		public static function LeanTween_easeInOutSine_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return (((-$end) / 2) * (Mathf.Cos_Single((3.141593 * $val) / 1) - 1)) + $start;
		}
		
		public static function LeanTween_easeInExpo_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return ($end * Mathf.Pow_Single_Single(2, 10 * (($val / 1) - 1))) + $start;
		}
		
		public static function LeanTween_easeOutExpo_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return ($end * ((-Mathf.Pow_Single_Single(2, (-10 * $val) / 1)) + 1)) + $start;
		}
		
		public static function LeanTween_easeInOutExpo_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val / 0.5;
			$end = $end - $start;
			if ($val < 1) {
				return (($end / 2) * Mathf.Pow_Single_Single(2, 10 * ($val - 1))) + $start;
			}
			$val = $val - 1;
			return (($end / 2) * ((-Mathf.Pow_Single_Single(2, -10 * $val)) + 2)) + $start;
		}
		
		public static function LeanTween_easeInCirc_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			return ((-$end) * (Mathf.Sqrt_Single(1 - ($val * $val)) - 1)) + $start;
		}
		
		public static function LeanTween_easeOutCirc_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val - 1;
			$end = $end - $start;
			return ($end * Mathf.Sqrt_Single(1 - ($val * $val))) + $start;
		}
		
		public static function LeanTween_easeInOutCirc_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val / 0.5;
			$end = $end - $start;
			if ($val < 1) {
				return (((-$end) / 2) * (Mathf.Sqrt_Single(1 - ($val * $val)) - 1)) + $start;
			}
			$val = $val - 2;
			return (($end / 2) * (Mathf.Sqrt_Single(1 - ($val * $val)) + 1)) + $start;
		}
		
		public static function LeanTween_easeInBounce_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			var $num: Number = 1;
			return ($end - LeanTween_easeOutBounce_Single_Single_Single(0, $end, $num - $val)) + $start;
		}
		
		public static function LeanTween_easeOutBounce_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$val = $val / 1;
			$end = $end - $start;
			if ($val < 0.3636364) {
				return ($end * ((7.5625 * $val) * $val)) + $start;
			}
			if ($val < 0.7272727) {
				$val = $val - 0.5454546;
				return ($end * (((7.5625 * $val) * $val) + 0.75)) + $start;
			}
			if (Number($val) < 0.909090909090909) {
				$val = $val - 0.8181818;
				return ($end * (((7.5625 * $val) * $val) + 0.9375)) + $start;
			}
			$val = $val - 0.9545454;
			return ($end * (((7.5625 * $val) * $val) + 0.984375)) + $start;
		}
		
		public static function LeanTween_easeInOutBounce_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			var $num: Number = 1;
			if ($val < ($num / 2)) {
				return (LeanTween_easeInBounce_Single_Single_Single(0, $end, $val * 2) * 0.5) + $start;
			}
			return ((LeanTween_easeOutBounce_Single_Single_Single(0, $end, ($val * 2) - $num) * 0.5) + ($end * 0.5)) + $start;
		}
		
		public static function LeanTween_easeInBack_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			$val = $val / 1;
			var $num: Number = 1.70158;
			return ((($end * $val) * $val) * ((($num + 1) * $val) - $num)) + $start;
		}
		
		public static function LeanTween_easeOutBack_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			var $num: Number = 1.70158;
			$end = $end - $start;
			$val = ($val / 1) - 1;
			return ($end * ((($val * $val) * ((($num + 1) * $val) + $num)) + 1)) + $start;
		}
		
		public static function LeanTween_easeInOutBack_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			var $num: Number = 1.70158;
			$end = $end - $start;
			$val = $val / 0.5;
			if ($val < 1) {
				$num = $num * 1.525;
				return (($end / 2) * (($val * $val) * ((($num + 1) * $val) - $num))) + $start;
			}
			$val = $val - 2;
			$num = $num * 1.525;
			return (($end / 2) * ((($val * $val) * ((($num + 1) * $val) + $num)) + 2)) + $start;
		}
		
		public static function LeanTween_easeInElastic_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			var $num: Number = 1;
			var $num2: Number = $num * 0.3;
			var $num3: Number = 0;
			var $num4: Number = 0;
			if ($val == 0) {
				return $start;
			}
			$val = $val / $num;
			if ($val == 1) {
				return $start + $end;
			}
			if (($num4 == 0) || ($num4 < Mathf.Abs_Single($end))) {
				$num4 = $end;
				$num3 = $num2 / 4;
			} else {
				$num3 = ($num2 / 6.283185) * Mathf.Asin_Single($end / $num4);
			}
			$val = $val - 1;
			return (-(($num4 * Mathf.Pow_Single_Single(2, 10 * $val)) * Mathf.Sin_Single(((($val * $num) - $num3) * 6.283185) / $num2))) + $start;
		}
		
		public static function LeanTween_easeOutElastic_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			var $num: Number = 1;
			var $num2: Number = $num * 0.3;
			var $num3: Number = 0;
			var $num4: Number = 0;
			if ($val == 0) {
				return $start;
			}
			$val = $val / $num;
			if ($val == 1) {
				return $start + $end;
			}
			if (($num4 == 0) || ($num4 < Mathf.Abs_Single($end))) {
				$num4 = $end;
				$num3 = $num2 / 4;
			} else {
				$num3 = ($num2 / 6.283185) * Mathf.Asin_Single($end / $num4);
			}
			return ((($num4 * Mathf.Pow_Single_Single(2, -10 * $val)) * Mathf.Sin_Single(((($val * $num) - $num3) * 6.283185) / $num2)) + $end) + $start;
		}
		
		public static function LeanTween_easeInOutElastic_Single_Single_Single($start: Number, $end: Number, $val: Number): Number {
			$end = $end - $start;
			var $num: Number = 1;
			var $num2: Number = $num * 0.3;
			var $num3: Number = 0;
			var $num4: Number = 0;
			if ($val == 0) {
				return $start;
			}
			$val = $val / ($num / 2);
			if ($val == 2) {
				return $start + $end;
			}
			if (($num4 == 0) || ($num4 < Mathf.Abs_Single($end))) {
				$num4 = $end;
				$num3 = $num2 / 4;
			} else {
				$num3 = ($num2 / 6.283185) * Mathf.Asin_Single($end / $num4);
			}
			if ($val < 1) {
				$val = $val - 1;
				return (-0.5 * (($num4 * Mathf.Pow_Single_Single(2, 10 * $val)) * Mathf.Sin_Single(((($val * $num) - $num3) * 6.283185) / $num2))) + $start;
			}
			$val = $val - 1;
			return (((($num4 * Mathf.Pow_Single_Single(2, -10 * $val)) * Mathf.Sin_Single(((($val * $num) - $num3) * 6.283185) / $num2)) * 0.5) + $end) + $start;
		}
		
		cil2as static function DefaultValue(): LeanTween {
			return new LeanTween().LeanTween_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function LeanTween_Constructor(): LeanTween {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LeanTween, {"init" : ["LeanTween_init", "LeanTween_init_Int32"], "reset" : "LeanTween_reset", "Update" : "LeanTween_Update", "update" : "LeanTween_update", "removeTween" : "LeanTween_removeTween_Int32", "pushNewTween" : "LeanTween_pushNewTween_GameObject_Vector3_Single_TweenAction_Hashtable", "add" : "LeanTween_add_Vector3Array_Vector3", "h" : "LeanTween_h_ObjectArray", "closestRot" : "LeanTween_closestRot_Single_Single", "cancel" : ["LeanTween_cancel_GameObject", "LeanTween_cancel_GameObject_Int32", "LeanTween_cancel_LTRect_Int32"], "description" : "LeanTween_description_Int32", "pause" : ["LeanTween_pause_GameObject_Int32", "LeanTween_pause_GameObject"], "resume" : ["LeanTween_resume_GameObject_Int32", "LeanTween_resume_GameObject"], "isTweening" : ["LeanTween_isTweening_GameObject", "LeanTween_isTweening_LTRect"], "drawBezierPath" : "LeanTween_drawBezierPath_Vector3_Vector3_Vector3_Vector3", "value" : ["LeanTween_value_String_Single_Single_Single_Hashtable", "LeanTween_value_GameObject_String_Single_Single_Single", "LeanTween_value_GameObject_String_Single_Single_Single_ObjectArray", "LeanTween_value_GameObject_Action$1_Single_Single_Single", "LeanTween_value_GameObject_Action$1_Single_Single_Single_ObjectArray", "LeanTween_value_GameObject_Action$2_Single_Single_Single_ObjectArray", "LeanTween_value_GameObject_String_Single_Single_Single_Hashtable", "LeanTween_value_GameObject_Action$1_Single_Single_Single_Hashtable", "LeanTween_value_GameObject_Action$2_Single_Single_Single_Hashtable", "LeanTween_value_GameObject_String_Vector3_Vector3_Single_Hashtable", "LeanTween_value_GameObject_String_Vector3_Vector3_Single_ObjectArray", "LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single_Hashtable", "LeanTween_value_GameObject_Action$2_Vector3_Vector3_Single_Hashtable", "LeanTween_value_GameObject_Action$1_Vector3_Vector3_Single_ObjectArray", "LeanTween_value_GameObject_Action$2_Vector3_Vector3_Single_ObjectArray"], "rotate" : ["LeanTween_rotate_GameObject_Vector3_Single", "LeanTween_rotate_GameObject_Vector3_Single_Hashtable", "LeanTween_rotate_GameObject_Vector3_Single_ObjectArray", "LeanTween_rotate_LTRect_Single_Single_Hashtable", "LeanTween_rotate_LTRect_Single_Single_ObjectArray"], "rotateX" : ["LeanTween_rotateX_GameObject_Single_Single", "LeanTween_rotateX_GameObject_Single_Single_Hashtable", "LeanTween_rotateX_GameObject_Single_Single_ObjectArray"], "rotateY" : ["LeanTween_rotateY_GameObject_Single_Single", "LeanTween_rotateY_GameObject_Single_Single_Hashtable", "LeanTween_rotateY_GameObject_Single_Single_ObjectArray"], "rotateZ" : ["LeanTween_rotateZ_GameObject_Single_Single", "LeanTween_rotateZ_GameObject_Single_Single_Hashtable", "LeanTween_rotateZ_GameObject_Single_Single_ObjectArray"], "rotateLocal" : ["LeanTween_rotateLocal_GameObject_Vector3_Single_Hashtable", "LeanTween_rotateLocal_GameObject_Vector3_Single_ObjectArray"], "rotateAround" : ["LeanTween_rotateAround_GameObject_Vector3_Single_Single_Hashtable", "LeanTween_rotateAround_GameObject_Vector3_Single_Single_ObjectArray"], "moveX" : ["LeanTween_moveX_GameObject_Single_Single_Hashtable", "LeanTween_moveX_GameObject_Single_Single_ObjectArray", "LeanTween_moveX_GameObject_Single_Single"], "moveY" : ["LeanTween_moveY_GameObject_Single_Single_Hashtable", "LeanTween_moveY_GameObject_Single_Single_ObjectArray", "LeanTween_moveY_GameObject_Single_Single"], "moveZ" : ["LeanTween_moveZ_GameObject_Single_Single", "LeanTween_moveZ_GameObject_Single_Single_Hashtable", "LeanTween_moveZ_GameObject_Single_Single_ObjectArray"], "move" : ["LeanTween_move_GameObject_Vector3_Single", "LeanTween_move_GameObject_Vector3_Single_Hashtable", "LeanTween_move_GameObject_Vector3_Single_ObjectArray", "LeanTween_move_GameObject_Vector3Array_Single_Hashtable", "LeanTween_move_GameObject_Vector3Array_Single_ObjectArray", "LeanTween_move_LTRect_Vector2_Single_Hashtable", "LeanTween_move_LTRect_Vector3_Single_ObjectArray", "LeanTween_move_LTRect_Vector2_Single"], "moveLocal" : ["LeanTween_moveLocal_GameObject_Vector3_Single", "LeanTween_moveLocal_GameObject_Vector3_Single_Hashtable", "LeanTween_moveLocal_GameObject_Vector3_Single_ObjectArray", "LeanTween_moveLocal_GameObject_Vector3Array_Single_Hashtable", "LeanTween_moveLocal_GameObject_Vector3Array_Single_ObjectArray"], "moveLocalX" : ["LeanTween_moveLocalX_GameObject_Single_Single_Hashtable", "LeanTween_moveLocalX_GameObject_Single_Single_ObjectArray"], "moveLocalY" : ["LeanTween_moveLocalY_GameObject_Single_Single_Hashtable", "LeanTween_moveLocalY_GameObject_Single_Single_ObjectArray"], "moveLocalZ" : ["LeanTween_moveLocalZ_GameObject_Single_Single_Hashtable", "LeanTween_moveLocalZ_GameObject_Single_Single_ObjectArray"], "scale" : ["LeanTween_scale_GameObject_Vector3_Single", "LeanTween_scale_GameObject_Vector3_Single_Hashtable", "LeanTween_scale_GameObject_Vector3_Single_ObjectArray", "LeanTween_scale_LTRect_Vector2_Single_Hashtable", "LeanTween_scale_LTRect_Vector2_Single_ObjectArray", "LeanTween_scale_LTRect_Vector2_Single"], "alpha" : ["LeanTween_alpha_LTRect_Single_Single_Hashtable", "LeanTween_alpha_LTRect_Single_Single_ObjectArray", "LeanTween_alpha_GameObject_Single_Single_Hashtable", "LeanTween_alpha_GameObject_Single_Single_ObjectArray", "LeanTween_alpha_GameObject_Single_Single"], "scaleX" : ["LeanTween_scaleX_GameObject_Single_Single", "LeanTween_scaleX_GameObject_Single_Single_Hashtable", "LeanTween_scaleX_GameObject_Single_Single_ObjectArray"], "scaleY" : ["LeanTween_scaleY_GameObject_Single_Single", "LeanTween_scaleY_GameObject_Single_Single_Hashtable", "LeanTween_scaleY_GameObject_Single_Single_ObjectArray"], "scaleZ" : ["LeanTween_scaleZ_GameObject_Single_Single", "LeanTween_scaleZ_GameObject_Single_Single_Hashtable", "LeanTween_scaleZ_GameObject_Single_Single_ObjectArray"], "delayedCall" : ["LeanTween_delayedCall_Single_String", "LeanTween_delayedCall_Single_Action", "LeanTween_delayedCall_Single_String_Hashtable", "LeanTween_delayedCall_Single_Action_ObjectArray", "LeanTween_delayedCall_GameObject_Single_String_ObjectArray", "LeanTween_delayedCall_GameObject_Single_Action_ObjectArray", "LeanTween_delayedCall_GameObject_Single_String", "LeanTween_delayedCall_GameObject_Single_String_Hashtable", "LeanTween_delayedCall_GameObject_Single_Action_Hashtable", "LeanTween_delayedCall_GameObject_Single_Action"], "tweenOnCurve" : "LeanTween_tweenOnCurve_LeanTweenDescr_Single", "tweenOnCurveVector" : "LeanTween_tweenOnCurveVector_LeanTweenDescr_Single", "easeOutQuadOpt" : "LeanTween_easeOutQuadOpt_Single_Single_Single", "easeInQuadOpt" : "LeanTween_easeInQuadOpt_Single_Single_Single", "easeInOutQuadOpt" : "LeanTween_easeInOutQuadOpt_Single_Single_Single", "linear" : "LeanTween_linear_Single_Single_Single", "clerp" : "LeanTween_clerp_Single_Single_Single", "spring" : "LeanTween_spring_Single_Single_Single", "easeInQuad" : "LeanTween_easeInQuad_Single_Single_Single", "easeOutQuad" : "LeanTween_easeOutQuad_Single_Single_Single", "easeInOutQuad" : "LeanTween_easeInOutQuad_Single_Single_Single", "easeInCubic" : "LeanTween_easeInCubic_Single_Single_Single", "easeOutCubic" : "LeanTween_easeOutCubic_Single_Single_Single", "easeInOutCubic" : "LeanTween_easeInOutCubic_Single_Single_Single", "easeInQuart" : "LeanTween_easeInQuart_Single_Single_Single", "easeOutQuart" : "LeanTween_easeOutQuart_Single_Single_Single", "easeInOutQuart" : "LeanTween_easeInOutQuart_Single_Single_Single", "easeInQuint" : "LeanTween_easeInQuint_Single_Single_Single", "easeOutQuint" : "LeanTween_easeOutQuint_Single_Single_Single", "easeInOutQuint" : "LeanTween_easeInOutQuint_Single_Single_Single", "easeInSine" : "LeanTween_easeInSine_Single_Single_Single", "easeOutSine" : "LeanTween_easeOutSine_Single_Single_Single", "easeInOutSine" : "LeanTween_easeInOutSine_Single_Single_Single", "easeInExpo" : "LeanTween_easeInExpo_Single_Single_Single", "easeOutExpo" : "LeanTween_easeOutExpo_Single_Single_Single", "easeInOutExpo" : "LeanTween_easeInOutExpo_Single_Single_Single", "easeInCirc" : "LeanTween_easeInCirc_Single_Single_Single", "easeOutCirc" : "LeanTween_easeOutCirc_Single_Single_Single", "easeInOutCirc" : "LeanTween_easeInOutCirc_Single_Single_Single", "easeInBounce" : "LeanTween_easeInBounce_Single_Single_Single", "easeOutBounce" : "LeanTween_easeOutBounce_Single_Single_Single", "easeInOutBounce" : "LeanTween_easeInOutBounce_Single_Single_Single", "easeInBack" : "LeanTween_easeInBack_Single_Single_Single", "easeOutBack" : "LeanTween_easeOutBack_Single_Single_Single", "easeInOutBack" : "LeanTween_easeInOutBack_Single_Single_Single", "easeInElastic" : "LeanTween_easeInElastic_Single_Single_Single", "easeOutElastic" : "LeanTween_easeOutElastic_Single_Single_Single", "easeInOutElastic" : "LeanTween_easeInOutElastic_Single_Single_Single"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
		
		public static function get LeanTween$punch$(): AnimationCurve {
			return _LeanTween$punch$ != null ? _LeanTween$punch$ : (_LeanTween$punch$ = new AnimationCurve().AnimationCurve_Constructor_KeyframeArray(CLIArrayFactory.NewArrayWithElements(Keyframe.$Type, new Keyframe().Constructor_Single_Single(0, 0), new Keyframe().Constructor_Single_Single(0.112586, 0.9976035), new Keyframe().Constructor_Single_Single(0.3120486, -0.1720615), new Keyframe().Constructor_Single_Single(0.4316337, 0.07030682), new Keyframe().Constructor_Single_Single(0.5524869, -0.03141804), new Keyframe().Constructor_Single_Single(0.6549395, 0.003909959), new Keyframe().Constructor_Single_Single(0.770987, -0.009817753), new Keyframe().Constructor_Single_Single(0.8838775, 0.001939224), new Keyframe().Constructor_Single_Single(1, 0))));
		}
		
		public static function set LeanTween$punch$(value: AnimationCurve): void {
			_LeanTween$punch$ = value;
		}
		
		public static function get LeanTween$emptyHash$(): Hashtable {
			return _LeanTween$emptyHash$ != null ? _LeanTween$emptyHash$ : (_LeanTween$emptyHash$ = new Hashtable().Hashtable_Constructor());
		}
		
		public static function set LeanTween$emptyHash$(value: Hashtable): void {
			_LeanTween$emptyHash$ = value;
		}
	}
}
