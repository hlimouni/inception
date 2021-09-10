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
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', '123' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', 'utf8_unicode_ci' );
define( 'FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
	define('AUTH_KEY',         '+3.]+S-5T-{1DM`>GA|<2%a)X-}9?`=vqI?tLIBZ$tjcg<W{{zwr~Gh^jMA/Y)f=');
	define('SECURE_AUTH_KEY',  '(YPt!o{+(u6=$~MY^?]b;+Gi`Mw|154Qjy=zo2]Mw!G}[y8{D}?FTRW+Cl1G-/+d');
	define('LOGGED_IN_KEY',    '$s[EFeDAQfkF_ K<kN:=+d|K+ +j|o_<o|c|.hve+^k0c_vr2-0+Ia`*/Lb.YNi5');
	define('NONCE_KEY',        's>mKd*7<:cG.)`Ryf-[F/7$W?`2nJR_xcCCo6,8(7zuU[Aa#0ZU1hj_DHq,#F<G]');
	define('AUTH_SALT',        'Azz1nN3-2jo-5bBMwNe-eC8{p5h4:u.VANL7S.QV%gEegR{]0P;0x8qY-^{z2E-B');
	define('SECURE_AUTH_SALT', 'fR6JFq>m`frmC{~3<?NoWT}V(HK&fh|at#xh3MEDfQ{Pk$RB9g-/w/)ax*N9dL;e');
	define('LOGGED_IN_SALT',   '?(0wg_@pa6#a+)hG0RTLLz#M0c-XpKS|QZX:RSKS&qKN)r1vZ]ohw7ppnY2>71<x');
	define('NONCE_SALT',       'A85rZ-mDw4+]UPo|JG/c:A1JtXtO}5pyVQV53g$Z|ARl)%Y}t7y]M4>fzPIV^b{8');

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