
 
//	ENUM DECLARATION	//
typedef enum {ANY, SINGLE, MULTICAST, BROADCAST} ptype;
typedef enum {HEX, DEC, BIN} base;
 
// CLASS DECLARATION	//
class packet;
	local string name;
	rand bit [3:0] target;
	bit [3:0] source;
	rand bit [7:0] data;
	ptype p;
 
	constraint target_notzero {target!='b0000;}
	constraint target_not_source {if(p!=BROADCAST)!(target & source);}
 
	constraint ptype_1 {if(p==SINGLE) target inside {1,2,4,8};}
 
	constraint ptype_M {if(p==MULTICAST) target inside {3,[5:7],[9:14]};}
	constraint ptype_B {if(p==BROADCAST)target == 15;}
	function new(input string new_name, input int n);
		this.name=new_name;
		case(n)
			0:this.source='b0001;
			1:this.source='b0010;
			2:this.source='b0100;
			3:this.source='b1000;
			default:this.source='b0001;
		endcase
		//this.p=ANY;
	endfunction
	function string gettype();
		return p.name();
	endfunction
 
	function string getname();
		return name;
	endfunction
 
	function void print(base b=HEX);
		case(b)
			HEX:$display("Name:%s, Target:%h, Source:%h, Data:%h, PType:%s",getname(), target, source, data, gettype());
			DEC:$display("Name:%s, Target:%d, Source:%d, Data:%d, PType:%s",getname(), target, source, data, gettype());
			BIN:$display("Name:%s, Target:%b, Source:%b, Data:%b, PType:%s",getname(), target, source, data, gettype());
		endcase
	endfunction
 
    /*function void validate();
        bit c1,c2,c3;
        if(p==SINGLE) c1=~(target & source);
        if(p==MULTICAST) c2=($countones(target)==2||$countones(target)==3);
        if(p==BROADCAST) c3=(target==4'hf);
        if(c1 || c2 || c3) $display("Constraint passed");
        else $display("Constraint Fail");
    endfunction*/
 
 
endclass
 
// CLASS PSINGLE    //
 
class psingle extends packet;
 
	constraint ptype_SINGLE {target inside {1,2,4,8};}
 
	function new(input string new_name, input int n);
		super.new(new_name,n);
        p=SINGLE;
	endfunction
endclass
 
// CLASS PMULTICAST    //
 
class pmulticast extends packet;
 
	constraint ptype_MULTICAST {target inside {3,[5:7],[9:14]};}
 
	function new(input string new_name, input int n);
	    super.new(new_name,n);	
		p=MULTICAST;
	endfunction
 
endclass
 
// CLASS PBROADCAST    //
 
class pbroadcast extends packet;
 
	constraint ptype_BROADCAST {target == 15;}
 
	function new(input string new_name, input int n);
	    super.new(new_name,n);	
		p=BROADCAST;
	endfunction
 
endclass



