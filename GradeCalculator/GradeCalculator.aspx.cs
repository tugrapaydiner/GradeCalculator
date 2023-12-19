using System;
using System.Web.UI;

namespace GradeCalculator
{
    public partial class GradeCalculator : Page
    {
        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            double totalContribution = 0;

            foreach (string key in Request.Form.AllKeys)
            {
                if (key.StartsWith("score"))
                {
                    int index = int.Parse(key.Substring(5));
                    double score = double.Parse(Request.Form["score" + index]);
                    double weight = double.Parse(Request.Form["weight" + index]); // Weight as a percentage

                    double contribution = score * (weight / 100.0); // Calculate contribution to final grade
                    totalContribution += contribution;
                }
            }

            lblResult.Text = "Your final weighted grade is: " + totalContribution.ToString("0.##");
        }
    }
}
