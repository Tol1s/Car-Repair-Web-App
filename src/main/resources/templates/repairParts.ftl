<#import "/spring.ftl" as spring/>
<html>

<head>
    <title>Repair Parts</title>
    <meta charset="utf-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/../utilities.js"></script>
    <link rel="stylesheet" href="/../styles.css">
    <!---- Trying to make some cool stuff with p5.js
    <script async src=https://CDN.JSDelivr.net/g/p5.js(p5.min.js+addons/p5.dom.js+addons/p5.sound.js)></script>
    <script defer src=/../sketch.js></script>
    <script defer src=/../particle.js></script> ------>

    <style>
        fieldset.Hor {
            float: left;
            width: 33.3%;
            padding: 20;
        }
        fieldset.Norm {
            padding: 20;
        }
    </style>

</head>

<body>
    <#include "navbar.ftl">
    <div class="p5container">
        <img src="/../Images/eXtremeRed.png">
    </div>
    <h1 class="errorRed">${errorMessage!""}</h1>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 align="center">Add Repair Parts</h1>
                    <form  class="form-horizontal" action="/admin/repairParts/add" method="POST" id="repairPartsForm" name="repairPartsForm">

                             <fieldset class="Hor">

                             <div class="form-group">
                             <label for="partID">Part ID</label>
                             <@spring.bind "repairPartsForm.partID"/>
                             <input class="form-control" type="number" name="partID" id="partID" placeholder="1" value="${repairPartsForm.partID!""}"/>
                             <#list spring.status.errorMessages as error>
                                <span class="errorRed">${error}</span>
                             </#list>
                             </div>
                             </fieldset>

                             <fieldset class="Hor">

                             <div class="form-group">
                             <label for="quantity">Quantity</label>
                             <@spring.bind "repairPartsForm.quantity"/>
                             <input class="form-control" type="number" name="quantity" id="quantity" placeholder="1" value="${repairPartsForm.quantity!""}"/>
                             <#list spring.status.errorMessages as error>
                                <span class="errorRed">${error}</span>
                             </#list>
                             </div>
                             </fieldset>

                        <div class="col-sm-12 controls">
                        <span>
                            <button type="submit" id="btn-submit" class="btn btn-success btn-md">Add</button>
                            <button type="reset" id="btn-clear" class="btn btn-danger btn-md">Clear</button>
                        </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <#if repairPartList??>
        <h3 class="text-center"><u>Retrieved Parts of this Repair</u></h3>
        <div class="table-responsive">
            <table class="table" class="table-hover">
                <thead>
                    <tr>
                        <th class="text-center">Part ID</th>
                        <th class="text-center">Part Price</th>
                        <th class="text-center">Quantity</th>
                        <th class="text-center">Delete Part</th>
                    </tr>
                </thead>
                <tbody>
                <#list repairPartList as repairPart>
                <span>
                <tr>
                    <td class="text-center">${repairPart.partID}</td>
                    <td class="text-center">${repairPart.partPrice}</td>
                    <td class="text-center">${repairPart.quantity}</td
                    <td> delete </td>
                </tr>
                </span>
                </#list>
            </tbody>
        </table>
    </div>
<#else>
<h2>No parts added to this repair yet!</h2>
</#if>

<hr></hr>


        <label for="filterInput">Filter</label>
        <input type="text" class="form-control" name="filterInput" id="filterInput" placeholder="turbocharger..."/>
    <#if wholePartList??>
        <div class="table-responsive">
            <table id="resultsTable" class="table" class="table-hover">
                <thead>
                    <tr>
                        <th class="text-center">Part ID</th>
                        <th class="text-center">Part Name</th>
                        <th class="text-center">Part Price</th>
                    </tr>
                </thead>
                <tbody>
                    <#list wholePartList as part>
                <span>
                <tr>
                    <td class="text-center">${part.partID}</td>
                    <td class="text-center">${part.partName}</td>
                    <td class="text-center">${part.partPrice}</td>
                </tr>
                </span>
                    </#list>
            </tbody>
        </table>
    </div>
    <#else>
    <h2>There are no parts at all!</h2>
    </#if>
    <#include "footer.ftl">
</body>
</html>
