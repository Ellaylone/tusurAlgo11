Program DayOfYearToGrigorian;
VAR
	//входящие данные
	d : 1..366;
	m : 1..12;
	y : LongInt;

	//вспомогательные переменные
        julianA : LongInt;
        julianY : LongInt;
        julianM : LongInt;
	monthRange : array[0..12] of integer = (0,31,28,31,30,31,30,31,31,30,31,30,31);
	i : 1..12;
	grigA : LongInt;
	grigB : LongInt;
	grigC : LongInt;
	grigD : LongInt;
	grigE : LongInt;
	grigM : LongInt;

	//переменные для хранения результатов вычислений
	JDN : LongInt;
	year : LongInt;
	month : 1..12;
	day : 1..31;
  
begin
	//Получение данных от пользователя
        writeln('Enter n');
        readln(d);
	writeln('Enter y');
	readln(y);
	//определение месяца
	for i := 1 to 12 do
		begin
			if d <= monthRange[i]
				then 
					begin 
						m := i;
						break;
					end
				else 
					begin
						d := d - monthRange[i];
					end;
		end;
	//рассчет JDN
        julianA := (14 - m) div 12;
        julianY := y + 4800 - julianA;
        julianM := m + (12 * julianA) - 3;
        JDN := d + ((153 * julianM + 2) div 5) + (365 * julianY) + (julianY div 4) - 32083;
    
        //рассчет даты по григорианскому календарю
	grigA := JDN + 32044;
	grigB := ((4*grigA) + 3) div 146097;
	grigC := grigA - ((146097 * grigB) div 4);
	grigD := ((4 * grigC) + 3) div 1461;
	grigE := grigC - ((1461 * grigD) div 4);
	grigM := ((5 * grigE) + 2) div 153;

	day := grigE - (((153 * grigM) + 2) div 5) + 1;
	month := grigM + 3 - (12 * (grigM div 10));
	year := (100 * grigB) + grigD - 4800 + (grigM div 10);

	//вывод
	writeln('JDN: ', JDN);
	writeln('Final grigorian date: ', day, '.', month, '.', year);
	readln();
end.
