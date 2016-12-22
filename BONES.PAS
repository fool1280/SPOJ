var s1,s2,s3,x,y,z,kq,max:integer;
    mark:array[3..80] of longint;
begin
        fillchar(mark,sizeof(mark),0);
        readln(s1,s2,s3);
        kq:=0;
        max:=0;
        for x:=1 to s1 do
        begin
                for y:=1 to s2 do
                begin
                        for z:=1 to s3 do inc(mark[x+y+z]);
                end;
        end;
        for x:=3 to (s1+s2+s3) do
        begin
                if mark[x]>max then
                begin
                        max:=mark[x];
                        kq:=x;
                end;
        end;
        writeln(kq);
end.
