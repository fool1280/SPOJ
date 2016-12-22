const fi='';
      fo='';
      c=20122007;
var f,g:text;
    tich,a:int64;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        read(f,a);
        close(f);
end;
function LuyThua(m:int64):qword;
var temp:qword;
begin
        if (m=1) then LuyThua:=3
        else
        begin
                temp:=LuyThua(m div 2);
                if m mod 2=1 then exit(((temp mod c)*(temp mod c)*3) mod c)
                else exit(((temp mod c)*(temp mod c)) mod c);
        end;
end;
procedure XuLi;
var i:longint;
begin
        tich:=1;
        for i:=1 to trunc(sqrt(a)) do
        begin
                if a mod i = 0 then
                begin
                        if a div i<>i then
                        begin
                                tich:=(tich*((LuyThua(i) mod c - 1) mod c)) mod c;
                                tich:=(tich*((LuyThua(a div i) mod c - 1) mod c)) mod c;
                        end else tich:=(tich*((LuyThua(i) mod c - 1) mod c)) mod c;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,tich);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
