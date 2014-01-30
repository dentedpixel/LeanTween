package global {
	
	import System.CLIArray;
	import System.CLIArrayFactory;
	import System.CLIObject;
	import System.CLIObjectArray;
	import System.StringOperations;
	import System.Type;
	import UnityEngine.Color;
	import UnityEngine.Debug;
	import UnityEngine.Gizmos;
	import UnityEngine.Mathf;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class LTSpline extends CLIObject implements IDeserializable {
		
		public var LTSpline$pts$: CLIObjectArray;
		
		public var LTSpline$lengthRatio$: CLIObjectArray;
		
		public var LTSpline$lengths$: CLIObjectArray;
		
		public var LTSpline$numSections$: int;
		
		public var LTSpline$currPt$: int;
		
		public var LTSpline$totalLength$: Number = 0;
		
		public function LTSpline_Constructor_Vector3Array($pts: CLIObjectArray): LTSpline {
			this.LTSpline$pts$ = CLIArrayFactory.NewArrayOfValueType(Vector3.$Type, $pts.Length);
			CLIArray.CLIArray_Copy_CLIArray_CLIArray_Int32($pts, this.LTSpline$pts$, $pts.Length);
			this.LTSpline$numSections$ = $pts.Length - 3;
			var $num: int = 20;
			this.LTSpline$lengthRatio$ = CLIArrayFactory.NewArrayOfPrimitive(Type.ForClass(Number), 0, this.LTSpline$numSections$);
			this.LTSpline$lengths$ = CLIArrayFactory.NewArrayOfPrimitive(Type.ForClass(Number), 0, $num);
			var $b: Vector3 = new Vector3().Constructor_Single_Single_Single(Infinity, 0, 0);
			this.LTSpline$totalLength$ = 0;
			for (var $i: int = 0; $i < $num; $i = $i + 1) {
				var $t: Number = (Number($i) * 1) / Number($num);
				var $vector: Vector3 = this.LTSpline_interp_Single($t);
				if ($i >= 1) {
					this.LTSpline$lengths$.elements[$i] = Vector3.op_Subtraction_Vector3_Vector3($vector, $b).magnitude;
				}
				this.LTSpline$totalLength$ = this.LTSpline$totalLength$ + (this.LTSpline$lengths$.elements[$i] as Number);
				$b = $vector.cil2as::Copy();
			}
			for (var $j: int = 0; $j < this.LTSpline$lengths$.Length; $j = $j + 1) {
				var $num2: Number = (Number($j) * 1) / Number(this.LTSpline$lengths$.Length);
				this.LTSpline$currPt$ = Mathf.Min_Int32_Int32(Mathf.FloorToInt_Single($num2 * Number(this.LTSpline$numSections$)), this.LTSpline$numSections$ - 1);
				this.LTSpline$lengthRatio$.elements[this.LTSpline$currPt$] = (this.LTSpline$lengthRatio$.elements[this.LTSpline$currPt$] as Number) + ((this.LTSpline$lengths$.elements[$j] as Number) / this.LTSpline$totalLength$);
				Debug.Debug_Log_Object(StringOperations.String_Concat_ObjectArray(CLIArrayFactory.NewArrayWithElements(Type.ForClass(Object), "lengthRatio[", this.LTSpline$currPt$, "]:", this.LTSpline$lengthRatio$.elements[this.LTSpline$currPt$] as Number, " lengths[", $j, "]:", this.LTSpline$lengths$.elements[$j] as Number)));
			}
			return this;
		}
		
		public function LTSpline_map_Single($t: Number): Number {
			var $num: Number = 0;
			for (var $i: int = 0; $i < this.LTSpline$lengthRatio$.Length; $i = $i + 1) {
				if (($num + (this.LTSpline$lengthRatio$.elements[$i] as Number)) >= $t) {
					return $num + ((($t - $num) / (this.LTSpline$lengthRatio$.elements[$i] as Number)) * (this.LTSpline$lengthRatio$.elements[$i] as Number));
				}
				$num = $num + (this.LTSpline$lengthRatio$.elements[$i] as Number);
			}
			return 1;
		}
		
		public function LTSpline_interp_Single($t: Number): Vector3 {
			this.LTSpline$currPt$ = Mathf.Min_Int32_Int32(Mathf.FloorToInt_Single($t * Number(this.LTSpline$numSections$)), this.LTSpline$numSections$ - 1);
			var $num: Number = ($t * Number(this.LTSpline$numSections$)) - Number(this.LTSpline$currPt$);
			var $a: Vector3 = this.LTSpline$pts$.elements[this.LTSpline$currPt$] as Vector3;
			var $a2: Vector3 = this.LTSpline$pts$.elements[this.LTSpline$currPt$ + 1] as Vector3;
			var $vector: Vector3 = this.LTSpline$pts$.elements[this.LTSpline$currPt$ + 2] as Vector3;
			var $b: Vector3 = this.LTSpline$pts$.elements[this.LTSpline$currPt$ + 3] as Vector3;
			return Vector3.op_Multiply_Single_Vector3(0.5, Vector3.op_Addition_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_UnaryNegation_Vector3($a), Vector3.op_Multiply_Single_Vector3(3, $a2)), Vector3.op_Multiply_Single_Vector3(3, $vector)), $b), ($num * $num) * $num), Vector3.op_Multiply_Vector3_Single(Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Multiply_Single_Vector3(2, $a), Vector3.op_Multiply_Single_Vector3(5, $a2)), Vector3.op_Multiply_Single_Vector3(4, $vector)), $b), $num * $num)), Vector3.op_Multiply_Vector3_Single(Vector3.op_Addition_Vector3_Vector3(Vector3.op_UnaryNegation_Vector3($a), $vector), $num)), Vector3.op_Multiply_Single_Vector3(2, $a2)));
		}
		
		public function LTSpline_point_Single($ratio: Number): Vector3 {
			return this.LTSpline_interp_Single($ratio);
		}
		
		public function LTSpline_gizmoDraw_Single($t: Number = -1): void {
			if ((this.LTSpline$lengthRatio$ != null) && (this.LTSpline$lengthRatio$.Length > 0)) {
				Gizmos.color = Color.white.cil2as::Copy();
				var $to: Vector3 = this.LTSpline_point_Single(0);
				for (var $i: int = 1; $i <= 120; $i = $i + 1) {
					var $ratio: Number = Number($i) / 120;
					var $vector: Vector3 = this.LTSpline_point_Single($ratio);
					Gizmos.Gizmos_DrawLine_Vector3_Vector3($vector.cil2as::Copy(), $to.cil2as::Copy());
					$to = $vector.cil2as::Copy();
				}
				if ($t >= 0) {
					Gizmos.color = Color.blue.cil2as::Copy();
					var $vector2: Vector3 = this.LTSpline_point_Single($t);
					Gizmos.Gizmos_DrawLine_Vector3_Vector3($vector2.cil2as::Copy(), Vector3.op_Addition_Vector3_Vector3($vector2, this.LTSpline_Velocity_Single($t)));
				}
			}
		}
		
		public function LTSpline_Velocity_Single($t: Number): Vector3 {
			$t = this.LTSpline_map_Single($t);
			var $num: int = this.LTSpline$pts$.Length - 3;
			var $num2: int = Mathf.Min_Int32_Int32(Mathf.FloorToInt_Single($t * Number($num)), $num - 1);
			var $num3: Number = ($t * Number($num)) - Number($num2);
			var $a: Vector3 = this.LTSpline$pts$.elements[$num2] as Vector3;
			var $a2: Vector3 = this.LTSpline$pts$.elements[$num2 + 1] as Vector3;
			var $a3: Vector3 = this.LTSpline$pts$.elements[$num2 + 2] as Vector3;
			var $b: Vector3 = this.LTSpline$pts$.elements[$num2 + 3] as Vector3;
			return Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.op_Multiply_Single_Vector3(1.5, Vector3.op_Addition_Vector3_Vector3(Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_UnaryNegation_Vector3($a), Vector3.op_Multiply_Single_Vector3(3, $a2)), Vector3.op_Multiply_Single_Vector3(3, $a3)), $b)), $num3 * $num3), Vector3.op_Multiply_Vector3_Single(Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Multiply_Single_Vector3(2, $a), Vector3.op_Multiply_Single_Vector3(5, $a2)), Vector3.op_Multiply_Single_Vector3(4, $a3)), $b), $num3)), Vector3.op_Multiply_Single_Vector3(0.5, $a3)), Vector3.op_Multiply_Single_Vector3(0.5, $a));
		}
		
		cil2as static function DefaultValue(): LTSpline {
			return new LTSpline();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.LTSpline$pts$ = CLIArray.TakeOwnership(Vector3.$Type, reader.ReadIDeserializableArray(Vector3.cil2as::DefaultValue));
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteIDeserializableArray(CLIArray.ElementsOf(this.LTSpline$pts$));
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LTSpline, {"map" : "LTSpline_map_Single", "interp" : "LTSpline_interp_Single", "point" : "LTSpline_point_Single", "gizmoDraw" : "LTSpline_gizmoDraw_Single", "Velocity" : "LTSpline_Velocity_Single"}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
