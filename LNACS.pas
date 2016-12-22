uses math;
const fi='';
      fo='';
var f,g:text;
    l:array[-1..1000,-1..1000] of longint;
    n,m:longint;
    a,b:array[1..1000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,m,n);
        for i:=1 to m do read(f,a[i]);
        for i:=1 to n do read(f,b[i]);
        close(f);
end;
procedure XuLi;
var i,j:longint;
begin
        for i:=1 to m do
        begin
                l[i,0]:=0;
                l[i,-1]:=0;
        end;
        for i:=1 to n do
        begin
                l[0,i]:=0;
                l[-1,i]:=0;
        end;
        for i:=1 to m do
        begin
                for j:=1 to n do
                begin
                        if a[i]=b[j] then l[i,j]:=max(l[i-1,j-1],max(l[i-1,j],max(l[i,j-1],l[i-2,j-2]+1)))
                        else l[i,j]:=max(l[i-1,j-1],max(l[i-1,j],l[i,j-1]));
                end;
        end;
        assign(g,fo);
        rewrite(g);
        writeln(g,l[m,n]);
        close(g);
end;
begin
        Doc;
        XuLi;
end.