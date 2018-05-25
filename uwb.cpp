#include<fstream>
#include<iostream>
#include<string>

using namespace std;


int main()
{
  string s;
  ifstream infine;
  infine.open("//Users//zhaoxiaowei//Documents//uwb//log6.txt");
  ofstream outf;
  outf.open("//Users//zhaoxiaowei//Documents//uwb//log66.txt");
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
