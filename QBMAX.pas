uses math;
const fi='';
      fo='';
var g:text;
    a,f:array[0..101,0..101] of longint;
    m,n,maxx:longint;
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
var i,j:longint;
begin
        for j:=0 to n+1 do
        begin
                f[0,j]:=-maxint;
                f[m+1,j]:=-maxint;
        end;
        for i:=1 to m do f[i,1]:=a[i,1];
        for j:=2 to n do
        begin
                for i:=1 to m do
                begin
                        f[i,j]:=max(f[i-1,j-1],max(f[i,j-1],f[i+1,j-1]))+a[i,j];
                end;
        end;
        maxx:=-maxint;
        for i:=1 to m do maxx:= max(maxx,f[i,n]);
        assign(g,fo);
        rewrite(g);
        write(g,maxx);
        close(g);
end;
begin
        Doc;
        XuLi;
end.