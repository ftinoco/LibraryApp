using System;

namespace LibraryApp.Common
{
    public class LoanFilter : DataFilter
    {
        public int? ReaderId { get; set; }

        public int? BookId { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public DateTime? ReturnDate { get; set; }

        public bool? Returned { get; set; }
    }
}
