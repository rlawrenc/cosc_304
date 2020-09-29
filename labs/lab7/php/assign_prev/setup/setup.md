# COSC 304 - Setup XAMPP Web Server and Add Microsoft SQL Driver

While there are advantages to developing locally, it is likely more time efficient to use the cosc304.ok.ubc.ca web server. If you choose your own local server, one advantage you will get, is better debug information, as the cosc304 server is setup as a production web server; if the page has a critical error, the server will just respond with a 500 error instead of showing the page.

Note that Microsoft has provided [instructions on how to setup PHP 7 and Microsoft SQL Server](https://www.microsoft.com/en-us/sql-server/developer-get-started/php/rhel/).

1. Download and install XAMPP from: <a href="https://www.apachefriends.org/">https://www.apachefriends.org/</a>. Take note of where it is installed too; you will need to access this location.

2. Download and install Microsoft SQL Server ODBC Drivers from: <a href="https://www.microsoft.com/en-us/download/details.aspx?id=53339">https://www.microsoft.com/en-us/download/details.aspx?id=53339</a>.

3. Download PHP SQLSRV Plugin from: <a href="https://github.com/Microsoft/msphpsql/releases/">https://github.com/Microsoft/msphpsql/releases/</a>. After downloading, extract to `<XAMPP Install Directory>\php\ext\` The default location on Windows would be `C:\xampp\php\ext\`. After extracting, head one directory up, to the `php` folder. Open `php.ini` in a text editor, locate the text `extention=`, around aproximately line 915.<br/>
Add the following at the end of the Extensions:<br/>
<pre>extension=php_sqlsrv_72_ts.dll <!-- This will have to be updated in future years for PHP versions higher than 7.1 -->
extension=php_pdo_sqlsrv_72_ts.dll</pre>

4. Start XAMPP Control Panel

5. Press Start next to <tt>Apache</tt> <br/>
<img src="img/xampp.png"><br/><tt><b>Note:</b> If you are using an OS other than Windows, your control panel will be slightly different.<br/>Still click start next to Apache</tt>

The webserver loads pages from  `<XAMPP Install Directory>\htdocs\`.

MySQL drivers are already fully configured in XAMPP, and if you want to use the local MySQL server it supplies when developing your final project, the user account is `root` with no password.
