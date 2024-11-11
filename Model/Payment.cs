using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Payment
    {
        public decimal SumPayment { get; set; }
        public int OrderNumber { get; set; }
        public int IncomeNumber { get; set; }

        public Payment(int orderNumber, int incomeNumber, decimal sumPayment) 
        {
            OrderNumber = orderNumber;
            IncomeNumber = incomeNumber;
            SumPayment = sumPayment;
        }
    }
}
