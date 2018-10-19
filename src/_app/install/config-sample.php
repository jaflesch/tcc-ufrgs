<?php
/* 
 * --------------------------------------
 * Application's configuration sample file for local values
 * 
 * Generated file will be placed at /config.php and it's already included in .gitignore.
 * --------------------------------------
 */

/// MySQL Database
define("DB_HOST", "localhost");
define("DB_USER", "root");
define("DB_PASS", "");
define("DB_NAME", "medjai");

// Defaults
define("SESSION_NAME", "tcc");
define("DEFAULT_CONTROLLER", "home");
define("DEFAULT_ACTION", "index");
define("DEFAULT_LANG", "PT");
define("CONTROLLER_INDEX", 0);
define("ACTION_INDEX", 1);
define("PARAM_INDEX", 2);
define("MAIL_CONTACT", "jean.flesch93@gmail.com.br");
define("DEBUG", true);

// E-mail provider SMTP config
define("SMTP_HOST", "");
define("SMTP_PORT", "");
define("SMTP_SECURE", "");
define("SMTP_SENDER", "");
define("SMTP_FROM_NAME", "");
define("SMTP_EMAIL_ACCOUNT", "");
define("SMTP_EMAIL_PASSWORD", "");

// Paths
define("APP_PATH", "_app/");
define("CORE_PATH", "_app/core/");
define("LIB_PATH", "_app/includes/");
define("INSTALL_PATH", "_app/install/");
define("CONTROLLER_PATH", "_controller/");
define("MODEL_PATH", "_model/");
define("VIEW_PATH", "/_view/");
define("BASE_PATH", dirname(__FILE__));

// Metadata
define("META_APP", "");
define("META_KEYWORDS", "");
define("META_DESCRIPTION", "");
define("META_FACEBOOK_ID", "");

// Timezone
date_default_timezone_set("America/Sao_Paulo");
