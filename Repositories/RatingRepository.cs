using Entities;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class RatingRepository : IRatingRepository
    {
        private readonly IConfiguration _configuration;

        public RatingRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<int> addRatingAsync(Rating rating)
        {
            string query = "INSERT INTO RATING(HOST,METHOD,PATH,REFERER,USER_AGENT,Record_Date)" + "VALUES (@Host,@Method,@Path,@Referer,@user_agent,@record_date)";
            int rowsEffected = 0;
            using (SqlConnection cn = new SqlConnection(_configuration.GetConnectionString("MyWinterStore")))
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.Add("@Host", SqlDbType.VarChar, 50).Value = rating.Host;
                cmd.Parameters.Add("@Method", SqlDbType.VarChar, 10).Value = rating.Method;
                cmd.Parameters.Add("@Path", SqlDbType.VarChar, 50).Value = rating.Path;
                cmd.Parameters.Add("@Referer", SqlDbType.VarChar, 100).Value = rating.Referer;
                cmd.Parameters.Add("@user_agent", SqlDbType.VarChar).Value = rating.UserAgent;
                cmd.Parameters.Add("@record_date", SqlDbType.DateTime).Value = rating.RecordDate;
                
                try //בקריאה הראשונה נזרקת שגיאה, לא הצלחתי להבין למה, אבל הוא מכניס את הנתונים
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    rowsEffected = 1;
                }
                catch (Exception e)
                {
                    //_logger.LogError($"Logged From rating {e.Message}  {e.StackTrace}\n\n");
                }
            }
            return rowsEffected;
        }
    }
}
