<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="html" indent="no" omit-xml-declaration="yes"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        encoding="iso-8859-1" />

    <xsl:template match="catalog">
        <html lang="en">
            <head>
                <meta charset="UTF-8" />
                <title>Level up lunch book transformation with XSLT</title>

                <!-- Latest compiled and minified CSS -->
                <link rel="stylesheet"
                    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />

                <!-- Optional theme -->
                <link rel="stylesheet"
                    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />

                <!-- Latest compiled and minified JavaScript -->
                <script
                    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
            </head>
            <body>
            
                <h2>Level up lunch - XSL + XML = Bootstrap</h2>

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Genre</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="book">
                            <tr>
                                <td>
                                    <xsl:value-of select="title" />
                                </td>
                                <td>
                                    <xsl:value-of select="author" />
                                </td>
                                <td>
                                    <xsl:value-of select="genre" />
                                </td>
                                <td>
                                    <xsl:value-of select="description" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>