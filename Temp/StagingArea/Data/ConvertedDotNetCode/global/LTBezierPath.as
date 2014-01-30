package global {
	
	import System.CLIArrayFactory;
	import System.CLIObject;
	import System.CLIObjectArray;
	import System.Type;
	import UnityEngine.Transform;
	import UnityEngine.Vector3;
	
	public class LTBezierPath extends CLIObject {
		
		public var LTBezierPath$pts$: CLIObjectArray;
		
		public var LTBezierPath$length$: Number = 0;
		
		public var LTBezierPath$orientToPath$: Boolean;
		
		public var LTBezierPath$beziers$: CLIObjectArray;
		
		public var LTBezierPath$lengthRatio$: CLIObjectArray;
		
		public function LTBezierPath_Constructor(): LTBezierPath {
			return this;
		}
		
		public function LTBezierPath_Constructor_Vector3Array($pts_: CLIObjectArray): LTBezierPath {
			this.LTBezierPath_setPoints_Vector3Array($pts_);
			return this;
		}
		
		public function LTBezierPath_setPoints_Vector3Array($pts_: CLIObjectArray): void {
			var $i: int;
			if ($pts_.Length < 4) {
				LeanTween.LeanTween_logError_String("LeanTween - When passing values for a vector path, you must pass four or more values!");
			}
			if (($pts_.Length % 4) != 0) {
				LeanTween.LeanTween_logError_String("LeanTween - When passing values for a vector path, they must be in sets of four: controlPoint1, controlPoint2, endPoint2, controlPoint2, controlPoint2...");
			}
			this.LTBezierPath$pts$ = $pts_;
			var $num: int = 0;
			this.LTBezierPath$beziers$ = CLIArrayFactory.NewArrayWithLength(LTBezier.$Type, int(this.LTBezierPath$pts$.Length / 4));
			this.LTBezierPath$lengthRatio$ = CLIArrayFactory.NewArrayOfPrimitive(Type.ForClass(Number), 0, this.LTBezierPath$beziers$.Length);
			this.LTBezierPath$length$ = 0;
			for ($i = 0; $i < this.LTBezierPath$pts$.Length; $i = $i + 4) {
				this.LTBezierPath$beziers$.elements[$num] = new LTBezier().LTBezier_Constructor_Vector3_Vector3_Vector3_Vector3_Single(this.LTBezierPath$pts$.elements[$i] as Vector3, this.LTBezierPath$pts$.elements[$i + 2] as Vector3, this.LTBezierPath$pts$.elements[$i + 1] as Vector3, this.LTBezierPath$pts$.elements[$i + 3] as Vector3, 0.05);
				this.LTBezierPath$length$ = this.LTBezierPath$length$ + (this.LTBezierPath$beziers$.elements[$num] as LTBezier).LTBezier$length$;
				$num = $num + 1;
			}
			for ($i = 0; $i < this.LTBezierPath$beziers$.Length; $i = $i + 1) {
				this.LTBezierPath$lengthRatio$.elements[$i] = (this.LTBezierPath$beziers$.elements[$i] as LTBezier).LTBezier$length$ / this.LTBezierPath$length$;
			}
		}
		
		public function LTBezierPath_point_Single($ratio: Number): Vector3 {
			var $num: Number = 0;
			for (var $i: int = 0; $i < this.LTBezierPath$lengthRatio$.Length; $i = $i + 1) {
				$num = $num + (this.LTBezierPath$lengthRatio$.elements[$i] as Number);
				if ($num >= $ratio) {
					return (this.LTBezierPath$beziers$.elements[$i] as LTBezier).LTBezier_point_Single(($ratio - ($num - (this.LTBezierPath$lengthRatio$.elements[$i] as Number))) / (this.LTBezierPath$lengthRatio$.elements[$i] as Number));
				}
			}
			return (this.LTBezierPath$beziers$.elements[this.LTBezierPath$lengthRatio$.Length - 1] as LTBezier).LTBezier_point_Single(1);
		}
		
		public function LTBezierPath_place_Transform_Single($transform: Transform, $ratio: Number): void {
			this.LTBezierPath_place_Transform_Single_Vector3($transform, $ratio, Vector3.up);
		}
		
		public function LTBezierPath_place_Transform_Single_Vector3($transform: Transform, $ratio: Number, $worldUp: Vector3): void {
			$transform.position = this.LTBezierPath_point_Single($ratio);
			$ratio = $ratio + 0.001;
			if ($ratio <= 1) {
				$transform.Transform_LookAt_Vector3_Vector3(this.LTBezierPath_point_Single($ratio), $worldUp.cil2as::Copy());
			}
		}
		
		public function LTBezierPath_placeLocal_Transform_Single($transform: Transform, $ratio: Number): void {
			this.LTBezierPath_placeLocal_Transform_Single_Vector3($transform, $ratio, Vector3.up);
		}
		
		public function LTBezierPath_placeLocal_Transform_Single_Vector3($transform: Transform, $ratio: Number, $worldUp: Vector3): void {
			$transform.localPosition = this.LTBezierPath_point_Single($ratio);
			$ratio = $ratio + 0.001;
			if ($ratio <= 1) {
				$transform.Transform_LookAt_Vector3_Vector3($transform.parent.Transform_TransformPoint_Vector3(this.LTBezierPath_point_Single($ratio)), $worldUp.cil2as::Copy());
			}
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LTBezierPath, {"setPoints" : "LTBezierPath_setPoints_Vector3Array", "point" : "LTBezierPath_point_Single", "place" : ["LTBezierPath_place_Transform_Single", "LTBezierPath_place_Transform_Single_Vector3"], "placeLocal" : ["LTBezierPath_placeLocal_Transform_Single", "LTBezierPath_placeLocal_Transform_Single_Vector3"]}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
