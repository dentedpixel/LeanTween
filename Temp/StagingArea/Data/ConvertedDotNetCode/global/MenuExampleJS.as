package global {
	
	import System.Type;
	import UnityEngine.Color;
	import UnityEngine.GUI;
	import UnityEngine.Matrix4x4;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Rect;
	import UnityEngine.Screen;
	import UnityEngine.Texture2D;
	import UnityEngine.Vector2;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class MenuExampleJS extends MonoBehaviour implements IDeserializable {
		
		public var MenuExampleJS$grumpy$: Texture2D;
		
		public var MenuExampleJS$beauty$: Texture2D;
		
		public var MenuExampleJS$w$: Number = 0;
		
		public var MenuExampleJS$h$: Number = 0;
		
		public var MenuExampleJS$buttonRect1$: LTRect;
		
		public var MenuExampleJS$buttonRect2$: LTRect;
		
		public var MenuExampleJS$buttonRect3$: LTRect;
		
		public var MenuExampleJS$buttonRect4$: LTRect;
		
		public var MenuExampleJS$grumpyRect$: LTRect;
		
		public var MenuExampleJS$beautyTileRect$: LTRect;
		
		public function MenuExampleJS_Constructor(): MenuExampleJS {
			this.MonoBehaviour_Constructor();
			this.MenuExampleJS$w$ = Number(Screen.width);
			this.MenuExampleJS$h$ = Number(Screen.height);
			return this;
		}
		
		public function MenuExampleJS_Start(): void {
			this.MenuExampleJS$w$ = Number(Screen.width);
			this.MenuExampleJS$h$ = Number(Screen.height);
			this.MenuExampleJS$buttonRect1$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(0.1 * this.MenuExampleJS$w$, 0.8 * this.MenuExampleJS$h$, 0.25 * this.MenuExampleJS$w$, 0.14 * this.MenuExampleJS$h$);
			this.MenuExampleJS$buttonRect2$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(1.2 * this.MenuExampleJS$w$, 0.8 * this.MenuExampleJS$h$, 0.2 * this.MenuExampleJS$w$, 0.14 * this.MenuExampleJS$h$);
			this.MenuExampleJS$buttonRect3$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(0.35 * this.MenuExampleJS$w$, Number(0) * this.MenuExampleJS$h$, 0.3 * this.MenuExampleJS$w$, 0.2 * this.MenuExampleJS$h$);
			this.MenuExampleJS$buttonRect4$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single_Single_Single(Number(0) * this.MenuExampleJS$w$, 0.4 * this.MenuExampleJS$h$, 0.3 * this.MenuExampleJS$w$, 0.2 * this.MenuExampleJS$h$, 1, 15);
			this.MenuExampleJS$grumpyRect$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single((0.5 * this.MenuExampleJS$w$) - (Number(this.MenuExampleJS$grumpy$.Texture_width) / 2), (0.5 * this.MenuExampleJS$h$) - (Number(this.MenuExampleJS$grumpy$.Texture_height) / 2), Number(this.MenuExampleJS$grumpy$.Texture_width), Number(this.MenuExampleJS$grumpy$.Texture_height));
			this.MenuExampleJS$beautyTileRect$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(Number(0), Number(0), Number(1), Number(1));
			LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleJS$buttonRect2$, new Vector2().Constructor_Single_Single(0.55 * this.MenuExampleJS$w$, this.MenuExampleJS$buttonRect2$.LTRect_rect.y), 0.7).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad);
		}
		
		public function MenuExampleJS_OnGUI(): void {
			var $position: Rect = new Rect().Constructor_Single_Single_Single_Single(Number(0) * this.MenuExampleJS$w$, Number(0) * this.MenuExampleJS$h$, 0.2 * this.MenuExampleJS$w$, 0.14 * this.MenuExampleJS$h$);
			if (GUI.GUI_Button_Rect_String($position, "Move Cat") && (!LeanTween.LeanTween_isTweening_LTRect(this.MenuExampleJS$grumpyRect$))) {
				var $to: Vector2 = new Vector2().Constructor_Single_Single(this.MenuExampleJS$grumpyRect$.LTRect_rect.x, this.MenuExampleJS$grumpyRect$.LTRect_rect.y);
				LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleJS$grumpyRect$, new Vector2().Constructor_Single_Single((1 * this.MenuExampleJS$w$) - Number(this.MenuExampleJS$grumpy$.Texture_width), Number(0) * this.MenuExampleJS$h$), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce);
				LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleJS$grumpyRect$, $to, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce).LTDescr_setDelay_Single(1);
			}
			GUI.GUI_DrawTexture_Rect_Texture(this.MenuExampleJS$grumpyRect$.LTRect_rect, this.MenuExampleJS$grumpy$);
			if (GUI.GUI_Button_Rect_String(this.MenuExampleJS$buttonRect1$.LTRect_rect, "Scale Centered")) {
				LeanTween.LeanTween_scale_LTRect_Vector2_Single(this.MenuExampleJS$buttonRect1$, Vector2.op_Multiply_Vector2_Single(new Vector2().Constructor_Single_Single(this.MenuExampleJS$buttonRect1$.LTRect_rect.width, this.MenuExampleJS$buttonRect1$.LTRect_rect.height), 1.2), 0.25).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad);
				LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleJS$buttonRect1$, new Vector2().Constructor_Single_Single(this.MenuExampleJS$buttonRect1$.LTRect_rect.x - (this.MenuExampleJS$buttonRect1$.LTRect_rect.width * 0.1), this.MenuExampleJS$buttonRect1$.LTRect_rect.y - (this.MenuExampleJS$buttonRect1$.LTRect_rect.height * 0.1)), 0.25).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad);
			}
			if (GUI.GUI_Button_Rect_String(this.MenuExampleJS$buttonRect2$.LTRect_rect, "Scale")) {
				LeanTween.LeanTween_scale_LTRect_Vector2_Single(this.MenuExampleJS$buttonRect2$, Vector2.op_Multiply_Vector2_Single(new Vector2().Constructor_Single_Single(this.MenuExampleJS$buttonRect2$.LTRect_rect.width, this.MenuExampleJS$buttonRect2$.LTRect_rect.height), 1.2), 0.25).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce);
			}
			$position = new Rect().Constructor_Single_Single_Single_Single(0.76 * this.MenuExampleJS$w$, 0.53 * this.MenuExampleJS$h$, 0.2 * this.MenuExampleJS$w$, 0.14 * this.MenuExampleJS$h$);
			if (GUI.GUI_Button_Rect_String($position, "Flip Tile")) {
				LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleJS$beautyTileRect$, new Vector2().Constructor_Single_Single(Number(0), this.MenuExampleJS$beautyTileRect$.LTRect_rect.y + Number(1)), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce);
			}
			GUI.GUI_DrawTextureWithTexCoords_Rect_Texture_Rect(new Rect().Constructor_Single_Single_Single_Single(0.8 * this.MenuExampleJS$w$, (0.5 * this.MenuExampleJS$h$) - (Number(this.MenuExampleJS$beauty$.Texture_height) / 2), Number(this.MenuExampleJS$beauty$.Texture_width) * 0.5, Number(this.MenuExampleJS$beauty$.Texture_height) * 0.5), this.MenuExampleJS$beauty$, this.MenuExampleJS$beautyTileRect$.LTRect_rect);
			if (GUI.GUI_Button_Rect_String(this.MenuExampleJS$buttonRect3$.LTRect_rect, "Alpha")) {
				LeanTween.LeanTween_alpha_LTRect_Single_Single(this.MenuExampleJS$buttonRect3$, Number(0), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad);
				LeanTween.LeanTween_alpha_LTRect_Single_Single(this.MenuExampleJS$buttonRect3$, 1, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad).LTDescr_setDelay_Single(1);
			}
			var $a: Number = 1;
			var $color: Color = GUI.GUI_color.cil2as::Copy();
			var $num: Number = $color.a = $a;
			var $color2: Color = GUI.GUI_color_Color = $color.cil2as::Copy();
			if (GUI.GUI_Button_Rect_String(this.MenuExampleJS$buttonRect4$.LTRect_rect, "Rotate")) {
				LeanTween.LeanTween_rotate_LTRect_Single_Single(this.MenuExampleJS$buttonRect4$, 150, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutElastic);
				LeanTween.LeanTween_rotate_LTRect_Single_Single(this.MenuExampleJS$buttonRect4$, Number(0), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutElastic).LTDescr_setDelay_Single(1);
			}
			GUI.GUI_matrix_Matrix4x4 = Matrix4x4.identity.cil2as::Copy();
		}
		
		public function MenuExampleJS_Main(): void {
		}
		
		cil2as static function DefaultValue(): MenuExampleJS {
			return new MenuExampleJS().MenuExampleJS_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.MenuExampleJS$grumpy$ = reader.ReadUnityEngineObject() as Texture2D;
			this.MenuExampleJS$beauty$ = reader.ReadUnityEngineObject() as Texture2D;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteUnityEngineObject(this.MenuExampleJS$grumpy$);
			writer.WriteUnityEngineObject(this.MenuExampleJS$beauty$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.MenuExampleJS$grumpy$ = remapper.GetNewInstanceToReplaceOldInstance(this.MenuExampleJS$grumpy$) as Texture2D;
			this.MenuExampleJS$beauty$ = remapper.GetNewInstanceToReplaceOldInstance(this.MenuExampleJS$beauty$) as Texture2D;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.MenuExampleJS, {"Start" : "MenuExampleJS_Start", "OnGUI" : "MenuExampleJS_OnGUI", "Main" : "MenuExampleJS_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
