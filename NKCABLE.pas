uses math;
const fi='';
      fo='';
var g:text;
    n:longint;
    a,f:array[1..25000] of longint;
procedure Doc;
var i:longint;
begin
        assign(g,fi);
        reset(g);
        read(g,n);
        for i:=1 to n-1 do read(g,a[i]);
        close(g);
end;
procedure XuLi;
var i:longint;
begin
        f[1]:=0;
        f[2]:=a[1];
        f[3]:=a[1]+a[2];
        for i:=4 to n do
        begin
                f[i]:=min(f[i-1],f[i-2])+a[i-1];
        end;
        assign(g,fo);
        rewrite(g);
        write(g,f[n]);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
