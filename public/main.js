var NavBar      = require('./navbar'),
    ClassList   = require('./professor/classlist'),
    ModalWindow = require('./modalwindow');

SITE_NAME = "Q-Class";

var SignInApp = function () {};

/**
 * Build some common DOM items, then determine if we should
 * build the professor site or student sign in site
 */
SignInApp.prototype.init = function () {
    document.title = SITE_NAME;
    this.navbar = new NavBar();

    // Check if we're logged in as a professor or not
    isProf = this.isProfessor();

    isProf ? this.buildProfDOM() : this.buildStudentDOM(); // jshint ignore:line
};

/**
 * Returns true if a given user id is a professor
 * In reality, currently not sure if we'd do this or SSO could do this
 * @param {*} id 
 */
SignInApp.prototype.isProfessor = function (id) {
    //TODO - unstub
    return true;
};

/**
 * Build the professor DOM
 */
SignInApp.prototype.buildProfDOM = function () {
    this.navbar.buildProfNavbar();
};

/**
 * Build the student DOM
 */
SignInApp.prototype.buildStudentDOM = function () {
    
};


/**
 * Build the professors class list
 */
SignInApp.prototype.buildClassList = function () {

};

// When the page is loaded, create our main ui object
$(function () {
    window.app = new SignInApp();
    window.app.init();
    var modalWindow = new ModalWindow({ title: 'Modal Window Test' });
    modalWindow.show();
});

module.exports = SignInApp;