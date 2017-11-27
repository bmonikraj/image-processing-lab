#include<iostream>
using namespace std;
#include<vector>
using std::vector;
#include<string>
using std::string;
#include<map>
using std::map;
#include<queue>
using std::queue;
#include<iterator>
using std::iterator;
#include<climits>

class Node{
	public:
		Node *parent = NULL;
		int value = -1;
		Node *lchild = NULL;
		Node *rchild = NULL;
};

int minArr(int A[100]){
	int min = 10000, pos = -1;
	for(int i=0;i<100;i++){
		if(min<A[i]){
			min = A[i];
			pos = i;
		}
	}
	A[pos] = 1000;
	return pos;
}

int main(){
	string s = "IMAGEPROCESSING";
	int A[100];
	for(int i=1;i<=26;i++){
		char f = (char) i+64;
		int p=0;
		for(int j=0;j<s.length();j++){
			if(f==s[j]){
				p=p+1;
			}
		}
		A[i] = p;
	}
	
	int B[27];
	for(int i=1;i<=26;i++){
		B[i] = A[i];
	}
	
	return 0;
}
