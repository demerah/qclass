var express     = require('express'),
    router      = express.Router(),
    routeHelper = require('./helper'),
    helper      = require('../api/helper'),
    db          = require('../api/db');

// GET user info
router.get('/info', function(req, res, next) {
    netID = req.cookies.netId;
    
    db.studentExists(netID, function(err, results, fields) {
        if (err) 
            return routeHelper.sendError(res, err, 'Error checking netID');
        if (results.length !== 0) {
            res.status(200).json({ 
                netId: results[0].NetID,
                firstName: results[0].fName,
                lastName: results[0].lName,
                isProf: false
             }); 
        } else {
            db.profExists(netID, function(err, results, fields) {
                if (err) 
                    return routeHelper.sendError(res, err, 'Error checking netID');
                if (results.length !== 0) {
                    res.status(200).json({ 
                        netId: results[0].pNetID,
                        firstName: results[0].fName,
                        lastName: results[0].lName,
                        isProf: true
                     }); 
                } else {
                    res.status(403).send("NetID not found: " + netID);
                }
            });
        }
    });
});

module.exports = router;