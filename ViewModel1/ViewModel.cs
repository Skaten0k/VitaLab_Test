using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Model;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows;
using System;
using System.Windows.Input;
using System.Windows.Data;
using System.Windows.Threading;
using System.Threading.Channels;
using System.Collections.Specialized;
using System.Windows.Documents;
using System.Windows.Controls;
using System.Timers;
using ViewModel.Commands;

namespace VitaLab_Test.ViewModel
{
    public class AppViewModel : INotifyPropertyChanged
    {
        private AppContext context;
        public Income? selectedIncome;
        public Order? selectedOrder;

        private string sum;
        public string Sum
        {
            get { return this.sum; }
            set
            { if (!string.Equals(this.sum, value))
                { this.sum = value;
                    this.OnPropertyChanged();
                }
            }
        }
        private readonly DispatcherTimer _timer;


        public ObservableCollection<Order> Orders { get; set; }


        public ObservableCollection<Income> Incomes { get; set; }


        private RelayCommand payCommand;
        

        public Income SelectedIncome
        {
            get { return selectedIncome; }
            set
            {
                this.selectedIncome = value;
                OnPropertyChanged("SelectedIncome");
            }
        }

        public Order SelectedOrder
        {
            get { return selectedOrder; }
            set
            {
                this.selectedOrder = value;
                OnPropertyChanged("SelectedOrder");
            }
        }

        public AppViewModel()
        {
            context = new AppContext();
            _timer = new DispatcherTimer { Interval = TimeSpan.FromSeconds(5) };
            LoadData();
            _timer.Start();
            _timer.Tick += (o, e) =>
            StartPolling();

        }

        void StartPolling()
        {
            Dispatcher.CurrentDispatcher.BeginInvoke(() =>
            {

                int? selectedOrderNumber = null;
                int? selectedIncomeNumber = null;
                if (selectedOrder != null) selectedOrderNumber = SelectedOrder.Number;
                if (selectedIncome != null) selectedIncomeNumber = SelectedIncome.Number;

                //Запрос к БД  и обновление UI
                context.ChangeTracker.Clear();
                Orders.Clear();
                Incomes.Clear();
                LoadData();
                Orders = context.Orders.Local.ToObservableCollection();
                Incomes = context.Incomes.Local.ToObservableCollection();
                if (selectedOrderNumber != null) SelectedOrder = Orders.FirstOrDefault(o => o.Number == selectedOrderNumber);
                if (selectedIncomeNumber != null) SelectedIncome = Incomes.FirstOrDefault(i => i.Number == selectedIncomeNumber);
            });
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
        private void LoadData()
        {
            context.Orders.Load();
            context.Incomes.Load();

            this.Orders = context.Orders.Local.ToObservableCollection();

            this.Incomes = context.Incomes.Local.ToObservableCollection();
        }

        public RelayCommand PayCommand
        {
            get
            {
                return payCommand ??
                  (payCommand = new RelayCommand(obj =>
                  {
                      if (decimal.TryParse(sum.Replace('.', ','), out decimal sumPayment))
                      {
                          if (SelectedOrder == null || SelectedIncome == null)
                          {
                              MessageBox.Show("Необходимо Выбрать заказ и поступление");
                          }
                          else
                          {
                              try
                              {
                                  context.Database.ExecuteSqlRaw($"EXEC Pay\n" +
                                      $"@orderNumber = {SelectedOrder.Number}, " +
                                      $"@incomeNumber = {SelectedIncome.Number}, " +
                                      $"@sumPayment = {(sumPayment).ToString(System.Globalization.CultureInfo.InvariantCulture)}, " +
                                      $"@orderPayed = {SelectedOrder.SumPayment.ToString(System.Globalization.CultureInfo.InvariantCulture)}");
                              }
                              catch (DbUpdateException)
                              {
                                  MessageBox.Show("Запись уже существует");
                              }
                              catch (SqlException ex)
                              {
                                  MessageBox.Show($"{ex.Message}");
                              }
                          }
                      }
                      else
                      {
                          MessageBox.Show("Введена некорректная сумма");
                      }
                  }));
            }
        }
    }
}
