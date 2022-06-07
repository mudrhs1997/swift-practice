//
//  DBHelper.swift
//  DBtest
//
//  Created by 정명곤 on 2022/05/11.
//

import Foundation
import SQLite3

class DBHelper {
    
    static let shared = DBHelper()
    
    var db : OpaquePointer? // db를 가리키는 포인터
    
    //  db이름은 항상 "DB이름.sqlite"형식 유지
    let databaseName = "DBtest.sqlite"
    
    init() {
        self.db = createDB()
    }
    
    deinit {
        sqlite3_close(db)
    }
    
    private func onSQLErrorPrintMessage(_ db: OpaquePointer?) {
        let errorMessage = String(cString: sqlite3_errmsg(db))
        
        print("Error preparing update:\(errorMessage)")
        
        return
    }
    
    private func createDB() -> OpaquePointer? {
        
        var db: OpaquePointer? = nil
        
        do {
            
            let dbPath: String = try FileManager.default.url(for: .documentDirectory,
                                                             in: .userDomainMask,
                                                             appropriateFor: nil,
                                                             create: false).appendingPathComponent(databaseName).path
            
            if sqlite3_open(dbPath, &db) == SQLITE_OK {
                print("Successfully created DB.Path:\(dbPath)")
                
                return db
            }
        } catch {
            
            print("Error while creating Database-\(error.localizedDescription)")
        }
        
        return nil
        
    }
    
    func createTable() {
        
        let query = """
                        Create Table IF NOT EXISTS dbTest(
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        name TEXT NOT NULL,
                        age INT
                        );
                        """
        
        var statement: OpaquePointer? = nil
        
        //  쿼리 실행 준비 단계
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            //  쿼리 실행하는 단계
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been succesfully done. db: \(String(describing:self.db))")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                
                print("\nsqlite3_step failure while creating table:\(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.db))
            
            print("\nsqlite3_prepare failure while creating table:\(errorMessage)")
        }


    }
    
    func insertData(name: String, age: Int) {
        
        let insertQuery = "insert into dbTest(id,name,age) values(?,?,?);"
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            
            sqlite3_bind_text(statement, 2, name, -1, nil)
            
            sqlite3_bind_int(statement, 3, Int32(age))
        } else {
            print("sqlite binding failure")
        }
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }
    
    func readData() -> [Model] {
        
        let query: String = " select * from dbTest;"
        
        var statement: OpaquePointer? = nil
        
        var result: [Model] = []
        
        if sqlite3_prepare(self.db, query, -1, &statement, nil) != SQLITE_OK {
            
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            
            print("error while prepare:\(errorMessage)")
            
            return result
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let id = sqlite3_column_int(statement, 0)
            
            let name = String(cString: sqlite3_column_text(statement, 1))
            
            let age = sqlite3_column_int(statement, 2)
            
            result.append(Model(id: Int(id), name: String(name), age: Int(age)))
        }
        
        sqlite3_finalize(statement)
        
        return result
    }
    
    func updateData(id: Int, name: String, age: Int) {
        var statement: OpaquePointer?
        
        let queryString = "UPDATE dbTest set name='\(name)',age=\(age) where id = \(id)"
        
        if sqlite3_prepare_v2(db, queryString, -1, &statement, nil) != SQLITE_OK {
            onSQLErrorPrintMessage(db)
            return
        }
        
        if sqlite3_step(statement) != SQLITE_DONE {
            onSQLErrorPrintMessage(db)
            return
        }
        
        print("Update has been successfully done")
    }
    
    
}

