#include<fstream>
#include<iostream>
#include<string>
#include<iomanip>
#include<unistd.h>
using namespace std;
#define _MAX_PATH 300



int main()
{
  string s;
  ifstream infine;
  string filestr;
  string filestr1;
  string logpath;
  string logoutpath;
  logpath="//data//trek1000//log1.txt";
  logoutpath="//data//trek1000//log111.txt";
     char buffer[_MAX_PATH];  
    if(! getcwd(buffer,_MAX_PATH))
    {
	    cout<<"error"<<endl;
    }else
    cout<<buffer<<endl;
    filestr=buffer;
       filestr1=buffer;

    filestr+=logpath;
    infine.open(filestr);
    cout<<filestr<<endl;
   ofstream outf;
   filestr1+=logoutpath;
   outf.open(filestr1);
   cout<<filestr1<<endl;
   while(getline(infine,s))
 {
  if(s.find("TS")!=string::npos)
 {
    outf<<s<<'\n';
    cout<<s<<endl;
 }
 }
    /* code */
    return 0;
}
