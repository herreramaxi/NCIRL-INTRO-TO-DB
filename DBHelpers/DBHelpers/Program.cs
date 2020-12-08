using System.Collections.Generic;
using System.Text;

namespace DBHelpers
{
    class Program
    {
        static void Main(string[] args)
        {
            var moves = new List<string>();
            var pgn = @"1.e4 c5 2.Nf3 e6 3.d4 cxd4 4.Nxd4 a6 5.Nc3 Nc6 6.Be3 Nf6 7.Bd3 d5 8.exd5 exd5 9.0-0 Bd6 10.Nxc6 bxc6 11.Bd4 0-0 12.Qf3 Be6 13.Rfe1 c5 14.Bxf6 Qxf6 15.Qxf6 gxf6 16.Rad1 Rfd8 17.Be2 Rab8 18.b3 c4 19.Nxd5 Bxd5 20.Rxd5 Bxh2+ 21.Kxh2 Rxd5 22.Bxc4 Rd2 23.Bxa6 Rxc2 24.Re2 Rxe2 25.Bxe2 Rd8 26.a4 Rd2 27.Bc4 Ra2 28.Kg3 Kf8 29.Kf3 Ke7 30.g4 f5 31.gxf5 f6 32.Bg8 h6 33.Kg3 Kd6 34.Kf3 Ra1 35.Kg2 Ke5 36.Be6 Kf4 37.Bd7 Rb1 38.Be6 Rb2 39.Bc4 Ra2 40.Be6 h5 41.Bd7";

            int current = 0;
            int ending = EndingIndex(pgn, current);
            int i = 1;
            while (ending > 0 && ending - current > 0)
            {
                i++;
                var currentMove = pgn.Substring(current, ending - current);
                currentMove = RemoveMoveNumberAndTrim(currentMove);

                moves.Add(currentMove);

                current = ending;
                ending = EndingIndex(pgn, current);
            }

            var id = 0;
            var matchGameId = 1;
            StringBuilder sb = new StringBuilder();

            foreach (var move in moves)
            {
                id++;
                var whiteAndBlackMove = move.Split(' ');

                if (whiteAndBlackMove.Length == 0 || whiteAndBlackMove.Length > 2) continue;

                var whiteMove = whiteAndBlackMove[0];
                var blackMove = whiteAndBlackMove.Length == 2 ? "'"+  whiteAndBlackMove[1] + "'": "null";

                var insert = $@"INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES ({id}, {matchGameId}, {id}, '{whiteMove}', {blackMove}, null, null);";
                sb.AppendLine(insert);

            }

            var script = sb.ToString();
        }

        private static string RemoveMoveNumberAndTrim(string currentMove)
        {
            //1.e4 c5
            currentMove = currentMove.Trim();
            var dotIndex = currentMove.IndexOf(".");
            if (dotIndex <= 0 || dotIndex + 1 >= currentMove.Length) return currentMove;

            return currentMove.Substring(dotIndex +1);
        }

        private static int EndingIndex(string pgn, int current)
        {
            var substring = pgn.Substring(current);
            int j = 0;
            int i = 0;
            int ending = -1;

            for (; i < substring.Length && j < 2; i++)
            {
                if (substring[i] == '.') j++;
            }

            if (j == 2)
            {
                for (; i > 0 && ending < 0; i--)
                {
                    if (char.IsWhiteSpace(substring[i])) ending = i;
                }
            }

            return j == 2 ? ending + current: pgn.Length;
        }        
    }
}
