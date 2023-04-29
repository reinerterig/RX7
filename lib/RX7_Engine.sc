Engine_RX7 : CroneEngine {

var mainCaller,
algo = 0;
  alloc {
    mainCaller = ("/home/we/dust/code/RX7/lib/DX7.scd").load;

// Supercollider DX7 Clone v1.0
// Implemented by Aziz Ege Gonul for more info go to www.egegonul.com
// Under GNU GPL 3 as per SuperCollider license


		
		// ** add your SynthDefs here **
		
		//		context.server.sync;

		// engine.NoteOn(nn,vel)
	this.addCommand("NoteOn", "iff", {|msg|
			mainCaller.value(msg[1], msg[2], msg[3]);
    });
    
    
    
		// engine.NoteOff(nn)
	this.addCommand("NoteOff", "i", {|msg|
     mainCaller.value(msg[1], 0);
    });
    
    
    
		
		// ** add your commands here **
		
		this.addCommand("algo", "f", { arg msg;
			  algo = msg[1];
		 });
        }
}