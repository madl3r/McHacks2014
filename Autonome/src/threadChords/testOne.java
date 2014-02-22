package threadChords;
import javax.sound.*;
import javax.sound.sampled.*;

public class testOne {

	  public static void main(String[] args) throws Exception {
		  
		  Tone[] theTones;

		  theTones = new Tone[2];
		  
		  theTones[0] = new Tone(1000, 1);
		  theTones[1] = new Tone(220, 1);
		  
		  new Thread (theTones[0]).start();
		  new Thread (theTones[1]).start();

	  }
}

