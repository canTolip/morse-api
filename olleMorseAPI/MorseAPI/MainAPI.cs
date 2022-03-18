using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace olleMorseAPI.MorseAPI
{
    public class MainAPI
    {
        public static string GetFromWebAPI(string requestedData)
        {
            string rtStr = "", reqURL = "http://ik.olleco.net/morse-api/";

            var httpRequest = (HttpWebRequest)WebRequest.Create(reqURL);

            httpRequest.Method = "POST";
            httpRequest.ContentType = "application/x-www-form-urlencoded";

            string commData = string.Format("command={0}", MorseConverter.EncodeMorse(requestedData));

            using (var streamWriter = new StreamWriter(httpRequest.GetRequestStream()))
                streamWriter.Write(commData);

            var httpResponse = (HttpWebResponse)httpRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                rtStr = streamReader.ReadToEnd();

            //Console.WriteLine(httpResponse.StatusCode);

            return rtStr;
        }
    }
}