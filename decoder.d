/* Takes a base64 binary and converts it to readable text.
 * 
 * Author: Jonathan Samson
 * Date: 04-08-2020
 */
module mzxmldecoder;
import core.stdc.stdio: fread, stdin;
import std.stdio;
import std.bitmanip;
import std.conv;
import std.base64;

void main()
{
	string line = "Qk3fDkS2lldCl6euRND28UKXvA9EyKoPQsg6lES2z/hCyxPbRLpQkELXhZBE4gXdQuzjCUTKe4VDAhZoRxKMVUMS9gVE0dn6QysnFUTcG4NDRy59Rwo27ENzK95H0YRqQ3Qsd0YINMA=";
	ubyte[] decoded = Base64.decode(line);
	string output = "";
	int j;
	for(int i=1; i<=decoded.length/4; ++i)
	{
		ubyte[4] swappedF = decoded[(4*i)-4..(4*i)];
		float real_text = bigEndianToNative!float(swappedF);
		output ~= real_text.to!string ~ "\t";
		if(i%2 == 0)
		{
			writeln(output);
			output = "";
		}
		j = i;
	}
	writeln(j/2);
	/*
	float f;
	int i = 1;
	string output = "";
	while (fread(&f, 1, 4, stdin) == 4)
	{
		ubyte[4] swappedF = (nativeToLittleEndian(f));
		output ~= bigEndianToNative!float(swappedF).to!string ~ "\t";
		if(i%2 == 0)
		{
			writeln(output);
			output = "";
		}
		++i;
	}
	*/
}
