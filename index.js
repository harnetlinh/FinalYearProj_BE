const express = require("express");
const bodyParser = require("body-parser");
const logger = require('morgan');
const chalk = require('chalk');
const app = express();
/**
 * Express configuration.
 */
app.set('host', process.env.OPENSHIFT_NODEJS_IP || '0.0.0.0');
app.set('port', process.env.PORT || process.env.OPENSHIFT_NODEJS_PORT || 8080);
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Welcome to HNL application." });
});
/**
 * Error Handler.
 */
if (process.env.NODE_ENV === 'development') {
	// only use in development
	app.use(errorHandler());
} else {
	app.use((err, req, res, next) => {
		console.error(err);
    res.status(500).send('Server Error');
  });
}
// set port, listen for requests
app.listen(app.get('port'), () => {
    console.log('%s App is running at http://localhost:%d in %s mode', chalk.green('✓'), app.get('port'), app.get('env'));
    console.log('  Press CTRL-C to stop\n');
  });
  