
function dbInit(){
    console.log(" Initializing database...")

    db = LocalStorage.openDatabaseSync("greenhousedb", "1.0", "GreenHouse Database", 10000000);
    db.transaction( function(tx) {
        print('... create table')
        tx.executeSql('CREATE TABLE IF NOT EXISTS ghleituras(date INTEGER PRIMARY KEY, it INTEGER, et INTEGER, uar INTEGER, usolo INTEGER, irr INTEGER, wt INTEGER, luz INTEGER, clr INTEGER, p1 INTEGER, p2 INTEGER)');
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
        var ms = datems(new Date('2019-01-24 00:00:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,23,32,23,50,12,75,1,0,1,0])
        ms = datems(new Date('2019-01-24 00:05:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,22,32,24,51,25,74,1,1,0,1])
        ms = datems(new Date('2019-01-24 00:10:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,23,33,25,51,3,73,1,0,1,0])
        ms = datems(new Date('2019-01-24 00:15:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,21,32,26,51,90,72,1,0,0,1])
        ms = datems(new Date('2019-01-24 00:20:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,21,32,27,51,3,72,1,1,1,0])
        ms = datems(new Date('2019-01-24 00:25:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,21,31,27,51,4,72,1,0,1,0])
        ms = datems(new Date('2019-01-24 00:30:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,21,31,28,52,14,72,1,0,1,0])
        ms = datems(new Date('2019-01-24 00:35:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,20,31,29,52,5,72,1,1,1,0])
        ms = datems(new Date('2019-01-24 00:40:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,20,30,29,52,5,71,1,0,1,0])
        ms = datems(new Date('2019-01-24 00:45:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,20,30,29,53,5,71,1,0,1,0])
        ms = datems(new Date('2019-01-24 00:50:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,19,29,32,53,5,71,1,1,1,0])
        ms = datems(new Date('2019-01-24 00:55:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,20,29,36,55,5,71,1,0,1,0])
        ms = datems(new Date('2019-01-24 01:00:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,19,28,40,55,5,71,1,0,0,1])
        ms = datems(new Date('2019-01-24 01:05:00'))
        tx.executeSql('INSERT INTO ghleituras VALUES (?,?,?,?,?,?,?,?,?,?,?)',[ms,18,28,43,60,5,71,1,0,0,1])
    });
}

function datems(data) {
    var dms = data.getTime();
    return dms;
}
