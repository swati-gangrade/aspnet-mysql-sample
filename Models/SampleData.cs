using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using MySql.Data.MySqlClient;

namespace aspnet_mysql_sample.Models
{
    public class SampleData
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public static void RetriveRecords()
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand command = connection.CreateCommand();
                command.CommandText = "SELECT * FROM default.Car;";

                if (connection.State != System.Data.ConnectionState.Open)
                    connection.Open();

                MySqlDataReader reader = command.ExecuteReader();

                Cars = new List<Car>();
                while (reader.Read())
                {
                    Cars.Add(new Car()
                    {
                        CarId = int.Parse(reader["CarId"].ToString()),
                        Model = reader["Model"].ToString(),
                        Manufacturer = reader["Manufacturer"].ToString(),
                        Year = int.Parse(reader["Year"].ToString())
                    });
                }
                reader.Close();

                if (connection.State == System.Data.ConnectionState.Open)
                    connection.Close();
            }
        }

        public static bool InsertRecord(Car car)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand command = connection.CreateCommand();
                command.CommandText = "INSERT INTO default.Car (Model, Year, Manufacturer) VALUES (?Model, ?Year, ?Manufacturer);";

                command.Parameters.AddWithValue("?Model", car.Model);
                command.Parameters.AddWithValue("?Year", car.Year);
                command.Parameters.AddWithValue("?Manufacturer", car.Manufacturer);

                if (connection.State != System.Data.ConnectionState.Open)
                    connection.Open();

                if(command.ExecuteNonQuery() == 1) { return true; }

                return false;
            }
        }

        public static List<Car> Cars { get; set; }
    }
}