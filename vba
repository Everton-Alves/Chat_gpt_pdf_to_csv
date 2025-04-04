interface ITrade
{
    double Value { get; }
    string ClientSector { get; }
    DateTime NextPaymentDate { get; }
    bool IsPoliticallyExposed { get; }  // Novo atributo
}

class TradeCategorizer
{
    public static string CategorizeTrade(ITrade trade, DateTime referenceDate)
    {
        if (trade.IsPoliticallyExposed) 
            return "PEP"; // Prioridade máxima

        if (trade.NextPaymentDate < referenceDate.AddDays(-30))
            return "EXPIRED";

        if (trade.Value > 1000000)
        {
            return trade.ClientSector == "Private" ? "MEDIUMRISK" : "LOWRISK";
        }

        return "UNCLASSIFIED"; // Caso nenhuma regra se aplique
    }
}
