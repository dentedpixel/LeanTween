package global {
	
	import System.CLIArrayFactory;
	import System.CLIObject;
	import System.CLIObjectArray;
	import System.Type;
	import UnityEngine.Vector3;
	
	public class LTBezier extends CLIObject {
		
		public var LTBezier$length$: Number = 0;
		
		public var LTBezier$a$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTBezier$aa$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTBezier$bb$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTBezier$cc$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var LTBezier$len$: Number = 0;
		
		public var LTBezier$arcLengths$: CLIObjectArray;
		
		public function LTBezier_Constructor_Vector3_Vector3_Vector3_Vector3_Single($a: Vector3, $b: Vector3, $c: Vector3, $d: Vector3, $precision: Number): LTBezier {
			this.LTBezier$a$.cil2as::Assign($a);
			this.LTBezier$aa$.cil2as::Assign(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Addition_Vector3_Vector3(Vector3.op_UnaryNegation_Vector3($a), Vector3.op_Multiply_Single_Vector3(3, Vector3.op_Subtraction_Vector3_Vector3($b, $c))), $d));
			this.LTBezier$bb$.cil2as::Assign(Vector3.op_Subtraction_Vector3_Vector3(Vector3.op_Multiply_Single_Vector3(3, Vector3.op_Addition_Vector3_Vector3($a, $c)), Vector3.op_Multiply_Single_Vector3(6, $b)));
			this.LTBezier$cc$.cil2as::Assign(Vector3.op_Multiply_Single_Vector3(3, Vector3.op_Subtraction_Vector3_Vector3($b, $a)));
			this.LTBezier$len$ = 1 / $precision;
			this.LTBezier$arcLengths$ = CLIArrayFactory.NewArrayOfPrimitive(Type.ForClass(Number), 0, int(this.LTBezier$len$) + 1);
			this.LTBezier$arcLengths$.elements[0] = 0;
			var $vector: Vector3 = $a.cil2as::Copy();
			var $num: Number = 0;
			var $num2: int = 1;
			while (Number($num2) <= this.LTBezier$len$) {
				var $vector2: Vector3 = this.LTBezier_bezierPoint_Single(Number($num2) * $precision);
				$num = $num + Vector3.op_Subtraction_Vector3_Vector3($vector, $vector2).magnitude;
				this.LTBezier$arcLengths$.elements[$num2] = $num;
				$vector = $vector2.cil2as::Copy();
				$num2 = $num2 + 1;
			}
			this.LTBezier$length$ = $num;
			return this;
		}
		
		public function LTBezier_map_Single($u: Number): Number {
			var $num: Number = $u * (this.LTBezier$arcLengths$.elements[int(this.LTBezier$len$)] as Number);
			var $i: int = 0;
			var $num2: int = int(this.LTBezier$len$);
			var $num3: int = 0;
			while ($i < $num2) {
				$num3 = $i + (int((Number($num2 - $i) / 2) as int) | 0);
				if ((this.LTBezier$arcLengths$.elements[$num3] as Number) < $num) {
					$i = $num3 + 1;
				} else {
					$num2 = $num3;
				}
			}
			if ((this.LTBezier$arcLengths$.elements[$num3] as Number) > $num) {
				$num3 = $num3 - 1;
			}
			if ($num3 < 0) {
				$num3 = 0;
			}
			return (Number($num3) + (($num - (this.LTBezier$arcLengths$.elements[$num3] as Number)) / ((this.LTBezier$arcLengths$.elements[$num3 + 1] as Number) - (this.LTBezier$arcLengths$.elements[$num3] as Number)))) / this.LTBezier$len$;
		}
		
		public function LTBezier_bezierPoint_Single($t: Number): Vector3 {
			return Vector3.op_Addition_Vector3_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Multiply_Vector3_Single(Vector3.op_Addition_Vector3_Vector3(Vector3.op_Multiply_Vector3_Single(this.LTBezier$aa$, $t), this.LTBezier$bb$), $t), this.LTBezier$cc$), $t), this.LTBezier$a$);
		}
		
		public function LTBezier_point_Single($t: Number): Vector3 {
			return this.LTBezier_bezierPoint_Single(this.LTBezier_map_Single($t));
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LTBezier, {"map" : "LTBezier_map_Single", "bezierPoint" : "LTBezier_bezierPoint_Single", "point" : "LTBezier_point_Single"}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
