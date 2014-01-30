package global {
	
	import System.Type;
	import UnityEngine.Color;
	import UnityEngine.Debug;
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
	
	public class MenuExampleCSharp extends MonoBehaviour implements IDeserializable {
		
		public var MenuExampleCSharp$grumpy$: Texture2D;
		
		public var MenuExampleCSharp$beauty$: Texture2D;
		
		public var MenuExampleCSharp$w$: Number = 0;
		
		public var MenuExampleCSharp$h$: Number = 0;
		
		public var MenuExampleCSharp$buttonRect1$: LTRect;
		
		public var MenuExampleCSharp$buttonRect2$: LTRect;
		
		public var MenuExampleCSharp$buttonRect3$: LTRect;
		
		public var MenuExampleCSharp$buttonRect4$: LTRect;
		
		public var MenuExampleCSharp$grumpyRect$: LTRect;
		
		public var MenuExampleCSharp$beautyTileRect$: LTRect;
		
		public function MenuExampleCSharp_Start(): void {
			this.MenuExampleCSharp$w$ = Number(Screen.width);
			this.MenuExampleCSharp$h$ = Number(Screen.height);
			this.MenuExampleCSharp$buttonRect1$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(0.1 * this.MenuExampleCSharp$w$, 0.8 * this.MenuExampleCSharp$h$, 0.2 * this.MenuExampleCSharp$w$, 0.14 * this.MenuExampleCSharp$h$);
			this.MenuExampleCSharp$buttonRect2$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(1.2 * this.MenuExampleCSharp$w$, 0.8 * this.MenuExampleCSharp$h$, 0.2 * this.MenuExampleCSharp$w$, 0.14 * this.MenuExampleCSharp$h$);
			this.MenuExampleCSharp$buttonRect3$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single_Single(0.35 * this.MenuExampleCSharp$w$, 0 * this.MenuExampleCSharp$h$, 0.3 * this.MenuExampleCSharp$w$, 0.2 * this.MenuExampleCSharp$h$, 0);
			this.MenuExampleCSharp$buttonRect4$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single_Single_Single(0 * this.MenuExampleCSharp$w$, 0.4 * this.MenuExampleCSharp$h$, 0.3 * this.MenuExampleCSharp$w$, 0.2 * this.MenuExampleCSharp$h$, 1, 15);
			this.MenuExampleCSharp$grumpyRect$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single((0.5 * this.MenuExampleCSharp$w$) - (Number(this.MenuExampleCSharp$grumpy$.Texture_width) * 0.5), (0.5 * this.MenuExampleCSharp$h$) - (Number(this.MenuExampleCSharp$grumpy$.Texture_height) * 0.5), Number(this.MenuExampleCSharp$grumpy$.Texture_width), Number(this.MenuExampleCSharp$grumpy$.Texture_height));
			this.MenuExampleCSharp$beautyTileRect$ = new LTRect().LTRect_Constructor_Single_Single_Single_Single(0, 0, 1, 1);
			LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleCSharp$buttonRect2$, new Vector2().Constructor_Single_Single(0.55 * this.MenuExampleCSharp$w$, this.MenuExampleCSharp$buttonRect2$.LTRect_rect.y), 0.7).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad);
		}
		
		public function MenuExampleCSharp_catMoved(): void {
			Debug.Debug_Log_Object("cat moved...");
		}
		
		public function MenuExampleCSharp_OnGUI(): void {
			GUI.GUI_DrawTexture_Rect_Texture(this.MenuExampleCSharp$grumpyRect$.LTRect_rect, this.MenuExampleCSharp$grumpy$);
			var $position: Rect = new Rect().Constructor_Single_Single_Single_Single(0 * this.MenuExampleCSharp$w$, 0 * this.MenuExampleCSharp$h$, 0.2 * this.MenuExampleCSharp$w$, 0.14 * this.MenuExampleCSharp$h$);
			if (GUI.GUI_Button_Rect_String($position, "Move Cat") && (!LeanTween.LeanTween_isTweening_LTRect(this.MenuExampleCSharp$grumpyRect$))) {
				var $to: Vector2 = new Vector2().Constructor_Single_Single(this.MenuExampleCSharp$grumpyRect$.LTRect_rect.x, this.MenuExampleCSharp$grumpyRect$.LTRect_rect.y);
				LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleCSharp$grumpyRect$, new Vector2().Constructor_Single_Single((1 * Number(Screen.width)) - Number(this.MenuExampleCSharp$grumpy$.Texture_width), 0 * Number(Screen.height)), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce).LTDescr_setOnComplete_Action(this.MenuExampleCSharp_catMoved);
				LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleCSharp$grumpyRect$, $to, 1).LTDescr_setDelay_Single(1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce);
			}
			if (GUI.GUI_Button_Rect_String(this.MenuExampleCSharp$buttonRect1$.LTRect_rect, "Scale Centered")) {
				LeanTween.LeanTween_scale_LTRect_Vector2_Single(this.MenuExampleCSharp$buttonRect1$, Vector2.op_Multiply_Vector2_Single(new Vector2().Constructor_Single_Single(this.MenuExampleCSharp$buttonRect1$.LTRect_rect.width, this.MenuExampleCSharp$buttonRect1$.LTRect_rect.height), 1.2), 0.25).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad);
				LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleCSharp$buttonRect1$, new Vector2().Constructor_Single_Single(this.MenuExampleCSharp$buttonRect1$.LTRect_rect.x - (this.MenuExampleCSharp$buttonRect1$.LTRect_rect.width * 0.1), this.MenuExampleCSharp$buttonRect1$.LTRect_rect.y - (this.MenuExampleCSharp$buttonRect1$.LTRect_rect.height * 0.1)), 0.25).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad);
			}
			if (GUI.GUI_Button_Rect_String(this.MenuExampleCSharp$buttonRect2$.LTRect_rect, "Scale")) {
				LeanTween.LeanTween_scale_LTRect_Vector2_Single(this.MenuExampleCSharp$buttonRect2$, Vector2.op_Multiply_Vector2_Single(new Vector2().Constructor_Single_Single(this.MenuExampleCSharp$buttonRect2$.LTRect_rect.width, this.MenuExampleCSharp$buttonRect2$.LTRect_rect.height), 1.2), 0.25).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce);
			}
			$position = new Rect().Constructor_Single_Single_Single_Single(0.76 * this.MenuExampleCSharp$w$, 0.53 * this.MenuExampleCSharp$h$, 0.2 * this.MenuExampleCSharp$w$, 0.14 * this.MenuExampleCSharp$h$);
			if (GUI.GUI_Button_Rect_String($position, "Flip Tile")) {
				LeanTween.LeanTween_move_LTRect_Vector2_Single(this.MenuExampleCSharp$beautyTileRect$, new Vector2().Constructor_Single_Single(0, this.MenuExampleCSharp$beautyTileRect$.LTRect_rect.y + 1), 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutBounce);
			}
			GUI.GUI_DrawTextureWithTexCoords_Rect_Texture_Rect(new Rect().Constructor_Single_Single_Single_Single(0.8 * this.MenuExampleCSharp$w$, (0.5 * this.MenuExampleCSharp$h$) - (Number(this.MenuExampleCSharp$beauty$.Texture_height) * 0.5), Number(this.MenuExampleCSharp$beauty$.Texture_width) * 0.5, Number(this.MenuExampleCSharp$beauty$.Texture_height) * 0.5), this.MenuExampleCSharp$beauty$, this.MenuExampleCSharp$beautyTileRect$.LTRect_rect);
			if (GUI.GUI_Button_Rect_String(this.MenuExampleCSharp$buttonRect3$.LTRect_rect, "Alpha")) {
				LeanTween.LeanTween_alpha_LTRect_Single_Single(this.MenuExampleCSharp$buttonRect3$, 0, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutQuad);
				LeanTween.LeanTween_alpha_LTRect_Single_Single(this.MenuExampleCSharp$buttonRect3$, 1, 1).LTDescr_setDelay_Single(1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeInQuad);
			}
			GUI.GUI_color_Color = new Color().Constructor_Single_Single_Single_Single(1, 1, 1, 1);
			if (GUI.GUI_Button_Rect_String(this.MenuExampleCSharp$buttonRect4$.LTRect_rect, "Rotate")) {
				LeanTween.LeanTween_rotate_LTRect_Single_Single(this.MenuExampleCSharp$buttonRect4$, 150, 1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutElastic);
				LeanTween.LeanTween_rotate_LTRect_Single_Single(this.MenuExampleCSharp$buttonRect4$, 0, 1).LTDescr_setDelay_Single(1).LTDescr_setEase_LeanTweenType(LeanTweenType.easeOutElastic);
			}
			GUI.GUI_matrix_Matrix4x4 = Matrix4x4.identity.cil2as::Copy();
		}
		
		cil2as static function DefaultValue(): MenuExampleCSharp {
			return new MenuExampleCSharp().MenuExampleCSharp_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.MenuExampleCSharp$grumpy$ = reader.ReadUnityEngineObject() as Texture2D;
			this.MenuExampleCSharp$beauty$ = reader.ReadUnityEngineObject() as Texture2D;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteUnityEngineObject(this.MenuExampleCSharp$grumpy$);
			writer.WriteUnityEngineObject(this.MenuExampleCSharp$beauty$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.MenuExampleCSharp$grumpy$ = remapper.GetNewInstanceToReplaceOldInstance(this.MenuExampleCSharp$grumpy$) as Texture2D;
			this.MenuExampleCSharp$beauty$ = remapper.GetNewInstanceToReplaceOldInstance(this.MenuExampleCSharp$beauty$) as Texture2D;
		}
		
		public function MenuExampleCSharp_Constructor(): MenuExampleCSharp {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.MenuExampleCSharp, {"Start" : "MenuExampleCSharp_Start", "catMoved" : "MenuExampleCSharp_catMoved", "OnGUI" : "MenuExampleCSharp_OnGUI"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
