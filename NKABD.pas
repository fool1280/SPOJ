const fi='';
      fo='';
var f,g:text;
    a:array[1..100000] of longint;
    l,r:longint;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        read(f,l,r);
        close(f);
end;
procedure XuLi;
var i,j,kq:longint;
begin
        for i:=1 to r do a[i]:=1;
        for i:=2 to r do
        begin
                for j:=2 to (r div i) do a[i*j]:=a[i*j]+j;
        end;
        kq:=0;
        for i:=l to r do if a[i]>i then inc(kq);
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.