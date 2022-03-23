public class Block
{
    private readonly DateTime _timeStamp;
    private long _nonce;
    public string PreviousHash { get; set; }
    public List<Transactions> { get; set; }
    
    public string Hash { get; private set; }
    
    public Block(DateTime timeStamp, List<Transactions> transactions, string previousHash = "")
    {
        _timeStamp = timeStamp;
        _nonce = 0;
        Transactions = transactions;
        PreviousHash = previousHash;
        Hash = CreateHash();
    }
