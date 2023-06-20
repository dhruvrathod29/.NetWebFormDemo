using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LOC_CountryENT
/// </summary>
/// 
namespace WebDevloper.ENT
{
    public class LOC_CountryENT
    {

        #region LOC_CountryENT Constructor
        public LOC_CountryENT()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

        #region CountryID
        protected SqlInt32 _CountryID;
        public SqlInt32 CountryID
        {
            get
            {
                return _CountryID;
            }
            set
            {
                _CountryID = value;
            }

        }
        #endregion

        #region CountryName

        protected SqlString _CountryName;

        public SqlString CountryName
        {
            get
            {
                return _CountryName;

            }
            set { _CountryName = value; }

        }


        #endregion

        #region CountryCode

        protected SqlString _CountryCode;

        public SqlString CountryCode
        {
            get
            {
                return _CountryCode;
            }
            set 
            {
                 _CountryCode = value;
            }
        }


        #endregion

        #region CreationDate
        protected SqlDateTime _CreationDate;
        public SqlDateTime CreationDate
        {
            get
            {
                return _CreationDate;
            }
            set
            {
                _CreationDate = value;
            }
        }

        #endregion

        #region ModificationDate
        protected SqlDateTime _ModificationDate;
        public SqlDateTime ModificationDate
        {
            get
            {
                return _ModificationDate;
            }
            set { _ModificationDate = value; }
        }
        #endregion
    }
}
