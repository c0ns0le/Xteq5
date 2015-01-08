﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xteq5;
using Yamua;

namespace Xteq5OutputGenerator_Consumer
{
    class Xteq5OutputGeneratorConsumerProgram
    {
        static void Main(string[] args)
        {
            Xteq5Runner runner = new Xteq5Runner();

            string basepath = "";

            //basepath = @"C:\dev\git\xteq5\src\ScriptsForTesting\Test1";
            basepath = @"C:\dev\git\xteq5\src\ScriptsForTesting\Test5";
            //basepath = @"C:\dev\git\xteq5\scripts";


            Task<Report> task = RunEngineAsync(runner, basepath);

            bool finished = false;
            while (finished == false)
            {
                Console.WriteLine("Waiting for runner to finish...");
                finished = task.Wait(333);
            }

            Report report = task.Result;

            //Set a text on this report
            report.UserText = "Generated by debug consumer";

            string templateFile = basepath + @"\BootstrapTemplate1.html";

            BootstrapHTMLGenerator generator = new BootstrapHTMLGenerator(templateFile);
            //string html = generator.Generate(report);
            string tempFile = generator.GenerateAndSaveFile(report);

            Process.Start(tempFile);
            

            //Console.WriteLine("Press return to exit...");
            //Console.ReadLine();
        }


        //This function allows use to use await - see http://blogs.msdn.com/b/pfxteam/archive/2012/04/12/10293335.aspx
        private static async Task<Report> RunEngineAsync(Xteq5Runner Runner, string BasePath)
        {
            Report result;
            result = await Runner.RunAsync(BasePath);
            Console.WriteLine("Async finished!");
            return result;
        }
    }
}