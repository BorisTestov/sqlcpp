#include <mysql++.h>

#include <iostream>
#include <iomanip>

using namespace std;

int
main(int argc, char *argv[])
{
    // Connect to the sample database.
    mysqlpp::Connection conn(false);
    mysqlpp::Query query = conn.query();
    if (conn.connect("DBname", "Server_address",
            "username", "password")) {

	/*INSERT*/
        query = conn.query("insert into events (date,time,event) values(\"2019.05.12\", \"23:40:00\", \"Event name\")");
        query.execute();
        /*ENDINSERT*/


/*READ*/
        query = conn.query("select * from events");
        if (mysqlpp::StoreQueryResult res = query.store()) {
            mysqlpp::StoreQueryResult::const_iterator it;
            for (it = res.begin(); it != res.end(); ++it) {
                mysqlpp::Row row = *it;
                cout << '\t' << row[0] << '\t' << row[1] << '\t' << row[2] << '\t' << row[3] << endl; //id date time event
            }
        }
        else {
            cerr << "Failed to get item list: " << query.error() << endl;
        }
/*ENDREAD*/
/*DELETE*/
query = conn.query("delete from events where id=3");
query.execute();
}
/*ENDDELETE*/
    else {
        cerr << "DB connection failed: " << conn.error() << endl;
    }
   return 0;
}
