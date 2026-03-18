VAR
    Data00 : INT := 0;
    Ary00 : ARRAY[0..4] OF INT := [1, 2, 3, 4, 5]; // 必要なら初期値を変更
    i : INT;
END_VAR

FOR i := 0 TO 4 DO
    Data00 := Data00 + Ary00[i];
END_FOR

RETURN Data00;
