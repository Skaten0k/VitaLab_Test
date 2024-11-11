using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Model
{
    public class Income : INotifyPropertyChanged
    {

        private decimal sum;
        private decimal remains;
        private DateOnly date;

        public int Number {  get; set; }
        public DateOnly Date { get { return date; } set { date = value; OnPropertyChanged("Date"); } }
        public decimal Sum { get { return sum; } set { sum = value; OnPropertyChanged("Sum"); } }
        public decimal Remains { get { return remains; } set { remains = value; OnPropertyChanged("SumPayment"); } }

        public Income(int number, DateOnly date, decimal sum)
        {
            Number = number;
            Date = date;
            Sum = sum;
            Remains = sum;
        }

        public event PropertyChangedEventHandler? PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
            }
        }
    }
}
