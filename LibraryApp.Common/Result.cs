namespace LibraryApp.Common
{
    public class Result<T> : BaseResult where T : class
    {
        public Result() : base()
        {

        }

        public T Data { get; set; }
    }
}
