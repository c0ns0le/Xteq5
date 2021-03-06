﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Xteq5
{
    /// <summary>
    /// Represents a Test, generated by a script 
    /// </summary>
    public class TestRecord : BaseRecord
    {
        internal TestRecord(BaseRecord baseRecord)
            : base(baseRecord)
        {
        }


        public int ConclusionInt
        {
            get
            {
                return (int)Conclusion;
            }
        }


        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("TestRecord; ").Append(base.ToString());
            return sb.ToString();
        }
    }
}
