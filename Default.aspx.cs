using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace aspnet_mysql_sample
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.BindRecords();
        }

        private void BindRecords()
        {
            try
            {
                //Get records from MySQL DB
                Models.SampleData.RetriveRecords();
            }
            catch (Exception ex)
            {
                dvErrorHeading.InnerText = "Data connection failed!";
                dvErrorDetails.InnerText = ex.Message;
                dvAlertError.Style.Add("display", "");

                return;
            }

            //Display records on ui
            dvRecord.InnerHtml = string.Empty;

            dvRecord.InnerHtml = @"<table class='table'><thead>
                            <tr>
                                <th>#</th>
                                <th>Model</ th >
                                <th>Manufacturer</ th >
                                <th>Year</ th >
                            </tr>
                        </thead><tbody>";

            foreach (var car in aspnet_mysql_sample.Models.SampleData.Cars)
            {
                dvRecord.InnerHtml += "<tr>" +
                                "<td>" + car.CarId.ToString() + "</td>" +
                                "<td>" + car.Model + "</td>" +
                                "<td>" + car.Manufacturer + "</td>" +
                                "<td>" + car.Year.ToString() + "</td>" +
                            "</tr>";
            }

            dvRecord.InnerHtml += "</tbody></table>";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Validate record
            if (string.IsNullOrEmpty(txtCarModel.Value))
            {
                dvErrorHeading.InnerText = "Validation Failed";
                dvErrorDetails.InnerText = "Model name cannot be left blank!";
                dvAlertError.Style.Add("display", "");
                return;
            }

            //Clear error and success messages
            dvErrorHeading.InnerText = dvErrorDetails.InnerText = string.Empty;
            dvAlertError.Style.Add("display", "none");
            dvAlertSuccess.Style.Add("display", "none");

            //Create car model
            Models.Car car = new Models.Car() { Model = txtCarModel.Value.Trim(), Manufacturer = txtCarManufacturer.Value.Trim(), Year = int.Parse(ddCarYear.Value.Trim()) };

            try
            {
                if (Models.SampleData.InsertRecord(car))
                {
                    txtCarModel.Value = txtCarManufacturer.Value = string.Empty;
                    ddCarYear.Value = "2016";

                    dvAlertSuccess.Style.Add("display", "");

                    this.BindRecords();
                }
                else
                {
                    dvErrorHeading.InnerText = "Data Insertion Failed!";
                    dvErrorDetails.InnerText = "Something went wrong while inserting record.";
                    dvAlertError.Style.Add("display", "");
                }
            }
            catch (Exception)
            {
                dvErrorHeading.InnerText = "Data Insertion Failed!";
                dvErrorDetails.InnerText = "Something went wrong while inserting record.";
                dvAlertError.Style.Add("display", "");
            }
        }
    }
}