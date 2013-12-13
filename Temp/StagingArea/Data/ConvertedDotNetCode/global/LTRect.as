package global {
	
	import System.CLIObject;
	import System.Type;
	import UnityEngine.Color;
	import UnityEngine.GUI;
	import UnityEngine.Matrix4x4;
	import UnityEngine.Quaternion;
	import UnityEngine.Rect;
	import UnityEngine.Vector2;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class LTRect extends CLIObject implements IDeserializable {
		
		public var LTRect$_rect$: Rect = Rect.cil2as::DefaultValue();
		
		public var LTRect$alpha$: Number = 0;
		
		public var LTRect$rotation$: Number = 0;
		
		public var LTRect$pivot$: Vector2 = Vector2.cil2as::DefaultValue();
		
		public var LTRect$rotateEnabled$: Boolean;
		
		public var LTRect$rotateFinished$: Boolean;
		
		public var LTRect$alphaEnabled$: Boolean;
		
		public static var LTRect$colorTouched$: Boolean;
		
		public function get LTRect_x(): Number {
			return this.LTRect$_rect$.x;
		}
		
		public function set LTRect_x_Single($value: Number): void {
			this.LTRect$_rect$.x = $value;
		}
		
		public function get LTRect_y(): Number {
			return this.LTRect$_rect$.y;
		}
		
		public function set LTRect_y_Single($value: Number): void {
			this.LTRect$_rect$.y = $value;
		}
		
		public function get LTRect_rect(): Rect {
			if (LTRect$colorTouched$) {
				LTRect$colorTouched$ = false;
				GUI.GUI_color_Color = new Color().Constructor_Single_Single_Single_Single(GUI.GUI_color.r, GUI.GUI_color.g, GUI.GUI_color.b, 1);
			}
			if (this.LTRect$rotateEnabled$) {
				if (this.LTRect$rotateFinished$) {
					this.LTRect$rotateFinished$ = false;
					this.LTRect$rotateEnabled$ = false;
					this.LTRect$_rect$.x = this.LTRect$_rect$.x + this.LTRect$pivot$.x;
					this.LTRect$_rect$.y = this.LTRect$_rect$.y + this.LTRect$pivot$.y;
					this.LTRect$pivot$.cil2as::Assign(Vector2.zero);
					GUI.GUI_matrix_Matrix4x4 = Matrix4x4.identity.cil2as::Copy();
				} else {
					var $identity: Matrix4x4 = Matrix4x4.identity.cil2as::Copy();
					$identity.SetTRS_Vector3_Quaternion_Vector3(Vector2.op_Implicit_Vector2_Vector3(this.LTRect$pivot$), Quaternion.Euler_Single_Single_Single(0, 0, this.LTRect$rotation$), Vector3.one);
					GUI.GUI_matrix_Matrix4x4 = $identity.cil2as::Copy();
				}
			}
			if (this.LTRect$alphaEnabled$) {
				GUI.GUI_color_Color = new Color().Constructor_Single_Single_Single_Single(GUI.GUI_color.r, GUI.GUI_color.g, GUI.GUI_color.b, this.LTRect$alpha$);
				LTRect$colorTouched$ = true;
			}
			return this.LTRect$_rect$.cil2as::Copy();
		}
		
		public function set LTRect_rect_Rect($value: Rect): void {
			this.LTRect$_rect$.cil2as::Assign($value);
		}
		
		public function LTRect_Constructor(): LTRect {
			this.LTRect_reset();
			this.LTRect$rotateEnabled$ = this.LTRect$alphaEnabled$ = true;
			this.LTRect$_rect$.cil2as::Assign(new Rect().Constructor_Single_Single_Single_Single(0, 0, 1, 1));
			return this;
		}
		
		public function LTRect_Constructor_Rect($rect: Rect): LTRect {
			this.LTRect$_rect$.cil2as::Assign($rect);
			this.LTRect_reset();
			return this;
		}
		
		public function LTRect_Constructor_Single_Single_Single_Single($x: Number, $y: Number, $width: Number, $height: Number): LTRect {
			this.LTRect$_rect$.cil2as::Assign(new Rect().Constructor_Single_Single_Single_Single($x, $y, $width, $height));
			this.LTRect$alpha$ = 1;
			this.LTRect$rotation$ = 0;
			this.LTRect$rotateEnabled$ = this.LTRect$alphaEnabled$ = false;
			return this;
		}
		
		public function LTRect_Constructor_Single_Single_Single_Single_Single($x: Number, $y: Number, $width: Number, $height: Number, $alpha: Number): LTRect {
			this.LTRect$_rect$.cil2as::Assign(new Rect().Constructor_Single_Single_Single_Single($x, $y, $width, $height));
			this.LTRect$alpha$ = $alpha;
			this.LTRect$rotation$ = 0;
			this.LTRect$rotateEnabled$ = this.LTRect$alphaEnabled$ = false;
			return this;
		}
		
		public function LTRect_Constructor_Single_Single_Single_Single_Single_Single($x: Number, $y: Number, $width: Number, $height: Number, $alpha: Number, $rotation: Number): LTRect {
			this.LTRect$_rect$.cil2as::Assign(new Rect().Constructor_Single_Single_Single_Single($x, $y, $width, $height));
			this.LTRect$alpha$ = $alpha;
			this.LTRect$rotation$ = $rotation;
			this.LTRect$rotateEnabled$ = this.LTRect$alphaEnabled$ = false;
			if ($rotation != 0) {
				this.LTRect$rotateEnabled$ = true;
				this.LTRect_resetForRotation();
			}
			return this;
		}
		
		public function LTRect_reset(): void {
			this.LTRect$alpha$ = 1;
			this.LTRect$rotation$ = 0;
			this.LTRect$rotateEnabled$ = this.LTRect$alphaEnabled$ = false;
		}
		
		public function LTRect_resetForRotation(): void {
			if (Vector2.op_Equality_Vector2_Vector2(this.LTRect$pivot$, Vector2.zero)) {
				this.LTRect$pivot$.cil2as::Assign(new Vector2().Constructor_Single_Single(this.LTRect$_rect$.x + (this.LTRect$_rect$.width * 0.5), this.LTRect$_rect$.y + (this.LTRect$_rect$.height * 0.5)));
				this.LTRect$_rect$.x = this.LTRect$_rect$.x + (-this.LTRect$pivot$.x);
				this.LTRect$_rect$.y = this.LTRect$_rect$.y + (-this.LTRect$pivot$.y);
			}
		}
		
		cil2as static function DefaultValue(): LTRect {
			return new LTRect().LTRect_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.LTRect$_rect$ = Rect.cil2as::DefaultValue();
			reader.ReadIDeserializable(this.LTRect$_rect$);
			this.LTRect$alpha$ = reader.ReadFloat();
			this.LTRect$rotation$ = reader.ReadFloat();
			this.LTRect$pivot$ = Vector2.cil2as::DefaultValue();
			reader.ReadIDeserializable(this.LTRect$pivot$);
			this.LTRect$rotateEnabled$ = reader.ReadBool();
			reader.Align();
			this.LTRect$rotateFinished$ = reader.ReadBool();
			reader.Align();
			this.LTRect$alphaEnabled$ = reader.ReadBool();
			reader.Align();
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteIDeserializable(this.LTRect$_rect$);
			writer.WriteFloat(this.LTRect$alpha$);
			writer.WriteFloat(this.LTRect$rotation$);
			writer.WriteIDeserializable(this.LTRect$pivot$);
			writer.WriteBool(this.LTRect$rotateEnabled$);
			writer.Align();
			writer.WriteBool(this.LTRect$rotateFinished$);
			writer.Align();
			writer.WriteBool(this.LTRect$alphaEnabled$);
			writer.Align();
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LTRect, {"get_x" : "LTRect_x", "set_x" : "LTRect_x_Single", "get_y" : "LTRect_y", "set_y" : "LTRect_y_Single", "get_rect" : "LTRect_rect", "set_rect" : "LTRect_rect_Rect", "reset" : "LTRect_reset", "resetForRotation" : "LTRect_resetForRotation"}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
