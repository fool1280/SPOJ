const fi='';
      fo='';
var f,g:text;
    n,k,s:longint;
    a:array[1..1000] of longint;
    kq:array[0..1000,0..50] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,k);
        s:=0;
        for i:=1 to n do
        begin
                read(f,a[i]);
                a[i]:=a[i] mod k;
                s:=s+a[i];
        end;
        close(f);
end;
procedure XuLi;
var i,j,temp:integer;
begin
        kq[0,0]:=0;
        for i:=1 to k-1 do kq[0,i]:=n+1;
        for i:=1 to n do
        begin
                for j:=0 to k-1 do
                begin
                        if kq[i-1,j]<kq[i-1,(k+j-a[i]) mod k]+1 then kq[i,j]:=kq[i-1,j]
                        else
                        kq[i,j]:=kq[i-1,(k+j-a[i]) mod k]+1;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,n-kq[n,s mod k]);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
