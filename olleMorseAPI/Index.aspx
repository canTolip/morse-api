<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="olleMorseAPI.Index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>olleMorseAPI | Test</title>

    <script src="MorseAPI/MorseConverter.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
 
</head>
<body class="hold-transition layout-fixed" style="background-color: #f4f6f9;">
    <div class="wrapper" style="margin-left: -250px; padding: 90px 90px 90px 90px;">

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0"></h1>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">

                    <div class="callout callout-info">
                        <h5><i class="fas fa-info"></i>Server Infos:</h5>
                        Architecture: <span id="server_arch"></span>
                        <br />
                        Hostname: <span id="server_hostname"></span>
                        <br />
                        Platform: <span id="server_platform"></span>
                        <br />
                        Type: <span id="server_type"></span>
                        <br />
                        Uptime: <span id="server_uptime"></span>
                        <br />
                         Memory (total/free): <span id="server_mem"></span>
                        <br />
                    </div>

                    <div class="row">
                        <div class="col-md-4" style="flex: 0 0 49.5%; max-width: 49.5%;">
                            <div class="card card-widget widget-user-2">
                                <div class="widget-user-header bg-success">
                                    <center>
                                    <h3 class="widget-user">CPU 0 Info</h3>
                                    <h5 id="cpu0_model" class="widget-user">sad</h5>
                                        </center>
                                </div>
                                <div class="card-footer p-0">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link">user <span id="cpu0_user" class="float-right badge bg-info"></span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link">nice <span id="cpu0_nice" class="float-right badge bg-info"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link">sys <span id="cpu0_sys" class="float-right badge bg-info"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link">idle <span id="cpu0_idle" class="float-right badge bg-info"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link">irq <span id="cpu0_irq" class="float-right badge bg-info"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="flex: 0 0 49.5%; max-width: 49.5%;">
                            <div class="card card-widget widget-user-2">
                                <div class="widget-user-header bg-success">
                                    <!-- /.widget-user-image -->
                                    <center>
                                    <h3 class="widget-user">CPU 1 Info</h3>
                                    <h5 id="cpu1_model" class="widget-user">sad</h5>
                                        </center>
                                </div>
                                <div class="card-footer p-0">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link">user <span id="cpu1_user" class="float-right badge bg-info"></span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link">nice <span id="cpu1_nice" class="float-right badge bg-info"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link">sys <span id="cpu1_sys" class="float-right badge bg-info"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link">idle <span id="cpu1_idle" class="float-right badge bg-info"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link">irq <span id="cpu1_irq" class="float-right badge bg-info"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
    </div>
    <script type="text/javascript">
        function executeRequest(){
            var cpuInf = <%Response.Write(olleMorseAPI.MorseAPI.MainAPI.GetFromWebAPI("CPU"));%>;
            var archInf = <%Response.Write(olleMorseAPI.MorseAPI.MainAPI.GetFromWebAPI("ARCH"));%>;
            var hostInf = <%Response.Write(olleMorseAPI.MorseAPI.MainAPI.GetFromWebAPI("HOSTNAME"));%>;
            var platformInf = <%Response.Write(olleMorseAPI.MorseAPI.MainAPI.GetFromWebAPI("PLATFORM"));%>;
            var typeInf = <%Response.Write(olleMorseAPI.MorseAPI.MainAPI.GetFromWebAPI("TYPE"));%>;
            var upTimeInf = <%Response.Write(olleMorseAPI.MorseAPI.MainAPI.GetFromWebAPI("uptime"));%>;
            var totalMemInf = <%Response.Write(olleMorseAPI.MorseAPI.MainAPI.GetFromWebAPI("TOTALMEM"));%>;
            var freeMemInf = <%Response.Write(olleMorseAPI.MorseAPI.MainAPI.GetFromWebAPI("FREEMEM"));%>;
        
            document.getElementById('cpu0_model').innerHTML = decodeMorse(cpuInf.data[0].model) + " ("+decodeMorse(cpuInf.data[0].speed)+")";
            document.getElementById('cpu0_user').innerHTML = decodeMorse(cpuInf.data[0].times.user);
            document.getElementById('cpu0_nice').innerHTML = decodeMorse(cpuInf.data[0].times.nice);
            document.getElementById('cpu0_sys').innerHTML = decodeMorse(cpuInf.data[0].times.sys);
            document.getElementById('cpu0_idle').innerHTML = decodeMorse(cpuInf.data[0].times.idle);
            document.getElementById('cpu0_irq').innerHTML = decodeMorse(cpuInf.data[0].times.irq);


            document.getElementById('cpu1_model').innerHTML = decodeMorse(cpuInf.data[1].model) + " ("+decodeMorse(cpuInf.data[1].speed)+")";
            document.getElementById('cpu1_user').innerHTML = decodeMorse(cpuInf.data[1].times.user);
            document.getElementById('cpu1_nice').innerHTML = decodeMorse(cpuInf.data[1].times.nice);
            document.getElementById('cpu1_sys').innerHTML = decodeMorse(cpuInf.data[1].times.sys);
            document.getElementById('cpu1_idle').innerHTML = decodeMorse(cpuInf.data[1].times.idle);
            document.getElementById('cpu1_irq').innerHTML = decodeMorse(cpuInf.data[1].times.irq);


            document.getElementById('server_arch').innerHTML = decodeMorse(archInf.data);
            document.getElementById('server_hostname').innerHTML = decodeMorse(hostInf.data);
            document.getElementById('server_platform').innerHTML = decodeMorse(platformInf.data);
            document.getElementById('server_type').innerHTML = decodeMorse(typeInf.data);
            document.getElementById('server_uptime').innerHTML = decodeMorse(upTimeInf.data);
            document.getElementById('server_mem').innerHTML = decodeMorse(totalMemInf.data) + "/"+decodeMorse(freeMemInf.data);
        }

        $(document).ready(function () {
            executeRequest();
        });
    </script>
    <!-- ./wrapper -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

