const fi='';
      fo='';
var f,g:text;
    n,m:longint;
    c:array[1..100,1..100] of int64;
    x:array[1..10000] of longint;
procedure Doc;
var i,j:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        for i:=1 to m do read(f,x[i]);
        for i:=1 to n do
        for j:=1 to n do read(f,c[i,j]);
        close(f);
end;
procedure Floyd;
var i,j,k:longint;
    kq:int64;
begin
        for i:=1 to n do
        for j:=1 to n do
        for k:=1 to n do
        begin
                if c[i,j]>c[i,k]+c[k,j] then
                begin
                        c[i,j]:=c[i,k]+c[k,j];
                end;
        end;
        kq:=0;
        if x[1]<>1 then kq:=kq+c[1,x[1]];
        for i:=2 to m do kq:=kq+c[x[i-1],x[i]];
        if x[m]<>n then kq:=kq+c[x[m],n];
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        Floyd;
end.