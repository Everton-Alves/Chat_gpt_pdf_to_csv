using System;
using System.Collections.Generic;
using System.Globalization;

interface ITrade
{
    double Value { get; }
    string ClientSector { get; }
    DateTime NextPaymentDate { get; }
}

class Trade : ITrade
{
    public double Value { get; private set; }
    public string ClientSector { get; private set; }
    public DateTime NextPaymentDate { get; private set; }

    public Trade(double value, string clientSector, DateTime nextPaymentDate)
    {
        Value = value;
        ClientSector = clientSector;
        NextPaymentDate = nextPaymentDate;
    }
}

class TradeClassifier
{
    private readonly DateTime _referenceDate;

    public TradeClassifier(DateTime referenceDate)
    {
        _referenceDate = referenceDate;
    }

    public string ClassifyTrade(ITrade trade)
    {
        if (trade.NextPaymentDate < _referenceDate.AddDays(-30))
            return "EXPIRED";
        
        if (trade.Value > 1000000)
        {
            if (trade.ClientSector == "Private")
                return "MEDIUMRISK";
            if (trade.ClientSector == "Public")
                return "LOWRISK";
        }

        return "LOWRISK";
    }
}

class Program
{
    static void Main()
    {
        CultureInfo provider = CultureInfo.InvariantCulture;
        DateTime referenceDate = DateTime.ParseExact(Console.ReadLine(), "MM/dd/yyyy", provider);
        int n = int.Parse(Console.ReadLine());

        List<ITrade> trades = new List<ITrade>();
        for (int i = 0; i < n; i++)
        {
            string[] input = Console.ReadLine().Split(' ');
            double value = double.Parse(input[0]);
            string sector = input[1];
            DateTime nextPaymentDate = DateTime.ParseExact(input[2], "MM/dd/yyyy", provider);

            trades.Add(new Trade(value, sector, nextPaymentDate));
        }

        TradeClassifier classifier = new TradeClassifier(referenceDate);

        foreach (var trade in trades)
        {
            Console.WriteLine(classifier.ClassifyTrade(trade));
        }
    }
}
