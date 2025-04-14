typedef enum {ANY,SINGLE,MULTICAST,BROADCAST}ptype_t;
typedef enum {HEX,DECM,BIN}format;
typedef enum {UNIDED,IDED}tagmodes;
class packet;
	local string name;
	bit[3:0]source;
	rand bit[3:0]target;
	rand bit[7:0]data;
  	rand ptype_t ptype;
	
	static int pktcount;
	int tag;
	tagmodes tagmode;

	constraint target_nonzero{target !=4'b0000;} 
	constraint target_not_equal_source{if(ptype==SINGLE || ptype==MULTICAST)!(target&source);}
	
	
	constraint single{if(ptype==SINGLE) ($onehot(target));}
	constraint MULTICAST_c{if(ptype==MULTICAST) ($countones(target)inside {2,3});}
	constraint BROADCAST_c{if(ptype==BROADCAST) (target==4'b1111);}
	
	
	function new(string name, int source=1);
		this.name=name;
		this.source = 4'b0001 << source;

		pktcount=pktcount+1;
		tag=pktcount;

		//this.ptype=ANY;
	endfunction


	function post_randomized();
		if(tagmode==IDED)
			tag=data;
	endfunction

	function string gettype();
		return ptype.name();
	endfunction


	function string getname();
		return this.name;
	endfunction

	function print(format f=HEX);
		case(f)
			HEX:$display(" name: %s		source: %0h	target:%0h	data:%0h	ptype:%s |pktcount=%h |tag:%h	|tagmode:%0h",this.name,this.source,this.target,this.data,this.gettype(),this.getcount(),tag,tagmode);
			DECM:$display(" name: %s	source: %0d	target:%0d	data:%0d	ptype:%s|pktcount=%d |tag:%d	|tagmode:%0d",this.name,this.source,this.target,this.data,this.gettype(),this.getcount(),tag,tagmode);
			BIN:$display(" name: %s		source: %0b	target:%0b	data:%0b	ptype:%s|pktcount=%b |tag:%b	|tagmode:%0b",this.name,this.source,this.target,this.data,this.gettype(),this.getcount(),tag,tagmode);
		endcase		
	endfunction

	static function int getcount();
		return pktcount;
	endfunction

endclass
