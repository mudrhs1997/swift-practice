//
//  DBHelper.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/15.
//

import Foundation
import SQLite3

class DBHelper {
    
    static let shared = DBHelper()
    
    var db : OpaquePointer?
    
    let databaseName = "TeamDB.sqlite"
    
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
            
            print("Error while creating Database\(error.localizedDescription)")
        }
        
        return nil
    }
    
    func createUserTable() {
        
        let query = """
                        Create Table IF NOT EXISTS User(
                        id TEXT NOT NULL PRIMARY KEY,
                        password TEXT NOT NULL,
                        name TEXT NOT NULL
                        );
                        """
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
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
    
    func createTeamTable() {
        
        let query = """
                        Create Table IF NOT EXISTS Team(
                        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                        name TEXT NOT NULL,
                        image TEXT NOT NULL DEFAULT 'swift'
                        );
                        """
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been succesfully done. db: \(String(describing:self.db))")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                
                print("\nsqlite3_step failure shile creating table:\(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.db))
            
            print("\nsqlite3_step failure shile creating table:\(errorMessage)")
        }
    }
    
    func createUserTeamTable() {
        
        let query = """
                        Create Table IF NOT EXISTS UserTeam(
                        user_id TEXT NOT NULL PRIMARY KEY,
                        team_id TEXT NOT NULL,
                        CONSTRAINT userid_fk FOREIGN KEY (user_id) REFERENCES User(id),
                        CONSTRAINT teamid_fk FOREIGN KEY (team_id) REFERENCES Team(id)
                        );
                        """
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been succesfully done. db: \(String(describing:self.db))")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                
                print("\nsqlite3_step failure shile creating table:\(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.db))
            
            print("\nsqlite3_step failure shile creating table:\(errorMessage)")
        }
    }
    
    func createStatTable() {
        
        let query = """
                        Create Table IF NOT EXISTS Stats(
                        team_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                        name TEXT NOT NULL,
                        goals INTEGER DEFAULT 0,
                        assists INTEGER DEFAULT 0,
                        games INTEGER DEFAULT 0,
                        CONSTRAINT teamid_fk FOREIGN KEY (team_id) REFERENCES TEAM(id)
                        );
                        """
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been succesfully done. db: \(String(describing:self.db))")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                
                print("\nsqlite3_step failure shile creating table:\(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.db))
            
            print("\nsqlite3_step failure shile creating table:\(errorMessage)")
        }
    }
    
    func createScheduleTable() {
        
        let query = """
                        Create Table IF NOT EXISTS Schedule(
                        opp_name TEXT NOT NULL PRIMARY KEY,
                        date TEXT DEFAULT '1999-99-99'
                        );
                        """
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been succesfully done. db: \(String(describing:self.db))")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                
                print("\nsqlite3_step failure shile creating table:\(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.db))
            
            print("\nsqlite3_step failure shile creating table:\(errorMessage)")
        }
    }
    
    func insertUserData(id: String, password: String, name: String) {
        
        let insertQuery = " insert into user(id,password,name) values(?,?,?); "
        
        var statement: OpaquePointer? = nil
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        if sqlite3_prepare_v2(self.db, insertQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("failure binding \(errMsg)")
            return
        }
        
        if sqlite3_bind_text(statement, 1, id, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        print(id)
        if sqlite3_bind_text(statement, 2, password, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        print(password)
        if sqlite3_bind_text(statement, 3, name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        print(name)
        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }
    
    func insertTeam(name: String) {
        
        let insertQuery = " insert into Team(name) values(?); "
        
        var statement: OpaquePointer? = nil
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        if sqlite3_prepare_v2(self.db, insertQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("failure binding \(errMsg)")
            return
        }
        
        if sqlite3_bind_text(statement, 1, name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }
    
    func insertUserTeam(user_id: String, team_name: String) {
        
        let insertQuery = " insert into UserTeam(user_id,team_id) values(?,?); "
        
        var statement: OpaquePointer? = nil
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        if sqlite3_prepare_v2(self.db, insertQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("failure binding \(errMsg)")
            return
        }
        
        if sqlite3_bind_text(statement, 1, user_id, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        
        if sqlite3_bind_text(statement, 1, team_name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }
    
    func insertStatData(name: String) {
        
        let insertQuery = " insert into stats(name) values(?); "
        
        var statement: OpaquePointer? = nil
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        if sqlite3_prepare_v2(self.db, insertQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("failure binding \(errMsg)")
            return
        }
        
        if sqlite3_bind_text(statement, 1, name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }
    
    func insertScheduleData(name: String, date: String) {
        
        let insertQuery = " insert into Schedule(opp_name, date) values(?,?); "
        
        var statement: OpaquePointer? = nil
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        if sqlite3_prepare_v2(self.db, insertQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("failure binding \(errMsg)")
            return
        }
        
        if sqlite3_bind_text(statement, 1, name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        
        if sqlite3_bind_text(statement, 2, date, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }
    
    
    
    func readUserData() -> [User] {
        let query: String = " select * from User; "
        
        var statement: OpaquePointer? = nil
        
        var result: [User] = []
        
        if sqlite3_prepare(self.db, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            
            print("error while prepare: \(errorMessage)")
            
            return result
        }
        
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let id = String(cString: sqlite3_column_text(statement, 0))
            let password = String(cString: sqlite3_column_text(statement, 1))
            let name = String(cString: sqlite3_column_text(statement, 2))
            
            result.append(User(id: String(id), password: String(password), name: String(name)))
            
        }
        
        sqlite3_finalize(statement)
        
        return result
    }
    
    func readTeamData() -> [Team] {
        let query: String = " select * from team; "
        
        var statement: OpaquePointer? = nil
        
        var result: [Team] = []
        
        if sqlite3_prepare(self.db, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            
            print("error while prepare: \(errorMessage)")
            
            return result
        }
        
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let id = sqlite3_column_int(statement, 0)
            let name = String(cString: sqlite3_column_text(statement, 1))
            let image = String(cString: sqlite3_column_text(statement, 2))
            
            result.append(Team(team_Id: Int(id), image: image, name: name))
            
        }
        
        sqlite3_finalize(statement)
        
        return result
    }
    
    func readStatsData() -> [Stats] {
        let query: String = " select * from Stats order by goals asc; "
        
        var statement: OpaquePointer? = nil
        
        var result: [Stats] = []
        
        if sqlite3_prepare(self.db, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            
            print("error while prepare: \(errorMessage)")
            
            return result
        }
        
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let id = sqlite3_column_int(statement, 0)
            let name = String(cString: sqlite3_column_text(statement, 1))
            let goals = sqlite3_column_int(statement, 2)
            let assists = sqlite3_column_int(statement, 3)
            let games = sqlite3_column_int(statement, 4)
            
            result.append(Stats(team_id: Int(id), name: String(name), goals: Int(goals), assists: Int(assists), games: Int(games)))
            
        }
        
        sqlite3_finalize(statement)
        
        return result
    }
    
    func readScheduleData() -> [Schedule] {
        let query: String = " select * from Schedule; "
        
        var statement: OpaquePointer? = nil
        
        var result: [Schedule] = []
        
        if sqlite3_prepare(self.db, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            
            print("error while prepare: \(errorMessage)")
            
            return result
        }
        
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let name = String(cString: sqlite3_column_text(statement, 0))
            let date = String(cString: sqlite3_column_text(statement, 1))
            
            result.append(Schedule(OpponentName: name, date: date))
            
        }
        
        sqlite3_finalize(statement)
        
        return result
    }
    
    func updateStatsData(name: String, goals: Int, assists: Int, games: Int) {
        var statement: OpaquePointer?
        
        let query = " update stats set goals='\(goals)', assists='\(assists)', games='\(games)' where name='\(name)'; "
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) != SQLITE_OK {
            onSQLErrorPrintMessage(db)
            return
        }
        
        if sqlite3_step(statement) != SQLITE_DONE {
            onSQLErrorPrintMessage(db)
            return
        }
        
        print("Update has been successfully done")
    }
    
    func deleteSchedule(name: String) {
        var statement: OpaquePointer?
        
        let query = " delete from schedule where opp_name = '\(name)'; "
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) != SQLITE_OK {
            onSQLErrorPrintMessage(db)
            return
        }
        
        if sqlite3_step(statement) != SQLITE_DONE {
            onSQLErrorPrintMessage(db)
            return
        }
        
        print("Update has been successfully done")
        
    }
    
    func deleteTeam(name: String) {
        var statement: OpaquePointer?
        
        let query = " delete from team where name = '\(name)'; "
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) != SQLITE_OK {
            onSQLErrorPrintMessage(db)
            return
        }
        
        if sqlite3_step(statement) != SQLITE_DONE {
            onSQLErrorPrintMessage(db)
            return
        }
        
        print("Update has been successfully done")
    }
    
    func deleteStat(name: String) {
        var statement: OpaquePointer?
        
        let query = " delete from stats where name = '\(name)'; "
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) != SQLITE_OK {
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
