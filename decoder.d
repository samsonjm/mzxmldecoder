/* Takes a base64 binary and converts it to readable text.
 * 
 * Author: Jonathan Samson
 * Date: 04-08-2020
 *
 * called with:
 *	cat filename.txt | base64 -d | ./decoder
 *
 * Base64.decode("BASE64STRINGHERE");
 * -> Needs to get into fread-style
 */
import core.stdc.stdio: fread, stdin;
import std.stdio;
import std.bitmanip;
import std.conv;
import std.base64;

void main()

{
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
}
