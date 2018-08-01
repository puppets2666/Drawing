Console.SetWindowSize(width: 80, height: 50);

for (double imageCoord = 1.2; imageCoord >= -1.2; imageCoord -= 0.05)
{
    for (double realCoord = -0.6; realCoord <= 1.77; realCoord += 0.03)
    {
        int iterations = 0;
        double realTemp = realCoord;
        double imageTemp = imageCoord;
        double arg = (realCoord * realCoord) + (imageCoord * imageCoord);

        while (arg < 4 && iterations < 40)
        {
            double realTemp2 = (realTemp * realTemp) - (imageTemp * imageTemp) - realCoord;
            imageTemp = (2 * realTemp * imageTemp) - imageCoord;
            realTemp = realTemp2;
            arg = (realTemp * realTemp) + (imageTemp * imageTemp);
            ++ iterations;
        }
        switch (iterations % 4)
        {
            case 0: Console.Write(".");break;
            case 1: Console.Write("o"); break;
            case 2: Console.Write("O"); break;
            case 3: Console.Write("@"); break;
        }
    }
    Console.WriteLine();
}
Console.ReadLine();
