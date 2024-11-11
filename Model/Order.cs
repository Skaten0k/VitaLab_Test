using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Order : INotifyPropertyChanged
    {
        public Order(int number, DateOnly date, decimal sum)
        {
            Number = number;
            Date = date;
            Sum = sum;
            SumPayment = 0;
        }

        private decimal sum;
        private DateOnly date;
        private decimal sumPayment;

        public int Number {  get; set; }
        public DateOnly Date { get { return date; } set { date = value; OnPropertyChanged("Date"); } }
        public decimal Sum { get { return sum; } set {sum = value; OnPropertyChanged("Sum");} }
        public decimal SumPayment { get { return sumPayment; } set { sumPayment = value; OnPropertyChanged("SumPayment"); } }

        public event PropertyChangedEventHandler? PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
    }
