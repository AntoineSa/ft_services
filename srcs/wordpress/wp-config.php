<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

define( 'FS_METHOD', 'direct' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         't$FeP;n,-lUk+MxP?$ySv8Eif{c- /(R@T+Tm8qBp`-wOfHANe]uwJKdMlBgD(,P');
define('SECURE_AUTH_KEY',  'Bny+fTM;&B5eJ9[4WP#(ECi$N=A_Rr_tXC<i}|KZy?&lL_X&d%hc:tL$_v2*T@M2');
define('LOGGED_IN_KEY',    '!*aINC<wV<q?Qu7:t/gk@[;j $T[Fdl_I!Q3cdK6]#yJWpaF*kOkRIbusxJiW/>k');
define('NONCE_KEY',        'K(!QN`3&!YePo>Hkxb{`m?Ce^xeob++2Mn,c(90-:I Eo$(,ch<EG?$g@RfSb5vz');
define('AUTH_SALT',        'i^q3Pi78naiI0twj6GYjlkGrWgfMOd>=+FT|%{XG*!m#}J1+L]-[W(^yGR*1XY7q');
define('SECURE_AUTH_SALT', '+]Ge`eH8hzN9^QVX@5qgIvDN8QDk&s?$>L[Lu:A4{Nl~d-Zi^Pk%O1`Qd+76gyM@');
define('LOGGED_IN_SALT',   '68}G?hpr}%|Em?=VN2ys5ccE8fQv|jIDE+zZ=*3<y?Pvcvw_[%%hS|^s?vN}@~ca');
define('NONCE_SALT',       'AcIWPh-P24dI:8AR}2 L/D)] L7i5cmg(;TLJa#vtU&Xte]bUPq}[QRabb4t(X|9');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
