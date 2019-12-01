
function dbInit(){
    console.log(" Initializing database...")

    db = LocalStorage.openDatabaseSync("greenhousedb", "1.0", "GreenHouse Database", 10000000);
    db.transaction( function(tx) {
        print('... create table')
        tx.executeSql('CREATE TABLE IF NOT EXISTS ghleituras(date INTEGER UNIQUE, it INTEGER, et INTEGER, uar INTEGER, usolo INTEGER, irr INTEGER, wt INTEGER, luz INTEGER, clr INTEGER, p1 INTEGER, p2 INTEGER)');
    });
}


function dbChart(){
    //Completar com a criação dos ChartViews das abas graficas
    console.log("Running Function dbChart...")
}
function dbReadAll()
{
    console.log(" Reading All data...")

    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Reading All data from database')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date desc')
        for (var i = 0; i < results.rows.length; i++) {
            readingsModelId.append({"day": results.rows[i].date,"temp_int": results.rows[i].it, "temp_ext": results.rows[i].et,
                                       "umd_ar": results.rows[i].uar, "umd_solo": results.rows[i].usolo,"infrared": results.rows[i].irr,"watertank" :results.rows[i].wt,
                                       "light": results.rows[i].luz,"cooler":results.rows[i].clr,"peltier1": results.rows[i].p1, "peltier2": results.rows[i].p2
                                   })           
            console.log(results.rows[i].date +" "+results.rows[i].et)
        }
    })
}

function fakeData(){
    console.log(" Storing fake data...")
    if (!db){
        return ;
    }
    db.transaction(function(tx){
        //Prepare json object data from qml code
        console.log("Creating new database table entry")
        //Create entrys
        var results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:00:00'),23,32,23,50,0,75,1,0,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:05:00'),22,32,24,51,0,74,1,1,0,1])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:10:00'),23,33,25,51,0,73,1,0,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:15:00'),21,32,26,51,0,72,1,0,0,1])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:20:00'),21,32,27,51,0,72,1,1,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:25:00'),21,31,27,51,0,72,1,0,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:30:00'),21,31,28,52,0,72,1,0,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:35:00'),20,31,29,52,0,72,1,1,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:40:00'),20,30,29,52,0,71,1,0,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:45:00'),20,30,29,53,0,71,1,0,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:50:00'),19,29,32,53,0,71,1,1,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 0:55:00'),20,29,36,55,0,71,1,0,1,0])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 1:00:00'),19,28,40,55,0,71,1,0,0,1])
        results = tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[datems('2019-01-24 1:05:00'),18,28,43,60,0,71,1,0,0,1])
    });
}

function datems(data) {
    var b = new Date(data);
    var dms = b.getTime();
    return dms;
}