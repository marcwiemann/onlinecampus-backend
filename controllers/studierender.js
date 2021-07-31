const db = require('../services/db');
const queryString = require('query-string');
const axios = require('axios');
var mysql = require('mysql2');
db.pool;
//Bekommt alle Daten zu einem Studierenden
exports.getUserData =  async(req, res)=>{
    console.log(req.params.id)
    if(req.params.id == null ) {
        res.sendStatus(500); 
        return;
    }
    const promisePool = db.pool.promise();
    const [rows, fields] = await promisePool.execute(`SELECT * FROM studierender WHERE id_studierender = ?`,[req.params.id]);
    res.json(rows)
}
//Studiernder wird hinzugefügt
exports.addUser = async(req, res)=>{
    console.log(req.body)
    if(req.body == null || req.body.vorname == null) {
        res.sendStatus(404); 
        return;
    }

    const promisePool = db.pool.promise();
    const [result, fields] = await promisePool.execute(
        `INSERT INTO studierender(studienbegin, vorname, nachname, geburtsdatum, studiengang_id, email, matrikelnummer, image_path) VALUES (?,?,?,?)`,
        [req.body.studienbegin, req.body.vorname, req.body.nachname, req.body.geburtsdatum, req.body.studiengang_id, email, req.body.matrikelnummer, req.body.image_path]
        );
    console.log(result);
    if(result.affectedRows >0){
        res.sendStatus(200);
    }
    else res.sendStatus(500);
}
//Studiernder wird bearbeitet
exports.updateUser = async(req, res)=>{
    console.log(req.body)
    if(req.body == null || req.body.vorname == null || req.params.id == null) {
        res.sendStatus(403); 
        return;
    }
    const promisePool = db.pool.promise();
    const [result, fields] = await promisePool.execute(
        `UPDATE studierender SET vorname = ?, nachname = ?, email= ? WHERE id_studierender = ? `,
        [req.body.vorname, req.body.nachname,  email]
    );
    console.log(result);
    if(result.affectedRows >0){
        res.sendStatus(200);
    }
    else res.sendStatus(500);
}

//neues Profilbild
exports.updateProfileImage = async(req, res)=>{
    console.log(req.body)
    if(req.body.note == null || req.body.checked == null || req.params.id == null) {
        res.sendStatus(403); 
        return;
    }
    const promisePool = db.pool.promise();
    const [result, fields] = await promisePool.execute(
        `UPDATE studierender SET image_path = ? WHERE id_studierender = ? `,
        [req.body.image_path]
    );
    console.log(result);
    if(result.affectedRows >0){
        res.sendStatus(200);
    }
    else res.sendStatus(500);
}