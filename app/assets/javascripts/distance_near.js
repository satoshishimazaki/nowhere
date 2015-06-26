function distance_near (latitude, longitude, article_latitude, article_longitude){
      //ラジアンに変換
    var a_lat = latitude * Math.PI / 180;
    var a_lon = longitude * Math.PI / 180;
    var b_lat = article_latitude * Math.PI / 180;
    var b_lon = article_longitude * Math.PI / 180;

    // 緯度の平均、緯度間の差、経度間の差
    var latave = (a_lat + b_lat) / 2;
    var latidiff = a_lat - b_lat;
    var longdiff = a_lon - b_lon;

    //子午線曲率半径
    //半径を6335439m、離心率を0.006694で設定してます
    var meridian = 6335439 / Math.sqrt(Math.pow(1 - 0.006694 * Math.sin(latave) * Math.sin(latave), 3));    

    //卯酉線曲率半径
    //半径を6378137m、離心率を0.006694で設定してます
    var primevertical = 6378137 / Math.sqrt(1 - 0.006694 * Math.sin(latave) * Math.sin(latave));     

    //Hubenyの簡易式
    var x = meridian * latidiff;
    var y = primevertical * Math.cos(latave) * longdiff;

    return Math.sqrt(Math.pow(x,2) + Math.pow(y,2));
}