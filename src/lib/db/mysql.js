import mysql from "mysql2/promise";

let mysqlconn = null;

/**
 * Initializes and returns a MySQL connection object.
 *
 * @return {Object} The MySQL connection object.
 */
export function mysqlconnFn() {
  if (!mysqlconn) {
    mysqlconn = mysql.createConnection({
      host: "127.0.0.1",
      user: "root",
      password: "",
      database: "championsdev",
    });
  }

  return mysqlconn;
}