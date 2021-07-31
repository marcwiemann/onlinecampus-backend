var express = require("express");
var router = express.Router();

var studierenderController = require("../controllers/studierender");
router.get("/:id", studierenderController.getUserData);
router.post("/", studierenderController.addUser);

router.put("/:id", studierenderController.updateUser);
router.put("/profile_image/:id", studierenderController.updateProfileImage);
module.exports = router;