const fi='';
      fo='';
var f,g:text;
    nn,mm,p,m,n:qword;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        read(f,m);
        close(f);
end;
procedure XuLi;
begin
        p:=n*m;
        nn:=n+1;
        mm:=m-1;
        while p>n do p:=p+(p-nn) div mm - n;
end;
begin
        Doc;
        XuLi;
        assign(g,fo);
        rewrite(g);
        write(g,p);
        close(g);
end.
