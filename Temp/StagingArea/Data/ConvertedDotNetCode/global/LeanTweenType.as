package global {
	
	import System.Enum;
	import System.Type;
	
	public final class LeanTweenType extends Enum {
		
		public static const notUsed: LeanTweenType = new LeanTweenType("notUsed", 0);
		
		public static const linear: LeanTweenType = new LeanTweenType("linear", 1);
		
		public static const easeOutQuad: LeanTweenType = new LeanTweenType("easeOutQuad", 2);
		
		public static const easeInQuad: LeanTweenType = new LeanTweenType("easeInQuad", 3);
		
		public static const easeInOutQuad: LeanTweenType = new LeanTweenType("easeInOutQuad", 4);
		
		public static const easeInCubic: LeanTweenType = new LeanTweenType("easeInCubic", 5);
		
		public static const easeOutCubic: LeanTweenType = new LeanTweenType("easeOutCubic", 6);
		
		public static const easeInOutCubic: LeanTweenType = new LeanTweenType("easeInOutCubic", 7);
		
		public static const easeInQuart: LeanTweenType = new LeanTweenType("easeInQuart", 8);
		
		public static const easeOutQuart: LeanTweenType = new LeanTweenType("easeOutQuart", 9);
		
		public static const easeInOutQuart: LeanTweenType = new LeanTweenType("easeInOutQuart", 10);
		
		public static const easeInQuint: LeanTweenType = new LeanTweenType("easeInQuint", 11);
		
		public static const easeOutQuint: LeanTweenType = new LeanTweenType("easeOutQuint", 12);
		
		public static const easeInOutQuint: LeanTweenType = new LeanTweenType("easeInOutQuint", 13);
		
		public static const easeInSine: LeanTweenType = new LeanTweenType("easeInSine", 14);
		
		public static const easeOutSine: LeanTweenType = new LeanTweenType("easeOutSine", 15);
		
		public static const easeInOutSine: LeanTweenType = new LeanTweenType("easeInOutSine", 16);
		
		public static const easeInExpo: LeanTweenType = new LeanTweenType("easeInExpo", 17);
		
		public static const easeOutExpo: LeanTweenType = new LeanTweenType("easeOutExpo", 18);
		
		public static const easeInOutExpo: LeanTweenType = new LeanTweenType("easeInOutExpo", 19);
		
		public static const easeInCirc: LeanTweenType = new LeanTweenType("easeInCirc", 20);
		
		public static const easeOutCirc: LeanTweenType = new LeanTweenType("easeOutCirc", 21);
		
		public static const easeInOutCirc: LeanTweenType = new LeanTweenType("easeInOutCirc", 22);
		
		public static const easeInBounce: LeanTweenType = new LeanTweenType("easeInBounce", 23);
		
		public static const easeOutBounce: LeanTweenType = new LeanTweenType("easeOutBounce", 24);
		
		public static const easeInOutBounce: LeanTweenType = new LeanTweenType("easeInOutBounce", 25);
		
		public static const easeInBack: LeanTweenType = new LeanTweenType("easeInBack", 26);
		
		public static const easeOutBack: LeanTweenType = new LeanTweenType("easeOutBack", 27);
		
		public static const easeInOutBack: LeanTweenType = new LeanTweenType("easeInOutBack", 28);
		
		public static const easeInElastic: LeanTweenType = new LeanTweenType("easeInElastic", 29);
		
		public static const easeOutElastic: LeanTweenType = new LeanTweenType("easeOutElastic", 30);
		
		public static const easeInOutElastic: LeanTweenType = new LeanTweenType("easeInOutElastic", 31);
		
		public static const punch: LeanTweenType = new LeanTweenType("punch", 32);
		
		public static const once: LeanTweenType = new LeanTweenType("once", 33);
		
		public static const clamp: LeanTweenType = new LeanTweenType("clamp", 34);
		
		public static const pingPong: LeanTweenType = new LeanTweenType("pingPong", 35);
		
		public static function ValueOf($value: int): LeanTweenType {
			switch ($value) {
				case 0:
					return notUsed;
				case 1:
					return linear;
				case 2:
					return easeOutQuad;
				case 3:
					return easeInQuad;
				case 4:
					return easeInOutQuad;
				case 5:
					return easeInCubic;
				case 6:
					return easeOutCubic;
				case 7:
					return easeInOutCubic;
				case 8:
					return easeInQuart;
				case 9:
					return easeOutQuart;
				case 10:
					return easeInOutQuart;
				case 11:
					return easeInQuint;
				case 12:
					return easeOutQuint;
				case 13:
					return easeInOutQuint;
				case 14:
					return easeInSine;
				case 15:
					return easeOutSine;
				case 16:
					return easeInOutSine;
				case 17:
					return easeInExpo;
				case 18:
					return easeOutExpo;
				case 19:
					return easeInOutExpo;
				case 20:
					return easeInCirc;
				case 21:
					return easeOutCirc;
				case 22:
					return easeInOutCirc;
				case 23:
					return easeInBounce;
				case 24:
					return easeOutBounce;
				case 25:
					return easeInOutBounce;
				case 26:
					return easeInBack;
				case 27:
					return easeOutBack;
				case 28:
					return easeInOutBack;
				case 29:
					return easeInElastic;
				case 30:
					return easeOutElastic;
				case 31:
					return easeInOutElastic;
				case 32:
					return punch;
				case 33:
					return once;
				case 34:
					return clamp;
				case 35:
					return pingPong;
			}
			return new LeanTweenType($value.toString(), $value);
		}
		
		public function LeanTweenType($name: String, $value: int) {
			super($name, $value);
		}
		
		cil2as static function DefaultValue(): LeanTweenType {
			return ValueOf(0);
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.LeanTweenType, {}, Enum.$Type));
		}
		
		public static var _$Type: Type;
	}
}
