using UnityEngine;

public class LeanTest : object {
	public static int expected = 0;
	private static int tests = 0;
	private static int passes = 0;
	
	public static void debug( string name, bool didPass, string failExplaination = null){
		float len = printOutLength(name);
		int paddingLen = 40-(int)(len*1.05f);
		#if UNITY_FLASH
		string padding = padRight(paddingLen);
		#else
		string padding = "".PadRight(paddingLen,"_"[0]);
		#endif
		string logName = formatB(name) +" " + padding + " [ "+ (didPass ? formatC("pass","green") : formatC("fail","red")) +" ]";
		if(didPass==false && failExplaination!=null)
			logName += " - " + failExplaination;
		Debug.Log(logName);
		if(didPass)
			passes++;
		tests++;
		
		if(tests==expected){
			Debug.Log(formatB("Final Report:")+" _____________________ PASSED: "+formatBC(""+passes,"green")+" FAILED: "+formatBC(""+(tests-passes),"red")+" ");
		}else if(tests>expected){
			Debug.Log(formatB("Too many tests for a final report!") + " set LeanTest.expected = "+tests);
		}
	}
	
	public static string padRight(int len){
		string str = "";
		for(int i = 0; i < len; i++){
			str += "_";
		}
		return str;
	}
	
	public static float printOutLength( string str ){
		float len = 0.0f;
		for(int i = 0; i < str.Length; i++){
			if(str[i]=="I"[0]){
				len += 0.5f;
			}else if(str[i]=="J"[0]){
				len += 0.85f;
			}else{
				len += 1.0f;
			}
		}
		return len;
	}
	
	public static string formatBC( string str, string color ){
		return formatC(formatB(str),color);
	}
	
	public static string formatB( string str ){
		#if UNITY_3_5 || UNITY_4_0 || UNITY_4_0_1 || UNITY_4_1 || UNITY_4_2
		return str;
		#else
		return "<b>"+ str + "</b>";
		#endif
	}
	
	public static string formatC( string str, string color ){
		#if UNITY_3_5 || UNITY_4_0 || UNITY_4_0_1 || UNITY_4_1 || UNITY_4_2
		return str;
		#else
		return "<color="+color+">"+ str + "</color>";
		#endif
	}
	
	public static void overview(){ }
}
