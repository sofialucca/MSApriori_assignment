#include <iostream>
#include <vector>
#include <string>
#include <map>
#include <fstream>
#include <sstream>
#include <algorithm>

using namespace std;

// Comparator function to sort pairs
// according to second value
bool cmp(pair<int, double>& a,
         pair<int, double>& b)
{
    if(a.second != b.second)
        return a.second < b.second;
    else
        return a.first < b.first;
}

int main() {
    ifstream dataFile, paramFile;
    ofstream output;
    string line, item, file_1, file_2, output_file;
    vector<vector<int>> transactions;
    map<int, double> itemsMap, itemsMIS;

    double sdc;
    int item_int;

    cout << "File containing the transactions:";
    cin >> file_1;

    dataFile.open(file_1);
    if (!dataFile.is_open()) {
        cerr << "ERROR FILE 1" << endl;
        exit(1);
    }


    cout << "File containing the MS:";
    cin >> file_2;

    paramFile.open(file_2);
    if(!paramFile.is_open()){
        cerr<<"ERROR FILE 2"<<endl;
        exit(1);
    }

    cout << "File for the output:";
    cin >> output_file;
    output.open(output_file, ios::trunc |ios::out);
    if(!output.is_open()){
        cerr<<"ERROR OUTPUT FILE"<<endl;
        exit(1);
    }

    //read file 1 for transactions
    while(getline(dataFile,line)){
        stringstream s_stream(line);
        vector<int> tran;

        while(getline(s_stream,item,',')){
            stringstream(item) >> item_int;

            tran.emplace_back(item_int);
            if(itemsMap.count(item_int)== 0 ) {
                itemsMap.insert({item_int, 1});
                itemsMIS.insert({item_int, -1});

            }else{
                itemsMap.find(item_int) ->second = itemsMap.find(item_int)->second +1;

            }

        }


        transactions.emplace_back(tran);
    }
    dataFile.close();

    //read file for MIS
    while(getline(paramFile,line,'\n')){

        if(line.find("MIS") == string::npos){
            sdc = stod(line.substr(line.find('=')+1));
        }else{
            item = line.substr(line.find('(')+1,line.find(')')- line.find('(') -1);

            if(item== "rest"){
                for (auto& it : itemsMIS) {

                    if(it.second == -1) {
                        it.second = stod(line.substr(line.find('=') + 1));
                    }

                }
            }else{
                itemsMIS.find(stoi(item)) ->second = stod(line.substr(line.find('=') + 1));
            }

        }
    }
    paramFile.close();

    //sorting
    vector<pair<int, double> > M;
    vector<vector<vector<int>>> F;
    vector<int> L;


    // Copy key-value pair from Map
    // to vector of pairs
    for(auto &it: itemsMIS){
        M.emplace_back(it);
    }
    // Sort using comparator function
    sort(M.begin(), M.end(), cmp);

    for(auto &it: itemsMap){
        it.second = it.second/ ((int)transactions.size());
    }
    //generate L
    map<int,int> pos;
    for(int i=0; i<M.size();i++){
        if(itemsMap.find(M[i].first)->second >= M[i].second){
            L.push_back(M[i].first);
            pos.insert({M[i].first,(int)L.size()});
            for(int j = i+1; j<M.size();j++){
                if(itemsMap.find(M[j].first)->second >= M[i].second){
                    L.push_back(M[j].first);
                    pos.insert({M[j].first,(int)L.size()});
                }
            }
            break;
        }
    }

    vector<vector<int>> final_set;
    for(auto &i: L){
        if(itemsMap.find(i)->second >= itemsMIS.find(i)->second){
            final_set.emplace_back(vector<int>{i});
        }
    }
    //TODO change into generic output.txt

    if(final_set.empty()){
        output<<"NO frequent items in the input file"<<endl;
        output.close();
        return 0;
    }


    for(int k = 1;!final_set.empty() && k<itemsMIS.size();k++){
        F.emplace_back(final_set);
        final_set.clear();
        vector<vector<int>> new_cand_set;
        //level2-candidate gen function
        if(k ==1){

            for(int i=0;i<L.size();i++){

                double sup_1 = itemsMap.find(L[i])->second;
                if( sup_1 >= itemsMIS.find(L[i])->second){
                    vector<int> new_cand(2);
                    new_cand[0] = L[i];
                    for(int h=i+1;h<L.size();h++){

                        double sup_2 = itemsMap.find(L[h])->second;
                        if( sup_2 >= (itemsMIS.find(L[i])->second) && abs(sup_2-sup_1)<=sdc ){

                            new_cand[1]=L[h];

                            new_cand_set.emplace_back(new_cand);

                        }
                    }
                }
            }

            //MScandidate-gen
        }else{

            for(int i=0;i<F[k-1].size();i++){



                //for(int j =i+1;j<F[k-1].size();j++){
                for(int j =i+1;j<F[k-1].size();j++){
                    vector<int> new_cand;
                    bool valid = true;
                    int z;
                    for(z=0;z<F[k-1][i].size()-1 && valid ;z++){
                        if(F[k-1][i][z] != F[k-1][j][z]) {
                            valid = false;
                        }
                    }
                    if(valid) {
                        double sup_1 = itemsMap.find(F[k-1][i][k-1])->second;
                        double sup_2 = itemsMap.find(F[k-1][i][k-1])->second;
                        if (F[k - 1][i][k-1] != F[k - 1][j][k-1]) {
                            if (pos.find(F[k - 1][i][k-1])->second < pos.find(F[k - 1][j][k-1])->second && abs(sup_2 - sup_1) <= sdc) {

                                new_cand.insert(new_cand.begin(), F[k - 1][i].begin(), F[k - 1][i].end());
                                new_cand.push_back(F[k - 1][j][k-1]);

                                new_cand_set.emplace_back(new_cand);
                                bool equal_MIS = (itemsMIS.find(new_cand[0])->second ==
                                                  itemsMIS.find(new_cand[1])->second);
                                for (int a = 0; a < new_cand.size(); a++) {
                                    vector<int> s(new_cand);
                                    s.erase(s.begin() + a);
                                    if (a != 0 || equal_MIS) {
                                        if (count(F[k - 1].begin(), F[k - 1].end(), s) == 0) {
                                            new_cand_set.pop_back();
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }


                }


            }

        }

        //transaction check
        for(auto &c:new_cand_set){

            double c_count=0;
            vector<int> c_1(c.begin()+1,c.end());
            for(auto &t:transactions){
                bool contained = true;
                for(auto &i:c){
                    if(count(t.begin(), t.end(), i)==0){
                        contained = false;
                    }

                }

                if(contained){
                    c_count++;
                }

            }
            if(  (c_count/((int) transactions.size())) >= itemsMIS.find(c[0])->second){
                final_set.emplace_back(c);
            }

        }

    }


    for(int k =0; k<F.size();k++){
        output<<"(Length- "<<k+1<<" "<<F[k].size()<<endl;
        for(auto &itemset:F[k]){
            output<<"\t("<<itemset.front();
            itemset.erase(itemset.begin());
            for(auto &it:itemset){
                output<<" "<<it;

            }
            output<<")"<<endl;
        }
        output<<")"<<endl;
    }

    output.close();

    return 0;
}