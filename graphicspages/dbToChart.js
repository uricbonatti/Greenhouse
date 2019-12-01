
function iTempOnChart() {
    console.log(" Reading All data...")
    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Sending Data to Internal Temperature Chart')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date')
        for (var i = 0; i < results.rows.length; i++) {
            if(i===0){
                iTempaxisX.min= new Date(results.rows[i].date)
            }
            if(i===results.rows.length-1){
                iTempaxisX.max=new Date(results.rows[i].date)
            }
            iTempSeries.insert(i,new Date(results.rows[i].date),results.rows[i].it)
        }
    })
}
function eTempOnChart() {
    console.log(" Reading All data...")
    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Sending Data to External Temperature Chart')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date')
        for (var i = 0; i < results.rows.length; i++) {
            if(i===0){
                eTempaxisX.min= new Date(results.rows[i].date)
            }
            if(i===results.rows.length-1){
                eTempaxisX.max=new Date(results.rows[i].date)
            }
            eTempSeries.insert(i,new Date(results.rows[i].date),results.rows[i].et)
        }
    })
}

function umdAirOnChart() {
    console.log(" Reading All data...")
    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Sending Data to Umid. Air Chart')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date')
        for (var i = 0; i < results.rows.length; i++) {
            if(i===0){
                umdAiraxisX.min= new Date(results.rows[i].date)
            }
            if(i===results.rows.length-1){
                umdAiraxisX.max=new Date(results.rows[i].date)
            }
            umdAirSeries.insert(i,new Date(results.rows[i].date),results.rows[i].uar)

        }
    })
}
function umdEarthOnChart() {
    console.log(" Reading All data...")
    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Sending Data to Umid. Earth Chart')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date')
        for (var i = 0; i < results.rows.length; i++) {
            if(i===0){
                umdEarthaxisX.min= new Date(results.rows[i].date)
            }
            if(i===results.rows.length-1){
                umdEarthaxisX.max=new Date(results.rows[i].date)
            }
            umdEarthSeries.insert(i,new Date(results.rows[i].date),results.rows[i].usolo)

        }
    })
}
function waterTankLevelOnChart() {
    console.log(" Reading All data...")
    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Sending Data to Water Tank Level Chart')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date')
        for (var i = 0; i < results.rows.length; i++) {
            if(i===0){
                waterTankaxisX.min= new Date(results.rows[i].date)
            }
            if(i===results.rows.length-1){
                waterTankaxisX.max=new Date(results.rows[i].date)
            }
            waterTankSeries.insert(i,new Date(results.rows[i].date),results.rows[i].wt)

        }
    })
}
function infraredOnChart() {
    console.log(" Reading All data...")
    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Sending Data to Infrared Level Chart')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date')
        for (var i = 0; i < results.rows.length; i++) {
            if(i===0){
                irrLevelaxisX.min= new Date(results.rows[i].date)
            }
            if(i===results.rows.length-1){
                irrLevelaxisX.max=new Date(results.rows[i].date)
            }
            irrLevelSeries.insert(i,new Date(results.rows[i].date),results.rows[i].irr)
        }
    })
}

//To Create the Series for any equipament
//Not working for now
function equipamentOnChart() {
    console.log(" Reading All data...")
    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Sending Data to Infrared Level Chart')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date')
        for (var i = 0; i < results.rows.length; i++) {
            if(i===0){
                irrLevelaxisX.min= new Date(results.rows[i].date)
            }
            if(i===results.rows.length-1){
                irrLevelaxisX.max=new Date(results.rows[i].date)
            }
            irrLevelSeries.insert(i,new Date(results.rows[i].date),results.rows[i].irr)

        }
    })
}

function allCharts(){
    console.log(" Reading All data...")
    if (!db){
        return ;
    }
    db.transaction(function (tx) {
        print('... Sending Data to Infrared Level Chart')
        var results = tx.executeSql('SELECT * FROM ghleituras order by date')
        for (var i = 0; i < results.rows.length; i++) {
            if(i===0){
                var sub = new Date(results.rows[i].date)
                irrLevelaxisX.min= sub
                waterTankaxisX.min= sub
                umdEarthaxisX.min= sub
                umdAiraxisX.min= sub
                eTempaxisX.min= sub
                iTempaxisX.min= sub
            }
            if(i===results.rows.length-1){
                var sub = new Date(results.rows[i].date)
                irrLevelaxisX.max=sub
                waterTankaxisX.max=sub
                console.log(new Date(waterTankaxisX.max))
                umdEarthaxisX.max=sub
                umdAiraxisX.max=sub
                eTempaxisX.max=sub
                iTempaxisX.max=sub
            }
            irrLevelSeries.insert(i,new Date(results.rows[i].date),results.rows[i].irr)
            waterTankSeries.insert(i,new Date(results.rows[i].date),results.rows[i].wt)
            umdEarthSeries.insert(i,new Date(results.rows[i].date),results.rows[i].usolo)
            umdAirSeries.insert(i,new Date(results.rows[i].date),results.rows[i].uar)
            eTempSeries.insert(i,new Date(results.rows[i].date),results.rows[i].et)
            iTempSeries.insert(i,new Date(results.rows[i].date),results.rows[i].it)
            console.log(results.rows[i].wt + "")
        }
    })
}

