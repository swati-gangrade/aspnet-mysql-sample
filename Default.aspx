<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="aspnet_mysql_sample.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>ASP.NET 4.5 - MySQL Example</title>
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="Default.aspx">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container theme-showcase">
        <div class="jumbotron">
            <h1>MySQL Example</h1>
            <p>This is MySQL Example Application which demonstrate connectivity between ASP.NET 4.5 and MySQL on OpenShift 3 Cloud.</p>
        </div>
        <div class="alert alert-danger alert-dismissible fade in" role="alert" id="dvAlertError" style="display: none;" runat="server">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
            <h4 id="dvErrorHeading" runat="server"></h4>
            <p id="dvErrorDetails" runat="server"></p>
        </div>
        <div class="alert alert-success alert-dismissible fade in" role="alert" id="dvAlertSuccess" style="display: none;" runat="server">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
            <strong>Record saved!</strong> New record inserted successfully.
        </div>
    </div>
    <form id="form1" runat="server">
        <div class="container theme-showcase">
            <p style="float: right;">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add Record</button>
            </p>
            <div class="page-header">
                <h1>Records</h1>
            </div>
            <div class="row">
                <div class="col-md-12" id="dvRecord" runat="server">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Model</th>
                                <th>Manufacturer</th>
                                <th>Year</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>370Z</td>
                                <td>Nissan</td>
                                <td>2012</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Mustang</td>
                                <td>Ford</td>
                                <td>2013</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Camaro</td>
                                <td>Chevrolet</td>
                                <td>2012</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Charger</td>
                                <td>Dodge</td>
                                <td>2013</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Add Car Details</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="txtCarModel" class="control-label">Model:</label>
                            <input type="text" class="form-control" id="txtCarModel" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="txtCarManufacturer" class="control-label">Manufacturer:</label>
                            <input type="text" class="form-control" id="txtCarManufacturer" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="ddCarYear" class="control-label">Year:</label>
                            <select name="ddCarYear" id="ddCarYear" class="form-control" runat="server">
                                <option>2005</option>
                                <option>2006</option>
                                <option>2007</option>
                                <option>2008</option>
                                <option>2009</option>
                                <option>2010</option>
                                <option>2011</option>
                                <option>2012</option>
                                <option>2013</option>
                                <option>2014</option>
                                <option>2015</option>
                                <option selected="">2016</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="container theme-showcase">
        <footer>
            <p>© 2016 - Click2Cloud Inc.</p>
        </footer>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
