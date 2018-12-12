package test;

public class Tester extends ASD{
	public String xx;
	
	{
		xx="aa";
	}
	
	
	static {
		System.out.println("b");
	}
	
	public Tester() {
		System.out.println("c");
	}
	
	public static void main(String[] args) {
		System.out.println(new Tester().xx);;
	}

}

class ASD {
	{
		System.out.println("e");
	}
	
	static {
		System.out.println("f");
	}
	
	public ASD() {
		System.out.println("g");
	}
}
