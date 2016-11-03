Imports System.Net
Imports System.Net.Http
Imports System.Web.Http
Imports Newtonsoft.Json
Imports System.Data.SqlClient
Imports System.Globalization
Imports JenkinsTestApp.TheatreServices.Models.TheatreServices

Namespace Controllers
    Public Class ExpensesController
        Inherits ApiController

        <Route("api/v1/jobs/report/{jobID}")>
        Public Function GetReport(<FromUri> value As GetJobID) As Object



            Dim List



            List = New With {
                .data = Nothing,
                .message = "Testing"
            }



            Return List
        End Function
    End Class
End Namespace