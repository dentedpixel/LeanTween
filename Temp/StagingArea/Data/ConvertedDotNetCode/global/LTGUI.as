package global {
	
	import System.CLIArrayFactory;
	import System.CLIObject;
	import System.CLIObjectArray;
	import System.Type;
	import UnityEngine.Color;
	import UnityEngine.GUI;
	import UnityEngine.Input;
	import UnityEngine.Rect;
	import UnityEngine.Screen;
	import UnityEngine.Texture;
	import UnityEngine.Time;
	import UnityEngine.Touch;
	import UnityEngine.Vector2;
	
	public class LTGUI extends CLIObject {
		
		public static var LTGUI$RECT_LEVELS$: int = 5;
		
		public static var LTGUI$RECTS_PER_LEVEL$: int = 10;
		
		public static var LTGUI$BUTTONS_MAX$: int = 24;
		
		public static var LTGUI$levels$: CLIObjectArray;
		
		public static var LTGUI$levelDepths$: CLIObjectArray;
		
		public static var LTGUI$buttons$: CLIObjectArray;
		
		public static var LTGUI$buttonLevels$: CLIObjectArray;
		
		public static var LTGUI$buttonLastFrame$: CLIObjectArray;
		
		public static var LTGUI$r$: LTRect;
		
		public static var LTGUI$color$: Color = Color.cil2as::DefaultValue();
		
		public static var LTGUI$isGUIEnabled$: Boolean;
		
		public static function LTGUI_init(): void {
			if (LTGUI$levels$ == null) {
				LTGUI$levels$ = CLIArrayFactory.NewArrayWithLength(LTRect.$Type, LTGUI$RECT_LEVELS$ * LTGUI$RECTS_PER_LEVEL$);
				LTGUI$levelDepths$ = CLIArrayFactory.NewArrayOfPrimitive(Type.ForClass(int), 0, LTGUI$RECT_LEVELS$);
			}
		}
		
		public static function LTGUI_initRectCheck(): void {
			if (LTGUI$buttons$ == null) {
				LTGUI$buttons$ = CLIArrayFactory.NewArrayOfValueType(Rect.$Type, LTGUI$BUTTONS_MAX$);
				LTGUI$buttonLevels$ = CLIArrayFactory.NewArrayOfPrimitive(Type.ForClass(int), 0, LTGUI$BUTTONS_MAX$);
				LTGUI$buttonLastFrame$ = CLIArrayFactory.NewArrayOfPrimitive(Type.ForClass(int), 0, LTGUI$BUTTONS_MAX$);
				for (var $i: int = 0; $i < LTGUI$buttonLevels$.Length; $i = $i + 1) {
					LTGUI$buttonLevels$.elements[$i] = -1;
				}
			}
		}
		
		public static function LTGUI_reset(): void {
			if (LTGUI$isGUIEnabled$) {
				LTGUI$isGUIEnabled$ = false;
				var $num: int = LTGUI$RECT_LEVELS$ * LTGUI$RECTS_PER_LEVEL$;
				for (var $i: int = 0; $i < $num; $i = $i + 1) {
					LTGUI$levels$.elements[$i] = null;
				}
				for (var $j: int = 0; $j < LTGUI$levelDepths$.Length; $j = $j + 1) {
					LTGUI$levelDepths$.elements[$j] = 0;
				}
			}
		}
		
		public static function LTGUI_update_Int32($updateLevel: int): void {
			if (LTGUI$isGUIEnabled$) {
				LTGUI_init();
				if ((LTGUI$levelDepths$.elements[$updateLevel] as int) > 0) {
					LTGUI$color$.cil2as::Assign(GUI.GUI_contentColor);
					var $num: int = $updateLevel * LTGUI$RECTS_PER_LEVEL$;
					var $num2: int = $num + (LTGUI$levelDepths$.elements[$updateLevel] as int);
					for (var $i: int = $num; $i < $num2; $i = $i + 1) {
						LTGUI$r$ = LTGUI$levels$.elements[$i] as LTRect;
						if ((LTGUI$r$ != null) && LTGUI_checkOnScreen_Rect(LTGUI$r$.LTRect_rect)) {
							if (LTGUI$r$.LTRect$type$ == 1) {
								if (LTGUI$r$.LTRect$style$ != null) {
									GUI.GUI_skin.$label = LTGUI$r$.LTRect$style$;
								}
								GUI.GUI_contentColor_Color = LTGUI$r$.LTRect$color$.cil2as::Copy();
								GUI.GUI_Label_Rect_String(LTGUI$r$.LTRect_rect, LTGUI$r$.LTRect$labelStr$);
							} else {
								if (LTGUI$r$.LTRect$type$ == 0) {
									GUI.GUI_DrawTexture_Rect_Texture(LTGUI$r$.LTRect_rect, LTGUI$r$.LTRect$texture$);
								}
							}
						}
					}
					GUI.GUI_contentColor_Color = LTGUI$color$.cil2as::Copy();
				}
			}
		}
		
		public static function LTGUI_checkOnScreen_Rect($rect: Rect): Boolean {
			var $flag: Boolean = ($rect.x + $rect.width) < 0;
			var $flag2: Boolean = $rect.x > Number(Screen.width);
			var $flag3: Boolean = $rect.y > Number(Screen.height);
			var $flag4: Boolean = ($rect.y + $rect.height) < 0;
			return (($flag || $flag2) || $flag3 ? 1 : ($flag4 ? 1 : 0)) == 0;
		}
		
		public static function LTGUI_destroy_Int32($id: int): void {
			LTGUI$levels$.elements[$id] = null;
		}
		
		public static function LTGUI_label_Rect_String_Int32($rect: Rect, $label: String, $depth: int): LTRect {
			LTGUI$isGUIEnabled$ = true;
			LTGUI_init();
			var $flag: Boolean = false;
			var $num: int = ($depth * LTGUI$RECTS_PER_LEVEL$) + LTGUI$RECTS_PER_LEVEL$;
			var $num2: int = 0;
			for (var $i: int = $depth * LTGUI$RECTS_PER_LEVEL$; $i < $num; $i = $i + 1) {
				LTGUI$r$ = LTGUI$levels$.elements[$i] as LTRect;
				if (LTGUI$r$ == null) {
					LTGUI$r$ = new LTRect().LTRect_Constructor_Rect($rect.cil2as::Copy());
					LTGUI$r$.LTRect$rotateEnabled$ = true;
					LTGUI$r$.LTRect$alphaEnabled$ = true;
					LTGUI$r$.LTRect$type$ = 1;
					LTGUI$r$.LTRect$labelStr$ = $label;
					LTGUI$r$.LTRect$id$ = $i;
					LTGUI$levels$.elements[$i] = LTGUI$r$;
					$flag = true;
					if ($num2 >= (LTGUI$levelDepths$.elements[$depth] as int)) {
						LTGUI$levelDepths$.elements[$depth] = $num2 + 1;
					}
					break;
				}
				$num2 = $num2 + 1;
			}
			if (!$flag) {
				return null;
			}
			return LTGUI$r$;
		}
		
		public static function LTGUI_texture_Rect_Texture_Int32($rect: Rect, $texture: Texture, $depth: int): LTRect {
			LTGUI$isGUIEnabled$ = true;
			LTGUI_init();
			var $flag: Boolean = false;
			var $num: int = ($depth * LTGUI$RECTS_PER_LEVEL$) + LTGUI$RECTS_PER_LEVEL$;
			var $num2: int = 0;
			for (var $i: int = $depth * LTGUI$RECTS_PER_LEVEL$; $i < $num; $i = $i + 1) {
				LTGUI$r$ = LTGUI$levels$.elements[$i] as LTRect;
				if (LTGUI$r$ == null) {
					LTGUI$r$ = new LTRect().LTRect_Constructor_Rect($rect.cil2as::Copy());
					LTGUI$r$.LTRect$rotateEnabled$ = true;
					LTGUI$r$.LTRect$alphaEnabled$ = true;
					LTGUI$r$.LTRect$type$ = 0;
					LTGUI$r$.LTRect$id$ = $i;
					LTGUI$levels$.elements[$i] = LTGUI$r$;
					$flag = true;
					if ($num2 >= (LTGUI$levelDepths$.elements[$depth] as int)) {
						LTGUI$levelDepths$.elements[$depth] = $num2 + 1;
					}
					break;
				}
				$num2 = $num2 + 1;
			}
			if (!$flag) {
				return null;
			}
			return LTGUI$r$;
		}
		
		public static function LTGUI_hasNoOverlap_Rect_Int32($rect: Rect, $depth: int): Boolean {
			LTGUI_initRectCheck();
			var $result: Boolean = true;
			var $flag: Boolean = false;
			for (var $i: int = 0; $i < LTGUI$buttonLevels$.Length; $i = $i + 1) {
				if ((LTGUI$buttonLevels$.elements[$i] as int) >= 0) {
					if (((LTGUI$buttonLastFrame$.elements[$i] as int) + 1) < Time.frameCount) {
						LTGUI$buttonLevels$.elements[$i] = -1;
					} else {
						if (((LTGUI$buttonLevels$.elements[$i] as int) > $depth) && LTGUI_pressedWithinRect_Rect(LTGUI$buttons$.elements[$i] as Rect)) {
							$result = false;
						}
					}
				}
				if ((!$flag) && ((LTGUI$buttonLevels$.elements[$i] as int) < 0)) {
					$flag = true;
					LTGUI$buttonLevels$.elements[$i] = $depth;
					LTGUI$buttons$.elements[$i] = $rect.cil2as::Copy();
					LTGUI$buttonLastFrame$.elements[$i] = Time.frameCount;
				}
			}
			return $result;
		}
		
		public static function LTGUI_pressedWithinRect_Rect($rect: Rect): Boolean {
			var $vector: Vector2 = LTGUI_firstTouch();
			if ($vector.x < 0) {
				return false;
			}
			var $num: Number = Number(Screen.height) - $vector.y;
			return ((($vector.x > $rect.x) && ($vector.x < ($rect.x + $rect.width))) && ($num > $rect.y)) && ($num < ($rect.y + $rect.height));
		}
		
		public static function LTGUI_checkWithinRect_Vector2_Rect($vec2: Vector2, $rect: Rect): Boolean {
			$vec2.y = Number(Screen.height) - $vec2.y;
			return ((($vec2.x > $rect.x) && ($vec2.x < ($rect.x + $rect.width))) && ($vec2.y > $rect.y)) && ($vec2.y < ($rect.y + $rect.height));
		}
		
		public static function LTGUI_firstTouch(): Vector2 {
			if (Input.touchCount > 0) {
				return (Input.touches.elements[0] as Touch).position.cil2as::Copy();
			}
			if (Input.Input_GetMouseButton_Int32(0)) {
				return Vector2.op_Implicit_Vector3_Vector2(Input.mousePosition);
			}
			return new Vector2().Constructor_Single_Single(-Infinity, -Infinity);
		}
		
		public function LTGUI_Constructor(): LTGUI {
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LTGUI, {"init" : "LTGUI_init", "initRectCheck" : "LTGUI_initRectCheck", "reset" : "LTGUI_reset", "update" : "LTGUI_update_Int32", "checkOnScreen" : "LTGUI_checkOnScreen_Rect", "destroy" : "LTGUI_destroy_Int32", "label" : "LTGUI_label_Rect_String_Int32", "texture" : "LTGUI_texture_Rect_Texture_Int32", "hasNoOverlap" : "LTGUI_hasNoOverlap_Rect_Int32", "pressedWithinRect" : "LTGUI_pressedWithinRect_Rect", "checkWithinRect" : "LTGUI_checkWithinRect_Vector2_Rect", "firstTouch" : "LTGUI_firstTouch"}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
