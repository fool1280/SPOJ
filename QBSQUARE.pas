uses math;
const fi='';
      fo='';
var g:text;
    a,f:array[1..1000,1..1000] of longint;
    m,n,c,kq,max:longint;
procedure Doc;
var i,j:longint;
begin
        assign(g,fi);
        reset(g);
        read(g,m,n);
        for i:=1 to m do
        begin
                for j:=1 to n do read(g,a[i,j]);
        end;
        close(g);
end;
procedure XuLi;
var i,j,max:longint;
begin
        for i:=1 to m do f[i,1]:=1;
        for i:=1 to n do f[1,i]:=1;
        max:=0;
        for i:=2 to m do
        begin
                for j:=2 to n do
                begin
                        if (a[i-1,j-1]=a[i-1,j]) and (a[i-1,j]=a[i,j-1]) and (a[i,j]=a[i-1,j]) then
                        begin
                                f[i,j]:=min(f[i-1,j-1],min(f[i-1,j],f[i,j-1]))+1;
                        end else f[i,j]:=1;
                        if f[i,j]>max then max:=f[i,j];
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,max);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
