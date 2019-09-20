using System;
using System.Net;

namespace LibraryApp.Common
{
    public class BaseResult
    {
        public BaseResult()
        {
            Message = "Success";
            ExceptionDetail = null;
            StatusCode = HttpStatusCode.OK;
        }

        public string Message { get; set; }

        public Exception ExceptionDetail { get; set; }

        public HttpStatusCode StatusCode { get; set; }

    }
}
