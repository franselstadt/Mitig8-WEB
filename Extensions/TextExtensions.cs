using System;

namespace Mitig8.Extensions
{
    public static class TextExtensions
    {
        public static string OrEmpty(this string value)
        {
            if (value == null)
            {
                return string.Empty;
            }

            return value;
        }

        public static int OrZero(this int? value)
        {
            if (value.HasValue)
            {
                return value.Value;
            }

            return 0;
        }

        public static decimal OrZero(this decimal? value)
        {
            if (value.HasValue)
            {
                return value.Value;
            }

            return 0m;
        }
    }
}
